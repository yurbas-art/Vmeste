import 'package:cloud_firestore/cloud_firestore.dart';

class MovieModel {
  const MovieModel({
    required this.id,
    required this.title,
    required this.genres,
    required this.rating,
    required this.durationMinutes,
    required this.posterUrl,
    required this.providers,
  });

  final String id;
  final String title;
  final List<String> genres;
  final double rating;
  final int durationMinutes;
  final String posterUrl;
  final List<String> providers;

  factory MovieModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data() ?? <String, dynamic>{};
    return MovieModel(
      id: snapshot.id,
      title: data['title'] as String? ?? 'Без названия',
      genres: List<String>.from(data['genres'] as List<dynamic>? ?? const []),
      rating: (data['rating'] as num?)?.toDouble() ?? 0,
      durationMinutes: data['durationMinutes'] as int? ?? 0,
      posterUrl: data['posterUrl'] as String? ?? '',
      providers: List<String>.from(
        data['providers'] as List<dynamic>? ?? const [],
      ),
    );
  }
}
