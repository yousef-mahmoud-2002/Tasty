import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasty/constants.dart';

Widget placeholder() => Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: kPrimaryColor.withValues(alpha: 0.3),
      child: Container(
        color: Colors.grey[200],
        height: 250,
        width: double.infinity,
      ),
    );
