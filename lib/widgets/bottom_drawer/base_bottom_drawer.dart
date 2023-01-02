part of 'bottom_drawer.dart';

class BaseBottomDrawer {
  final BuildContext context;
  final Widget child;
  final EdgeInsets? padding;

  const BaseBottomDrawer({
    required this.context,
    required this.child,
    this.padding,
  });

  Future<T?> show<T>() {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: padding ?? const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    child,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
