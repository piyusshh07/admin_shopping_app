import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? _selectedCategory;
  String? _selectedBrand;
  String? _selectedOffer;
  var _formKey = GlobalKey<FormState>();
  var _isSaving = false;

  String? productName;
  String? description;
  String? category;
  String? brand;
  String? imageUrl;
  int? price;
  bool offer = false;

  void addData() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      print("Form is not valid"); // Debug print
      return;
    }
    _formKey.currentState!.save();

    category = _selectedCategory;
    offer = _selectedOffer == 'Yes';
    brand = _selectedBrand;

    final productDetails = {
      'ProductName': productName,
      'Category': category,
      'Brand': brand,
      'Description': description,
      'ImageUrl': imageUrl,
      'Price': price,
      'Offer': offer,
    };

    try {
      setState(() {
        _isSaving = true;
      });
      await FirebaseFirestore.instance.collection("products").add(productDetails);
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error while adding data. Try again later.")));
    }

    setState(() {
      _isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
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
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Product name'),
                        hintText: 'Enter your Product Name'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter a valid Name";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      productName = value!;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Product Description'),
                        hintText: 'Enter your Product Description'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter a valid Text";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      description = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Image url'),
                        hintText: 'Enter your Product image url'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter a valid url";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      imageUrl = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)),
                        label: Text('Product Price'),
                        hintText: 'Enter your Product Price'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty || value == "0") {
                        return "Enter a valid Price";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      price = int.tryParse(value!);
                    },
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
                          value: _selectedCategory,
                          borderRadius: BorderRadius.circular(20),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          hint: Text('Select Category'),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategory = newValue;
                            });
                          },
                          items: [
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
                          value: _selectedBrand,
                          borderRadius: BorderRadius.circular(20),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          hint: Text('Select Brand'),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedBrand = newValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'Nike', child: Text('Nike')),
                            DropdownMenuItem<String>(
                                value: 'Adidas', child: Text('Adidas')),
                            DropdownMenuItem<String>(
                                value: 'Puma', child: Text('Puma')),
                            DropdownMenuItem<String>(
                                value: 'RedTape', child: Text('RedTape')),
                            DropdownMenuItem<String>(
                                value: 'Skechers', child: Text('Skechers')),
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
                      value: _selectedOffer,
                      borderRadius: BorderRadius.circular(20),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      hint: Text('Select Offer'),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOffer = newValue;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: 'Yes', child: Text('Yes')),
                        DropdownMenuItem<String>(
                            value: 'No', child: Text('No')),
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
                          onPressed: addData,
                          child: _isSaving
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
      ),
    );
  }
}
