import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_color.dart';

class AvatarChatWidget extends StatelessWidget {
  final bool checkLastMessage;

  const AvatarChatWidget({
    required this.checkLastMessage,
    super.key,
  });

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
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
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
