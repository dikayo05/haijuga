class PostModel {
  final String _caption      = '';
  final String _media        = '';
  final int    _likeCount    = 0;
  final int    _commentCount = 0;
  final int    _shareCount   = 0;

  Map<String, dynamic> toJson() {
    return {
      "caption":       _caption,
      "media":         _media,
      "like_count":    _likeCount,
      "comment_count": _commentCount,
      "share_count":   _shareCount
    };
  }
}
