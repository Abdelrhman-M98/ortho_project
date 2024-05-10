import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatelessWidget {
  UploadImage({
    super.key,
    required this.radius,
    required this.isVisiable,
  });

  final double radius;
  final bool isVisiable;
  final ImagePicker picker = ImagePicker(); // Initialize picker here

  @override
  Widget build(BuildContext context) {
    PickedFile imageFile; // Define imageFile here

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              CircleAvatar(
                radius: radius,
                backgroundImage:
                    AssetImage('assets/images/photos/onBording.png'),
              ),
              Visibility(
                visible: isVisiable,
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
                          builder: (builder) => bottomSheet(
                              context, picker), // Pass context and picker here
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
}

Widget bottomSheet(BuildContext context, ImagePicker picker) {
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
            // Pass picker here
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