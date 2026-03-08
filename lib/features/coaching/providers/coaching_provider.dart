import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:isar/isar.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/core/network/connectivity_service.dart';
import 'package:mesmer_app/features/enterprise/repositories/merl_repository.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';

final allSessionsProvider =
    AsyncNotifierProvider<CoachingNotifier, List<CoachingSession>>(
  CoachingNotifier.new,
);

final coachingProvider = allSessionsProvider;

class CoachingNotifier
    extends AsyncNotifier<List<CoachingSession>> {
  @override
  Future<List<CoachingSession>> build() async {
    return IsarService.sessions.where().findAll();
  }

  Future<void> scheduleSession(CoachingSession session) async {
    session.uuid = const Uuid().v4();
    session.status = SessionStatus.scheduled;
    session.createdAt = DateTime.now();
    session.isSynced = false;

    await IsarService.write((isar) async {
      await isar.coachingSessions.put(session);
    });
    state = AsyncData(await IsarService.sessions.where().findAll());

    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushSession(session);
      await IsarService.write((isar) async {
        session.isSynced = true;
        session.syncedAt = DateTime.now();
        await isar.coachingSessions.put(session);
      });
      state = AsyncData(await IsarService.sessions.where().findAll());
    }
  }

  Future<void> updateSessionNotes({
    required String uuid,
    required String notes,
    required String recommendations,
    String? nextSteps,
  }) async {
    final session = await IsarService.sessions
        .filter()
        .uuidEqualTo(uuid)
        .findFirst();
    if (session == null) return;

    session
      ..notes = notes
      ..recommendations = recommendations
      ..nextSteps = nextSteps
      ..updatedAt = DateTime.now()
      ..isSynced = false;

    await IsarService.write((isar) async {
      await isar.coachingSessions.put(session);
    });
    state = AsyncData(await IsarService.sessions.where().findAll());

    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushSession(session);
      await IsarService.write((isar) async {
        session.isSynced = true;
        session.syncedAt = DateTime.now();
        await isar.coachingSessions.put(session);
      });
    }
  }

  Future<void> addMediaUri(String sessionUuid, String uri) async {
    final session = await IsarService.sessions
        .filter()
        .uuidEqualTo(sessionUuid)
        .findFirst();
    if (session == null) return;

    session.mediaUris = [...session.mediaUris, uri];
    session.isSynced = false;
    session.updatedAt = DateTime.now();

    await IsarService.write((isar) async {
      await isar.coachingSessions.put(session);
    });
    state = AsyncData(await IsarService.sessions.where().findAll());
  }

  Future<void> completeSession(String uuid) async {
    final session = await IsarService.sessions
        .filter()
        .uuidEqualTo(uuid)
        .findFirst();
    if (session == null) return;

    session
      ..status = SessionStatus.completed
      ..conductedAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isSynced = false;

    await IsarService.write((isar) async {
      await isar.coachingSessions.put(session);
    });
    state = AsyncData(await IsarService.sessions.where().findAll());

    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushSession(session);
    }
  }
}
