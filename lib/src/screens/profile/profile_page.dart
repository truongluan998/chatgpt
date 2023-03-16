import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../routes/app_router.dart';
import '../../theme/app_color.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text.dart';
import 'widgets/custom_column_infor_profile.dart';
import 'widgets/vertical_divider_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                ImageConstants.defaultBackground,
                width: double.infinity,
                height: size.height * DimensionConstants.size_0DOT8,
                fit: BoxFit.fill,
              ),
              Container(
                width: double.infinity,
                height: size.height * DimensionConstants.size_0DOT8,
                color: AppColor.profileBlurColor.withOpacity(DimensionConstants.opacity_0DOT8),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * DimensionConstants.size_0DOT8,
                child: Padding(
                  padding: const EdgeInsets.all(DimensionConstants.size_20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => context.router.pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      const CircleAvatar(
                        radius: DimensionConstants.size_70,
                        backgroundImage: AssetImage(
                          ImageConstants.defaultBackground,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Andrea Jameson',
                            style: theme.labelLarge!.copyWith(color: AppColor.whiteColor),
                          ),
                          AppText(
                            text: 'truongluan998@gmail.com',
                            style: theme.labelMedium!.copyWith(color: AppColor.whiteColor),
                          ),
                        ],
                      ),
                      const Divider(height: DimensionConstants.size_2, color: AppColor.dividerColor),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'about_me'.tr(),
                            style: theme.labelLarge!.copyWith(color: AppColor.whiteColor),
                          ),
                          AppText(
                            text:
                                "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                            style: theme.labelMedium!.copyWith(color: AppColor.whiteColor),
                            maxLine: DimensionConstants.maxLine_4,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CustomColumnInforProfile(
                            title: '145K',
                            content: 'Followers',
                          ),
                          VerticalDividerProfile(),
                          CustomColumnInforProfile(
                            title: '56K',
                            content: 'Following',
                          ),
                          VerticalDividerProfile(),
                          CustomColumnInforProfile(
                            title: '1,690',
                            content: 'Like',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionConstants.size_32,
              vertical: DimensionConstants.size_48,
            ),
            child: AppElevatedButton(
              press: () => context.router.push(const HomeRoute()),
              text: 'chat_with_gpt'.tr(),
            ),
          )
        ],
      ),
    );
  }
}
