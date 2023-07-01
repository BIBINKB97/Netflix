class HotAndNewComingSoon {
  late String bagroudimage;
  late int id;
  late String descrption;
  late String verticleposter;
  late String relesedate;
  late String title;

  HotAndNewComingSoon(
    this.bagroudimage,
    this.id,
    this.descrption,
    this.verticleposter,
    this.relesedate,
    this.title,
  );

  HotAndNewComingSoon.fromJson(Map<String, dynamic> jsondata, int index) {
    bagroudimage = jsondata["results"][index]["backdrop_path"];
    id = jsondata["results"][index]["id"];
    descrption = jsondata["results"][index]["overview"];
    verticleposter = jsondata["results"][index]["poster_path"];

    relesedate = jsondata["results"][index]["release_date"];
    title = jsondata["results"][index]["title"];
  }
}