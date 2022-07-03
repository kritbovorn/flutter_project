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
        const LoginTextField(
          hintText: "ไปเที่ยวทะเล",
          icon: FaIcon(
            FontAwesomeIcons.userLarge,
            size: 16,
            color: Colors.grey,
          ),
        ),
        const LoginTextField(
          isSecure: true,
          hintText: "ไปเที่ยวภูเขา",
          icon: FaIcon(
            FontAwesomeIcons.key,
            size: 16,
            color: Colors.grey,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("อยากไปทะเล", style: Theme.of(context).textTheme.button),
        ),
      ],
    );
  }
}
