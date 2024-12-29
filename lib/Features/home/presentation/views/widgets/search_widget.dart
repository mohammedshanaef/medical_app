import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final double width;
  final double height; 

  const SearchWidget({Key? key, this.width = double.infinity, this.height = 70.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
