import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../screens/auth/sign_in_page.dart';
import '../screens/auth/sign_up_page.dart';
import '../screens/home/home_page.dart';
import '../screens/profile/profile_page.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage, path: '/sign-in-page'),
    AutoRoute(page: SignUpPage, path: '/sign-up-page'),
    AutoRoute(page: HomePage, path: '/', guards: [AuthGuard]),
    AutoRoute(page: ProfilePage, path: '/profile-page'),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({
    required AuthGuard authGuard,
  }) : super(
          authGuard: authGuard,
          navigatorKey: AppConstants.navigatorKey,
        );
}
