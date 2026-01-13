import 'package:flutter/material.dart';

class BuildRequirments extends StatefulWidget {
  bool isval;
  BuildRequirments({super.key, required this.text, required this.isval});

  final String text;

  @override
  State<BuildRequirments> createState() => _BuildRequirmentsState();
}

class _BuildRequirmentsState extends State<BuildRequirments> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.isval
            ? Icon(Icons.check_circle_outline, color: Colors.green, size: 20)
            : Icon(
                Icons.check_circle_outline,
                color: Colors.grey.shade400,
                size: 20,
              ),
        SizedBox(width: 8),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
