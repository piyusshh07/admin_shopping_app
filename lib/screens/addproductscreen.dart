import 'package:adminshop/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Products"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add Products',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: ctrl.Productnamectrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Product name'),
                        hintText: 'Enter your Product Name'),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: ctrl.Descriptionctrl,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Product Description'),
                        hintText: 'Enter your Product Description'),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.ImageUrlctrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Image url'),
                        hintText: 'Enter your Product image url'),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ctrl.Pricectrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Product Price'),
                        hintText: 'Enter your Product Price'),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          borderRadius: BorderRadius.circular(20),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          hint: Text(ctrl.category.toString().isEmpty
                              ? 'Select Category'
                              : ctrl.category.toString()),
                          onChanged: (newValue) {
                            ctrl.category = newValue ?? 'General';
                            ctrl.update();
                          },
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'Shoes', child: Text('Shoes')),
                            DropdownMenuItem<String>(
                                value: 'Sandals', child: Text('Sandals')),
                            DropdownMenuItem<String>(
                                value: 'Slippers', child: Text('Slippers')),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          borderRadius: BorderRadius.circular(20),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          hint: Text(ctrl.Brand.toString().isEmpty
                              ? 'Select Brand'
                              : ctrl.Brand.toString()),
                          onChanged: (newValue) {
                            ctrl.Brand = newValue ?? 'Local';
                            ctrl.update();
                          },
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'Nike', child: Text('Nike')),
                            DropdownMenuItem<String>(
                                value: 'Adidas', child: Text('Adidas')),
                            DropdownMenuItem<String>(
                                value: 'Puma', child: Text('Puma')),
                            DropdownMenuItem<String>(
                                value: 'RedTape', child: Text('RedTape')),
                            DropdownMenuItem<String>(
                                value: 'Sketchers', child: Text('Skechers')),
                            DropdownMenuItem<String>(
                                value: 'Reebok', child: Text('Reebok')),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Any Offer on product?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      borderRadius: BorderRadius.circular(20),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      hint: Text(ctrl.offer.toString()),
                      onChanged: (newValue) {
                        ctrl.offer =
                            bool.tryParse(newValue ?? 'false') ?? false;
                        ctrl.update();
                      },
                      items: const [
                        DropdownMenuItem<String>(
                            value: 'true', child: Text('true')),
                        DropdownMenuItem<String>(
                            value: 'false', child: Text('false')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigoAccent,
                              foregroundColor: Colors.white),
                          onPressed: ctrl.addproducts,
                          child: ctrl.isSaving
                              ? CircularProgressIndicator()
                              : const Text(
                                  'Add Product',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
