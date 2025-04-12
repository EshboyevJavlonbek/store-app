import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/delivery_address_model.dart';

class CheckoutRepository{

  CheckoutRepository({required this.client});
  final ApiClient client;

  DeliveryAddressModel? address;

  Future<DeliveryAddressModel?>getAddress()async{
    var response = await client.genericGetRequest<Map<String, dynamic>>('');
    address = DeliveryAddressModel.fromJson(response);
    return address;
  }
}