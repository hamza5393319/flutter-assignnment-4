import 'package:flutter/material.dart';
import 'package:flutterassignment4/product_detail_Screen.dart';
import 'product_cart.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [Icon(Icons.search, color: Colors.black)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: PromotionCard(
                      discount: '50% Off',
                      description: 'On everything today',
                      code: 'FSCREATION',
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: PromotionCard(
                      discount: '70% Off',
                      description: 'On everything today',
                      code: 'FSCREATION',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SectionTitle(title: 'New Arrivals'),
              SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen()),
                        );
                      },
                      child: ProductCard(
                        imageUrl: 'assets/images/bag.webp',
                        name: 'The Marc Jacobs',
                        description: 'Traveler Tote',
                        price: '\$195.00',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen()),
                        );
                      },
                      child: ProductCard(
                        imageUrl: 'assets/images/shoes.jpg',
                        name: 'Axel Arigato',
                        description: 'Clean 90 Triple Sneakers',
                        price: '\$245.00',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SectionTitle(title: 'Popular'),
              SizedBox(height: 8),
              PopularProductCard(
                imageUrl: 'assets/images/sandel.jpg',
                name: 'Gia Borghini',
                description: 'RHW Rosie 1 Sandals',
                price: '\$740.00',
                rating: 4.5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductCartScreen()),
                );
              },
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String discount;
  final String description;
  final String code;

  PromotionCard({required this.discount, required this.description, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(discount, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(color: Colors.white, fontSize: 12)),
          SizedBox(height: 8),
          Text('With code: $code', style: TextStyle(color: Colors.white, fontSize: 12)),
          SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.white),
            onPressed: () {},
            child: Text('Get Now'),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {}, child: Text('View All')),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  ProductCard({required this.imageUrl, required this.name, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(description, style: TextStyle(color: Colors.grey)),
        Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class PopularProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final double rating;

  PopularProductCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(description, style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text(rating.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
