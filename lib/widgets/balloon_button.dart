import 'package:flutter/material.dart';

class BalloonButton extends StatefulWidget {
  const BalloonButton({
    super.key,
    required this.text,
    required this.active,
  });

  final String text;
  final bool active;

  @override
  State<BalloonButton> createState() => _BalloonButtonState();
}

class _BalloonButtonState extends State<BalloonButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: !widget.active
              ? const MaterialStatePropertyAll<Color>(Colors.grey)
              : null,
          shadowColor: const MaterialStatePropertyAll<Color>(Colors.black),
          elevation: const MaterialStatePropertyAll<double>(4.0),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
