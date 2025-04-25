import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/repository/auth_repository.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/data/repository/search_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => AuthRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => ProductRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => SearchRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => NotificationRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => CategoryRepository(
      client: context.read(),
    ),
  ),
];
