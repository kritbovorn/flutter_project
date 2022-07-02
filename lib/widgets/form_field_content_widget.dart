import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/login_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormFieldContentWidget extends StatelessWidget {
  const FormFieldContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginTextField(
          hintText: "รหัสตัวแทนคู่ค้า",
          icon: FaIcon(
            FontAwesomeIcons.userLarge,
            size: 16,
            color: Colors.grey.shade400,
          ),
        ),
        LoginTextField(
          hintText: "รหัสผ่าน",
          icon: FaIcon(
            FontAwesomeIcons.key,
            size: 16,
            color: Colors.grey.shade400,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("เข้าสู่ระบบ", style: Theme.of(context).textTheme.button),
        ),
      ],
    );
  }
}
