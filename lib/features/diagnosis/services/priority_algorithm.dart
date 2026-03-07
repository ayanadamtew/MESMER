/// Priority Algorithm: parses diagnosis scores and returns an ordered list
/// of business challenges, worst-first (lowest score = highest priority).
class PriorityAlgorithm {
  PriorityAlgorithm._();

  static List<PriorityChallenge> compute({
    required double finance,
    required double marketing,
    required double hr,
    required double operations,
    required double governance,
  }) {
    final scores = {
      'Finance': finance,
      'Marketing': marketing,
      'Human Resources': hr,
      'Operations': operations,
      'Governance': governance,
    };

    final challenges = scores.entries
        .map(
          (e) => PriorityChallenge(
            category: e.key,
            score: e.value,
            severity: _severity(e.value),
            description: _description(e.key, e.value),
          ),
        )
        .toList()
      ..sort((a, b) => a.score.compareTo(b.score)); // lowest score first

    return challenges;
  }

  static ChallengeSeverity _severity(double score) {
    if (score < 30) return ChallengeSeverity.critical;
    if (score < 50) return ChallengeSeverity.high;
    if (score < 70) return ChallengeSeverity.medium;
    return ChallengeSeverity.low;
  }

  static String _description(String category, double score) {
    final level = score < 30 ? 'critically low' : score < 50 ? 'low' : score < 70 ? 'moderate' : 'adequate';
    final action = switch (category) {
      'Finance' => 'Focus on bookkeeping practices, financial separation, and loan management.',
      'Marketing' => 'Develop pricing strategy, identify target customers, and grow sales channels.',
      'Human Resources' => 'Clarify staff roles, ensure timely wages, and invest in skills training.',
      'Operations' => 'Improve inventory tracking, supplier relations, and standard procedures.',
      'Governance' => 'Pursue formal business registration and develop a written business plan.',
      _ => 'Review and improve practices in this area.',
    };
    return 'Performance is $level (${score.toStringAsFixed(0)}%). $action';
  }
}

enum ChallengeSeverity { critical, high, medium, low }

class PriorityChallenge {
  const PriorityChallenge({
    required this.category,
    required this.score,
    required this.severity,
    required this.description,
  });

  final String category;
  final double score;
  final ChallengeSeverity severity;
  final String description;
}
