import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: 'Checkout',
        actions: [],
      ),
      body: FutureBuilder(
        future: Hive.openBox('checkout'),
        builder: (context, snapshot) => ListView(),
      ),
    );
  }
}
