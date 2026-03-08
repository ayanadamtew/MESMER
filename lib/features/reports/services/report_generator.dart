import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';
import 'package:mesmer_app/shared/models/progress_indicator_record.dart';

final reportGeneratorProvider = Provider<ReportGenerator>(
  (ref) => ReportGenerator(),
);

class ReportGenerator {
  /// Generates a full enterprise progress report PDF and triggers share/print.
  Future<void> generateEnterpriseReport({
    required BuildContext context,
    required Enterprise enterprise,
  }) async {
    final sessions = await IsarService.sessions
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .sortByScheduledAtDesc()
        .findAll();

    final assessments = await IsarService.assessments
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .sortByAssessedAtDesc()
        .findAll();

    final progressRecords = await IsarService.progressRecords
        .filter()
        .enterpriseIdEqualTo(enterprise.uuid)
        .sortByRecordedAt()
        .findAll();

    final pdf = await _buildPdf(
      enterprise: enterprise,
      sessions: sessions,
      assessments: assessments,
      progressRecords: progressRecords,
    );

    await Printing.sharePdf(
      bytes: pdf,
      filename: 'MESMER_Report_${enterprise.businessName.replaceAll(' ', '_')}_${DateFormat('yyyyMMdd').format(DateTime.now())}.pdf',
    );
  }

  Future<Uint8List> _buildPdf({
    required Enterprise enterprise,
    required List<CoachingSession> sessions,
    required List<DiagnosisAssessment> assessments,
    required List<ProgressIndicatorRecord> progressRecords,
  }) async {
    final doc = pw.Document();

    final accentColor = PdfColor.fromHex('005F6B');
    final lightBg = PdfColor.fromHex('F8FAFC');
    final textDark = PdfColor.fromHex('1E293B');
    final textLight = PdfColor.fromHex('64748B');

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        header: (ctx) => _buildHeader(enterprise, accentColor),
        footer: (ctx) => _buildFooter(ctx, textLight),
        build: (ctx) => [
          pw.SizedBox(height: 24),

          // Enterprise Profile Section
          _sectionTitle('Enterprise Profile', accentColor),
          pw.SizedBox(height: 8),
          _infoGrid([
            ['Business Name', enterprise.businessName],
            ['Owner', enterprise.ownerName],
            ['Sector', enterprise.sector.name],
            ['City / District', '${enterprise.city ?? '-'}, ${enterprise.district ?? '-'}'],
            ['Employees', enterprise.employeeCount?.toString() ?? '-'],
            ['Year Founded', enterprise.yearFounded?.toString() ?? '-'],
            ['Enrolled', DateFormat.yMMMd().format(enterprise.enrolledAt)],
          ], textDark, textLight, lightBg),
          pw.SizedBox(height: 20),

          // Diagnosis Summary
          if (assessments.isNotEmpty) ...[
            _sectionTitle('Latest Diagnosis Assessment', accentColor),
            pw.SizedBox(height: 8),
            _scoreBars(assessments.first, accentColor, textLight),
            pw.SizedBox(height: 8),
            if (assessments.first.priorityChallenges.isNotEmpty)
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Priority Challenges:',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  ...assessments.first.priorityChallenges.asMap().entries.map(
                    (e) => pw.Text(
                      '${e.key + 1}. ${e.value}',
                      style: pw.TextStyle(color: textLight),
                    ),
                  ),
                ],
              ),
            pw.SizedBox(height: 20),
          ],

          // Progress Summary
          if (progressRecords.length >= 2) ...[
            _sectionTitle('Progress Summary', accentColor),
            pw.SizedBox(height: 8),
            _progressTable(progressRecords, textDark, textLight, lightBg),
            pw.SizedBox(height: 20),
          ],

          // Session History
          if (sessions.isNotEmpty) ...[
            _sectionTitle('Coaching Session History', accentColor),
            pw.SizedBox(height: 8),
            _sessionTable(sessions, textDark, textLight, lightBg),
          ],
        ],
      ),
    );

    return doc.save();
  }

  pw.Widget _buildHeader(Enterprise enterprise, PdfColor accent) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(color: accent),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'MESMER COACHING PLATFORM',
            style: pw.TextStyle(
              color: PdfColors.white,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            'Enterprise Progress Report',
            style: const pw.TextStyle(color: PdfColors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildFooter(pw.Context ctx, PdfColor textLight) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          'Generated: ${DateFormat.yMMMMd().format(DateTime.now())}',
          style: pw.TextStyle(color: textLight, fontSize: 9),
        ),
        pw.Text(
          'Page ${ctx.pageNumber} of ${ctx.pagesCount}',
          style: pw.TextStyle(color: textLight, fontSize: 9),
        ),
      ],
    );
  }

  pw.Widget _sectionTitle(String title, PdfColor color) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: pw.BoxDecoration(
        color: color,
        borderRadius: pw.BorderRadius.circular(4),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          color: PdfColors.white,
          fontWeight: pw.FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  pw.Widget _infoGrid(
    List<List<String>> rows,
    PdfColor textDark,
    PdfColor textLight,
    PdfColor bg,
  ) {
    return pw.Table(
      children: rows.map((row) {
        return pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(
                row[0],
                style: pw.TextStyle(
                  color: textLight,
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(
                row[1],
                style: pw.TextStyle(color: textDark, fontSize: 10),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  pw.Widget _scoreBars(
    DiagnosisAssessment a,
    PdfColor accent,
    PdfColor textLight,
  ) {
    final categories = [
      ['Finance', a.financeScore],
      ['Marketing', a.marketingScore],
      ['HR', a.hrScore],
      ['Operations', a.operationsScore],
      ['Governance', a.governanceScore],
    ];

    return pw.Column(
      children: categories.map((cat) {
        final score = (cat[1] as double) / 100;
        return pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 4),
          child: pw.Row(
            children: [
              pw.SizedBox(
                width: 80,
                child: pw.Text(
                  cat[0] as String,
                  style: pw.TextStyle(fontSize: 10, color: textLight),
                ),
              ),
              pw.SizedBox(width: 8),
              pw.Expanded(
                child: pw.Container(
                  height: 10,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey200,
                    borderRadius: pw.BorderRadius.circular(5),
                  ),
                  child: pw.Row(
                    children: [
                      if (score > 0)
                        pw.Expanded(
                          flex: (score * 100).toInt(),
                          child: pw.Container(
                            decoration: pw.BoxDecoration(
                              color: accent,
                              borderRadius: pw.BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      if (score < 1)
                        pw.Expanded(
                          flex: ((1 - score) * 100).toInt(),
                          child: pw.SizedBox(),
                        ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${(cat[1] as double).toStringAsFixed(0)}%',
                style: pw.TextStyle(fontSize: 10),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  pw.Widget _progressTable(
    List<ProgressIndicatorRecord> records,
    PdfColor textDark,
    PdfColor textLight,
    PdfColor bg,
  ) {
    final baseline = records.first;
    final latest = records.last;

    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300),
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(color: bg),
          children: ['Indicator', 'Baseline', 'Latest', 'Change'].map(
            (h) => pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(h,
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: textDark,
                      fontSize: 10)),
            ),
          ).toList(),
        ),
        _progressRow(
          'Bookkeeping Score',
          baseline.bookkeepingScore?.toStringAsFixed(1) ?? '-',
          latest.bookkeepingScore?.toStringAsFixed(1) ?? '-',
          baseline.bookkeepingScore != null && latest.bookkeepingScore != null
              ? '${(latest.bookkeepingScore! - baseline.bookkeepingScore!).toStringAsFixed(1)} pts'
              : '-',
          textDark, textLight,
        ),
        _progressRow(
          'Sales Volume (GHS)',
          baseline.salesVolume?.toStringAsFixed(0) ?? '-',
          latest.salesVolume?.toStringAsFixed(0) ?? '-',
          baseline.salesVolume != null && latest.salesVolume != null
              ? '${(((latest.salesVolume! - baseline.salesVolume!) / baseline.salesVolume!) * 100).toStringAsFixed(1)}%'
              : '-',
          textDark, textLight,
        ),
        _progressRow(
          'Loan Status',
          baseline.loanRepaymentStatus.name,
          latest.loanRepaymentStatus.name,
          '-',
          textDark, textLight,
        ),
      ],
    );
  }

  pw.TableRow _progressRow(
    String label,
    String baseline,
    String latest,
    String change,
    PdfColor textDark,
    PdfColor textLight,
  ) {
    return pw.TableRow(
      children: [label, baseline, latest, change].map(
        (v) => pw.Padding(
          padding: const pw.EdgeInsets.all(6),
          child: pw.Text(v,
              style: pw.TextStyle(color: textDark, fontSize: 10)),
        ),
      ).toList(),
    );
  }

  pw.Widget _sessionTable(
    List<CoachingSession> sessions,
    PdfColor textDark,
    PdfColor textLight,
    PdfColor bg,
  ) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300),
      columnWidths: const {
        0: pw.FlexColumnWidth(2),
        1: pw.FlexColumnWidth(1),
        2: pw.FlexColumnWidth(1),
        3: pw.FlexColumnWidth(3),
      },
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(color: bg),
          children: ['Date', 'Type', 'Status', 'Recommendations'].map(
            (h) => pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(h,
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: textDark,
                      fontSize: 10)),
            ),
          ).toList(),
        ),
        ...sessions.take(10).map(
          (s) => pw.TableRow(
            children: [
              DateFormat.yMMMd().format(s.scheduledAt),
              s.sessionType.name,
              s.status.name,
              s.recommendations ?? '-',
            ].map(
              (v) => pw.Padding(
                padding: const pw.EdgeInsets.all(6),
                child: pw.Text(v,
                    style: pw.TextStyle(color: textDark, fontSize: 9)),
              ),
            ).toList(),
          ),
        ),
      ],
    );
  }
}
