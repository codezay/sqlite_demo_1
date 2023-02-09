import 'package:flutter/material.dart';
import 'package:sqlite_demo_1/helpers/song_helper.dart';
import 'package:sqlite_demo_1/models/song.dart';

class SongList extends StatefulWidget {
  const SongList({super.key});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  List<Song> _songs = [];

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  void _fetchSongs() async {
    SongHelper songHelper = SongHelper();
    List<Song> songs = await songHelper.getAllSongs();
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_songs[index].name ?? ''),
            subtitle: Text(_songs[index].cat ?? ''),
          );
        },
      ),
    );
  }
}
