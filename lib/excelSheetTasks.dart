import 'dart:io';

import 'package:excel/excel.dart';

String addCommaAfterEveryTenCharacters(String input) {
  // Remove any white spaces from the input string
  String numbers = input.replaceAll(RegExp(r'\s+'), '');

  // Split the string into chunks of 10 characters
  List<String> chunks = [];
  for (int i = 0; i < numbers.length; i += 10) {
    var end = (i + 10 < numbers.length) ? i + 10 : numbers.length;
    chunks.add(numbers.substring(i, end));
  }

  // Join the chunks with a comma and convert them back to a single string
  String result = chunks.join(',');
  return result;
}

String filePath ="assets/new.xlsx";
Map<String, String> setMap(String number) {
  String news = addCommaAfterEveryTenCharacters(number);
  news.replaceAll(RegExp(r' '), "");
  List<String> list = news.split(",");
  print(list.length);
  Map<String, String> map = {};
  for (var i = 0; i < list.length; i++) {
    map["A${i + 3506}"] = list[i];
  }
  return map;
}

bool writeMapToExcel(Map<String, String> dataMap, String filePath) {
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  // Write headers for columns
  sheet.appendRow(['Name', 'Phone Number']);

  // Write data from the Map to the sheet
  dataMap.forEach((key, value) {
    sheet.appendRow([key, value]);
  });

  // Save the Excel file
  var file = File(filePath);
  file.writeAsBytesSync(excel.save()!);
  return true;
}