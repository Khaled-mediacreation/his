import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his/core/services/get_it.dart';
import 'package:his/core/utils/app_colors.dart';
import 'package:his/core/utils/app_text_styles.dart';
import 'package:his/features/category/data/model/media_model.dart';
import 'package:his/features/category/data/repo/comments_repo.dart';
import 'package:his/features/category/presentation/cubits/add_comments_cubit/comments_cubit.dart';
import 'package:his/features/category/presentation/cubits/get_comments_cubit/get_comments_cubit.dart';
import 'package:his/features/category/presentation/view/widgets/video_widget.dart';

class VideoView extends StatelessWidget {
  const VideoView({
    super.key,
    required this.mediaModel,
  });
  final MediaModel mediaModel;
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
        title: Text(
          mediaModel.title ?? "",
          style: Styles.semiBoldRoboto20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CommentsCubit(getIt<CommentRepo>()),
            ),
            BlocProvider(
              create: (context) => GetCommentsCubit(getIt<CommentRepo>())
                ..getComments(mediaId: 1),
            ),
          ],
          child: VideoWidget(mediaModel: mediaModel),
        ),
      ),
    );
  }
}
