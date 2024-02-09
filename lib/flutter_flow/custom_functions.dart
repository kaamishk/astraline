import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String getStringFromList(List<String> list) {
  String out = list[0];
  for (int i = 1; i < list.length; i++) {
    out = out + ', ' + list[i];
  }
  return out;
}

int splitDate(
  DateTime givenDate,
  String type,
) {
  // if type = day return days type = month return month type = year return year from givenDate int
  switch (type) {
    case 'day':
      return givenDate.day;
    case 'month':
      return givenDate.month;
    case 'year':
      return givenDate.year;
    default:
      return 0;
  }
}

int spiltTime(
  DateTime givenTime,
  String type,
) {
  // if type = hour return hours type = min return min from givenTime int
  switch (type) {
    case 'hour':
      return givenTime.hour;
    case 'min':
      return givenTime.minute;
    default:
      return 0;
  }
}

int zodiacNumber(String zodiacName) {
  // return zodiac number
  switch (zodiacName) {
    case 'Aries':
      return 1;
    case 'Taurus':
      return 2;
    case 'Gemini':
      return 3;
    case 'Cancer':
      return 4;
    case 'Leo':
      return 5;
    case 'Virgo':
      return 6;
    case 'Libra':
      return 7;
    case 'Scorpio':
      return 8;
    case 'Sagittarius':
      return 9;
    case 'Capricorn':
      return 10;
    case 'Aquarius':
      return 11;
    case 'Pisces':
      return 12;
    default:
      return 0;
  }
}

double stringToDouble(String givenString) {
  // prase string to double
// Use the try-catch block to handle any errors that may occur during the conversion process
  try {
    return double.parse(givenString);
  } catch (e) {
    print('Error: $e');
    return 0.0;
  }
}

DateTime stringToDate(String givenString) {
  try {
    if (givenString.contains(',')) {
      // Format: Fri, 15 Sep 2023 00:00:00 +0200
      return DateFormat('E, d MMM yyyy HH:mm:ss Z').parse(givenString);
    } else if (givenString.contains('-')) {
      // Format: 14-10-2023
      return DateFormat('dd-MM-yyyy').parse(givenString);
    } else if (givenString.contains('/')) {
      // Format: 14/10/2023
      return DateFormat('dd/MM/yyyy').parse(givenString);
    } else if (givenString.contains(' ')) {
      // Format: Thu Dec 28 2023
      return DateFormat('E MMM d yyyy').parse(givenString);
    } else {
      // Return null if the givenString is not in a recognized format
      return DateTime.now();
    }
  } catch (e) {
    print('Error: $e');
    return DateTime.now();
  }
}

String dateToString(DateTime givenDate) {
  // return given date to string dd-mm-yyyy format
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(givenDate);
  return formatted;
}

String dateFormat() {
  // return current date to 18-11-2023 format
  final now = DateTime.now();
  final formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(now);
}

int charCout(String givenList) {
  // count charectar in givenString
  int count = 0;
  for (int i = 0; i < givenList.length; i++) {
    if (givenList[i] != ' ') {
      count++;
    }
  }
  return count;
}

List<DateTime> getDateTimeOfThisMonth(
  DateTime month,
  int monthsToSkip,
) {
  // get date time list of this month
  final now = DateTime(month.year, month.month + monthsToSkip, 5);
  final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
  final firstDayOfMonth = DateTime(now.year, now.month, 1);
  final lastDayOfMonth = DateTime(now.year, now.month, daysInMonth);

  // Initialize the list of dates
  List<DateTime> dates = List.generate(
      daysInMonth, (index) => DateTime(now.year, now.month, index + 1));

  // Check if the first day of the month is after Monday
  if (firstDayOfMonth.weekday > DateTime.monday) {
    // Calculate the number of days to go back to reach the previous Monday
    final daysBack = firstDayOfMonth.weekday - DateTime.monday;
    final prevMonthLastDay = DateTime(now.year, now.month, 0);

    // Add days from the previous month
    for (int i = 0; i < daysBack; i++) {
      final prevMonthDay =
          prevMonthLastDay.subtract(Duration(days: daysBack - i));
      dates.insert(0, prevMonthDay);
    }
  }

  // Check if the last day of the month is before Sunday
  if (lastDayOfMonth.weekday < DateTime.sunday) {
    // Calculate the number of days to go forward to reach the next Sunday
    final daysForward = DateTime.sunday - lastDayOfMonth.weekday;

    // Add days from the next month
    for (int i = 1; i <= daysForward; i++) {
      final nextMonthDay = DateTime(now.year, now.month + 1, i);
      dates.add(nextMonthDay);
    }
  }
  return dates;
}

DateTime getNextMonth(int skip) {
  // get the date time for next month
  final currentDate = DateTime.now();
  return DateTime(currentDate.year, currentDate.month + skip, 5);
}

List<DateTime> getSelectDates() {
  return [
    DateTime(2023, 11, 2),
    DateTime(2023, 11, 4),
    DateTime(2023, 11, 10),
    DateTime(2023, 11, 20),
    DateTime(2023, 12, 5)
  ];
}

List<DateTime> dateListFormated(List<DateTime> givenList) {
  // retun dateTime list with time 00:00:00.000 from givenList
  List<DateTime> newList = [];
  for (DateTime dateTime in givenList) {
    newList.add(DateTime(dateTime.year, dateTime.month, dateTime.day));
  }
  return newList;
}

DateTime endDate(
  DateTime givenDate,
  int noDays,
) {
  // return date givenDate + noDays
  return givenDate.add(Duration(days: noDays));
}

YogaRoutineRecord filteredRoutineList(
  List<YogaRoutineRecord> givenList,
  List<DocumentReference> refList,
) {
  // return first doc from givenList where refList contain docRef
  for (final routine in givenList) {
    if (refList.contains(routine.reference)) {
      return routine;
    }
  }
  throw Exception('No matching routine found.');
}

List<YogaRoutineRecord> routineFilter(
  List<YogaRoutineRecord> givenRecord,
  String filterOne,
  String filterTwo,
) {
  // return given document with both filters if filterOne = All don't apply filterOne same for filterTwo
  if (filterOne == 'All' && filterTwo == 'All') {
    return givenRecord;
  } else if (filterOne == 'All') {
    return givenRecord
        .where((record) => record.difficulty == filterTwo)
        .toList();
  } else if (filterTwo == 'All') {
    return givenRecord
        .where((record) => record.routinrType == filterOne)
        .toList();
  } else {
    return givenRecord
        .where((record) =>
            record.routinrType == filterOne && record.difficulty == filterTwo)
        .toList();
  }
}

List<HelpRecord> searchHelp(
  List<HelpRecord> givenList,
  String searchString,
) {
  // return list of docs where searchString is like title in givenList
  return givenList
      .where((helpRecord) =>
          helpRecord.title.toLowerCase().contains(searchString.toLowerCase()))
      .toList();
}

List<DateTime> stringToDateList(List<String> givenDate) {
  // prase stringList to dateTimeList
  List<DateTime> dateTimeList = [];
  for (String date in givenDate) {
    List<String> dateParts = date
        .split('/'); // Split the date string into day, month, and year parts
    if (dateParts.length == 3) {
      int? day = int.tryParse(dateParts[0]);
      int? month = int.tryParse(dateParts[1]);
      int? year = int.tryParse(dateParts[2]);

      if (day != null && month != null && year != null) {
        dateTimeList.add(DateTime(year, month, day));
      }
    }
  }
  return dateTimeList;
}

int returnIndex(
  List<String> givenList,
  String filter,
) {
  // return index of filtered item from givenList
  int index = givenList.indexWhere((element) => element.contains(filter));
  return index;
}

DateTime lastDate(List<String> givenDateList) {
  // prase givenDateList (format 31/01/2024) to dateTime and return max date
  DateTime maxDate = DateTime(1900);
  for (String date in givenDateList) {
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
    if (parsedDate.isAfter(maxDate)) {
      maxDate = parsedDate;
    }
  }
  return maxDate;
}

List<String> stringList(
  String astro0,
  String astro1,
  String astro2,
  String astro3,
  String astro4,
  String astro5,
  String astro6,
  String astro7,
  String astro8,
  String astro9,
) {
  // return list of strings
  return [
    astro0,
    astro1,
    astro2,
    astro3,
    astro4,
    astro5,
    astro6,
    astro7,
    astro8,
    astro9
  ];
}

String properText(String givenText) {
  // remove extra line and space from the begining from givenText
  return givenText.trim();
}
