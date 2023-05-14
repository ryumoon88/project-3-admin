import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _productName;
  late String _category;
  late double _price;
  late String _size;
  final List<Color> _selectedColors = List.empty(growable: true);
  Color currentColor = Colors.white;
  late String _imagePath;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform desired actions
      _formKey.currentState!.save();
      // Perform further operations with the form data
      // e.g., submit the form to a backend API or save it locally
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the product name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productName = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Category'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the product category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _category = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _price = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Size'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the product size';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _size = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Color",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < _selectedColors.length; i++)
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedColors[i],
                          ),
                        ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Select Color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: currentColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          currentColor = color;
                                        });
                                      },
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        setState(() {
                                          _selectedColors.add(currentColor);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                              CircleBorder(),
                            ),
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Image Path'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the image path';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _imagePath = value!;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
