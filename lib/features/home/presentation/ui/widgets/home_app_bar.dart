import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(AppPngAssets.profileImage),
      ),
      title: Text('Hi, Ahmed 👋🏿', style: TextStyles.font18Bold),
      trailing: SvgPicture.asset(AppSvgAssets.notification),
    );
  }
}
