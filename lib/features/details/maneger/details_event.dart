part of 'details_bloc.dart';

sealed class DetailEvent {}

 final class DetailLoading extends DetailEvent {
  final int productId;
  DetailLoading({required this.productId});
}
