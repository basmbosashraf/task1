import 'package:flutter/material.dart';
import 'package:task1/coponents/prefs_class.dart';


TextEditingController _controller = TextEditingController();
TextEditingController inputKey=_controller;


class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.textFieldLabel,
    required this.containerWidth,
    this.containerHeight = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.margin = const EdgeInsets.all(10),
    this.borderColor = Colors.grey,
  });

  final String textFieldLabel;
  final double containerWidth;
  final double containerHeight;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color borderColor;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {

  @override
  void initState() {
    super.initState();
    SharedPreferenceHelper().loadSavedInput();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor),
      ),
      child: TextField(
        controller: inputKey,

        decoration: InputDecoration(
          hintText: widget.textFieldLabel,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onSubmitted: (savedData) {
          SharedPreferenceHelper().saveInput(inputKey as String, context);
        },
      ),
    );
  }
}