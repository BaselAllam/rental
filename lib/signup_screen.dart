import 'package:flutter/material.dart';
import 'package:rental/navigation_screen.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/shared/sharedWidgets/snack_widget.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSecured = true;
  bool isChecked = false;
  DateTime selectedDate = DateTime(1970);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Welcom Signup!', style: SharedFonts.subTealStyle),
        iconTheme: IconThemeData(color: SharedColors.tealColor, size: 20.0),
      ),
      body: Column(
        children: [
          field('Email Address', Icons.email, emailController, false),
          field('Password', Icons.lock, passwordController, isSecured),
          ListTile(
            title: Text('\nReady Our Terms & Conditions\n', style: SharedFonts.subTealStyle),
            trailing: Checkbox(
              value: isChecked,
              checkColor: Colors.white,
              activeColor: SharedColors.tealColor,
              onChanged: (o) {
                setState(() {
                  isChecked = o!;
                });
              },
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    ),
                  );
                }
              );
            },
          ),
          ListTile(
            title: Text('\nPicke your Birthdate\n', style: SharedFonts.subTealStyle),
            subtitle: Text(selectedDate.toString().substring(0, 10), style: SharedFonts.subGreyStyle),
            trailing: Icon(Icons.calendar_month, color: SharedColors.tealColor, size: 20.0,),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(1970),
                lastDate: DateTime(2002),
                currentDate: DateTime(1980),
                initialDate: DateTime(1970)
              );
              setState(() {
                selectedDate = picked!;
              });
            },
          ),
          TextButton(
            child: Text('Signup', style: SharedFonts.whiteStyle),
            style: TextButton.styleFrom(
              backgroundColor: SharedColors.tealColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              maximumSize: Size(200.0, 50.0),
              minimumSize: Size(200.0, 50.0)
            ),
            onPressed: () {
              if (emailController.text.isEmpty && passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  snack('Some Fields Requried', 3, Colors.red)
                );
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return NavigationScreen();}));
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: Text('\nHave an Account? Login', style: SharedFonts.subTealStyle),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder fieldBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(20.0)
    );
  }

  Container field(String label, IconData icon, TextEditingController controller, bool isSecure) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
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