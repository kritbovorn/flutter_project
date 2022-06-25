import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/widgets.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TrackInfo(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  PlayerControls(),
                ],
              ),
            ),
            if (MediaQuery.of(context).size.width > 800)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    MoreControls(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
