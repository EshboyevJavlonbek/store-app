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
        if (state.status==HomeStatus.idle) {
          context.read<HomeBloc>().add(HomeLoad(categoryId: 1));
        }
        return Scaffold(
          appBar: HomeAppBar(
            state: state.categories,
            selectedCategory: 1,
          ),
          extendBody: true,
          body: RefreshIndicator(
            color: AppColors.blackMain,
            onRefresh: () async {
              print(state.status);
              if (state.status==HomeStatus.success) {
                context.read<HomeBloc>().add(HomeLoad(categoryId: state.selectedCategory!));
              }
            },
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 231.h,
                crossAxisCount: 2,
                mainAxisSpacing: 24.h,
                crossAxisSpacing: 10.w,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) => HomeProductItem(
                model: state.products[index],
              ),
            ),
          ),
          bottomNavigationBar: StoreBottomNavigationBar(),
        );
      },
    );
  }
}
