import 'package:flutter/material.dart';
import 'package:flutter_project/models/current_track_model.dart';
import 'package:provider/provider.dart';

class TrackInfo extends StatelessWidget {
  const TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selectedTrack;
    // if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selected!.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                selected.artist,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey[300], fontSize: 12),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }
}
