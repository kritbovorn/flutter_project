import 'package:flutter/material.dart';

class AlertConfirmWidget extends StatelessWidget {
  const AlertConfirmWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text("ยีนยันการขายแพ็กเกจเสริม"),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
            ],
          ),
          const Text('ok'),
        ],
      ),
    );
  }
}
