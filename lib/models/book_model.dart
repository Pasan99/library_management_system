import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookModel {
  @JsonKey(name: "bookId")
  final int bookId;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "authorId")
  final int authorId;
  @JsonKey(name: "authorName")
  final String authorName;
  @JsonKey(includeIfNull: false, defaultValue: false, ignore: true)
  bool isReserving = false;


  BookModel({required this.bookId, required this.description, required this.code, required this.count, required this.authorId, required this.authorName});

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}