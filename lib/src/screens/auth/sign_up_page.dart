import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mock_project/src/screens/auth/widget/login_with_social_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../app_dependencies.dart';
import '../../blocs/authentication/authentication_cubit.dart';
import '../../blocs/authentication/authentication_state.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_router.dart';
import '../../utils/show_toast.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/blur_loading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _authBloc = AppDependencies.injector.get<AuthenticationCubit>();
  final _showToastUtils = AppDependencies.injector.get<ShowToast>();

   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _fullNameController = TextEditingController();
   final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer(
        bloc: _authBloc,
        listener: (context, AuthenticationState state) {
          state.maybeWhen(
            initial: () {},
            submitting: () {},
            success: () {
              AutoRouter.of(context).replaceAll([const HomeRoute()]);
              _showToastUtils.showToast('sign_up_success'.tr());
            },
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
                        columnSpacing: DimensionConstants.size_16,
                        rowSpacing: DimensionConstants.size_16,
                        children: [
                          ResponsiveRowColumnItem(
                            child: ResponsiveRowColumn(
                              layout: ResponsiveWrapper.of(context).isSmallerThan('4K')
                                  ? ResponsiveRowColumnType.COLUMN
                                  : ResponsiveRowColumnType.COLUMN,
                              columnSpacing: DimensionConstants.size_16,
                              children: [
                                ResponsiveRowColumnItem(
                                  child: AppTextFormField(
                                    textEditingController: _fullNameController,
                                    hintText: 'full_name'.tr(),
                                    iconData: Icons.person,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  child: AppTextFormField(
                                    textEditingController: _emailController,
                                    hintText: 'email'.tr(),
                                    iconData: Icons.email_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            child: ResponsiveRowColumn(
                              layout: ResponsiveWrapper.of(context).isSmallerThan('4K')
                                  ? ResponsiveRowColumnType.COLUMN
                                  : ResponsiveRowColumnType.COLUMN,
                              columnSpacing: DimensionConstants.size_16,
                              children: [
                                ResponsiveRowColumnItem(
                                  child: AppTextFormField(
                                    textEditingController: _passwordController,
                                    hintText: 'password'.tr(),
                                    obscureText: true,
                                    iconData: Icons.password,
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  child: AppTextFormField(
                                    textEditingController: _phoneController,
                                    hintText: 'phone'.tr(),
                                    iconData: Icons.phone,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: AppElevatedButton(
                        text: 'register'.tr(),
                        width: size.width * DimensionConstants.size_0DOT4,
                        height: DimensionConstants.size_48,
                        press: () async {
                          await _authBloc.signUpWithCredentials(
                            _emailController.text,
                            _passwordController.text,
                            _fullNameController.text,
                            _phoneController.text,
                          );
                        },
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
                            child: AppElevatedButton(
                              text: 'or_sign_in'.tr(),
                              width: size.width * DimensionConstants.size_0DOT35,
                              press: () => AutoRouter.of(context).replace(const SignInRoute()),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: state is Submitting,
                child: const BlurLoading(),
              )
            ],
          ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
