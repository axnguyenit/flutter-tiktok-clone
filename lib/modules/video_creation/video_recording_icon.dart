part of 'video_creation_camera.dart';

class VideoRecordingButton extends StatefulWidget {
  final VideoRecordingStatus videoRecordingStatus;

  const VideoRecordingButton({
    super.key,
    required this.videoRecordingStatus,
  });

  @override
  State<VideoRecordingButton> createState() => _VideoRecordingButtonState();
}

class _VideoRecordingButtonState extends State<VideoRecordingButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _setUpAnimation();
    _executeAnimation();
  }

  @override
  void didUpdateWidget(VideoRecordingButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    _executeAnimation();
  }

  void _executeAnimation() {
    log.info('*********** ${widget.videoRecordingStatus} ***********');
    if (widget.videoRecordingStatus == VideoRecordingStatus.recording) {
      _controller
        ..reset()
        ..forward();
    } else {
      _controller.forward(from: 100.0);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  void _setUpAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _animation = Tween(begin: 0.0, end: 100.0).animate(_controller)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: XCircle(percentage: _animation.value),
      child: Center(
        child: widget.videoRecordingStatus == VideoRecordingStatus.init
            ? Icon(
                Icons.circle,
                size: 80,
                color: context.primaryColor,
              )
            : Icon(
                Icons.stop_rounded,
                size: 60,
                color: context.primaryColor,
              ),
      ),
    );
  }
}

class XCircle extends CustomPainter {
  final double percentage;

  const XCircle({
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Paint paint = Paint()
      ..strokeWidth = 6
      ..color = AppColors.primaryColor.withOpacity(.6)
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 40),
      3 * pi / 2,
      2 * pi * (percentage / 100),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
