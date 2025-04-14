import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_category_item.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_null_body.dart';
import 'package:store_app/features/saved_items/manager/saved_items_bloc.dart';
import 'package:store_app/features/saved_items/manager/saved_items_state.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedItemsBloc, SavedItemsState>(
      builder: (context, state) => Scaffold(
        appBar: StoreAppBar(
          title: "Saved Items",
          actions: [
            StoreIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () => context.push(Routes.notification),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 24.h),
            child: Divider(
              color: AppColors.greySub,
            ),
          ),
        ),
        body: state.savedItems.isEmpty
            ? StoreNullBody(
                image: "assets/icons/no_saved.svg",
                title: "No Saved Items!",
                subTitle:
                    "You don’t have any saved items. Go to home and add some.",
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.savedItems.length,
                itemBuilder: (context, index) => StoreAppCategoryItem(
                    image: state.savedItems[index].image,
                    title: state.savedItems[index].title,
                    price: state.savedItems[index].price,
                    discount: state.savedItems[index].discount,
                    id: state.savedItems[index].id),
              ),
        bottomNavigationBar: StoreBottomNavigationBar(),
      ),
    );
  }
}
