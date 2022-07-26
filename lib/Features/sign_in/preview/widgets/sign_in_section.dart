import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/Features/recover_password/recover_password_page.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/numbers_and_params.dart';
import 'package:hi_tech/core/data_manager.dart';
import 'package:hi_tech/core/reusable_widgets/custom_interaction_card.dart';
import 'package:hi_tech/core/reusable_widgets/custom_text_form_field.dart';

class signInSection extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<StatefulWidget> createState() => signInSectionState();
}

class signInSectionState extends State<signInSection> {
  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      readAccounts().then((accounts) {
        if (accounts.isNotEmpty) {
          setState(() {
            widget.userNameController.text = accounts.keys.first.toString();
            widget.passwordController.text = accounts[accounts.keys.first.toString()]!["password"];
          });
        }
      });
    }
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: CustomInteractionCard(
        title: "sign_in_to_your_account",
        content: [
          CustomTextFormField(
            label: "username",
            controller: widget.userNameController,
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "password",
            isObscure: true,
            controller: widget.passwordController,
          ),
          const SizedBox(height: 8),
          _forgetPasswordButton(),
          const SizedBox(height: 35),
          _signInButton(widget.formKey, context),
        ],
        formKey: widget.formKey,
      ),
    );
  }

  Widget _forgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RecoverPasswordPage(),
                  ),
                ),
            child: Text(
              "forgot_password".tr(),
              style: const TextStyle(color: Colors.black, decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget _signInButton(GlobalKey<FormState> formKey, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate() && isMobile) {
              readAccounts().then((accounts) {
                if (accounts.containsKey(widget.userNameController.text) &&
                    accounts[widget.userNameController.text]!["password"] == widget.passwordController.text) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("successfully_signed_in".tr()),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("ok".tr()))],
                          ));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("invalid_username_or_password".tr()),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("ok".tr()))],
                          ));
                }
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(elevatedButtonBGColor),
            elevation: MaterialStateProperty.all(5),
          ),
          child: Text(
            "sign_in".tr(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
