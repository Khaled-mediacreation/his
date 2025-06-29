import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:his/core/helpers/dummy_media.dart';
import 'package:his/core/utils/app_text_styles.dart';
import 'package:his/features/home/presentation/view/widgets/articles_sliver_list.dart';
import 'package:his/features/category/presentation/view/widgets/category_list.dart';
import 'package:his/features/home/presentation/view/widgets/custom_text_form_field.dart';
import 'package:his/features/home/presentation/view/widgets/video_card_sliver_list.dart';

class BookmarksViewBody extends StatefulWidget {
  const BookmarksViewBody({super.key});

  @override
  State<BookmarksViewBody> createState() => _BookmarksViewBodyState();
}

class _BookmarksViewBodyState extends State<BookmarksViewBody> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTextFormField(hintText: 'Search in Bookmark'),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: 32,
                width: double.infinity,
                child: YearList(
                  categoryList: const [
                    'Videos',
                    'Articles',
                  ],
                  onItemTapped: (int value) {
                    if (value == index) return;
                    setState(() {
                      index = value;
                    });
                  },
                )),
          ),
          index == 0
              ? SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      const Text(
                        '2025\'s Videos',
                        style: Styles.semiBoldRoboto20,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
          index == 0
              ? const VideoCardSliverList(
                  mediaList: [],
                  isBookmark: true,
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
          index == 1
              ? SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      const Text(
                        'Saved Articles',
                        style: Styles.semiBoldRoboto20,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
          index == 1
              ? ArticlesSliverList(
                  articleList: dummyArticleList,
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 24,
          )),
        ],
      ),
    );
  }
}
