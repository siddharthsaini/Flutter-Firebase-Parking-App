import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    this.icon,
    this.hint,
    this.validator,
    this.onSaved,
    this.autoValidate,
    this.controller,
  });
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final FormFieldValidator<String> validator;
  final bool autoValidate;
  final TextEditingController controller;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Icon _suffixIcon = Icon(Icons.visibility);
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == false) {
        _suffixIcon = Icon(Icons.visibility_off);
      } else
        _suffixIcon = Icon(Icons.visibility);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        onSaved: widget.onSaved,
        validator: widget.validator,
        autovalidate: widget.autoValidate == true ? true : false,
        obscureText: widget.hint == "Password" ? _obscureText : false,
        decoration: InputDecoration(
          labelText: widget.hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Colors.grey[700]),
              child: widget.icon,
            ),
            padding: EdgeInsets.only(left: 20, right: 15),
          ),
          suffixIcon: Padding(
            child: widget.hint == "Password"
                ? IconButton(
                    color: Colors.grey[700],
                    icon: _suffixIcon,
                    onPressed: _toggle,
                  )
                : null,
            padding: EdgeInsets.only(left: 15, right: 7),
          ),
        ),
      ),
    );
  }
}

class NewTextField extends StatefulWidget {
  NewTextField({
    this.icon,
    this.hint,
    this.validator,
    this.onSaved,
    this.autoValidate,
    this.controller,
    this.formatter,
    this.capital,
    this.keyboard,
  });
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final FormFieldValidator<String> validator;
  final bool autoValidate;
  final TextEditingController controller;
  final List<TextInputFormatter> formatter;
  final TextCapitalization capital;
  final TextInputType keyboard;

  @override
  _NewTextFieldState createState() => _NewTextFieldState();
}

class _NewTextFieldState extends State<NewTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      decoration: InputDecoration(
        // hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        labelText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        prefixIcon: Padding(
          child: IconTheme(
            data: IconThemeData(color: Colors.grey[700]),
            child: widget.icon,
          ),
          padding: EdgeInsets.only(left: 20, right: 15),
        ),
      ),
      keyboardType: widget.keyboard,
      inputFormatters: widget.formatter,
      textCapitalization: widget.capital,
    );
  }
}
