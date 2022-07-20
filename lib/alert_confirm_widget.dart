import 'package:flutter/material.dart';

class AlertConfirmWidget extends StatelessWidget {
  const AlertConfirmWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFCFCFC),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: 460,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 10, top: 3, bottom: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ยืนยันการขายแพ็คเกจเสริม",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFCFCFCF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.padded,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ให้กับหมายเลข 090-906-9895",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "จำนวน 321.00 บาท",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: SizedBox(
                height: 38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "เน็ตความเร็ว 512 Kbps ไม่จำกัด",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "แพ็คเกจเน็ตไม่อั้น ไม่ลดความเร็ว(Fixed Speed)",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: SizedBox(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "เน็ตเลิฟเวอร์ไม่อั้น ไม่ลดสปีด ความเร็วสูงสุด",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "512 Kbps ไม่จำกัดใช้งานได้ 30 วัน",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "(คิดอัตราค่าใช้บริการเหมาจ่าย 321.00 บาท)",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "เงื่อนไข",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "- แพ็คเกจเหมาจ่ายแบบรายครั้งไม่สามารถยกเลิกได้",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "- ความเร็วการให้บริการ 4G/3G/EDGE/GPRS",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      " \t ขึ้นอยู่กับพื้นที่ในการให้บริการและอุปกรณ์ที่ใช้งาน",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "*** ราคารวม Vat",
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFE2415E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.check_circle,
                          size: 22,
                          color: Color(0XFFFEFEFE),
                          // color: Color(0xFFE2415E),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "ยืนยัน",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFFCDDE3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
