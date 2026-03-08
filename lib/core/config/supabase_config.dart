/// Supabase project configuration.
/// Replace the placeholder values with your actual Supabase project credentials.
/// Find these in: Supabase Dashboard → Settings → API
class SupabaseConfig {
  SupabaseConfig._();

  static const String url = 'https://mbgqehzfnttpywslkyud.supabase.co';
  static const String anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1iZ3FlaHpmbnR0cHl3c2xreXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI5NzkwODYsImV4cCI6MjA4ODU1NTA4Nn0.u-DoM3LfY_mwwkARVyffyryeskC9GPa8K9SrrkOSa5w';

  // Storage bucket names
  static const String evidenceBucket = 'evidence';
  static const String documentsBucket = 'documents';
  static const String profilesBucket = 'profiles';
}
