import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:his/core/errors/failure.dart';
import 'package:his/core/services/api_services.dart';
import 'package:his/core/utils/api_endpoints.dart';
import 'package:his/features/category/data/model/media_model.dart';
import 'package:his/features/home/data/models/article_model.dart';

class GlobalSearchRepo {
  final ApiServices apiServices;
  GlobalSearchRepo({required this.apiServices});
  Future<Either<Failure, Either<List<ArticleModel>, List<MediaModel>>>> search({
    required String query,
  }) async {
    try {
      Map<String, dynamic> searchQuery = {'search': query};
      final data = await apiServices.getMethod(
          endPoint: ApiEndpoints.search, data: searchQuery);
      String type = data['type'];
      if (type == 'media') {
        dynamic dataList = data['data'];
        List<MediaModel> mediaList = [];
        mediaList.add(MediaModel.fromJson(dataList));
        return Right(Right(mediaList));
      } else {
        dynamic dataList = data['data'];
        List<ArticleModel> articleList = [];
        articleList.add(ArticleModel.fromJson(dataList));
        return Right(Left(articleList));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errMesage: 'Something went wrong , try again'));
    }
  }
}
