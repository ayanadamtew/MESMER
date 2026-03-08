import 'package:supabase/supabase.dart';

void main() async {
  final supabase = SupabaseClient(
    'https://mbgqehzfnttpywslkyud.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1iZ3FlaHpmbnR0cHl3c2xreXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI5NzkwODYsImV4cCI6MjA4ODU1NTA4Nn0.u-DoM3LfY_mwwkARVyffyryeskC9GPa8K9SrrkOSa5w',
  );

  print('Creating test user...');
  try {
    final response = await supabase.auth.signUp(
      email: 'testcoach@mesmer.com',
      password: 'Password123!',
      data: {'name': 'Test Coach'},
    );
    print('User created successfully: \${response.user?.email}');
    print('ID: \${response.user?.id}');
  } on AuthException catch (e) {
    print('Auth Error: \${e.message}');
  } catch (e) {
    print('Error: \$e');
  }
}
