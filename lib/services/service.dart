import 'package:path/path.dart';
import 'dart:io';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayer/audioplayer.dart';

var yt = YoutubeExplode();
final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
AudioPlayer audioPlayer = AudioPlayer();

/* Function to get search results */
search(String query) async {
  var videos = await yt.search.getVideosAsync(query).toList();
  return videos;
}

/* Function to get Audo of youtube video */
Future<bool> convert(String vdo, String fileName) async {
  final Directory appDirectory = await getExternalStorageDirectory();
  final String videoDirectory = '${appDirectory.path}/Videos';
  await Directory(videoDirectory).create(recursive: true);
  final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
  final String filePath = '${videoDirectory}/${fileName}_${currentTime}.mp3';

  var streamManifest = await yt.videos.streamsClient.getManifest(vdo);
  // var streamInfo = streamManifest.muxed.withHighestBitrate();
  var streamInfo = streamManifest.audioOnly.withHighestBitrate();

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

    /* Play Audio */
    playAudio(filePath);
  }

  // var arguments = ["-i", filePath, videoDirectory + "/${fileName}out.mp3"];

  // _flutterFFmpeg
  //     .executeWithArguments(arguments)
  //     .then((rc) => print("FFmpeg process exited with rc $rc"));
}

bool playAudio(String url) {
  audioPlayer.play(url);
}

pauseAudio() {
  audioPlayer.pause();
}
