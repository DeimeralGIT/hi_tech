import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/Features/recover_password/widgets/recover_password_app_bar.dart';
import 'package:hi_tech/Features/recover_password/widgets/recover_password_section.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/images_and_files.dart';
import 'package:hi_tech/core/numbers_and_params.dart';
import 'package:hi_tech/core/reusable_widgets/primary_app_bar.dart';

class RecoverPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBGColor,
      appBar: isMobile ? RecoverPasswordAppBar(context) : PrimaryAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageSidePadding),
        child: isMobile
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 38),
                  RecoverPasswordSection(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _logoSection(),
                            Text(
                              "lorem_ipsum".tr(),
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 120),
                      Expanded(
                        child: Column(
                          children: [
                            RecoverPasswordSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _logoSection() {
    return Image.asset(
      secondaryLogo,
      width: 393,
      height: 240,
    );
  }
}
