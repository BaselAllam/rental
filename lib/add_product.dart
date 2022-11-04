import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/shared/sharedWidgets/snack_widget.dart';
import 'dart:io';
import 'package:provider/provider.dart';


class AddProduc extends StatefulWidget {
  const AddProduc({Key? key}) : super(key: key);

  @override
  State<AddProduc> createState() => _AddProducState();
}

class _AddProducState extends State<AddProduc> {

  TextEditingController nameController = TextEditingController();

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Add Product!', style: SharedFonts.subTealStyle),
      ),
      body: Column(
          children: [
            InkWell(
              onTap: () async {
                picker(ImageSource.camera);
              },
              onDoubleTap: () async {
                picker(ImageSource.gallery);
              },
              child: Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // image: pickedImage == null ? DecorationImage(
                  //   image: NetworkImage('https://www.collinsdictionary.com/images/full/apple_158989157.jpg'),
                  //   fit: BoxFit.fill
                  // ) : DecorationImage(
                  //   image: FileImage(pickedImage!),
                  //   fit: BoxFit.fill
                  // )
                ),
              ),
            ),
            field('Product Name', Icons.text_fields, nameController),
            TextButton(
              child: Text('Add Product', style: SharedFonts.whiteStyle),
              style: TextButton.styleFrom(
                backgroundColor: SharedColors.tealColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                maximumSize: Size(200.0, 50.0),
                minimumSize: Size(200.0, 50.0)
              ),
              onPressed: () {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    snack('Some Fields Requried', 3, Colors.red)
                  );
                } else {
                  context.read<ProductController>().addProduct(nameController.text, false, 'https://cdnprod.mafretailproxy.com/sys-master-root/h18/h21/16221859086366/565953_main.jpg_480Wx480H');
                }
              },
            ),
          ],
        ),
    );
  }

  picker(ImageSource source) async {
    XFile? img = await ImagePicker().pickImage(source: source);
    setState(() {
      pickedImage = File(img!.path);
    });
  }

  OutlineInputBorder fieldBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(20.0)
    );
  }

  Container field(String label, IconData icon, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (x) {
          if (x!.isEmpty) return 'This Field Required!';
        },
        decoration: InputDecoration(
          border: fieldBorder(SharedColors.greyColor),
          enabledBorder: fieldBorder(SharedColors.greyColor),
          focusedBorder: fieldBorder(SharedColors.greyColor),
          errorBorder: fieldBorder(Colors.red),
          labelText: label,
          labelStyle: SharedFonts.subGreyStyle,
          prefixIcon: Icon(icon, color: SharedColors.greyColor, size: 20.0),
        ),
        style: SharedFonts.subBlackStyle,
        controller: controller
      ),
    );
  }
}