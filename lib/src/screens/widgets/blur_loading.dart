import 'package:flutter/material.dart';
import '../../theme/app_color.dart';

class BlurLoading extends StatelessWidget {
  const BlurLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.loadingBlurColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
}
