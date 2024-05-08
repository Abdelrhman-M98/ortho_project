// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/models/ScanData/scan_data.dart';

class searchBar extends StatefulWidget {
  const searchBar({
    super.key,
  });

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  String _selectedFilter = 'All';
  static const List<String> list = <String>[
    'All',
    'Curved',
    'Date',
    'Num Of Scan'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchbar_background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(
          color: AppColors.searchbar_background,
          width: 1.w,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: AppColors.searchbar_text,
                  fontFamily: "Nunito",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                icon: const Icon(Icons.search),
              ),
            ),
          ),
          Image(
            width: 12.w,
            height: 12.h,
            image: const AssetImage("assets/images/icons/Filter.png"),
          ),
          Text(
            _selectedFilter,
            style: TextStyle(
              color: AppColors.searchbar_text,
              fontFamily: "Nunito",
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ), // Display selected filter
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            onSelected: (value) {
              setState(() {
                _selectedFilter = value; // Update selected filter
              });
            },
            itemBuilder: (BuildContext context) {
              return list.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
