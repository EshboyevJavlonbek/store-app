import 'package:hive/hive.dart';
import 'package:store_app/data/model/category/category_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel>{
  @override
  final int typeId = 0;

  @override
  CategoryModel read(BinaryReader reader){
    final id = reader.readInt();
    final title = reader.readString();
    return CategoryModel(id: id, title: title);
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj){
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
  }
}