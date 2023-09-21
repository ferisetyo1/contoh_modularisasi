import 'package:core/dependency.dart';
import 'package:flutter/material.dart';

import '../common.dart';

final _formKey = GlobalKey<FormBuilderState>();

class FeriAlertTextFieldDialog extends StatelessWidget {
  final String title;
  final String label;
  final String hint;
  final String? initial;
  final Function()? positiveAction;
  final Function()? negativeAction;
  final String? positiveBtnText;
  final String? negativeBtnText;
  const FeriAlertTextFieldDialog({
    super.key,
    required this.title,
    this.positiveAction,
    this.negativeAction,
    this.positiveBtnText,
    this.negativeBtnText,
    required this.label,
    required this.hint,
    this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomText(
                      title,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 16),
                    TextFieldForm(
                      label: label,
                      hint: hint,
                      name: "input",
                      initialValue: initial,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  if (negativeBtnText != null)
                    Expanded(
                        child: CustomButton(
                            withBorder: true,
                            customBorder: const BorderSide(
                                color: ColorPalletes.abuabuTerang, width: 1),
                            buttonColor: Colors.white,
                            textColor: ColorPalletes.accentGelap,
                            onPressed: () {
                              negativeAction?.call();
                              Navigator.pop(context);
                            },
                            buttonText: negativeBtnText ?? "")),
                  if (positiveBtnText != null && negativeBtnText != null)
                    const SizedBox(width: 8),
                  if (positiveBtnText != null)
                    Expanded(
                      child: CustomButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == false) {
                              return;
                            }
                            var value =
                                _formKey.currentState?.fields["input"]?.value;
                            Navigator.pop(context, value);
                            positiveAction?.call();
                          },
                          buttonText: positiveBtnText ?? ""),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
