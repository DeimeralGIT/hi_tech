import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/Features/sign_in/preview/sing_in_page.dart';
import 'package:hi_tech/core/account_model.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/data_manager.dart';
import 'package:hi_tech/core/reusable_widgets/custom_interaction_card.dart';
import 'package:hi_tech/core/reusable_widgets/custom_text_form_field.dart';

class CreateAccountSection extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  State<StatefulWidget> createState() => CreateAccountSectionState();
}

class CreateAccountSectionState extends State<CreateAccountSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CustomInteractionCard(
        title: "create_a_new_account",
        content: [
          CustomTextFormField(
            label: "first_name",
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "last_name",
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "email",
            controller: widget.emailController,
            regexp: r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "phone_number",
            isPhoneNumber: true,
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: "password",
            controller: widget.passwordController,
            isObscure: true,
          ),
          const SizedBox(height: 32),
          CustomTextFormField(label: "confirm_password", controller: widget.confirmPasswordController, isObscure: true),
          const SizedBox(height: 32),
          _createAccountButton(widget.formKey, context),
        ],
        formKey: widget.formKey,
      ),
    );
  }

  Widget _createAccountButton(GlobalKey<FormState> formKey, BuildContext context) {
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
                if (accounts.containsKey(widget.emailController.text)) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("username_already_exists".tr()),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("ok".tr()))],
                          ));
                } else if (widget.passwordController.text != widget.confirmPasswordController.text) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text("passwords_do_not_match".tr()),
                            actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("ok".tr()))],
                          ));
                } else {
                  addAccount(AccountModel(userID: widget.emailController.text, password: widget.passwordController.text)).then((pass) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Text("account_created_successfully".tr()),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => SignInPage()), (route) => false),
                                    child: Text("ok".tr()))
                              ],
                            ));
                  });
                }
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(elevatedButtonBGColor),
            elevation: MaterialStateProperty.all(5),
          ),
          child: Text(
            "create".tr(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
