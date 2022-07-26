import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/core/colors.dart';

InputDecoration customInputDecoration({
  required String label,
  required bool middleText,
}) {
  return InputDecoration(
    label: Row(
      mainAxisAlignment: middleText ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          label.tr(),
          style: TextStyle(
            fontSize: 14,
            color: inputFieldLabelColor,
          ),
        ),
      ],
    ),
    fillColor: inputFieldBGColor,
    filled: true,
    border: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(4)),
    contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
  );
}
