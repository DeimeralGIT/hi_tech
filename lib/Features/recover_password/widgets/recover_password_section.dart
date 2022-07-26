import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/Features/verification_change_password/verification_change_password_page.dart';
import 'package:hi_tech/core/account_model.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/data_manager.dart';
import 'package:hi_tech/core/reusable_widgets/custom_interaction_card.dart';
import 'package:hi_tech/core/reusable_widgets/custom_text_form_field.dart';

class RecoverPasswordSection extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  State<StatefulWidget> createState() => RecoverPasswordSectionState();
}

class RecoverPasswordSectionState extends State<RecoverPasswordSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CustomInteractionCard(
        title: "recover_your_password",
        content: [
          _recoverInfoSection(),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "username",
            controller: widget.emailController,
          ),
          const SizedBox(height: 32),
          _RecoverPasswordButton(widget.formKey, context),
        ],
        formKey: widget.formKey,
      ),
    );
  }

  Widget _RecoverPasswordButton(GlobalKey<FormState> formKey, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "cancel".tr(),
            style: TextStyle(color: elevatedButtonBGColor),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              readAccounts().then((accounts) {
                if (!accounts.containsKey(widget.emailController.text)) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("username_does_not_exist".tr()),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("ok".tr()))],
                          ));
                } else {
                  AccountModel currentAccount = extractAccounts(accounts)[widget.emailController.text] as AccountModel;
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => VerificationChangePasswordPage(
                        currentAccount: currentAccount,
                      ),
                    ),
                  );
                }
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(elevatedButtonBGColor),
            elevation: MaterialStateProperty.all(5),
          ),
          child: Text(
            "recover".tr(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _recoverInfoSection() {
    return Column(
      children: [
        Text("recover_password_info".tr()),
        const SizedBox(
          height: 14,
        ),
        Divider(thickness: 1, color: dividerColor),
      ],
    );
  }
}
