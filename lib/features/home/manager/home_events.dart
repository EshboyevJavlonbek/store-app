sealed class HomeEvents{}

final class HomeLoad extends HomeEvents{}

final class HomeSearch extends HomeEvents{
  final String title;
  HomeSearch({required this.title});
}

final class HomeLike extends HomeEvents{
  final int categoryId;
  HomeLike({required this.categoryId});
}