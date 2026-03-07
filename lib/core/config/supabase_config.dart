/// Supabase project configuration.
/// Replace the placeholder values with your actual Supabase project credentials.
/// Find these in: Supabase Dashboard → Settings → API
class SupabaseConfig {
  SupabaseConfig._();

  static const String url = 'YOUR_SUPABASE_URL';
  static const String anonKey = 'YOUR_SUPABASE_ANON_KEY';

  // Storage bucket names
  static const String evidenceBucket = 'evidence';
  static const String documentsBucket = 'documents';
  static const String profilesBucket = 'profiles';
}
