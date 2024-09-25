import 'package:flutter/material.dart';

TextSpan processSummary(String summary) {
  // Remove all HTML tags except <b> and </b>
  summary =
      summary.replaceAll(RegExp(r'<\/?(?!b\b)[^>]*>', caseSensitive: true), '');

  // Replace <b> and </b> tags with TextSpan for bold text
  final boldRegex = RegExp(r'<b>(.*?)<\/b>', caseSensitive: true);
  final matches = boldRegex.allMatches(summary);

  List<TextSpan> spans = [];
  int lastMatchEnd = 0;

  for (final match in matches) {
    if (match.start > lastMatchEnd) {
      spans.add(TextSpan(text: summary.substring(lastMatchEnd, match.start)));
    }
    spans.add(TextSpan(
      text: match.group(1),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < summary.length) {
    spans.add(TextSpan(text: summary.substring(lastMatchEnd)));
  }

  return TextSpan(children: spans);
}
