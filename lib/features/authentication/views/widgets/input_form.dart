import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String form;

  const InputForm({
    super.key,
    required this.formData,
    required this.form,
  });

  final Map<String, String> formData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: form != "email" ? true : false,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Please write correctly";
        }
        return null;
      },
      onSaved: (newValue) {
        if (newValue != null) {
          formData[form] = newValue;
        }
      },
      decoration: InputDecoration(
        hintText: form != "email" ? "password" : "Mobile number or email",

        // 기본
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
          ),
        ),

        // focus
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),

        // error (+added)
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade800,
            width: 1.5, // 두께 조절
          ),
        ),

        // error + focus (+added)
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade600,
          ),
        ),

        // 에러 메시지 스타일 (선택 사항)
        errorStyle: TextStyle(
          color: Colors.red.shade600,
          fontSize: 14,
        ),
      ),
    );
  }
}
