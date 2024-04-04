import 'dart:io';

import 'package:codeland_assignment/Screens/view_image_screen.dart';
import 'package:codeland_assignment/Utils/colors.dart';
import 'package:codeland_assignment/Utils/constants.dart';
import 'package:codeland_assignment/widgets/sizedbox.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? _image;
  final imagePick = ImagePicker();

  addImage() {
    print("upload image");
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: themeColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SizedBox(
              height: 200.h,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectImageOptions(Icons.camera, "Take a Photo", () {
                      Navigator.pop(context);
                      imagePickerCamera();
                    }),
                    selectImageOptions(Icons.crop_original, "Albumbs", () {
                      Navigator.pop(context);
                      imagePickerGallery();
                    }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget selectImageOptions(IconData icon, String name, VoidCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 90.h,
        width: 120.w,
        decoration: BoxDecoration(
            color: wColor, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            height8,
            Text(
              name,
              style: tFTextStyle,
            )
          ],
        ),
      ),
    );
  }

  Future imagePickerGallery() async {
    final pick = await imagePick.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        print("SANG: " + pick.path);
        print(File(_image!.path));
      } else {
        Fluttertoast.showToast(msg: "Please select an image");
      }
    });
  }

  Future imagePickerCamera() async {
    final pick = await imagePick.pickImage(source: ImageSource.camera);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        print("SANG1: " + pick.path);
        print(File(_image!.path));
        print("SANG1: end " + pick.path);
      } else {
        Fluttertoast.showToast(msg: "Please select an image");
      }
    });
  }

  String? _savedImagePath;
  //save image
  Future<void> _saveImageLocally() async {
    if (_image != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'image.jpg';
      final savedImage = await _image!.copy('${appDir.path}/$fileName');
      setState(() {
        _savedImagePath = savedImage.path;
      });
    }
  }
  // Future<void> _saveImage() async {
  //   if (_image != null) {
  //     final appDir = await getApplicationDocumentsDirectory();
  //     final fileName = 'image.jpg';
  //     final savedImage = await _image!.copy('${appDir.path}/$fileName');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          children: [
            Text(
              "Upload  a  Image",
              style: headingStyle,
            ),
            height12,
            DottedBorder(
              color: bColor,
              dashPattern: [6, 3, 2, 3],
              strokeWidth: 1,
              child: GestureDetector(
                onTap: () {
                  addImage();
                },
                child: SizedBox(
                    height: 400.h,
                    width: double.infinity,
                    child: _image == null
                        ? Center(child: Image.asset("assets/img4.png"))
                        // : Image.network(_image!.path,fit: BoxFit.cover),

                        : Image.file(File(_image!.path), fit: BoxFit.cover)),
              ),
            ),
            height28,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor: themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    onPressed: () {
                      _saveImageLocally();
                      Fluttertoast.showToast(
                          msg: "Image Uploaded Successfully");
                    },
                    child: Text(
                      "Upload",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: wColor,
                          height: 1.4),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor: gColor.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    onPressed: () {
                      if (_savedImagePath != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewImageScreen(
                              imagePath: _savedImagePath!,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "View",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: bColor,
                          height: 1.4),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
