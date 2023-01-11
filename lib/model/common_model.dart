class CommonModel {
  String? title;
  String? title2;
  String? title3;
  String? title4;
  String? img;
  String? desc;
  bool? selected;
  List<CommonModel2>? list;

  CommonModel({this.title, this.desc, this.selected, this.title2, this.title3, this.title4, this.list, this.img});
}

class CommonModel2 {
  String? title;
  String? title2;
  String? title3;
  String? title4;
  String? desc;
  bool? selected;

  CommonModel2({
    this.title,
    this.desc,
    this.selected,
    this.title2,
    this.title3,
    this.title4,
  });
}
