import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required String hint,
  required String? Function(String?)? validator,
  required TextInputType keyboardType,
  required controller,
  required context,
  required IconData icon,
  bool ispassword = false,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      obscureText: ispassword,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.all(20.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        // hintText: hint,
        label: Text(hint),
      ),
    );

Widget defaultButton({
  required context,
  required Widget content,
  required void Function()? onpressed,
  Color? color,
}) =>
    Container(
      padding: const EdgeInsets.all(0.0),
      height: 70.0,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: FilledButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(
            BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(
                0,
              ),
            ),
          ),
        ),
        child: content,
      ),
    );
