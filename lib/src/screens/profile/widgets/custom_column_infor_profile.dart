import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../widgets/app_text.dart';

class CustomColumnInforProfile extends StatelessWidget {
  const CustomColumnInforProfile({
    required this.title,
    required this.content,
    super.key,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        AppText(
          text: title,
          style: theme.appTextLabelLarge,
        ),
        AppText(
          text: content.toUpperCase(),
          style: theme.appTextLabelMedium,
        ),
      ],
    );
  }
}
