import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/utils/assets.dart';

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetData.fecebook),
        const SizedBox(width: 18),
        SvgPicture.asset(AssetData.chrome),
        const SizedBox(width: 18),
        SvgPicture.asset(AssetData.twitter),
      ],
    );
  }
}
