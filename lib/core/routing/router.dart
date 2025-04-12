import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/auth/manager/forgot_password/forgot_password_bloc.dart';
import 'package:store_app/features/auth/manager/login/login_bloc.dart';
import 'package:store_app/features/auth/manager/reset_password/reset_password_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/manager/verification/verification_bloc.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/forgot_password_view.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/reset_password_view.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/verification_code_view.dart';
import 'package:store_app/features/auth/pages/login_view.dart';
import 'package:store_app/features/auth/pages/sign_up_view.dart';
import 'package:store_app/features/details/pages/details_view.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/pages/home_view.dart';
import 'package:store_app/features/saved_items/pages/saved_items_view.dart';
import 'package:store_app/features/search/pages/search_view.dart';

final router = GoRouter(
  initialLocation: Routes.detail,
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
      builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordBloc(
                context.read(),
              ),
          child: ForgotPasswordView()),
    ),
    GoRoute(
      path: Routes.verificationCode,
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider(
          create: (context) => VerificationBloc(
            context.read(),
          ),
          child: VerificationCodeView(
            email: email,
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.resetPass,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final email = extra['email'] as String;
        final code = extra['code'] as String;

        return BlocProvider(
          create: (context) => ResetPasswordBloc(
            context.read(),
          ),
          child: ResetPasswordView(
            email: email,
            code: code,
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          repo: context.read(),
          searchRepo: context.read(),
        ),
        child: HomeView(),
      ),
    ),
    GoRoute(
      path: Routes.savedItems,
      builder: (context, state) => SavedItemsView(),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchView(),
    ),
    GoRoute(
      path: Routes.detail,
      builder: (context, state) => DetailsView(),
    ),
  ],
);
