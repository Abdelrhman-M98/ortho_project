// ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ortho/components/AppColors.dart';
// import 'package:ortho/models/dataOfScan.dart';

// class CircularProgress extends StatelessWidget {
//   final List<ListItem> items;

//   const CircularProgress({
//     super.key,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     int totalScans = items.length;
//     int validScans = items.where((item) => item.IsimageVailed == 1).length;
//     double validPercentage = (validScans / totalScans) * 100;

//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         SizedBox(
//           width: 108.w, // Set the width and height of the circle
//           height: 108.h,
//           child: CircularProgressIndicator(
//             strokeCap: StrokeCap.round,
//             value: validPercentage / 100,
//             color: AppColors.Primary_color,
//             strokeWidth: 6,
//           ),
//         ),
//         Text(
//           '${validPercentage.toStringAsFixed(0)}%',
//           style: const TextStyle(
//             fontFamily: "Nunito",
//             color: AppColors.Primary_color,
//             fontWeight: FontWeight.w800,
//             fontSize: 20,
//           ),
//         ),
//       ],
//     );
//   }
// }
