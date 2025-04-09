import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/auth/manager/login/login_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/forgot_password_view.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/reset_password_view.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/verification_code_view.dart';
import 'package:store_app/features/auth/pages/login_view.dart';
import 'package:store_app/features/auth/pages/sign_up_view.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/pages/home_view.dart';

final router = GoRouter(
  initialLocation: Routes.signUp,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginBloc(
          repo: context.read(),
        ),
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpBloc(
          repo: context.read(),
        ),
        child: SignUpView(),
      ),
    ),
    GoRoute(
      path: Routes.forgotPass,
      builder: (context, state) => ForgotPasswordView(),
    ),
    GoRoute(
      path: Routes.verificationCode,
      builder: (context, state) => VerificationCodeView(),
    ),
    GoRoute(
      path: Routes.resetPass,
      builder: (context, state) => ResetPasswordView(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          repo: context.read(),
        ),
        child: HomeView(),
      ),
    ),
  ],
);
