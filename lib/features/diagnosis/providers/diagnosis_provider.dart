import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/core/network/connectivity_service.dart';
import 'package:mesmer_app/features/enterprise/repositories/merl_repository.dart';
import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';

final diagnosisProvider = AsyncNotifierProviderFamily<DiagnosisNotifier,
    List<DiagnosisAssessment>, String>(
  DiagnosisNotifier.new,
);

class DiagnosisNotifier
    extends FamilyAsyncNotifier<List<DiagnosisAssessment>, String> {
  @override
  Future<List<DiagnosisAssessment>> build(String enterpriseId) async {
    return IsarService.assessments
        .filter()
        .enterpriseIdEqualTo(enterpriseId)
        .sortByAssessedAtDesc()
        .findAll();
  }

  Future<void> saveAssessment({
    required String enterpriseId,
    required double financeScore,
    required double marketingScore,
    required double hrScore,
    required double operationsScore,
    required double governanceScore,
    required Map<String, bool?> answers,
  }) async {
    final assessment = DiagnosisAssessment()
      ..uuid = const Uuid().v4()
      ..enterpriseId = enterpriseId
      ..coachId = 'current-coach-id'
      ..assessedAt = DateTime.now()
      ..financeScore = financeScore
      ..marketingScore = marketingScore
      ..hrScore = hrScore
      ..operationsScore = operationsScore
      ..governanceScore = governanceScore
      ..checklistJson =
          json.encode(answers.map((k, v) => MapEntry(k, v)))
      ..priorityChallenges = _computePriorities(
        financeScore,
        marketingScore,
        hrScore,
        operationsScore,
        governanceScore,
      )
      ..isSynced = false;

    await IsarService.write((isar) async {
      await isar.diagnosisAssessments.put(assessment);
    });

    state = AsyncData(
      await IsarService.assessments
          .filter()
          .enterpriseIdEqualTo(enterpriseId)
          .findAll(),
    );

    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushAssessment(assessment);
      await IsarService.write((isar) async {
        assessment.isSynced = true;
        assessment.syncedAt = DateTime.now();
        await isar.diagnosisAssessments.put(assessment);
      });
    }
  }

  List<String> _computePriorities(
    double f,
    double m,
    double hr,
    double ops,
    double gov,
  ) {
    final scores = {
      'Finance': f,
      'Marketing': m,
      'Human Resources': hr,
      'Operations': ops,
      'Governance': gov,
    };
    return (scores.entries.toList()
          ..sort((a, b) => a.value.compareTo(b.value)))
        .map((e) => e.key)
        .toList();
  }
}
