import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class FAQSView extends StatelessWidget {
  const FAQSView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "FAQs",
        actions: [
          StoreIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 24.h),
          child: Divider(color: AppColors.greySub),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(label: 'General', isSelected: true),
                  CategoryChip(label: 'Account'),
                  CategoryChip(label: 'Service'),
                  CategoryChip(label: 'Payment'),
                  CategoryChip(label: 'Delivery'),
                ],
              ),
            ),
            SizedBox(height: 16),
            SearchBar(),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  FAQItem(
                    question: 'How do I make a purchase?',
                    answer:
                        'When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the "Add to Cart" button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.',
                    initiallyExpanded: true,
                  ),
                  FAQItem(question: 'What payment methods are accepted?'),
                  FAQItem(question: 'How do I track my orders?'),
                  FAQItem(question: 'Can I cancel or return an order?'),
                  FAQItem(
                      question:
                          'How can I contact customer support for assistance?'),
                  FAQItem(question: 'What is your return policy?'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black),
              label: 'Account'),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for questions...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.mic),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String? answer;
  final bool initiallyExpanded;

  const FAQItem({
    super.key,
    required this.question,
    this.answer,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ExpansionTile(
        title: Text(question, style: TextStyle(fontWeight: FontWeight.w600)),
        initiallyExpanded: initiallyExpanded,
        tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: EdgeInsets.zero,
        children: answer != null
            ? [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    answer!,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}
