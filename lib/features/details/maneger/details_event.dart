part of 'details_bloc.dart';

sealed class DetailEvent {}

 final class DetailLoading extends DetailEvent {
  final int productId;
  DetailLoading({required this.productId});
}

final class DetailSaveProduct extends DetailEvent{
 final int productId;

 DetailSaveProduct({required this.productId});
}

final class DetailUnSaveProduct extends DetailEvent{
 final int productId;

 DetailUnSaveProduct({required this.productId});
}

final class DetailAddProduct extends DetailEvent{
 final int productId;
 final int sizeId;

 DetailAddProduct({required this.productId, required this.sizeId});
}
