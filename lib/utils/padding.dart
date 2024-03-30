import 'package:flutter/material.dart';

extension PaddingExt on Widget {
  Padding paddingOnly({
    double left = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    double top = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
      child: this,
    );
  }

  Padding paddingSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Padding paddingAll(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Padding zeroPadding() => Padding(padding: EdgeInsets.zero, child: this);
}
