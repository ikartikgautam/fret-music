import 'package:path/path.dart';
import 'dart:io';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';

var yt = YoutubeExplode();
final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

search(String query) async {
  // var res = await yt.search.queryFromPage(query);

  // String result = res.content[0].toString();
  // String id = result.substring(
  //     (result.lastIndexOf('(') + 1), (result.lastIndexOf(')')));
  // print(id);

  // List arr = [];
  // res.content.forEach((element) {
  //   arr.add(element);
  // });

// Get playlist metadata.
  var playlist = await yt.playlists.get('PLQLqnnnfa_fAkUmMFw5xh8Kv0S5voEjC9');

  var title = playlist.title; // "Igorrr - Hallelujah"
  var author = playlist.author; // "randomusername604"

  await for (var video in yt.playlists.getVideos(playlist.id)) {
    var videoTitle = video.id;
    var videoAuthor = video.author;
  }

  List arr = await yt.search.getVideosAsync(query).toList();

  print(arr);

  return arr;
}

convert(String vdo, String fileName) async {
  final Directory appDirectory = await getExternalStorageDirectory();
  final String videoDirectory = '${appDirectory.path}/Videos';
  await Directory(videoDirectory).create(recursive: true);
  final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
  final String filePath = '${videoDirectory}/${fileName}_${currentTime}.mp4';

  var streamManifest = await yt.videos.streamsClient.getManifest(vdo);
  var streamInfo = streamManifest.muxed.withHighestBitrate();

  if (streamInfo != null) {
    // Get the actual stream
    var stream = yt.videos.streamsClient.get(streamInfo);

    // Open a file for writing.
    var file = File(filePath);
    var fileStream = file.openWrite();

    // Pipe all the content of the stream into the file.
    await stream.pipe(fileStream);

    // Close the file.
    await fileStream.flush();
    await fileStream.close();
  }

  var arguments = ["-i", filePath, videoDirectory + "/${fileName}out.mp3"];

  _flutterFFmpeg
      .executeWithArguments(arguments)
      .then((rc) => print("FFmpeg process exited with rc $rc"));
}
