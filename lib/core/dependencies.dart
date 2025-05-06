import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/repository/auth_repository.dart';
import 'package:store_app/data/repository/category/category_repository_local.dart';
import 'package:store_app/data/repository/category/category_repository_remote.dart';
import 'package:store_app/data/repository/detail_repository.dart';
import 'package:store_app/data/repository/product/product_repository.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/data/repository/product/product_repository_local.dart';
import 'package:store_app/data/repository/product/product_repository_remote.dart';
import 'package:store_app/data/repository/reviews_repository.dart';
import 'package:store_app/data/repository/search_repository.dart';

import '../data/repository/category/category_repository.dart';

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
      localRepo: ProductRepositoryLocal(),
      remoteRepo: ProductRepositoryRemote(
        client: context.read(),
      ),
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
    create: (context) => ReviewRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => CategoryRepository(
      localRepo: CategoryRepositoryLocal(),
      remoteRepo: CategoryRepositoryRemote(
        client: context.read(),
      ),
    ),
  ),
  Provider(
    create: (context) => DetailRepository(
      client: context.read(),
    ),
  ),
];
