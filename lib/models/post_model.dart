import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? caption;
  String? media;
  int likeCount;
  int commentCount;
  int shareCount;

  PostModel({
    this.caption,
    this.media,
    this.likeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "caption": caption,
      "media": media,
      "like_count": likeCount,
      "comment_count": commentCount,
      "share_count": shareCount,
      "created_at": FieldValue.serverTimestamp(),
      "updated_at": FieldValue.serverTimestamp(),
    };
  }
}
