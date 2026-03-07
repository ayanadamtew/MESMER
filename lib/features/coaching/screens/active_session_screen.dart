import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/features/coaching/providers/coaching_provider.dart';
import 'package:mesmer_app/features/coaching/services/media_upload_service.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/loading_overlay.dart';

class ActiveSessionScreen extends ConsumerStatefulWidget {
  const ActiveSessionScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  ConsumerState<ActiveSessionScreen> createState() =>
      _ActiveSessionScreenState();
}

class _ActiveSessionScreenState extends ConsumerState<ActiveSessionScreen> {
  final _notesCtrl = TextEditingController();
  final _recommendationsCtrl = TextEditingController();
  final _nextStepsCtrl = TextEditingController();
  CoachingSession? _session;
  bool _isLoading = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadSession();
    // Auto-save every 30 seconds
    Stream.periodic(const Duration(seconds: 30)).listen((_) {
      if (mounted) _autoSave();
    });
  }

  Future<void> _loadSession() async {
    final session = await IsarService.sessions
        .filter()
        .uuidEqualTo(widget.sessionId)
        .findFirst();
    if (mounted && session != null) {
      setState(() {
        _session = session;
        _notesCtrl.text = session.notes ?? '';
        _recommendationsCtrl.text = session.recommendations ?? '';
        _nextStepsCtrl.text = session.nextSteps ?? '';
      });
    }
  }

  Future<void> _autoSave() async {
    if (_session == null) return;
    await ref.read(coachingProvider.notifier).updateSessionNotes(
          uuid: widget.sessionId,
          notes: _notesCtrl.text,
          recommendations: _recommendationsCtrl.text,
          nextSteps: _nextStepsCtrl.text,
        );
  }

  Future<void> _saveNotes() async {
    setState(() => _isSaving = true);
    await _autoSave();
    setState(() => _isSaving = false);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notes saved'),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 1),
      ),
    );
  }

  Future<void> _uploadMedia() async {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSpacing.sm),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(ctx).dividerColor,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text('Upload Evidence',
                style: Theme.of(ctx).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined,
                  color: AppColors.primary),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(ctx);
                _handleUpload(MediaType.image);
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam_outlined,
                  color: AppColors.primary),
              title: const Text('Record / Select Video'),
              onTap: () {
                Navigator.pop(ctx);
                _handleUpload(MediaType.video);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file_outlined,
                  color: AppColors.primary),
              title: const Text('Attach Document'),
              onTap: () {
                Navigator.pop(ctx);
                _handleUpload(MediaType.document);
              },
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }

  Future<void> _handleUpload(MediaType type) async {
    setState(() => _isLoading = true);
    try {
      final service = ref.read(mediaUploadServiceProvider);
      final uri = await service.pickAndUpload(
        type: type,
        sessionId: widget.sessionId,
      );
      if (uri != null) {
        await ref
            .read(coachingProvider.notifier)
            .addMediaUri(widget.sessionId, uri);
        await _loadSession();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Media uploaded successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload failed: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _completeSession() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Complete Session'),
        content: const Text(
            'Mark this session as completed? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Complete'),
          ),
        ],
      ),
    );

    if (confirm != true) return;
    await _autoSave();
    await ref.read(coachingProvider.notifier).completeSession(widget.sessionId);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Session completed!'),
        backgroundColor: AppColors.success,
      ),
    );
    context.pop();
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    _recommendationsCtrl.dispose();
    _nextStepsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      message: 'Uploading media…',
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _session != null
                ? DateFormat.yMMMd().format(_session!.scheduledAt)
                : 'Active Session',
          ),
          actions: [
            if (_isSaving)
              const Padding(
                padding: EdgeInsets.only(right: AppSpacing.md),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
            IconButton(
              icon: const Icon(Icons.save_outlined),
              tooltip: 'Save notes',
              onPressed: _saveNotes,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_session != null)
                _SessionInfoBar(session: _session!),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Session Notes',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: _notesCtrl,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: 'Record observations and discussion notes…',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Coach Recommendations',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: _recommendationsCtrl,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText:
                      'Specific actions recommended for the enterprise…',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Next Steps',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: _nextStepsCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Agreed next steps and follow-up actions…',
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Evidence',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              if (_session != null && _session!.mediaUris.isNotEmpty)
                _MediaGrid(uris: _session!.mediaUris),
              OutlinedButton.icon(
                onPressed: _uploadMedia,
                icon: const Icon(Icons.attach_file_rounded),
                label: const Text('Attach Evidence'),
              ),
              const SizedBox(height: AppSpacing.xxl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _completeSession,
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Complete Session'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SessionInfoBar extends StatelessWidget {
  const _SessionInfoBar({required this.session});

  final CoachingSession session;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.business_outlined, color: AppColors.primary, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(session.enterpriseId,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  session.sessionType.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, size: 8, color: AppColors.success),
                SizedBox(width: 4),
                Text(
                  'LIVE',
                  style: TextStyle(
                    color: AppColors.success,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaGrid extends StatelessWidget {
  const _MediaGrid({required this.uris});

  final List<String> uris;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
      ),
      itemCount: uris.length,
      itemBuilder: (_, i) {
        final uri = uris[i];
        final isDoc = uri.endsWith('.pdf') || uri.endsWith('.doc');
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: isDoc
              ? const Icon(Icons.insert_drive_file_rounded,
                  color: AppColors.primary)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: Image.file(File(uri), fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                            Icons.image_not_supported_outlined,
                          )),
                ),
        );
      },
    );
  }
}
