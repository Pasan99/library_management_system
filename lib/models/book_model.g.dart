// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    bookId: json['bookId'] as int,
    description: json['description'] as String,
    code: json['code'] as String,
    count: json['count'] as int,
    authorId: json['authorId'] as int,
    authorName: json['authorName'] as String,
  );
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'description': instance.description,
      'code': instance.code,
      'count': instance.count,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
    };
