import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/home_category_item.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';
import 'package:store_app/features/home/pages/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeLoad(categoryId: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: HomeAppBar(
            state: state.categories,
          ),
          extendBody: true,
          body: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 231.h,
              crossAxisCount: 2,
              mainAxisSpacing: 24.h,
              crossAxisSpacing: 10.w,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) => HomeCategoryItem(
              image: state.products[index].image,
              title: state.products[index].title,
              price: state.products[index].price,
              discount: state.products[index].discount,
              id: state.products[index].id,
              isLiked: state.products[index].isLiked,
            ),
          ),
          bottomNavigationBar: StoreBottomNavigationBar(),
        );
      },
    );
  }
}
