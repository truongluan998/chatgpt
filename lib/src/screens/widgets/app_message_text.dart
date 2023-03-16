import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_color.dart';

class MessageWidget extends StatelessWidget {
  final String content;
  final String time;
  final Color backgroundColor;
  final Color textColor;
  final Color timeColor;
  final bool? checkCurrentUserChat;
  const MessageWidget({
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

class AvartarChatWidget extends StatelessWidget {
  final bool checkLastMessage;
  const AvartarChatWidget({ required this.checkLastMessage,super.key,});

  @override
  Widget build(BuildContext context) => checkLastMessage
        ? Material(
            borderRadius: const BorderRadius.all(
              Radius.circular(DimensionConstants.size_18),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              // replase this to photoURL when imp logic on chat page
              'https://pixwares.com/wp-content/uploads/2021/01/anh-gai-xinh.jpg',
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress,) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, object, stackTrace) => const Icon(
                  Icons.account_circle,
                  size: DimensionConstants.size_35,
                  color: Colors.grey,
                ),
              width: DimensionConstants.size_35,
              height: DimensionConstants.size_35,
              fit: BoxFit.cover,
            ),
          )
        : const SizedBox(width: DimensionConstants.size_35);
}