import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_color.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.textEditingController,
    this.onChange,
    this.onSubmit,
    this.obscureText = false,
    this.maxLine = 1,
    this.hintText,
    this.labelText,
    this.iconData = Icons.rectangle_outlined,
    this.validator,
    this.elevation = DimensionConstants.elevation_15,
    this.filled = true,
    this.backgroundColor,
    this.enabledBorder,
    this.iconColor = AppColor.secondaryColor,
    this.cursorColor = AppColor.textBlackColor,
    this.textColor,
    super.key,
  });

  final TextEditingController textEditingController;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final bool obscureText;
  final int? maxLine;
  final String? hintText;
  final String? labelText;
  final IconData? iconData;
  final FormFieldValidator<String>? validator;
  final double? elevation;
  final bool? filled;
  final Color? backgroundColor;
  final InputBorder? enabledBorder;
  final Color? iconColor;
  final Color? textColor;
  final Color? cursorColor;


  @override
  Widget build(BuildContext context) => Material(
      borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
      elevation: elevation!,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: DimensionConstants.size_400,
          maxHeight: DimensionConstants.size_44,
        ),
        child: TextFormField(
          style: TextStyle(color: textColor),
          controller: textEditingController,
          cursorColor: cursorColor,
          decoration: InputDecoration(
            filled: filled,
            fillColor: backgroundColor ,
            enabledBorder: enabledBorder,
            prefixIcon: Icon(
              iconData,
              color: iconColor,
            ),
            hintText: hintText,
          ),
          onChanged: onChange,
          onFieldSubmitted: onSubmit,
          obscureText: obscureText,
          maxLines: maxLine,
          validator: validator,
        ),
      ),
    );
}
