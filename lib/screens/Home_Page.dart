// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 45.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      'Welcome , islam',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.dark_text,
                        fontFamily: 'Montserrat',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      'let’s check your dental health',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.SubHeadText,
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //let’s check your dental health
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/photos/onBording.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 34.h,
          ),
          ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                String dropdownValue = list.first;

                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 18.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: Image.asset("assets/images/icons/Search.png"),
                  trailing: <Widget>[
                    Tooltip(
                      message: 'All',
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/images/icons/Filter.png"),
                            selectedIcon:
                                const Icon(Icons.brightness_2_outlined),
                          ),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              // setState(() {
                              //   dropdownValue = value!;
                              // });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    // onTap: () {
                    //   setState(() {
                    //     controller.closeView(item);
                    //   });
                    // },
                  );
                });
              }),
            ],
          ),
        ],
      ),
    );
  }
}
