import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/utils/assets.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  const HeaderWidget({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello $userName !", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text(
                "How Do You Feel Today?",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff151515),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.green,
              child: SvgPicture.asset(
                AssetData.sign,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
