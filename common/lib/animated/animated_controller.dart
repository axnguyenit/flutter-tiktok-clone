class AnimatedController {
  final Duration duration;
  void Function()? runAnimation;
  void Function()? onAnimationFinished;

  AnimatedController({this.duration = const Duration(milliseconds: 250)});

  void run() {
    if (runAnimation != null) {
      runAnimation!();
    }
  }

  void addListeners({required void Function() onFinished}) {
    onAnimationFinished = onFinished;
  }

  void dispose() {
    onAnimationFinished = null;
  }
}
