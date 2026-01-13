import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtabbar extends StatefulWidget {
  Customtabbar({
    super.key,
    required this.title,
    required this.index,
    this.selectedTab = 0,
  });
  final String title;
  final int index;
  int? selectedTab;

  @override
  State<Customtabbar> createState() => _CustomtabbarState();
}

class _CustomtabbarState extends State<Customtabbar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(
          () => widget.selectedTab = widget.index,
        ), // Update selected tab
        child: Column(
          children: [
            // Display the tab text
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.selectedTab == widget.index
                    ? Colors.blue
                    : Colors.black, // Change text color
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add an underline only if this tab is selected
            if (widget.selectedTab == widget.index)
              Container(
                margin: const EdgeInsets.only(
                  top: 4,
                ), // Space between text and underline
                height: 2,
                width: 50, // Width of the underline
                color: Colors.blue, // Color of the underline
              ),
          ],
        ),
      ),
    );
  }
}
