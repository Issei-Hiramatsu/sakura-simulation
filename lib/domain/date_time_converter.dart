// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// class DateTimeConverter implements JsonConverter<DateTime?, dynamic> {
//   const DateTimeConverter();

//   @override
//   DateTime? fromJson(dynamic timestamp) {
//     timestamp as Timestamp?;
//     return timestamp?.toDate();
//   }
//   //現状使わないけど Firebase導入時にこれに置き換える
//   // nullの時は toJson 時 FieldValue.serverTimestamp() を返すことで、createdAt の挙動になる
//   @override
//   dynamic toJson(DateTime? dateTime) {
//     if (dateTime == null) return FieldValue.serverTimestamp();
//     return dateTime;
//   }
// }
