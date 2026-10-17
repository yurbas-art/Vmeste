import 'package:cloud_firestore/cloud_firestore.dart';

import 'room_model.dart';

class RoomRepository {
  RoomRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<List<RoomModel>> watchRoomsForUser(String userId) {
    return _firestore
        .collection('rooms')
        .where('memberIds', arrayContains: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map(RoomModel.fromFirestore).toList());
  }

  Future<DocumentReference<Map<String, dynamic>>> createRoom(RoomModel room) {
    return _firestore.collection('rooms').add(room.toFirestore());
  }
}
