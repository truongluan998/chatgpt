import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_color.dart';

class AppMessageWidget extends StatelessWidget {
  final String content;
  final String time;
  final Color backgroundColor;
  final Color textColor;
  final Color timeColor;
  final bool? checkCurrentUserChat;
  const AppMessageWidget({
    required this.content,
    required this.backgroundColor,
    required this.textColor,
    required this.time,
    required this.timeColor,
    this.checkCurrentUserChat,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(
        DimensionConstants.size_15,
        DimensionConstants.size_10,
        DimensionConstants.size_15,
        DimensionConstants.size_10,
      ),
      margin: checkCurrentUserChat != null
          ? EdgeInsets.only(
              bottom: checkCurrentUserChat!
                  ? DimensionConstants.size_20
                  : DimensionConstants.size_10,
              right: DimensionConstants.size_10,
            )
          : const EdgeInsets.only(left: DimensionConstants.size_10),
      width: size.width * DimensionConstants.size_0DOT7,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.secondaryColor.withOpacity(0.1),
              spreadRadius: DimensionConstants.size_2,
              blurRadius: DimensionConstants.size_7,
              offset: const Offset(
                DimensionConstants.size_4,
                DimensionConstants.size_10,
              ),
            ),
          ],
          color: backgroundColor,
          borderRadius: BorderRadius.circular(DimensionConstants.size_18),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: textTheme.bodyMedium?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
