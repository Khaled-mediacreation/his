import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:his/constants.dart';
import 'package:his/core/services/shared_preferences.dart';
import 'package:his/core/utils/app_colors.dart';
import 'package:his/core/utils/app_text_styles.dart';
import 'package:his/core/utils/assets.dart';
import 'package:his/core/widgets/text_container_widget.dart';
import 'package:his/features/authentication/presentation/view/login_view.dart';
import 'package:his/features/home/data/models/article_model.dart';
import 'package:his/features/home/presentation/view/article_view.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!Prefs.getBool(PrefsKeys.isLoggedIn)) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const LoginView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
        } else {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => ArticleView(
                  articleModel: widget.articleModel,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ));
        }
      },
      child: Container(
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: AppColors.lightGrey,
                  width: 0.5,
                )),
            shadows: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 6.10,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AspectRatio(
              aspectRatio: 294 / 68,
              child: Image.asset(
                Assets.assetsImagesDoctestimage,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                const TextContainerWidget(text: 'Nutrition'),
                SizedBox(
                  width: 11.w,
                ),
                Text(
                  '8 Mins read',
                  style:
                      Styles.semiBoldRoboto10.copyWith(color: AppColors.grey),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isBookmarked = !isBookmarked;
                      });
                    },
                    icon: Icon(
                      isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined,
                      color: AppColors.primaryColor,
                      size: 18,
                    )),
              ],
            ),
            Text(
              widget.articleModel.title!,
              style: Styles.semiBoldPoppins14,
            ),
            Text(
              widget.articleModel.description!,
              style: Styles.regularRoboto10.copyWith(color: AppColors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesLink),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.articleModel.hyperlink ?? '',
                  style: Styles.regularRoboto10
                      .copyWith(color: const Color(0xff2463B6)),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
