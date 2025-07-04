import 'package:his/features/bookmarks/data/models/bookmarks_model/item.dart';

class MediaModel {
  int? id;
  int? categoryId;
  int? userId;
  String? title;
  String? views;
  String? description;
  String? filePath;
  String? pdf;
  String? thumbnailPath;
  String? status;
  String? duration;
  int? isFeatured;
  int? isRecommended;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? commentsCount;
  int? likesCount;
  String? image;

  MediaModel({
    this.id,
    this.categoryId,
    this.userId,
    this.title,
    this.views,
    this.description,
    this.filePath,
    this.pdf,
    this.thumbnailPath,
    this.status,
    this.isFeatured,
    this.isRecommended,
    this.createdAt,
    this.updatedAt,
    this.duration,
    this.commentsCount,
    this.likesCount,
    this.image,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json['id'] as int?,
        categoryId: json['category_id'] as int?,
        userId: json['user_id'] as int?,
        title: json['title'] as String?,
        views: json['views'] as String?,
        description: json['description'] as String?,
        filePath: json['file_path'] as String?,
        pdf: json['pdf'] as String?,
        duration: json['duration'] as String?,
        thumbnailPath: json['thumbnail_path'] as String,
        image: json['image_path'] as String?,
        commentsCount: json['comments_count'] as int?,
        likesCount: json['likes_count'] as int?,
        status: json['status'] as String?,
        isFeatured: json['is_featured'] as int?,
        isRecommended: json['is_recommended'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'user_id': userId,
        'title': title,
        'views': views,
        'description': description,
        'file_path': filePath,
        'pdf': pdf,
        'duration': duration,
        'thumbnail_path': thumbnailPath,
        'image_path': image,
        'comments_count': commentsCount,
        'likes_count': likesCount,
        'status': status,
        'is_featured': isFeatured,
        'is_recommended': isRecommended,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
  factory MediaModel.fromBookmarks(Item bookmark) => MediaModel(
        id: bookmark.id,
        categoryId: bookmark.categoryId,
        userId: bookmark.userId,
        title: bookmark.title,
        views: bookmark.views,
        description: bookmark.description as String?,
        filePath: bookmark.filePath,
        pdf: bookmark.pdf,
        duration: bookmark.duration,
        thumbnailPath: bookmark.thumbnailPath as String,
        image: bookmark.imagePath,
        status: bookmark.status,
        isFeatured: bookmark.isFeatured,
        createdAt:
            bookmark.createdAt == null ? null : bookmark.createdAt as DateTime,
        updatedAt:
            bookmark.updatedAt == null ? null : bookmark.updatedAt as DateTime,
      );
}
