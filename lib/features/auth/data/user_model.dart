import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.displayName,
    required this.subscriptions,
    required this.favoriteGenres,
  });

  final String id;
  final String displayName;
  final List<String> subscriptions;
  final List<String> favoriteGenres;

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data() ?? <String, dynamic>{};
    return UserModel(
      id: snapshot.id,
      displayName: data['displayName'] as String? ?? '',
      subscriptions: List<String>.from(
        data['subscriptions'] as List<dynamic>? ?? const [],
      ),
      favoriteGenres: List<String>.from(
        data['favoriteGenres'] as List<dynamic>? ?? const [],
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'displayName': displayName,
      'subscriptions': subscriptions,
      'favoriteGenres': favoriteGenres,
    };
  }
}
