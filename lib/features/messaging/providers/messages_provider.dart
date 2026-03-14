import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/message.dart';

// Provides a real-time stream of messages for a specific enterprise chat
final chatMessagesProvider = StreamProvider.family<List<Message>, String>((ref, enterpriseId) {
  return IsarService.messages
      .filter()
      .enterpriseIdEqualTo(enterpriseId)
      .sortBySentAt()
      .watch(fireImmediately: true);
});

// Provides the single most recent message for a specific enterprise chat
final latestMessageProvider = StreamProvider.family<Message?, String>((ref, enterpriseId) {
  return IsarService.messages
      .filter()
      .enterpriseIdEqualTo(enterpriseId)
      .sortBySentAtDesc()
      .limit(1)
      .watch(fireImmediately: true)
      .map((messages) => messages.isEmpty ? null : messages.first);
});

class MessagingNotifier extends StateNotifier<AsyncValue<void>> {
  MessagingNotifier() : super(const AsyncData(null));

  Future<void> sendMessage({
    required String text,
    required String senderId,
    required String receiverId,
    required String enterpriseId,
  }) async {
    state = const AsyncLoading();
    try {
      final msg = Message()
        ..uuid = const Uuid().v4()
        ..text = text
        ..senderId = senderId
        ..receiverId = receiverId
        ..enterpriseId = enterpriseId
        ..sentAt = DateTime.now();

      await IsarService.write((isar) async {
        await isar.messages.put(msg);
      });
      
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final messagingNotifierProvider = StateNotifierProvider<MessagingNotifier, AsyncValue<void>>((ref) {
  return MessagingNotifier();
});
