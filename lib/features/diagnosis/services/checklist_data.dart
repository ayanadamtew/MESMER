import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';

/// All checklist questions used in the Digital Diagnosis Engine.
/// Weighted scoring: critical items (weight 2.0), standard (weight 1.0)
class ChecklistData {
  ChecklistData._();

  static const List<ChecklistItem> allItems = [
    // ── Finance ──────────────────────────────────────────────────────────────
    ChecklistItem(
      id: 'fin_01',
      category: DiagnosisCategory.finance,
      question: 'Does the business maintain a regular record of income and expenses (bookkeeping)?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'fin_02',
      category: DiagnosisCategory.finance,
      question: 'Does the owner separate business finances from personal finances?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'fin_03',
      category: DiagnosisCategory.finance,
      question: 'Can the owner produce a monthly profit/loss estimate?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'fin_04',
      category: DiagnosisCategory.finance,
      question: 'Does the business have a savings or reserve fund for emergencies?',
      weight: 1.0,
    ),
    ChecklistItem(
      id: 'fin_05',
      category: DiagnosisCategory.finance,
      question: 'Is the business currently meeting all loan repayment obligations on time?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'fin_06',
      category: DiagnosisCategory.finance,
      question: 'Does the business file taxes or register income with relevant authorities?',
      weight: 1.0,
    ),

    // ── Marketing ────────────────────────────────────────────────────────────
    ChecklistItem(
      id: 'mkt_01',
      category: DiagnosisCategory.marketing,
      question: 'Does the business have a clearly defined target customer base?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'mkt_02',
      category: DiagnosisCategory.marketing,
      question: 'Does the business use any active marketing channels (social media, fliers, word-of-mouth strategy)?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'mkt_03',
      category: DiagnosisCategory.marketing,
      question: 'Does the enterprise have a pricing strategy based on cost analysis?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'mkt_04',
      category: DiagnosisCategory.marketing,
      question: 'Does the business track customer satisfaction or gather feedback?',
      weight: 1.0,
    ),
    ChecklistItem(
      id: 'mkt_05',
      category: DiagnosisCategory.marketing,
      question: 'Has the business experienced a measurable increase in sales in the past 3 months?',
      weight: 1.5,
    ),

    // ── Human Resources ──────────────────────────────────────────────────────
    ChecklistItem(
      id: 'hr_01',
      category: DiagnosisCategory.hr,
      question: 'Are employee roles and responsibilities clearly defined?',
      weight: 1.0,
    ),
    ChecklistItem(
      id: 'hr_02',
      category: DiagnosisCategory.hr,
      question: 'Does the business pay wages consistently and on time?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'hr_03',
      category: DiagnosisCategory.hr,
      question: 'Has any staff received job-relevant skills training in the past year?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'hr_04',
      category: DiagnosisCategory.hr,
      question: 'Does the business have a mechanism for handling staff disputes?',
      weight: 1.0,
    ),
    ChecklistItem(
      id: 'hr_05',
      category: DiagnosisCategory.hr,
      question: 'Does the owner participate in any external business training or association?',
      weight: 1.0,
    ),

    // ── Operations ───────────────────────────────────────────────────────────
    ChecklistItem(
      id: 'ops_01',
      category: DiagnosisCategory.operations,
      question: 'Does the business have documented standard operating procedures for key tasks?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'ops_02',
      category: DiagnosisCategory.operations,
      question: 'Is inventory (stock) tracked regularly?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'ops_03',
      category: DiagnosisCategory.operations,
      question: 'Does the business have reliable suppliers and manage procurement effectively?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'ops_04',
      category: DiagnosisCategory.operations,
      question: 'Is the business location/workspace adequate and safe for operations?',
      weight: 1.0,
    ),
    ChecklistItem(
      id: 'ops_05',
      category: DiagnosisCategory.operations,
      question: 'Does the business have a plan for handling equipment breakdown or supply disruption?',
      weight: 1.0,
    ),

    // ── Governance ───────────────────────────────────────────────────────────
    ChecklistItem(
      id: 'gov_01',
      category: DiagnosisCategory.governance,
      question: 'Is the business formally registered with a government body?',
      weight: 2.0,
    ),
    ChecklistItem(
      id: 'gov_02',
      category: DiagnosisCategory.governance,
      question: 'Does the business have a basic written business plan or operational goals?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'gov_03',
      category: DiagnosisCategory.governance,
      question: 'Are there clear decision-making processes in place for the business?',
      weight: 1.0,
    ),
    ChecklistItem(
      id: 'gov_04',
      category: DiagnosisCategory.governance,
      question: 'Does the business participate in or comply with industry/sector regulations?',
      weight: 1.5,
    ),
    ChecklistItem(
      id: 'gov_05',
      category: DiagnosisCategory.governance,
      question: 'Does the owner have succession or ownership continuity plans?',
      weight: 1.0,
    ),
  ];
}
