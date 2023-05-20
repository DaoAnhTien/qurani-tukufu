import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurani_tukufu/models/multi_text.dart';
import 'package:qurani_tukufu/modules/common/bloc/app_cubit.dart';
import 'package:qurani_tukufu/modules/common/bloc/app_state.dart';

class MultiLanguageText extends StatelessWidget {
  const MultiLanguageText(this.multiText,
      {Key? key,
      this.style,
      this.space = 5,
      this.supportRTL = false,
      this.isVertical = true})
      : super(key: key);
  final TextStyle? style;
  final MultiText? multiText;
  final double space;
  final bool supportRTL;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    if (!isVertical) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            multiText?.swText ?? '',
            style: style ?? const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 5),
          Text(
            '(${multiText?.arText ?? ''})',
            style: style ?? const TextStyle(fontSize: 14),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment:
            supportRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            multiText?.arText ?? '',
            style: style ?? const TextStyle(fontSize: 14),
            textAlign: supportRTL ? TextAlign.right : TextAlign.left,
          ),
          SizedBox(
            height: space,
          ),
          Text(
            multiText?.swText ?? '',
            style: style ?? const TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: space,
          ),
        ],
      );
    }
  }
}
