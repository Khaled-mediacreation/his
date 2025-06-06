import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:his/core/utils/app_text_styles.dart';
import 'package:his/features/bookmarks/presentation/view/widgets/articles_sliver_list.dart';
import 'package:his/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:his/features/home/presentation/view/widgets/featured_videos_page_view.dart';
import 'package:his/features/home/presentation/view/widgets/recently_added_sliver_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                const CustomTextField(
                  hintText: 'Search..',
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                const Text('Featured Videos', style: Styles.semiBoldRoboto20),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: isPortrait
                      ? mediaQuery.size.height * 0.36
                      : mediaQuery.size.height * 0.7,
                ),
                child: const FeaturedVideosPageView()),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                const Text('Articles', style: Styles.semiBoldRoboto20),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
          const ArticlesSliverList(),
          // SliverToBoxAdapter(
          //     child: Row(
          //   children: [
          //     // const Text('Recommended Videos', style: Styles.semiBoldRoboto20),
          //     const Spacer(),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => const LoginView(),
          //         ));
          //       },
          //       child: Text('See All',
          //           style: Styles.regularRoboto12
          //               .copyWith(color: AppColors.primaryColor)),
          //     ),
          //   ],
          // )),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 12.h,
          //   ),
          // ),
          // const RecommendedVideosSliverGrid(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                const Text('Recently Added', style: Styles.semiBoldRoboto20),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
          const RecentlyAddedSliverList(),
        ],
      ),
    );
  }
}
