import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/config.dart';
import 'package:task_app/data/model/video_model.dart';

class Repository {
  Future getVideo() async {
    var url = Uri.parse(
        "${Config.apiUrl}external/atab/m360ict/get/video/app/test");
    try {
      final response = await http.get(url);
      var data = json.decode(response.body.toString());
      VideoModel videoModel = VideoModel.fromJson(data);
      return videoModel;
    } catch(e) {
      return e;
    }
  }
}