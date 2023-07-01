class HotAndNewEveryOnewatching {
  late String bagroudimage;
  late int id;
  late String descrption;
  late String title;

  HotAndNewEveryOnewatching(
    this.bagroudimage,
    this.id,
    this.descrption,
    this.title,
  );
  HotAndNewEveryOnewatching.fromJson(
      Map<String, dynamic> jsondataeveryonewatchig, int index) {
    bagroudimage = jsondataeveryonewatchig["results"][index]["backdrop_path"];
    id = jsondataeveryonewatchig["results"][index]["id"];
    descrption = jsondataeveryonewatchig["results"][index]["overview"];
    title = jsondataeveryonewatchig["results"][index]["title"];
  }
}