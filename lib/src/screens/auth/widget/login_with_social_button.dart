import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../theme/app_color.dart';

class LoginWithSocialButton extends StatelessWidget {
  const LoginWithSocialButton({
    required this.press,
    required this.icon,
    super.key,
  });

  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.radius_24),
        ),
        child: Icon(
          icon,
          color: AppColor.primaryColor,
          size: DimensionConstants.size_44,
        ),
      ),
    );
}
