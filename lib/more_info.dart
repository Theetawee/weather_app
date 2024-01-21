import "package:flutter/material.dart";

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String val;

  const AdditionalInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                icon,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
             Text(
              val,
              style:const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
