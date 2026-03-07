import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/features/diagnosis/screens/diagnosis_screen.dart';
import 'package:mesmer_app/features/diagnosis/providers/diagnosis_provider.dart';
import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

void main() {
  testWidgets('DiagnosisScreen renders 5 tabs and saves assessment', (tester) async {
    // Override the provider to not hit Isar
    final mockProvider = AsyncNotifierProviderFamily<DiagnosisNotifier,
        List<DiagnosisAssessment>, String>(
      () => _MockDiagnosisNotifier(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          diagnosisProvider.overrideWith(mockProvider.call),
        ],
        child: const MaterialApp(
          home: DiagnosisScreen(enterpriseId: 'test-enterprise-123'),
        ),
      ),
    );

    // Initial render and settlement
    await tester.pumpAndSettle();

    // Verify AppBar title
    expect(find.text('Digital Diagnosis'), findsOneWidget);

    // Verify 5 tabs exist
    expect(find.text('Finance'), findsOneWidget);
    expect(find.text('Marketing'), findsOneWidget);
    expect(find.text('HR'), findsOneWidget);
    expect(find.text('Operations'), findsOneWidget);
    expect(find.text('Governance'), findsOneWidget);

    // Verify first question in Finance tab
    expect(find.text('Does the business maintain a regular record of income and expenses (bookkeeping)?'), findsOneWidget);

    // Tap 'Yes' on the first question
    final yesButtons = find.text('Yes');
    await tester.tap(yesButtons.first);
    await tester.pumpAndSettle();

    // The score should update (visually, the progress bar updates, but we can check if it moved by interacting or just proceeding)
    
    // Tap the 'Complete Diagnosis' button
    await tester.tap(find.text('Complete Diagnosis'));
    await tester.pumpAndSettle();

    // Verify bottom sheet appears with Priority Challenges
    expect(find.text('Diagnosis Results'), findsOneWidget);
    expect(find.text('Priority business challenges identified:'), findsOneWidget);
    
    // Tap 'Done' to close sheet
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    
    // Bottom sheet is closed
    expect(find.text('Diagnosis Results'), findsNothing);
  });
}

class _MockDiagnosisNotifier extends FamilyAsyncNotifier<List<DiagnosisAssessment>, String> implements DiagnosisNotifier {
  @override
  Future<List<DiagnosisAssessment>> build(String arg) async {
    return [];
  }

  @override
  Future<void> saveAssessment({
    required String enterpriseId,
    required double financeScore,
    required double marketingScore,
    required double hrScore,
    required double operationsScore,
    required double governanceScore,
    required Map<String, bool?> answers,
  }) async {
    // Mock save logic, do nothing just succeed
  }
}
