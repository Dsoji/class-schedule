import 'package:flutter/material.dart';

class ReusedField extends StatelessWidget {
  final double height;
  final bool autofocus;
  final TextEditingController controller;
  final double width;
  final Color color;
  final FormFieldSetter<String>? onSaved;

  const ReusedField(
      {super.key,
      required this.height,
      required this.width,
      required this.controller,
      required this.color,
      required this.autofocus,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        maxLines: 100,
        keyboardType: TextInputType.emailAddress,
        autofocus: autofocus,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        decoration: InputDecoration(
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: color),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: color),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Email cannot be empty";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          } else {
            return null;
          }
        },
        onChanged: (value) {},
        onSaved: onSaved,
      ),
    );
  }
}

class ReusedField2 extends StatelessWidget {
  final double height;
  final bool autofocus;
  final IconData icon;
  final TextEditingController controller;
  final double width;
  final Color color;
  final VoidCallback onPressed;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;

  const ReusedField2(
      {super.key,
      required this.height,
      required this.width,
      required this.controller,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.autofocus,
      required this.validator,
      this.onChanged,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        autofocus: autofocus,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: color),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: color),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.grey,
            ),
            color: color,
          ),
        ),
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}

class ReusedField3 extends StatelessWidget {
  final double height;
  final bool autofocus;
  final TextEditingController controller;
  final double width;
  final Color color;

  const ReusedField3({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
    required this.color,
    required this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        maxLines: 100,
        keyboardType: TextInputType.emailAddress,
        autofocus: autofocus,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
        decoration: InputDecoration(
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: color),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
