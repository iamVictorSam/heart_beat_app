import 'dart:math' as math; // Import the math library for min and max functions

import 'package:intl/intl.dart';

List<int> getHighestAndLowest(List<int> numbers) {
  if (numbers.isEmpty) {
    return []; // Handle empty array case
  }

  int highest = numbers[0];
  int lowest = numbers[0];

  for (int number in numbers) {
    highest = math.max(highest, number); // Update highest with the larger value
    lowest = math.min(lowest, number); // Update lowest with the smaller value
  }

  return [
    highest,
    lowest
  ]; // Return a list containing highest and lowest values
}

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('HH:mm MM/dd/yyyy'); // Customize the format here
  return formatter.format(dateTime);
}
