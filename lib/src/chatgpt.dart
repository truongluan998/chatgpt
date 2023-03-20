import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app_dependencies.dart';
import 'blocs/battery/check_battery_cubit.dart';
import 'blocs/battery/check_battery_state.dart';
import 'constants/app_constants.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';
import 'utils/show_toast.dart';

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> with AfterLayoutMixin<ChatGPT> {
  final _appRouter = AppDependencies.injector.get<AppRouter>();
  final _showToastUtils = AppDependencies.injector.get<ShowToast>();
  final _connectivityImp = AppDependencies.injector.get<ConnectivityImp>();
  final _checkBatteryCubit = AppDependencies.injector.get<CheckBatteryCubit>();

  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool showResultConnectivityFirstTime = true;

  void _checkConnectivity() {
    if (!showResultConnectivityFirstTime) {
      _connectivitySubscription = _connectivityImp.onConnectivityChanged().listen(
        (event) async {
          event != ConnectivityResult.none
              ? await _showToastUtils.showToast('common_internet_connected'.tr())
              : await _showToastUtils.showToast('common_lost_internet'.tr());
        },
      );
    } else {
      showResultConnectivityFirstTime = false;
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => _checkBatteryCubit,
        child: BlocListener(
          bloc: _checkBatteryCubit,
          listener: (context, CheckBatteryState state) {
            state.maybeWhen(
              veryLowBattery: () => _showToastUtils.showToast('very_low_battery'.tr()),
              lowBattery: () => _showToastUtils.showToast('low_battery'.tr()),
              highBattery: () => _showToastUtils.showToast('high_battery'.tr()),
              fullBattery: () => _showToastUtils.showToast('full_battery'.tr()),
              orElse: () {},
            );
          },
          child: MaterialApp.router(
            builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              breakpoints: [
                const ResponsiveBreakpoint.resize(
                  DimensionConstants.responsiveBreakPointMobile,
                  name: MOBILE,
                ),
                const ResponsiveBreakpoint.resize(
                  DimensionConstants.responsiveBreakPointTablet,
                  name: TABLET,
                ),
                const ResponsiveBreakpoint.resize(
                  DimensionConstants.responsiveBreakPointDesktop,
                  name: DESKTOP,
                ),
                const ResponsiveBreakpoint.resize(
                  DimensionConstants.responsiveBreakPoint4k,
                  name: AppConstants.fourK,
                ),
              ],
            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.buildTheme(),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          ),
        ),
      );

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    _checkConnectivity();
    await _checkBatteryCubit.checkBattery();
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}
