import 'package:flutter/material.dart';

TextSpan processSummary(String summary, Color color, double fontSize) {
  // Remove all HTML tags except <b> and </b>
  // summary =
  //     summary.replaceAll(RegExp(r'<\/?(?!b\b)[^>]*>', caseSensitive: true), '');

  // Replace <b> and </b> tags with TextSpan for bold text
  summary = summary.replaceAll(RegExp(r'<\/?p>', caseSensitive: false), '');
  final boldRegex = RegExp(r'<b>(.*?)<\/b>', caseSensitive: true);
  final matches = boldRegex.allMatches(summary);

  List<TextSpan> spans = [];
  int lastMatchEnd = 0;

  for (final match in matches) {
    if (match.start > lastMatchEnd) {
      spans.add(TextSpan(
        text: summary.substring(lastMatchEnd, match.start),
        style:
            TextStyle(color: color, fontSize: fontSize), // Default text color
      ));
    }
    spans.add(TextSpan(
      text: match.group(1),
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: fontSize + 1), // Bold text color
    ));
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < summary.length) {
    spans.add(TextSpan(
      text: summary.substring(lastMatchEnd),
      style: TextStyle(color: color, fontSize: fontSize), // Default text color
    ));
  }

  return TextSpan(children: spans);
}
