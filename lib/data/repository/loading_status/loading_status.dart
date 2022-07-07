import 'package:flutter/foundation.dart';
import 'package:movie_app_flutter/data/repository/loading_status/stream_data.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stream_transform/stream_transform.dart';

class LoadingStatus {
  BehaviorSubject<bool>? _loadingController;
  bool _isLoading = false;
  bool _streamedInitialEvent = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    _publishLoadingState();
  }

  bool get isLoading => _isLoading;

  Stream<bool> listen() {
    _loadingController ??= BehaviorSubject(
        onListen: _publishInitialLoadingState,
        onCancel: () {
          _loadingController?.close();
          _loadingController = null;
          _streamedInitialEvent = false;
        });
    return _loadingController!.stream.distinct();
  }

  void _publishInitialLoadingState() {
    if (!_streamedInitialEvent) {
      _publishLoadingState();
      _streamedInitialEvent = true;
    }
  }

  void _publishLoadingState() {
    _loadingController?.sink.add(_isLoading);
  }
}

extension LoadingStatusStreamExtension<T> on Stream<T> {
  DataStream<T> withLoading(LoadingStatus loadingStatus) {
    return combineLatest<bool, StreamData<T>>(loadingStatus.listen(), (data, isLoading) {
      if (isLoading) {
        return LoadingData(data);
      }
      return ReadyData(data);
    });
  }
}

