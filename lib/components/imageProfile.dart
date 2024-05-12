// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({
    super.key,
    required this.radius,
    required this.isVisiable,
  });

  final double radius;
  final bool isVisiable;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker picker = ImagePicker();

  Uint8List? _image;

  File? selectedIMage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: widget.radius,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: widget.radius,
                      backgroundImage: const NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
              Visibility(
                visible: widget.isVisiable,
                child: Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet(context,
                              _pickImageFromGallery), // Pass context and picker here
                        );
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.teal,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }
}

Widget bottomSheet(BuildContext context, Function picker) {
  // Pass picker here
  return Container(
    height: 120.0.h,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20.w,
      vertical: 20.h,
    ),
    child: Column(
      children: <Widget>[
        Text(
          "Choose Profile Photo",
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('Gallery',
            style: TextStyle(
              fontSize: 20.sp,
            )),
        IconButton(
          onPressed: () {
            picker();
          },
          icon: Icon(
            Icons.image,
            size: 30.sp,
          ),
        ),
      ],
    ),
  );
}
