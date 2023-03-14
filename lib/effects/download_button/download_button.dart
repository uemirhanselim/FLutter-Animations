import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/effects/download_button/download_controller.dart';
import 'package:flutter_animations/effects/download_button/enum.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  late final List<DownloadController> _downloadCOntrollers;

  @override
  void initState() {
    _downloadCOntrollers = List<DownloadController>.generate(
        3,
        (index) => AnimatedDownloadController(onOpenDownload: () {
              _openDownload(index);
            }));
    super.initState();
  }

  void _openDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Opened the downloaded file $index")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade200,
      appBar: AppBar(
        title: const Text('Download Button Animation'),
        backgroundColor: Colors.amberAccent.shade700,
      ),
      body: ListView.separated(
          itemBuilder: _buildListItem,
          separatorBuilder: (_, __) => const Divider(),
          itemCount: _downloadCOntrollers.length),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final theme = Theme.of(context);
    final downloadController = _downloadCOntrollers[index];

    return SizedBox(
      width: 100,
      child: ListTile(
        title: Text(
          "Item ${index + 1}",
          style: theme.textTheme.titleLarge,
        ),
        subtitle: Text(
          "Subscribe to Code Diaries ${index + 1}",
          style: theme.textTheme.bodySmall,
        ),
        trailing: SizedBox(
          width: 96,
          child: AnimatedBuilder(
            animation: downloadController,
            builder: (context, child) {
              return DownloadButtonWidget(
                onCancel: downloadController.stopDownload,
                onDownload: downloadController.startDownload,
                onOpen: downloadController.openDownload,
                status: downloadController.downloadStatus,
                donwloadProgress: downloadController.progress,
              );
            },
          ),
        ),
      ),
    );
  }
}

class DownloadButtonWidget extends StatelessWidget {
  const DownloadButtonWidget(
      {super.key,
      required this.status,
      this.donwloadProgress = 0.0,
      required this.onDownload,
      required this.onCancel,
      required this.onOpen,
      this.transitionDuration = const Duration(milliseconds: 500)});

  final DownloadStatus status;
  final double donwloadProgress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transitionDuration;

  bool get _isDownloading => status == DownloadStatus.downloading;

  bool get _isFetching => status == DownloadStatus.fethcingDownload;

  bool get _isDownloaded => status == DownloadStatus.downloaded;

  void _onPressed() {
    switch (status) {
      case DownloadStatus.notDownloaded:
        onDownload();
        break;
      case DownloadStatus.fethcingDownload:
        break;
      case DownloadStatus.downloading:
        onCancel();
        break;
      case DownloadStatus.downloaded:
        onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          ButtonShapeWidget(
            isDownloaded: _isDownloaded,
            isDownloading: _isDownloading,
            isFetching: _isFetching,
            transitionDuration: transitionDuration,
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: transitionDuration,
              opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ProgressIndicatorWidget(
                    donwloadProgress: donwloadProgress,
                    isDownloading: _isDownloading,
                    isFetching: _isFetching,
                  ),
                  if (_isDownloading)
                    const Icon(
                      Icons.stop,
                      size: 14,
                      color: Colors.purple,
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget(
      {super.key,
      required this.donwloadProgress,
      required this.isDownloading,
      required this.isFetching});

  final double donwloadProgress;
  final bool isDownloading;
  final bool isFetching;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: donwloadProgress),
        duration: const Duration(milliseconds: 500),
        builder: (context, progress, child) {
          return CircularProgressIndicator(
            backgroundColor: isDownloading
                ? CupertinoColors.lightBackgroundGray
                : Colors.white.withOpacity(0),
            valueColor: AlwaysStoppedAnimation(isFetching
                ? CupertinoColors.lightBackgroundGray
                : Colors.purple),
            strokeWidth: 2,
            value: isFetching ? null : progress.toDouble(),
          );
        },
      ),
    );
  }
}

class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget(
      {super.key,
      required this.isDownloading,
      required this.isDownloaded,
      required this.isFetching,
      required this.transitionDuration});

  final bool isDownloading;
  final bool isDownloaded;
  final bool isFetching;
  final Duration transitionDuration;

  @override
  Widget build(BuildContext context) {
    var shape = const ShapeDecoration(
        shape: StadiumBorder(), color: CupertinoColors.lightBackgroundGray);

    if (isDownloading || isFetching) {
      shape = ShapeDecoration(
        shape: const CircleBorder(),
        color: Colors.white.withOpacity(0),
      );
    }
    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AnimatedOpacity(
          duration: transitionDuration,
          opacity: isDownloading || isFetching ? 0.0 : 1.0,
          curve: Curves.ease,
          child: Text(isDownloaded ? "Open" : "Download",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  )),
        ),
      ),
    );
  }
}
