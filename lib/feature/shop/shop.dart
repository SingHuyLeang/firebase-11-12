import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_11_12/feature/shop/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  CollectionReference dataRef =
      FirebaseFirestore.instance.collection("products");

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
      body: StreamBuilder<QuerySnapshot>(
        stream: dataRef.snapshots(),
        builder: (context, snapshort) {
          if (snapshort.hasError) {
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 26,
              ),
            );
          } else if (snapshort.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: snapshort.data!.docs.length,
              itemBuilder: (_, index) => CardItem(
                product: ProductModel.fromJson(
                  snapshort.data!.docs[index].data() as Map<String, dynamic>,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(product.image),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.grey[700],
                ),
          ),
          Text(
            '\$ ${product.price}',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.black,
                  fontWeightDelta: DateTime.may,
                ),
          ),
        ],
      ),
    );
  }
}
