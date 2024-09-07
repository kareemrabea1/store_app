import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/serveses/update_product.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, des, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.purple[800]),
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.purple[800]),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomFormTextField(
                  labelText: 'Product Name',
                  onChange: (data) {
                    productName = data;
                  },
                  hintText: product.title,
                ),
                const SizedBox(height: 10),
                CustomFormTextField(
                  labelText: 'Description',
                  onChange: (data) {
                    des = data;
                  },
                  hintText: product.description,
                ),
                const SizedBox(height: 10),
                CustomFormTextField(
                  labelText: 'Price',
                  inputType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                  hintText: product.price.toString(),
                ),
                const SizedBox(height: 10),
                CustomFormTextField(
                  labelText: 'Image',
                  onChange: (data) {
                    image = data;
                  },
                  hintText: product.image,
                ),
                const SizedBox(height: 50),
                CustomBotton(
                  titel: 'Update',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      // تحديث الحقول التي تم تغييرها فقط
                      await updateProduct(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Success'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } catch (e) {
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    // تأكد من تحويل السعر إلى String
    String updatedTitle = productName ?? product.title;
    String updatedDescription = des ?? product.description;
    String updatedPrice =
        price ?? product.price.toString(); // تحويل السعر إلى String
    String updatedImage = image ?? product.image;

    await UpdateProduct().updateProduct(
      id: product.id,
      title: updatedTitle,
      price: updatedPrice, // تمرير السعر كـ String
      des: updatedDescription,
      image: updatedImage,
      category: product.category ?? 'Default Category',
    );
  }
}
