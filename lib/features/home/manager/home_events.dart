sealed class HomeEvents{}

final class HomeLoad extends HomeEvents{}

final class HomeSearch extends HomeEvents{
  final String title;
  HomeSearch({required this.title});
}