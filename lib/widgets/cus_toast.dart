import 'package:flutter/widgets.dart';
import 'package:travel_app/constants/Theme.dart';

class CusToast extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CusToast({required this.content, required this.icon});
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: NowUIColors.black.withOpacity(0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon, // Set your own leading icon!
            color: NowUIColors.input,
            size: 20,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            content,
            style: const TextStyle(color: NowUIColors.input),
          ),
        ],
      ),
    );
  }
}
