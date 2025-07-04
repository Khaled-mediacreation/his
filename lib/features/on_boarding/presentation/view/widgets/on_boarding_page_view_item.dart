import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:his/core/utils/app_colors.dart';
import 'package:his/core/utils/app_text_styles.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 328,
            child: AspectRatio(
                aspectRatio: 328 / 320, child: SvgPicture.asset(image))),
        const SizedBox(
          height: 64,
        ),
        Text(
          title,
          style: Styles.semiBoldPoppins24,
        ),
        Text(
          subtitle,
          style: Styles.regularPoppins12.copyWith(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
