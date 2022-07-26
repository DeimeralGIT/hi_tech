import 'package:flutter/material.dart';
import 'package:hi_tech/Features/verification_change_password/widgets/verification_change_password_app_bar.dart';
import 'package:hi_tech/Features/verification_change_password/widgets/verification_change_password_section.dart';
import 'package:hi_tech/core/account_model.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/numbers_and_params.dart';

class VerificationChangePasswordPage extends StatelessWidget {
  AccountModel currentAccount;
  VerificationChangePasswordPage({required this.currentAccount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBGColor,
      appBar: VerificationChangePasswordAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageSidePadding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 60),
            VerificationChangePasswordSection(
              currentAccount: currentAccount,
            ),
          ],
        ),
      ),
    );
  }
}
