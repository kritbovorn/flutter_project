import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 7,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double w = constraints.maxWidth;
              double h = constraints.maxHeight;
              double p = w * 0.01;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: p, vertical: p),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisExtent: (h.toInt() / 6),
                ),
                itemCount: 42,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {},
                    child: Text(index.toString()),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('ยกเลิก'),
                            ),
                          ),
                          Expanded(
                              child: TextButton(
                            onPressed: () {},
                            child: const Text('ตกลง'),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
