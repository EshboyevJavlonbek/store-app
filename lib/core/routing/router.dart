import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/auth/manager/login/login_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/pages/login_view.dart';
import 'package:store_app/features/auth/pages/sign_up_view.dart';

final router = GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => LoginBloc(
          repo: context.read(),
        ),
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => SignUpBloc(
          repo: context.read(),
        ),
        child: SignUpView(),
      ),
    ),
  ],
);
