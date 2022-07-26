// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/images_and_files.dart';
import 'package:hi_tech/core/numbers_and_params.dart';
import 'package:hi_tech/core/reusable_widgets/custom_outlined_button.dart';
import 'package:hi_tech/core/reusable_widgets/language_button.dart';
import 'package:url_launcher/url_launcher.dart';

PreferredSize PrimaryAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(appBarHeight),
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: appBarVerticalPadding,
        horizontal: appBarHorizontalPadding,
      ),
      color: appBarBGColor,
      child: Row(
        mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          isMobile ? _logoWidget() : const SizedBox(),
          isMobile ? const Spacer() : const SizedBox(),
          isMobile
              ? Expanded(
                  flex: 10,
                  child: _websiteButton(context),
                )
              : _websiteButton(context),
          _languageButton(),
        ],
      ),
    ),
  );
}

Widget _logoWidget() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: appBarMainLogoHorizontalPadding),
    child: Image.asset(
      mainLogo,
      height: appBarMainLogoHeight,
      width: appBarMainLogoWidth,
    ),
  );
}

Widget _websiteButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: CustomOutlinedButton(
      onPressed: () async {
        await launchUrl(Uri.https("www.hyeid.org", '/en'));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Image.asset(
              mainLogo,
              height: 17.33,
              width: 32,
            ),
          ),
          isMobile
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: AutoSizeText("go_to_hyeid_website".tr()),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: AutoSizeText("go_to_hyeid_website".tr()),
                ),
        ],
      ),
    ),
  );
}

Widget _languageButton() {
  return LanguageButton();
}
