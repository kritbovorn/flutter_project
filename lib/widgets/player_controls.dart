import 'package:flutter/material.dart';
import 'package:flutter_project/models/current_track_model.dart';
import 'package:provider/provider.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selectedTrack;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 34,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 5,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
