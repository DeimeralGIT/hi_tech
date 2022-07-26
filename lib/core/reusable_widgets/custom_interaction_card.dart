// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/core/numbers_and_params.dart';

class CustomInteractionCard extends StatelessWidget {
  String title;
  List<Widget> content;
  GlobalKey formKey;
  CustomInteractionCard({
    required this.title,
    required this.content,
    required this.formKey,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleSection(),
        cardSection(),
      ],
    );
  }

  Widget titleSection() {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Text(
        title.tr(),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget cardSection() {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 32 : 48,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: content,
          ),
        ),
      ),
    );
  }
}
