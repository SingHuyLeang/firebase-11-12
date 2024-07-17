import 'dart:developer';
import 'dart:io';

import 'package:firebase_11_12/feature/shop/controller/shop_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormProduct extends StatefulWidget {
  const FormProduct({super.key});

  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
  final controller = Get.put(ShopController());

  File? image;

  Future<void> chooseImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async => chooseImage(),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        image != null ? null : Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: image != null
                          ? FileImage(image!)
                          : const AssetImage("assets/icons/image-add.png")
                              as ImageProvider,
                    ),
                  ),
                ),
              ),
              if (image != null)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () async => chooseImage(),
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
              formField(controller.titleCtr, "Product Name"),
              const SizedBox(height: 20),
              formField(controller.descriptionCtr, "Description"),
              const SizedBox(height: 20),
              formField(controller.priceCtr, "Product price"),
              const SizedBox(height: 20),
              formField(controller.sizesCtr, "Sizes"),
              const SizedBox(height: 20),
              formField(controller.colorsCtr, "Colors"),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () async {
                    if (image != null) {
                      await controller
                          .addProduct(image!)
                          .whenComplete(() async => image = File(""));
                    }
                  },
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
