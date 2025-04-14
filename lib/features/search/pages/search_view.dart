import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/search/manager/search_bloc.dart';
import 'package:store_app/features/search/manager/search_state.dart';
import 'package:store_app/features/common/widgets/store_null_body.dart';
import 'package:store_app/features/search/widgets/search_result_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: StoreAppBar(
              title: "Search",
              actions: [
                StoreIconButtonContainer(
                  image: 'assets/icons/notification.svg',
                  callback: () => context.push(Routes.notification),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 72.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400, width: 1.2),
                  ),
                  child: Row(
                    spacing: 8.w,
                    children: [
                      StoreIconButtonContainer(
                        image: "assets/icons/search.svg",
                        callback: () {
                          context.read<SearchBloc>().add(
                                SearchRequest(
                                    title: searchController.text.trim()),
                              );
                        },
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search for clothes...',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      StoreIconButtonContainer(
                        image: "assets/icons/microphone.svg",
                        callback: () {},
                        iconColor: AppColors.greySub,
                      )
                    ],
                  ),
                ),
              )),
          extendBody: true,
          body: state.categories.isEmpty
              ? StoreNullBody(
                  image: "assets/icons/no_result.svg",
                  title: "No Results Found!",
                  subTitle: "Try a similar word or something more general.",
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) => SearchResultItem(
                            image: state.categories[index].image,
                            title: state.categories[index].title,
                            price: state.categories[index].price,
                            id: state.categories[index].id,
                            discount: state.categories[index].discount,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: StoreBottomNavigationBar(),
        );
      },
    );
  }
}
