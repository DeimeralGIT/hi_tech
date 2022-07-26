import 'package:flutter/material.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/numbers_and_params.dart';

OutlinedButton CustomOutlinedButton({
  required Function() onPressed,
  required Widget child,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(outlinedButtonBGColor),
      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: outlinedButtonBorderColor)),
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(
          horizontal: outlinedButtonHorizontalPadding,
        ),
      ),
      fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(outlinedButtonFixedHeight)),
      foregroundColor: MaterialStateProperty.all<Color>(outlinedButtonFGColor),
    ),
    child: child,
  );
}
