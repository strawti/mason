import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key? key,
    this.maxLines = 1,
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.isPassword = false,
    this.optional = false,
    this.enabled = true,
    this.focusNode,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  final int maxLines;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final bool enabled;
  final bool isPassword;
  final FocusNode? focusNode;
  final bool optional;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      controller: widget.controller,
      obscureText: !widget.isPassword ? false : obscureText,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator ??
          (value) {
            if (widget.optional == false) {
              if (value?.trim().isEmpty ?? true) {
                return 'Esse campo é obrigatório.';
              }
            }
            return null;
          },
      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: IconButton(
            icon: Icon(
              obscureText
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
            ),
            onPressed: () {
              obscureText = !obscureText;
              setState(() {});
            },
          ),
        ),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.tertiary.withOpacity(0.3),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.tertiary.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.tertiary,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
