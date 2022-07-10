// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PopResultScreen extends StatefulWidget {
  final String data;
  final bool hasChange;
  final bool isShowButton;
  const PopResultScreen({
    Key? key,
    required this.data,
    required this.hasChange,
    required this.isShowButton,
  }) : super(key: key);

  @override
  State<PopResultScreen> createState() => _PopResultScreenState();
}

class _PopResultScreenState extends State<PopResultScreen> {
  TextEditingController textEditingController = TextEditingController();
  dynamic resultFromField;
  @override
  Widget build(BuildContext context) {
    bool changeColor = false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pop Result Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PopResult Screen',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (widget.isShowButton)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                child: SizedBox(
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        labelText: 'Results',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onChanged: (value) => resultFromField = value,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                widget.data,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            if (!widget.isShowButton)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: ElevatedButton(
                    child: const Text('Change Color'),
                    onPressed: () {
                      changeColor = widget.hasChange;
                      changeColor = !changeColor;

                      Navigator.pop(context, changeColor);
                    }),
              ),
            if (widget.isShowButton)
              ElevatedButton(
                child: const Text('ส่ง Data from TextField'),
                onPressed: () {
                  if (resultFromField == null) {
                    Navigator.pop(context, 'No Data: back');
                  } else {
                    Navigator.pop(context, resultFromField);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
