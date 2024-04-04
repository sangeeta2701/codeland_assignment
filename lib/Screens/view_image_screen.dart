import 'dart:io';

import 'package:codeland_assignment/Utils/colors.dart';
import 'package:codeland_assignment/Utils/constants.dart';
import 'package:codeland_assignment/widgets/sizedbox.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewImageScreen extends StatefulWidget {
  const ViewImageScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: wColor,
        title: Text(
          "View Image",
          style: headingStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          children: [
            height12,
            DottedBorder(
              color: bColor,
              dashPattern: [6, 3, 2, 3],
              strokeWidth: 1,
              child: SizedBox(
                height: 400.h,
                width: double.infinity,
                child: Image.file(File(widget.imagePath)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
