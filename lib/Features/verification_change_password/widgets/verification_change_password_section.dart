import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/Features/sign_in/preview/sing_in_page.dart';
import 'package:hi_tech/core/account_model.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/data_manager.dart';
import 'package:hi_tech/core/reusable_widgets/custom_interaction_card.dart';
import 'package:hi_tech/core/reusable_widgets/custom_text_form_field.dart';

class VerificationChangePasswordSection extends StatefulWidget {
  AccountModel currentAccount;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  State<StatefulWidget> createState() => VerificationChangePasswordSectionState();

  VerificationChangePasswordSection({required this.currentAccount});
}

class VerificationChangePasswordSectionState extends State<VerificationChangePasswordSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CustomInteractionCard(
        title: "account_verification",
        content: [
          _verificationInfoSection(),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "verification_code",
            middleText: true,
            controller: widget.emailController,
          ),
          const SizedBox(height: 32),
          _resendCodeSection(),
          const SizedBox(height: 32),
          _changePasswordSection(),
          const SizedBox(height: 24),
          CustomTextFormField(
            label: "new_password",
            controller: widget.passwordController,
            isObscure: true,
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "confirm_password",
            controller: widget.confirmPasswordController,
            isObscure: true,
          ),
          const SizedBox(height: 32),
          _VerificationChangePasswordButton(widget.formKey, context),
        ],
        formKey: widget.formKey,
      ),
    );
  }

  Widget _VerificationChangePasswordButton(GlobalKey<FormState> formKey, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              readAccounts().then((accounts) {
                if (widget.passwordController.text != widget.confirmPasswordController.text) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("passwords_do_not_match".tr()),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("ok".tr()))],
                          ));
                } else {
                  AccountModel newAccount = AccountModel(userID: widget.currentAccount.userID, password: widget.passwordController.text);
                  removeAccount(widget.currentAccount);
                  addAccount(newAccount);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("password_updated".tr()),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (_) => SignInPage(),
                                      ),
                                      (route) => false),
                                  child: Text("ok".tr()))
                            ],
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
            "done".tr(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _verificationInfoSection() {
    return Column(
      children: [
        Text("verification_password_info".tr()),
        const SizedBox(
          height: 14,
        ),
        Divider(thickness: 1, color: dividerColor),
      ],
    );
  }

  Widget _resendCodeSection() {
    return Row(
      children: [
        Text("have_not_received_yet".tr()),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                "resend".tr(),
                style: TextStyle(color: elevatedButtonBGColor, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 20),
              Icon(
                Icons.refresh,
                color: elevatedButtonBGColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _changePasswordSection() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "change_your_password".tr(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Divider(
          thickness: 1,
          height: 1,
          color: dividerColor,
        ),
      ],
    );
  }
}
