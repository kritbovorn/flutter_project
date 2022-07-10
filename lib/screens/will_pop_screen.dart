// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScreen extends StatefulWidget {
  final String data;
  const WillPopScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<WillPopScreen> createState() => _WillPopScreenState();
}

class _WillPopScreenState extends State<WillPopScreen> {
  bool isAllowPopBack = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(isAllowPopBack);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: isAllowPopBack ? true : false,
          title: const Text('Will Pop Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  'Page WillPop',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              CupertinoSwitch(
                value: isAllowPopBack,
                onChanged: (value) {
                  setState(() {
                    isAllowPopBack = value;
                  });
                  // _onSwitchChanged(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  widget.data,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
