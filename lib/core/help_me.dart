const kLOGTAG = "[Demo-Flutter]";
const kLOGENABLE = true;

printLog(dynamic data) {
  if (kLOGENABLE) {
    print("$kLOGTAG${data.toString()}");
  }
}
