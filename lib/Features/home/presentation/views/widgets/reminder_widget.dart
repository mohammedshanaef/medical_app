import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/utils/assets.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: SvgPicture.asset(AssetData.reminderDoctor),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dr. Asaad Hanash", style: TextStyle(color: Colors.white, fontSize: 18)),
              Text("ENT", style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text("Wed 7 Sep 2024  \u2022  10:30 - 11:30 AM", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }
}
