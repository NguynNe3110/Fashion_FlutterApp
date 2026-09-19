import 'package:flutter/material.dart';

import '../../app.dart';

class AnimatedAppSplash extends StatefulWidget {
  const AnimatedAppSplash({required this.child, super.key});

  final Widget child;

  @override
  State<AnimatedAppSplash> createState() => _AnimatedAppSplashState();
}

class _AnimatedAppSplashState extends State<AnimatedAppSplash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 2200),
          )
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed && mounted) {
              setState(() => _isVisible = false);
            }
          })
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        if (_isVisible)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final progress = _controller.value;
              final entrance = Curves.easeOutBack.transform(
                (progress / 0.55).clamp(0.0, 1.0),
              );
              final exitOpacity = progress <= 0.8
                  ? 1.0
                  : ((1.0 - progress) / 0.2).clamp(0.0, 1.0);
              final lineProgress = Curves.easeInOutCubic.transform(
                ((progress - 0.25) / 0.45).clamp(0.0, 1.0),
              );

              return Opacity(
                opacity: exitOpacity,
                child: ColoredBox(
                  color: AppColors.background,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: (progress / 0.3).clamp(0.0, 1.0),
                          child: Transform.translate(
                            offset: Offset(0, 18 * (1 - entrance)),
                            child: Transform.scale(
                              scale: 0.86 + (0.14 * entrance),
                              child: Image.asset(
                                AppImages.appLogo,
                                width: Dimens.d220.responsive(),
                                height: Dimens.d220.responsive(),
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimens.d16.responsive()),
                        Text(
                          'THỜI TRANG TỐI GIẢN',
                          style: AppTextStyles.eyebrow().copyWith(
                            color: AppColors.ink2,
                            letterSpacing: 2.4,
                          ),
                        ),
                        SizedBox(height: Dimens.d20.responsive()),
                        Container(
                          width: Dimens.d80.responsive(),
                          height: Dimens.d2.responsive(),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: AppColors.line,
                            borderRadius: BorderRadius.circular(
                              Dimens.d100.responsive(),
                            ),
                          ),
                          child: FractionallySizedBox(
                            widthFactor: lineProgress,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.ink,
                                borderRadius: BorderRadius.circular(
                                  Dimens.d100.responsive(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
