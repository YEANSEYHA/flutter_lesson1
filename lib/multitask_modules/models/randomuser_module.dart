class RandomUserModel {
  late Info info;

  RandomUserModel({required this.info});

  RandomUserModel.fromJson(Map<String, dynamic> map) {
    info = Info.fromJson(map['info']);
  }

  @override
  String toString() {
    return "RandomUserModel(info: ${info.toString()})";
  }
}

class Info {
  late String seed;
  late int results;
  late int page;
  late String version;

  Info({
    this.seed = "no seed",
    this.results = 0,
    this.page = 0,
    this.version = "no version",
  });

  Info.fromJson(Map<String, dynamic> map) {
    seed = map['seed'];
    results = map['results'];
    page = map['page'];
    version = map['version'];
  }

  @override
  String toString() {
    return "seed: $seed, results: $results, page: $page, version: $version";
  }
}
