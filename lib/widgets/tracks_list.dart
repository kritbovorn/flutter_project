import 'package:flutter/material.dart';

import 'package:flutter_project/data/data.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;
  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text('TITLE'),
        ),
        DataColumn(
          label: Text('ARTIST'),
        ),
        DataColumn(
          label: Text('ALBUM'),
        ),
        DataColumn(
          label: Icon(Icons.access_time),
        ),
      ],
      rows: tracks.map(
        (e) {
          return DataRow(cells: [
            DataCell(
              Text(
                e.title,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(
              Text(
                e.artist,
              ),
            ),
            DataCell(
              Text(
                e.album,
              ),
            ),
            DataCell(
              Text(
                e.duration,
              ),
            ),
          ]);
        },
      ).toList(),
    );
  }
}
