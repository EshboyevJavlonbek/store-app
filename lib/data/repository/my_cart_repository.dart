import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/my_cart/cart_model.dart';

class MyCartRepository{
  final ApiClient client;

  MyCartRepository({required this.client});

  CartModel? cart;

  Future<CartModel?> fetchCarts()async{
    var rawCart = await client.genericGetRequest('/my-cart/my-cart-items');
    cart = CartModel.fromJson(rawCart);
    return cart;
  }
}