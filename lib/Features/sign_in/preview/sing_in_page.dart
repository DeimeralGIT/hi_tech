import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/Features/create_account/preview/create_account_page.dart';
import 'package:hi_tech/Features/sign_in/preview/widgets/sign_in_section.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/images_and_files.dart';
import 'package:hi_tech/core/numbers_and_params.dart';
import 'package:hi_tech/core/reusable_widgets/primary_app_bar.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBGColor,
      appBar: PrimaryAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageSidePadding),
        child: isMobile
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _logoSection(),
                  _introSection(),
                  signInSection(),
                  _createAccountSection(context),
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
                            signInSection(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80),
                              child: _createAccountSection(context),
                            ),
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

  //Provided that the constants vary with not so many common constraits - some numbers are hardcoded (like size, fontWeight, padding, etc.)

  Widget _logoSection() {
    return isMobile
        ? Padding(
            padding: const EdgeInsets.all(32),
            child: Image.asset(mainLogo),
          )
        : Image.asset(
            secondaryLogo,
            width: 393,
            height: 240,
          );
  }

  Widget _introSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "sign_in_welcome_quote".tr(),
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "sign_in_welcome_author".tr(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _createAccountSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 43),
      child: Row(
        children: [
          Text("dont_have_an_id_account".tr()),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CreateAccountPage()));
              },
              child: Text(
                "create".tr(),
                style: const TextStyle(color: Color.fromRGBO(59, 158, 146, 1), fontWeight: FontWeight.w700),
              )),
        ],
      ),
    );
  }
}
