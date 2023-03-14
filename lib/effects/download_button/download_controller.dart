import 'package:flutter/cupertino.dart';
import 'package:flutter_animations/effects/download_button/enum.dart';

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;
  double get progress;

  void startDownload();
  void stopDownload();
  void openDownload();
}

class AnimatedDownloadController extends DownloadController
    with ChangeNotifier {
  AnimatedDownloadController({
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    required VoidCallback onOpenDownload,
  })  : _downloadStatus = downloadStatus,
        _progress = progress,
        _onOpenDownload = onOpenDownload;

  DownloadStatus _downloadStatus;

  @override
  DownloadStatus get downloadStatus => _downloadStatus;
  double _progress;

  @override
  double get progress => _progress;
  final VoidCallback _onOpenDownload;

  bool _isDownloading = false;

  @override
  void openDownload() {
    if (downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }

  @override
  void startDownload() {
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doAnimateDownload();
    }
  }

  @override
  void stopDownload() {
    if (_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  Future<void> _doAnimateDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fethcingDownload;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (!_isDownloading) {
      return;
    }

    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();

    const downloadProgressStopList = [0.0, 0.15, 0.45, 0.8, 1.0];
    for (final stop in downloadProgressStopList) {
      await Future.delayed(const Duration(seconds: 1));

      if (!_isDownloading) {
        return;
      }
      _progress = stop;
      notifyListeners();
    }

    await Future.delayed(const Duration(seconds: 1));

    if (!_isDownloading) {
      return;
    }

    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }
}
