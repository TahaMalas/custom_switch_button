import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

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
    @required this.backgroundColor,
    @required this.checked,
    @required this.checkedColor,
    @required this.unCheckedColor,
    @required this.animationDuration,
    this.buttonWidth = 40,
    this.buttonHeight = 20,
    this.indicatorWidth = 13,
    this.indicatorBorderRadius = 25,
    this.backgroundBorderRadius = 30,
  })  : assert(animationDuration != null),
        assert(unCheckedColor != null),
        assert(backgroundColor != null),
        assert(checkedColor != null),
        assert(checked != null);

  @override
  Widget build(BuildContext context) {
    var tween = MultiTrackTween([
      Track("paddingLeft").add(animationDuration, Tween(begin: 0.0, end: 20.0)),
      Track("color").add(animationDuration,
          ColorTween(begin: unCheckedColor, end: checkedColor)),
    ]);

    return ControlledAnimation(
      playback: checked ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      startPosition: checked ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildCheckbox,
    );
  }

  Widget _buildCheckbox(context, animation) {
    return Container(
      decoration: _outerBoxDecoration(backgroundColor),
      width: buttonWidth,
      height: buttonHeight,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(left: animation["paddingLeft"]),
            child: Container(
              decoration: _innerBoxDecoration(animation["color"]),
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
