import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> allProducts = [
    {
      'name': 'Regular Fit Slogan',
      'price': '\$1,190',
      'image': 'StoreAppAssets/images/splash.png',
    },
    {
      'name': 'Slim Fit Jeans',
      'price': '\$890',
      'image': 'StoreAppAssets/images/splash.png',
    },
    {
      'name': 'Oversized Hoodie',
      'price': '\$1,250',
      'image': 'StoreAppAssets/images/splash.png',
    },
  ];

  List<Map<String, String>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      setState(() {
        filteredProducts = allProducts.where((product) {
          return product['name']!.toLowerCase().contains(query);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('StoreAppAssets/icons/notification.svg', height: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Search bar
            Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400, width: 1.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SvgPicture.asset('StoreAppAssets/icons/search.svg', height: 20),
                     SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration:  InputDecoration(
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
                     SizedBox(width: 8),
                    SvgPicture.asset('StoreAppAssets/icons/microphone.svg', height: 20),
                  ],
                ),
              ),
            ),
             SizedBox(height: 20),
            // Product list
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      searchController.text = product['name']!;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product['image']!,
                              width: 56,
                              height: 54,
                              fit: BoxFit.cover,
                            ),
                          ),
                           SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: const TextStyle(
                                  color: Color(0XFF1A1A1A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                product['price']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff808080),
                                ),
                              ),
                            ],
                          ),
                           Spacer(),
                          SvgPicture.asset("StoreAppAssets/icons/export-arrow.svg"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
