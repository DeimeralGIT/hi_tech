import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/core/images_and_files.dart';
import 'package:hi_tech/core/numbers_and_params.dart';
import 'package:hi_tech/core/reusable_widgets/custom_outlined_button.dart';

class LanguageButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageButtonState();
}

class LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return isMobile
        ? CustomOutlinedButton(
            onPressed: () {
              changeLocalization();
            },
            child: imageByLocalization())
        : CustomOutlinedButton(
            onPressed: () {},
            child: PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: languageButton("English", usaFlag, "en", "US"),
                ),
                PopupMenuItem(
                  child: languageButton("Русский", russiaFlag, "ru", "RU"),
                ),
                PopupMenuItem(
                  child: languageButton("Հայերեն", armeniaFlag, "am", "AM"),
                ),
              ],
              offset: const Offset(0, 40),
              color: Color.fromARGB(255, 218, 218, 218),
              elevation: 2,
              child: Row(
                children: [
                  imageByLocalization(),
                  const SizedBox(width: 12),
                  nameByLocalization(),
                  const SizedBox(width: 12),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          );
  }

  Widget languageButton(String lang, String imagePath, String locale1, String locale2) {
    return GestureDetector(
      onTap: () {
        context.setLocale(Locale(locale1, locale2));
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: languageButtonFlagHeight,
            width: languageButtonFlagWidth,
          ),
          const SizedBox(width: 12),
          Text(lang),
        ],
      ),
    );
  }

  Image imageByLocalization() {
    String imagePath = usaFlag;
    if (Localizations.localeOf(context).toString() == "ru_RU") {
      imagePath = russiaFlag;
    } else if (Localizations.localeOf(context).toString() == "am_AM") {
      imagePath = armeniaFlag;
    }
    return Image.asset(
      imagePath,
      height: languageButtonFlagHeight,
      width: languageButtonFlagWidth,
    );
  }

  Widget nameByLocalization() {
    String name = "English";
    if (Localizations.localeOf(context).toString() == "ru_RU") {
      name = "Русский";
    } else if (Localizations.localeOf(context).toString() == "am_AM") {
      name = "Հայերեն";
    }
    return Text(name);
  }

  void changeLocalization() {
    List<Locale> supportedLocales = context.supportedLocales;
    setState(() {
      context.setLocale(supportedLocales[(supportedLocales.indexOf(context.locale) + 1) % supportedLocales.length]);
    });
  }
}
