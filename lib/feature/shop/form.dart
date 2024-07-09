import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormProduct extends StatelessWidget {
  FormProduct({super.key});

  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final sizesCtr = TextEditingController();
  final colorsCtr = TextEditingController();
  String? image = "luxury-woman-handbag.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        image != null ? null : Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: AssetImage(image == null
                          ? "assets/icons/image-add.png"
                          : "assets/images/$image"),
                    ),
                  ),
                ),
                if (image != null)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change Image',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeightDelta: DateTime.march,
                              ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add Product',
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          color: Colors.black,
                          fontWeightDelta: DateTime.march,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                formField(titleCtr, "Product Name"),
                const SizedBox(height: 20),
                formField(descriptionCtr, "Description"),
                const SizedBox(height: 20),
                formField(priceCtr, "Product price"),
                const SizedBox(height: 20),
                formField(sizesCtr, "Sizes"),
                const SizedBox(height: 20),
                formField(colorsCtr, "Colors"),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: CupertinoButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    child: Text(
                      'Add Product',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Colors.white,
                            fontWeightDelta: DateTime.march,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField formField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
      ),
    );
  }
}
