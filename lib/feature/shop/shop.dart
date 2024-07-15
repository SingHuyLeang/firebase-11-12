import 'package:firebase_11_12/feature/shop/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final products = [
    ProductModel(
        id: 1,
        title: "Offical Code",
        detail: "detaila,smhjvsaghjsagjcsakli;jhoaisjkhcjbas jmc",
        price: 29.99,
        size: 16,
        colors: ["red", "gray", "indigo"],
        image:
            "https://imgs.search.brave.com/WwZwFJBEz_ZlsT7iq7PAwpfxhFbgZBFH5MSLuL6V6Ps/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NjFpSTFxRW9pS0wu/anBn")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Women Bag',
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: Colors.black,
                        fontWeightDelta: DateTime.march,
                      ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: CupertinoButton(
                    minSize: double.infinity,
                    color: Theme.of(context).colorScheme.primary,
                    child: Text(
                      'Add Product',
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: Colors.white,
                            fontWeightDelta: DateTime.march,
                          ),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/form-product'),
                  ),
                ),
                const SizedBox(height: 10),
                const Spacer(),
                SizedBox(
                  height: 50,
                  child: CupertinoButton(
                    minSize: double.infinity,
                    color: Theme.of(context).colorScheme.error,
                    child: Text(
                      'Log out',
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: Colors.white,
                            fontWeightDelta: DateTime.march,
                          ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Women Bag',
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: Colors.black,
                fontWeightDelta: DateTime.march,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 10,
        itemBuilder: (_, index) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(products[0].image),
              ),
              Text(
                products[0].title,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: Colors.grey[700],
                    ),
              ),
              Text(
                '\$ ${products[0].price}',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: Colors.black,
                      fontWeightDelta: DateTime.may,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
