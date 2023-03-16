import 'package:auto_route/auto_route.dart';

import '../app_dependencies.dart';
import '../services/firebase/auth/auth_service.dart';
import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final _authService = AppDependencies.injector.get<AuthService>();

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final currentUser = await _authService.getCurrentUser();

    if (currentUser?.id != null) {
      resolver.next();
    } else {
      await router.replaceAll([const SignInRoute()]);
    }
  }
}
