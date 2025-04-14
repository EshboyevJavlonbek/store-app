import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_state.dart';
import 'package:store_app/features/home/pages/home_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_category_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Scaffold(
        appBar: HomeAppBar(),
        extendBody: true,
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24.h,
            crossAxisSpacing: 10,
          ),
          itemCount: state.categories.length,
          itemBuilder: (context, index) => StoreAppCategoryItem(
            image: state.categories[index].image,
            title: state.categories[index].title,
            price: state.categories[index].price,
            discount: state.categories[index].discount,
            id: state.categories[index].id,
          ),
        ),
        bottomNavigationBar: StoreBottomNavigationBar(),
      ),
    );
  }
}
