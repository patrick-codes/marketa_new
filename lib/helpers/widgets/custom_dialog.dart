import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';

class CustomDialogs {
  static Future<void> successModal(
      BuildContext context, String title, String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 60),
                const SizedBox(height: 16),
                Text(title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Order Tracking',
                      onpressed: () {},
                      color: primaryColor,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
