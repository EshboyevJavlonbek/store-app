class Routes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPass = '/forgot-password';
  static const String resetPass = '/reset-password';
  static const String verificationCode = '/verification-code';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String checkout = '/checkout';
  static const String savedItems='/saved-items';
  static const String search = '/search';
  static const String detail = '/detail:productId';
  static const String myCart ='/my-cart';
  static const String account = '/account';
  static const String orders = '/orders';
  static const String helpCenter = '/helpCenter';
  static const String myAddress = '/my-address';
  static const String faqs = '/faqs';
  static const String myDetail = '/my-detail';
  static const String settings = '/settings';

  static getDetail(int productId) => '/detail/$productId';
}
