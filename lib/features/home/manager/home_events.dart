sealed class HomeEvents{}

final class HomeLoad extends HomeEvents{
  final int categoryId;
  HomeLoad({required this.categoryId});
}

final class HomeSearch extends HomeEvents{
  final String title;
  HomeSearch({required this.title});
}

final class HomeSaved extends HomeEvents{
  final int productId;
  HomeSaved({required this.productId});
}

final class HomeUnSaved extends HomeEvents{
  final int productId;
  HomeUnSaved({required this.productId});
}