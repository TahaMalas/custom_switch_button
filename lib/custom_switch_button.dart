import 'package:flutter/material.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

enum AniProps { paddingLeft, color }

class CustomSwitchButton extends StatelessWidget {
  final bool checked;

  final Color checkedColor;

  final Color unCheckedColor;

  final Duration animationDuration;

  final Color backgroundColor;

  final double buttonWidth;

  final double buttonHeight;
  final double indicatorWidth;
  final double indicatorBorderRadius;
  final double backgroundBorderRadius;

  const CustomSwitchButton({
    required this.backgroundColor,
    required this.checked,
    required this.checkedColor,
    required this.unCheckedColor,
    required this.animationDuration,
    this.buttonWidth = 40,
    this.buttonHeight = 20,
    this.indicatorWidth = 13,
    this.indicatorBorderRadius = 25,
    this.backgroundBorderRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    // var tween = MultiTween([
    //   Track("paddingLeft").add(animationDuration, Tween(begin: 0.0, end: 20.0)),
    //   Track("color").add(animationDuration,
    //       ColorTween(begin: unCheckedColor, end: checkedColor)),
    // ]);
    var tween = MultiTween<AniProps>()
      ..add(
          AniProps.paddingLeft, Tween(begin: 0.0, end: 20.0), animationDuration)
      ..add(
          AniProps.color,
          ColorTween(begin: unCheckedColor, end: checkedColor),
          animationDuration);

    // return ControlledAnimation(
    //   playback: checked ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
    //   startPosition: checked ? 1.0 : 0.0,
    //   duration: tween.duration * 1.2,
    //   tween: tween,
    //   curve: Curves.easeInOut,
    //   builder: _buildCheckbox,
    // );
    return CustomAnimation<MultiTweenValues<AniProps>>(
      builder: _buildCheckbox,
      tween: tween,
      curve: Curves.easeInOut,
      control: checked
          ? CustomAnimationControl.play
          : CustomAnimationControl.playReverse,
      startPosition: checked ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
    );
  }

  Widget _buildCheckbox(
      BuildContext context, Widget? child, MultiTweenValues<AniProps> value) {
    return Container(
      decoration: _outerBoxDecoration(backgroundColor),
      width: buttonWidth,
      height: buttonHeight,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(left: value.get(AniProps.paddingLeft)),
            child: Container(
              decoration: _innerBoxDecoration(value.get(AniProps.color)),
              width: indicatorWidth,
            ),
          ))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(indicatorBorderRadius)),
      color: color);

  BoxDecoration _outerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(backgroundBorderRadius)),
        color: backgroundColor,
      );
}
