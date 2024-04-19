// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ortho/components/AppColors.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({
    this.radius = 8,
    required this.mdFileName,
  }) : assert(mdFileName.contains('.md'),
            'The file must contain the .md extension');
  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
  future: rootBundle.loadString('assets/$mdFileName'),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return MarkdownBody(
        data: snapshot.data!,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
  },
)
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
              backgroundColor: AppColors.Pin_error_color,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "CLOSE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
