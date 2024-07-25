import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    required this.onPressed,
    this.buttonColor = Colors.blueAccent,
    this.paddingHorizantal = 40.0,
    this.animate= true
  });
  final VoidCallback onPressed;
  final Color buttonColor;
  final double paddingHorizantal;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Pulse(
      duration: const Duration(seconds: 4),
      infinite: true,
      animate: animate,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0.0),
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          padding: MaterialStatePropertyAll(
            EdgeInsetsDirectional.symmetric(
              vertical: 5.0,
              horizontal: paddingHorizantal,
            ),
          ),
          overlayColor: MaterialStatePropertyAll(
            Colors.white.withOpacity(0.11),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                80.0,
              ), // Set your desired radius here
            ),
          ),
        ),
        child: Text(
          "BAŞVURU YAP",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
