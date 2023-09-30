import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final IconData icon;
  final String text_label;
  final bool secret;
  final List<TextInputFormatter>? input;
  final String? error;
  final String initialvalue;
  final onChanged;
  final Function? set_visible;
  final bool visible;
  final Key? keyy;
  final TextInputType? typeKeyboard;

  CustomFormField(
      {Key? key,
      required this.icon,
      required this.text_label,
      this.secret = false,
      this.input,
      required this.error,
      required this.initialvalue,
      this.onChanged,
      this.set_visible = null,
      this.visible = false,
      this.keyy,
      this.typeKeyboard})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        keyboardType: widget.typeKeyboard,
        key: widget.keyy,
        initialValue: widget.initialvalue,
        onChanged: widget.onChanged,
        inputFormatters: widget.input,
        obscureText: widget.secret ? widget.visible : false,
        decoration: InputDecoration(
          errorText: widget.error,
          suffixIcon: widget.secret
              ? IconButton(
                  onPressed: () {
                    widget.set_visible!();
                  },
                  icon: Icon(
                      widget.visible ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.text_label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
