class ScrollImageHome {
  late String bagroudimage;

  ScrollImageHome(
    this.bagroudimage,
  );

  ScrollImageHome.fromJson(Map<String, dynamic> jsondata, int index) {
    bagroudimage = jsondata["results"][index]["backdrop_path"];
  }
}
