import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/models/progress_indicator_record.dart';

final merlRepositoryProvider = Provider<MerlRepository>(
  (ref) => MerlRepository(Supabase.instance.client),
);

/// Handles two-way data sync with the MESMER MERL system via Supabase.
class MerlRepository {
  MerlRepository(this._client);

  final SupabaseClient _client;

  // ── Enterprise ──────────────────────────────────────────────────────────────

  Future<void> pushEnterprise(Enterprise e) async {
    await _client.from('enterprises').upsert({
      'uuid': e.uuid,
      'business_name': e.businessName,
      'owner_name': e.ownerName,
      'owner_phone': e.ownerPhone,
      'owner_email': e.ownerEmail,
      'owner_gender': e.ownerGender,
      'owner_age': e.ownerAge,
      'sector': e.sector.name,
      'subsector': e.subsector,
      'employee_count': e.employeeCount,
      'year_founded': e.yearFounded,
      'annual_revenue': e.annualRevenue,
      'street_address': e.streetAddress,
      'city': e.city,
      'district': e.district,
      'region': e.region,
      'country': e.country,
      'latitude': e.latitude,
      'longitude': e.longitude,
      'baseline_status': e.baselineStatus.name,
      'baseline_bookkeeping_score': e.baselineBookkeepingScore,
      'baseline_loan_status': e.baselineLoanStatus,
      'baseline_sales_volume': e.baselineSalesVolume,
      'merl_id': e.merlId,
      'coach_id': e.coachId,
      'enrolled_at': e.enrolledAt.toIso8601String(),
      'updated_at': (e.updatedAt ?? DateTime.now()).toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> pullEnterprises({
    required String coachId,
  }) async {
    final response = await _client
        .from('enterprises')
        .select()
        .eq('coach_id', coachId)
        .order('enrolled_at', ascending: false);
    return List<Map<String, dynamic>>.from(response as List);
  }

  // ── Diagnosis Assessments ────────────────────────────────────────────────────

  Future<void> pushAssessment(DiagnosisAssessment a) async {
    await _client.from('diagnosis_assessments').upsert({
      'uuid': a.uuid,
      'enterprise_id': a.enterpriseId,
      'coach_id': a.coachId,
      'assessed_at': a.assessedAt.toIso8601String(),
      'finance_score': a.financeScore,
      'marketing_score': a.marketingScore,
      'hr_score': a.hrScore,
      'operations_score': a.operationsScore,
      'governance_score': a.governanceScore,
      'checklist_json': a.checklistJson,
      'priority_challenges': a.priorityChallenges,
      'notes': a.notes,
    });
  }

  // ── Coaching Sessions ────────────────────────────────────────────────────────

  Future<void> pushSession(CoachingSession s) async {
    await _client.from('coaching_sessions').upsert({
      'uuid': s.uuid,
      'enterprise_id': s.enterpriseId,
      'coach_id': s.coachId,
      'session_type': s.sessionType.name,
      'status': s.status.name,
      'scheduled_at': s.scheduledAt.toIso8601String(),
      'conducted_at': s.conductedAt?.toIso8601String(),
      'duration_minutes': s.durationMinutes,
      'notes': s.notes,
      'recommendations': s.recommendations,
      'next_steps': s.nextSteps,
      'media_uris': s.mediaUris,
    });
  }

  // ── Progress Records ─────────────────────────────────────────────────────────

  Future<void> pushProgressRecord(ProgressIndicatorRecord r) async {
    await _client.from('progress_indicators').upsert({
      'uuid': r.uuid,
      'enterprise_id': r.enterpriseId,
      'recorded_by': r.recordedBy,
      'recorded_at': r.recordedAt.toIso8601String(),
      'bookkeeping_score': r.bookkeepingScore,
      'loan_repayment_status': r.loanRepaymentStatus.name,
      'sales_volume': r.salesVolume,
      'sales_growth_percent': r.salesGrowthPercent,
      'revenue_amount': r.revenueAmount,
      'number_of_customers': r.numberOfCustomers,
      'employee_count': r.employeeCount,
      'notes': r.notes,
    });
  }

  // ── Consortium Aggregation (calls Edge Function) ─────────────────────────────

  Future<Map<String, dynamic>> fetchConsortiumAggregates() async {
    final response = await _client.functions.invoke('aggregate-consortium');
    return Map<String, dynamic>.from(response.data as Map);
  }
}
