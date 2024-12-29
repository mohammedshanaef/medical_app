import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/utils/assets.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": "Cardiologist", "image": AssetData.category1},
      {"name": "Psychologist", "image": AssetData.category2},
      {"name": "Dentist", "image": AssetData.category3},
      {"name": "Psychiatrist", "image": AssetData.category4},
    ];

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal.shade100,
                child: ClipOval(
                  child: SvgPicture.asset(
                    categories[index]['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(categories[index]['name']!),
            ],
          );
        },
      ),
    );
  }
}
