import 'package:flutter/material.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Saved Items",
        actions: [
          StoreIconButtonContainer(
            image: "StoreAppAssets/icons/notification.svg",
            callback: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 1),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
