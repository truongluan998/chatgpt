import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../theme/app_color.dart';

class VerticalDividerProfile extends StatelessWidget {
  const VerticalDividerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const SizedBox(
      height: DimensionConstants.size_36,
      child: VerticalDivider(
        thickness: DimensionConstants.size_1,
        color: AppColor.whiteColor,
      ),
    );
}
