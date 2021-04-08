import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/resources/colors.dart';
import 'package:movie_app_flutter/resources/dimen.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: RawMaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Dimen.detailButtonBorderRadius),
            ),
            fillColor: MovieColors.greyButton,
            padding: const EdgeInsets.symmetric(
              horizontal: Dimen.detailCollectButtonHorizontalPadding,
              vertical: Dimen.detailButtonVerticalPadding,
            ),
            elevation: 0.0,
            child: Text(
              context.text.detailCollect,
              style:
                  textTheme.button!.copyWith(color: MovieColors.greyButtonText),
            ),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 8,
          child: RawMaterialButton(
            onPressed: () {},
            fillColor: MovieColors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Dimen.detailButtonBorderRadius),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: Dimen.detailButtonVerticalPadding,
            ),
            child: Text(
              context.text.detailBuyNow,
              style: textTheme.button,
            ),
          ),
        ),
      ],
    );
  }
}
