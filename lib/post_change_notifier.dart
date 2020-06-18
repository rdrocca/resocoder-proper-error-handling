import 'package:flutter/foundation.dart';
import 'post_service.dart';

enum NotifierState { initial, loading, loaded }

class PostChangeNotifier extends ChangeNotifier {
  
  final _postService = PostService();
  /////////////////////////////////////////////
  NotifierState _state = NotifierState.initial;
  // getter
  NotifierState get state => _state;
  // setter
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }
  /////////////////////////////////////////////
  Post _post;
  // getter
  Post get post => _post;
  // setter
  void _setPost(Post post) {
    _post = post;
    notifyListeners();
  }
  /////////////////////////////////////////////
  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }
  /////////////////////////////////////////////
  void getOnePost() async {
    // use setter
    _setState(NotifierState.loading);
    try {
      final post = await _postService.getOnePost();
      _setPost(post);
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}