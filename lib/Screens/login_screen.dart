import 'package:codeland_assignment/Screens/upload_image_screen.dart';
import 'package:codeland_assignment/Utils/colors.dart';
import 'package:codeland_assignment/Utils/constants.dart';
import 'package:codeland_assignment/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("assets/img3.png")),
                height16,
                TextFormField(
                  controller: usernameController,
                  style: smallTextStyle,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z]+|\s'),
                        allow: true)
                  ],
                  decoration: InputDecoration(hintText: "Username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter username";
                    }
                    if (value.length < 3) {
                      return "Username can't be less than 3 characters";
                    }
                    if (value.length > 20) {
                      return "Username can't be more  than 20 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                height16,
                TextFormField(
                  controller: passwordController,
                  style: smallTextStyle,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 5) {
                      return "Password can't be less than 5 characters";
                    }
                    if (value.length > 15) {
                      return "Password can't be more  than 15 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                height28,
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadImageScreen()),
                          (route) => false);

                      Future.delayed(Duration(milliseconds: 100), () {
                        Fluttertoast.showToast(msg: "Login Successfull!!");
                      });
                    }
                  },
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeColor,
                      boxShadow: [
                        BoxShadow(
                            color: gColor.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: wColor,
                            height: 1.4),
                      ),
                    ),
                  ),
                ),
                height40,
                Text(
                  "For Assistance & Login Details Contact: ",
                  style: smallTextStyle,
                ),
                height4,
                contactDetailRow("English, Kannada & Telugu :", "7406333800"),
                height4,
                contactDetailRow(
                    "English, Kannada & Hindi    :", " 9071386515"),
                height80,
                Center(
                    child: Text(
                  "v1.7© 2023,Codeland Infosolutions Pvt Ltd.",
                  style: smallTextStyle,
                )),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget contactDetailRow(String ques, String ans) {
    return Row(
      children: [
        Text(
          ques,
          style: smallTextStyle,
        ),
        Text(
          ans,
          style: themeTextStyle,
        ),
      ],
    );
  }
}
