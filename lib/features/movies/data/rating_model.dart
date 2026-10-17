import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {
  const RatingModel({
    required this.userId,
    required this.movieId,
    required this.roomId,
    required this.value,
    required this.createdAt,
  });

  final String userId;
  final String movieId;
  final String roomId;
  final int value;
  final DateTime createdAt;

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'movieId': movieId,
      'value': value,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
