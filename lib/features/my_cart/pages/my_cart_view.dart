import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/my_cart/manager/my_cart_bloc.dart';
import 'package:store_app/features/my_cart/manager/my_cart_state.dart';
import 'package:store_app/features/my_cart/widgets/my_cart_item.dart';

import '../../common/widgets/store_null_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartBloc, MyCartState>(
      builder: (context, state) {
        if (state.status == MyCartStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        else if (state.status == MyCartStatus.error) {
          return Center(child: Text("Xatoo!"),);
        }
        else if(state.cart == null){
          return Center(child: Text("Xatoo!"),);
        }
        return Scaffold(
          appBar: StoreAppBar(
            title: "My Cart",
            actions: [
              StoreIconButtonContainer(
                image: "assets/icons/notification.svg",
                callback: () => context.push(Routes.notification),
              ),
            ],
          ),
          extendBody: true,
          body: state.cart!.items.isEmpty
              ? StoreNullBody(
                  image: "assets/icons/cart.svg",
                  title: "Your Cart Is Empty!",
                  subTitle: "When you add products, they’ll appear here.",
                )
              : RefreshIndicator(
                onRefresh: () async {
                  context.read<MyCartBloc>().add(MyCartLoad());
                },
                child: ListView.builder(
                    itemCount: state.cart!.items.length,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemBuilder: (context, index) => MyCartItem(item: state.cart!.items[index],),
                  ),
              ),
          bottomNavigationBar: StoreBottomNavigationBar(),
        );
      },
    );
  }
}
