class Images {
  static String get logo => 'logo'.png;
  static String get camera => 'camera'.svg;
  static String get chat => 'chat'.svg;
  static String get like => 'like'.svg;
  static String get notification => 'notification'.svg;
  static String get send => 'send'.svg;
  static String get soundUnMute => 'sound_unmute'.svg;
  static String get soundMute => 'sound_mute'.svg;
  static String get subtract => 'subtract'.svg;
  static String get pause => 'pause'.svg;
  static String get play => 'play'.svg;
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get svg => 'assets/images/$this.svg';
}
