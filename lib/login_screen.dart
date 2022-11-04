import 'package:flutter/material.dart';
import 'package:rental/navigation_screen.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/shared/sharedWidgets/snack_widget.dart';
import 'package:rental/signup_screen.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Welcom Login!', style: SharedFonts.subTealStyle),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            field('Email Address', Icons.email, emailController, false, emailKey),
            field('Password', Icons.lock, passwordController, isSecured, passwordKey),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       backgroundColor: Colors.white,
                  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  //       content: field('Mobile Number', Icons.phone, numberController, false),
                  //       actions: [
                  //         TextButton(
                  //           child: Text('Cancel', style: SharedFonts.whiteStyle),
                  //           style: TextButton.styleFrom(
                  //             backgroundColor: Colors.red,
                  //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  //             maximumSize: Size(100.0, 50.0),
                  //             minimumSize: Size(100.0, 50.0)
                  //           ),
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //         ),
                  //         TextButton(
                  //           child: Text('Send', style: SharedFonts.whiteStyle),
                  //           style: TextButton.styleFrom(
                  //             backgroundColor: SharedColors.tealColor,
                  //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  //             maximumSize: Size(100.0, 50.0),
                  //             minimumSize: Size(100.0, 50.0)
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //       ],
                  //     );
                  //   }
                  // );
                },
                child: Text('Forgot Password   ', style: SharedFonts.subGreyStyle),
              )
            ),
            TextButton(
              child: Text('Login', style: SharedFonts.whiteStyle),
              style: TextButton.styleFrom(
                backgroundColor: SharedColors.tealColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                maximumSize: Size(200.0, 50.0),
                minimumSize: Size(200.0, 50.0)
              ),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    snack('Some Fields Requried', 3, Colors.red)
                  );
                } else {
                  Provider.of<ProductController>(context, listen: false).getProducts();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return NavigationScreen();}));
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Text('\nDont Have an Account? Signup', style: SharedFonts.subTealStyle),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  OutlineInputBorder fieldBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(20.0)
    );
  }

  Container field(String label, IconData icon, TextEditingController controller, bool isSecure, Key key) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        key: key,
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
          suffixIcon: label == 'Password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: SharedColors.greyColor,
            iconSize: 20.0,
            onPressed: () {
              isSecured = !isSecured;
              setState(() {
                
              });
            },
          ) :  null
        ),
        style: SharedFonts.subBlackStyle,
        obscureText: isSecure,
        controller: controller
      ),
    );
  }
}