// ignore_for_file: non_constant_identifier_names

class ListItem {
  int scan_num = 0;
  final DateTime date_of_scan;
  final String beforeImage;
  final String afterImage;

  ListItem({
    required this.date_of_scan,
    required this.beforeImage,
    required this.afterImage,
  });
}
