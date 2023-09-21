import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/dependency.dart';
import '../common.dart';

// ignore: must_be_immutable
class TextFieldForm extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final String name;
  final bool enabled;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final bool shouldValidate;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final EdgeInsets? margin;
  final int? maxLines;
  final int? lines;
  final EdgeInsetsGeometry? contentPadding;
  // final
  final TextInputAction? textInputAction;

  static var emailValidator =
      FormBuilderValidators.email(errorText: "Email tidak valid");
  static var requiredValidator = FormBuilderValidators.required(
      errorText: "Silahkan isi form ini terlebih dahulu");
  static String? Function(dynamic value) isEqual(String? expected,
      {String errorText = "Nilai tidak sama"}) {
    return (s) {
      debugPrint("$expected $s");
      if (expected != s) {
        return errorText;
      }
      return null;
    };
  }

  TextFieldForm(
      {Key? key,
      required this.label,
      required this.hint,
      required this.name,
      this.enabled = true,
      this.initialValue,
      this.keyboardType,
      this.inputFormatters,
      this.onChanged,
      this.shouldValidate = true,
      this.obscureText = false,
      this.validator,
      this.margin,
      this.maxLines,
      this.textInputAction,
      this.lines,
      this.contentPadding,
      this.prefixIcon,
      this.readOnly = false,
      this.controller,
      this.onTap,
      this.suffixIcon})
      : super(key: key);

  @override
  _TextFieldFormState createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  late bool isPasswordForm;

  @override
  void initState() {
    isPasswordForm = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: widget.label.isNotEmpty,
              child: CustomText(widget.label)),
          Visibility(
              visible: widget.label.isNotEmpty,
              child: const SizedBox(height: 8)),
          FormBuilderTextField(
            onTap: widget.onTap,
            controller: widget.controller,
            enabled: widget.enabled,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            name: widget.name,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            minLines: widget.lines,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hint,
              hintStyle: const TextStyle(
                  fontSize: 12, color: ColorPalletes.abuabuNormal),
              suffixIcon: widget.suffixIcon ??
                  Visibility(
                    visible: isPasswordForm,
                    child: IconButton(
                      icon: Icon(
                        widget.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                    ),
                  ),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: ColorPalletes.abuabuNormal)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: ColorPalletes.abuabuNormal)),
            ),
            validator: widget.validator ?? TextFieldForm.requiredValidator,
            onChanged: (String? val) {
              widget.onChanged?.call(val);
            },
          )
        ],
      ),
    );
  }
}

extension ValueFormBuilderExt on GlobalKey<FormBuilderState> {
  String? getValue(String key) => currentState?.fields[key]?.value;
  void setValue(String key, String value) =>
      currentState?.fields[key]?.didChange(value);
  bool get isNotValid => currentState?.validate() == false;
}
