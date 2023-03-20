import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../app_dependencies.dart';
import '../../blocs/authentication/authentication_cubit.dart';
import '../../blocs/authentication/authentication_state.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_router.dart';
import '../../utils/show_toast.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/blur_loading.dart';
import 'widget/login_with_social_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _authBloc = AppDependencies.injector.get<AuthenticationCubit>();
  final _showToastUtils = AppDependencies.injector.get<ShowToast>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer(
        bloc: _authBloc,
        listener: (context, AuthenticationState state) {
          state.maybeWhen(
            success: () => context.router.replaceAll([const HomeRoute()]),
            error: (message) => _showToastUtils.showToast(message ?? ''),
            orElse: () {},
          );
        },
        builder: (context, state) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DimensionConstants.size_52,
                vertical: DimensionConstants.size_60,
              ),
              child: ResponsiveRowColumn(
                columnMainAxisAlignment: MainAxisAlignment.spaceAround,
                layout: ResponsiveWrapper.of(context).isSmallerThan('4K')
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.COLUMN,
                children: [
                  ResponsiveRowColumnItem(
                    child: Image.asset(
                      ImageConstants.appLogo,
                      width: size.width * DimensionConstants.size_0DOT4,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ResponsiveRowColumn(
                      rowMainAxisAlignment: MainAxisAlignment.center,
                      layout: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                          ? ResponsiveRowColumnType.ROW
                          : ResponsiveRowColumnType.COLUMN,
                      columnSpacing: DimensionConstants.size_48,
                      rowSpacing: DimensionConstants.size_16,
                      children: [
                        ResponsiveRowColumnItem(
                          child: AppTextFormField(
                            textEditingController: _emailController,
                            hintText: 'email'.tr(),
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          child: AppTextFormField(
                            textEditingController: _passwordController,
                            hintText: 'password'.tr(),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: AppElevatedButton(
                      text: 'login'.tr(),
                      width: size.width * DimensionConstants.size_0DOT35,
                      height: DimensionConstants.size_48,
                      press: () async {
                        await _authBloc.signInWithCredentials(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'forgot_pass'.tr(),
                        style: textTheme.labelSmall,
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ResponsiveRowColumn(
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      layout: ResponsiveWrapper.of(context).isSmallerThan('4K')
                          ? ResponsiveRowColumnType.ROW
                          : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                          columnFit: FlexFit.loose,
                          child: LoginWithSocialButton(
                            press: () {},
                            icon: Icons.facebook_outlined,
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          columnFit: FlexFit.loose,
                          child: LoginWithSocialButton(
                            press: () {},
                            icon: LineIcons.linkedin,
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          columnFit: FlexFit.loose,
                          child: LoginWithSocialButton(
                            press: () {},
                            icon: LineIcons.twitter,
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          columnFit: FlexFit.loose,
                          child: AppElevatedButton(
                            text: 'or_sign_up'.tr(),
                            width: size.width * DimensionConstants.size_0DOT35,
                            press: () => AutoRouter.of(context).replace(const SignUpRoute()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: state is Submitting,
              child: const BlurLoading(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
