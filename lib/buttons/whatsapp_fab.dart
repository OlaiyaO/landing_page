import 'package:flutter/material.dart';


class WhatsAppFAB extends StatelessWidget {
  final String whatsappIcon; // Link to WhatsApp icon image

  const WhatsAppFAB({super.key, required this.whatsappIcon});

  @override
  Widget build(BuildContext context) {
    const buttonPadding = 24.0;
    return FloatingActionButton.extended(
      onPressed: () {
        // Add your logic to handle button press here
      },
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(12),
      ),
      label: Container(
        padding: const EdgeInsets.symmetric(
            vertical: buttonPadding, horizontal: buttonPadding),
        height: 2 * MediaQuery.of(context).size.height / 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              whatsappIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 8.0),
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Chat on WhatsApp',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}