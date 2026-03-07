import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mesmer_app/core/config/supabase_config.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  // Initialize local Isar database
  await IsarService.initialize();

  runApp(const ProviderScope(child: MesmerApp()));
}

class MesmerApp extends ConsumerWidget {
  const MesmerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'MESMER',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
