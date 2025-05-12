import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/account/pages/account_view.dart';
import 'package:store_app/features/auth/manager/forgot_password/forgot_password_bloc.dart';
import 'package:store_app/features/auth/manager/login/login_bloc.dart';
import 'package:store_app/features/auth/manager/reset_password/reset_password_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_bloc.dart';
import 'package:store_app/features/auth/manager/verification/verification_bloc.dart';
import 'package:store_app/features/auth/onboarding/onboarding.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/forgot_password_view.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/reset_password_view.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/verification_code_view.dart';
import 'package:store_app/features/auth/pages/login_view.dart';
import 'package:store_app/features/auth/pages/sign_up_view.dart';
import 'package:store_app/features/checkout/pages/checkout_view.dart';
import 'package:store_app/features/details/maneger/details_bloc.dart';
import 'package:store_app/features/details/pages/details_view.dart';
import 'package:store_app/features/faqs/pages/faqs_view.dart';
import 'package:store_app/features/help_center/pages/help_center_view.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/pages/home_view.dart';
import 'package:store_app/features/my_cart/manager/my_cart_bloc.dart';
import 'package:store_app/features/my_cart/pages/my_cart_view.dart';
import 'package:store_app/features/my_details/pages/my_details_view.dart';
import 'package:store_app/features/notification/manager/notification_bloc.dart';
import 'package:store_app/features/notification/pages/notification_view.dart';
import 'package:store_app/features/orders/pages/orders_view.dart';
import 'package:store_app/features/reviews/maneger/reviews_bloc.dart';
import 'package:store_app/features/reviews/pages/reviews_view.dart';
import 'package:store_app/features/saved_items/manager/saved_items_bloc.dart';
import 'package:store_app/features/saved_items/pages/saved_items_view.dart';
import 'package:store_app/features/search/manager/search_bloc.dart';
import 'package:store_app/features/search/pages/search_view.dart';


final router = GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => Onboarding(),
    ),
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
          catRepo: context.read(),
        ),
        child: HomeView(),
      ),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchBloc(
          repo: context.read(),
        ),
        child: SearchView(),
      ),
    ),
    GoRoute(
      path: Routes.savedItems,
      builder: (context, state) => BlocProvider(
        create: (context) => SavedItemsBloc(
          repo: context.read(),
        ),
        child: SavedItemsView(),
      ),
    ),
    GoRoute(
      path: Routes.detail,
      builder: (context, state) => BlocProvider(
        create: (context) => DetailsBloc(
          repo: context.read(),
          id: int.parse(state.pathParameters['productId']!),
        ),
        child: DetailsView(),
      ),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
          productId: int.parse(state.pathParameters['productId']!),
          reviewsRepo: context.read(),
        ),
        child: ReviewsView(),
      ),
    ),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => BlocProvider(
        create: (context) => NotificationBloc(
          repo: context.read(),
        ),
        child: NotificationView(),
      ),
    ),
    GoRoute(
      path: Routes.myCart,
      builder: (context, state) => BlocProvider(
          create: (context) => MyCartBloc(
                repo: context.read(),
              ),
          child: MyCartView()),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => CheckoutView(),
    ),
    GoRoute(
      path: Routes.account,
      builder: (context, state) => AccountView(),
    ),
    GoRoute(
      path: Routes.orders,
      builder: (context, state) => OrdersView(),
    ),
    GoRoute(
      path: Routes.helpCenter,
      builder: (context, state) => HelpCenterView(),
    ),
    GoRoute(
      path: Routes.faqs,
      builder: (context, state) => FAQSView(),
    ),
    GoRoute(
      path: Routes.myDetail,
      builder: (context, state) => MyDetailView(),
    ),
  ],
);
