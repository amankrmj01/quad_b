import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controllers/searchh.controller.dart';

class SearchhScreen extends GetView<SearchhController> {
  const SearchhScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            8.heightBox,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                // const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      const CircleBorder(side: BorderSide.none),
                    ),
                    fixedSize: WidgetStateProperty.all(
                      const Size(48, 48),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.all(0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
