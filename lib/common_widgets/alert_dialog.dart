import 'package:flutter/cupertino.dart';

class CostomAlertDialog extends StatelessWidget {
  const CostomAlertDialog({
    required this.onTap,
    required this.title,
    required this.description,
    super.key,
  });
  // onTapを設けることで、アラートダイアログをStatelessWidgetとして役割を明確にしています。
  final VoidCallback onTap;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 1,
                letterSpacing: 0.25,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 1,
                letterSpacing: 0.25,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onTap,
          child: const Text(
            'OK',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 1,
              letterSpacing: 0.25,
            ),
          ),
        ),
      ],
    );
  }
}
