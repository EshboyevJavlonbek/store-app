import 'package:hive/hive.dart';
import 'package:store_app/data/model/product/product_model.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final image = reader.readString();
    final  price = reader.readInt();
    final discount = reader.readInt();
    final isLiked = reader.readBool();
    return ProductModel(
      id: id,
      image: image,
      title: title,
      price: price,
      discount: discount,
      isLiked: isLiked,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj){
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.image);
    writer.writeInt(obj.price);
    writer.writeInt(obj.discount);
    writer.writeBool(obj.isLiked);
  }
}
