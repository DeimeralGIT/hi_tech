import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hi_tech/core/colors.dart';
import 'package:hi_tech/core/custom_input_form_decoration.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomTextFormField extends StatefulWidget {
  String label;
  bool isObscure;
  TextEditingController? controller;
  bool middleText;
  bool isPhoneNumber;
  CustomTextFormField({
    required this.label,
    this.isObscure = false,
    this.controller,
    this.middleText = false,
    this.isPhoneNumber = false,
  });

  @override
  State<StatefulWidget> createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode focusNode = FocusNode();
  late bool hasError;

  @override
  void initState() {
    hasError = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() {
      setState(() {});
    });

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          Container(
            height: 49,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: focusNode.hasFocus ? inputFieldBorderColorFocused : inputFieldBorderColor),
          ),
          SizedBox(
            height: hasError ? 72 : 48,
            child: widget.isPhoneNumber
                ? Container(
                    color: inputFieldBGColor,
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber value) {},
                      validator: ((value) {
                        setState(() {
                          hasError = value != null ? value.isEmpty : true;
                        });
                        return hasError ? "cant_be_empty".tr() : null;
                      }),
                      inputDecoration: customInputDecoration(label: widget.label, middleText: widget.middleText),
                      errorMessage: "",
                    ),
                  )
                : TextFormField(
                    validator: ((value) {
                      setState(() {
                        hasError = value != null ? value.isEmpty : true;
                      });
                      return hasError ? "cant_be_empty".tr() : null;
                    }),
                    decoration: customInputDecoration(label: widget.label, middleText: widget.middleText),
                    focusNode: focusNode,
                    obscureText: widget.isObscure,
                    controller: widget.controller,
                    textAlign: widget.middleText ? TextAlign.center : TextAlign.start,
                  ),
          ),
        ],
      ),
    );
  }
}
