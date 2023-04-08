class PostModel {
  late int userId;
  late int id;
  late String title;
  late String body;

  PostModel({
    this.userId = 0,
    this.id = 0,
    this.title = "no title",
    this.body = "no body",
  });

  PostModel.fromJson(Map<String, dynamic> item) {
    userId = item["userId"];
    id = item["id"];
    title = item["title"];
    body = item["body"];
  }

  @override
  String toString() {
    return "userId: $userId, id: $id, title: $title, body: $body";
  }
}
