import 'package:flutter/material.dart';
import 'package:his/core/utils/app_colors.dart';
import 'package:his/core/utils/app_text_styles.dart';
import 'package:his/features/category/presentation/view/widgets/video_widget.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.grey,
            size: 18,
          ),
        ),
        title: const Text(
          'Lorem ipsum dolor sit amet',
          style: Styles.semiBoldRoboto20,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: VideoWidget(),
      ),
    );
  }
}
