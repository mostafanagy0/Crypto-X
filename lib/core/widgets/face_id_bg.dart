import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:flutter/material.dart';

class FaceIdBg extends StatelessWidget {
  const FaceIdBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppPngAssets.faceIdBg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
