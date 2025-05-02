part of'saved_items_bloc.dart';
sealed class SavedItemsEvents{}

final class SavedItemsLoad extends SavedItemsEvents{}

final class SaveItem extends SavedItemsEvents{
  final int productId;
  SaveItem({required this.productId});
}

final class UnSaveItem extends SavedItemsEvents{
  final int productId;
  UnSaveItem({required this.productId});
}