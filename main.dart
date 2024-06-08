import 'package:flutter/material.dart';

void main() {
  runApp(const ProductNavigationApp());
}

class ProductNavigationApp extends StatelessWidget {

  const ProductNavigationApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(
      ),

      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a purple toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.
      home:  ProductListPage(),
    );
  }
}
class Product {
  final String name;
  final String description;
  final int price;
  final Color color;


  Product(this.name, this.description, this.price, this.color);

}

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final List<Product> products = [
    Product('Pixel 1', 'Pixel is the most featureFul phone ever', 800,
        Colors.blue.shade700),
    Product('Laptop', 'Laptop is most productive development tool', 2000,
        Colors.green),
    Product('Tablet', 'Tablet is the most useful device ever for meeting', 1500,
        Colors.yellow),
    Product('Pen Drive', 'iPhone is the stylist phone ever', 100, Colors.brown),
    Product('Floppy Drive', 'iPhone is the stylist phone ever', 50,
        Colors.teal.shade300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation'),
        backgroundColor: Colors.blue,
      ),
      body:
      Container(
        color: Colors.white, // Set the background color of the page to white
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
             margin: const EdgeInsets.symmetric(vertical: 4.0),
              // Adds space between items
              child: Row(
                children: [
                  Container(
                    color: product.color,
                    // Set the background color for part of the product item
                    width: 100,
                    // Adjust width as needed
                    height: 80,
                    // Adjust height as needed
                    alignment: Alignment.center,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white, // White part of the product item
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Price: ${product.price}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.

// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final"

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: product.color,
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 48),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: ${product.price}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Row(
                      children: List.generate(5, (index) => const Icon(
                          Icons.star_border, size: 32)),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsPage(product: product),
                            ));
                      })
                ])));
  }}
