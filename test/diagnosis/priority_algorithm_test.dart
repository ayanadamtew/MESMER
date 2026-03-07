import 'package:flutter_test/flutter_test.dart';
import 'package:mesmer_app/features/diagnosis/services/priority_algorithm.dart';

void main() {
  group('PriorityAlgorithm', () {
    test('returns 5 challenges in ascending score order', () {
      final result = PriorityAlgorithm.compute(
        finance: 20,
        marketing: 65,
        hr: 45,
        operations: 80,
        governance: 10,
      );

      expect(result.length, 5);
      for (int i = 0; i < result.length - 1; i++) {
        expect(
          result[i].score,
          lessThanOrEqualTo(result[i + 1].score),
          reason: 'Results should be sorted lowest-score-first',
        );
      }
    });

    test('governance scored 10 gets severity critical', () {
      final result = PriorityAlgorithm.compute(
        finance: 50,
        marketing: 50,
        hr: 50,
        operations: 50,
        governance: 10,
      );
      final govChallenge = result.firstWhere((c) => c.category == 'Governance');
      expect(govChallenge.severity, ChallengeSeverity.critical);
    });

    test('finance scored 100 gets severity low', () {
      final result = PriorityAlgorithm.compute(
        finance: 100,
        marketing: 50,
        hr: 50,
        operations: 50,
        governance: 50,
      );
      final finChallenge = result.firstWhere((c) => c.category == 'Finance');
      expect(finChallenge.severity, ChallengeSeverity.low);
    });

    test('categories with equal scores appear without crash', () {
      expect(
        () => PriorityAlgorithm.compute(
          finance: 50,
          marketing: 50,
          hr: 50,
          operations: 50,
          governance: 50,
        ),
        returnsNormally,
      );
    });

    test('score boundaries map to correct severities', () {
      final result = PriorityAlgorithm.compute(
        finance: 25,
        marketing: 35,
        hr: 55,
        operations: 75,
        governance: 90,
      );

      expect(
        result.firstWhere((c) => c.category == 'Finance').severity,
        ChallengeSeverity.critical,
      );
      expect(
        result.firstWhere((c) => c.category == 'Marketing').severity,
        ChallengeSeverity.high,
      );
      expect(
        result.firstWhere((c) => c.category == 'HR').severity,
        ChallengeSeverity.medium,
      );
      expect(
        result.firstWhere((c) => c.category == 'Operations').severity,
        ChallengeSeverity.low,
      );
    });
  });
}
