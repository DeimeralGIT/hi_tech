// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/images_and_files.dart';
import 'package:hi_tech/core/numbers_and_params.dart';

//hardcoded numbers and parameters since most are unique and are not reused

PreferredSize RecoverPasswordAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(appBarHeight * 2),
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: appBarHorizontalPadding, right: appBarHorizontalPadding, top: 29),
      color: appBarBGColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _logoWidget(),
          _appBarText(),
          _divider(),
          _backToLoginSection(context),
          _divider(),
        ],
      ),
    ),
  );
}

Widget _logoWidget() {
  return Row(
    children: [
      Image.asset(
        secondaryLogo,
        width: 78.64,
        height: 48,
      )
    ],
  );
}

Widget _appBarText() {
  return Expanded(
    child: Center(
      child: Text(
        "lorem_ipsum".tr(),
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _divider() {
  return Divider(
    thickness: 1,
    height: 1,
    color: dividerColor,
  );
}

Widget _backToLoginSection(BuildContext context) {
  return Container(
      height: appBarHeight,
      alignment: Alignment.center,
      child: Row(
        children: [
          Text("back_to_login".tr()),
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.all(2),
            ),
            child: Text(
              "sign_in".tr(),
              style: TextStyle(color: elevatedButtonBGColor),
            ),
          ),
        ],
      ));
}
