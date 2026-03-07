import 'package:flutter/material.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    required this.isLoading,
    required this.child,
    super.key,
    this.message,
  });

  final bool isLoading;
  final Widget child;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.45),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    if (message != null) ...[
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        message!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
