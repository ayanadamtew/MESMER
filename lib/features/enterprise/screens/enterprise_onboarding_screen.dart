import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/features/enterprise/providers/enterprise_provider.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/loading_overlay.dart';

class EnterpriseOnboardingScreen extends ConsumerStatefulWidget {
  const EnterpriseOnboardingScreen({super.key});

  @override
  ConsumerState<EnterpriseOnboardingScreen> createState() =>
      _EnterpriseOnboardingScreenState();
}

class _EnterpriseOnboardingScreenState
    extends ConsumerState<EnterpriseOnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  bool _isLoading = false;

  // Page 1: Basic Info
  final _businessNameCtrl = TextEditingController();
  final _ownerNameCtrl = TextEditingController();
  final _ownerPhoneCtrl = TextEditingController();
  final _ownerEmailCtrl = TextEditingController();
  String? _ownerGender;
  final _ownerAgeCtrl = TextEditingController();
  final _page1Key = GlobalKey<FormState>();

  // Page 2: Business Details
  BusinessSector _sector = BusinessSector.trade;
  final _subsectorCtrl = TextEditingController();
  final _employeeCountCtrl = TextEditingController();
  final _yearFoundedCtrl = TextEditingController();
  final _page2Key = GlobalKey<FormState>();

  // Page 3: Location & Baseline
  final _addressCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _districtCtrl = TextEditingController();
  final _regionCtrl = TextEditingController();
  String _baselineLoanStatus = 'No loan';
  final _baselineBookkeepingCtrl = TextEditingController();
  final _baselineSalesCtrl = TextEditingController();
  final _page3Key = GlobalKey<FormState>();

  @override
  void dispose() {
    _pageController.dispose();
    _businessNameCtrl.dispose();
    _ownerNameCtrl.dispose();
    _ownerPhoneCtrl.dispose();
    _ownerEmailCtrl.dispose();
    _ownerAgeCtrl.dispose();
    _subsectorCtrl.dispose();
    _employeeCountCtrl.dispose();
    _yearFoundedCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _districtCtrl.dispose();
    _regionCtrl.dispose();
    _baselineBookkeepingCtrl.dispose();
    _baselineSalesCtrl.dispose();
    super.dispose();
  }

  Future<void> _nextPage() async {
    final isValid = switch (_currentPage) {
      0 => _page1Key.currentState!.validate(),
      1 => _page2Key.currentState!.validate(),
      _ => _page3Key.currentState!.validate(),
    };
    if (!isValid) return;

    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      await _submit();
    }
  }

  Future<void> _submit() async {
    setState(() => _isLoading = true);
    try {
      final enterprise = Enterprise()
        ..businessName = _businessNameCtrl.text.trim()
        ..ownerName = _ownerNameCtrl.text.trim()
        ..ownerPhone = _ownerPhoneCtrl.text.trim()
        ..ownerEmail = _ownerEmailCtrl.text.trim()
        ..ownerGender = _ownerGender
        ..ownerAge = int.tryParse(_ownerAgeCtrl.text)
        ..sector = _sector
        ..subsector = _subsectorCtrl.text.trim()
        ..employeeCount = int.tryParse(_employeeCountCtrl.text)
        ..yearFounded = int.tryParse(_yearFoundedCtrl.text)
        ..streetAddress = _addressCtrl.text.trim()
        ..city = _cityCtrl.text.trim()
        ..district = _districtCtrl.text.trim()
        ..region = _regionCtrl.text.trim()
        ..country = 'Ghana'
        ..baselineStatus = BaselineStatus.assessed
        ..baselineLoanStatus = _baselineLoanStatus
        ..baselineBookkeepingScore =
            double.tryParse(_baselineBookkeepingCtrl.text)
        ..baselineSalesVolume = double.tryParse(_baselineSalesCtrl.text)
        ..coachId = 'current-coach-id'; // Replace with actual auth user id

      await ref.read(enterpriseListProvider.notifier).addEnterprise(enterprise);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enterprise onboarded successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
      context.go(AppRoutes.enterprises);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      message: 'Saving enterprise…',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Enterprise'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.pop(),
          ),
        ),
        body: Column(
          children: [
            _buildProgressIndicator(),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (p) => setState(() => _currentPage = p),
                children: [
                  _buildPage1(),
                  _buildPage2(),
                  _buildPage3(),
                ],
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: List.generate(3, (i) {
          final isActive = i == _currentPage;
          final isDone = i < _currentPage;
          return Expanded(
            child: Row(
              children: [
                if (i > 0)
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isDone || isActive
                          ? AppColors.primary
                          : Theme.of(context).dividerColor,
                    ),
                  ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: isDone || isActive
                        ? AppColors.primary
                        : Theme.of(context).dividerColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isDone
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : Text(
                            '${i + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                  ),
                ),
                if (i < 2)
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isDone
                          ? AppColors.primary
                          : Theme.of(context).dividerColor,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPage1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Form(
        key: _page1Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Basic Information',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.xs),
            Text('Tell us about the enterprise and its owner.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6))),
            const SizedBox(height: AppSpacing.xl),
            TextFormField(
              controller: _businessNameCtrl,
              decoration: const InputDecoration(
                labelText: 'Business Name *',
                prefixIcon: Icon(Icons.storefront_outlined),
              ),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Business name is required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _ownerNameCtrl,
              decoration: const InputDecoration(
                labelText: "Owner's Full Name *",
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Owner name is required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _ownerPhoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _ownerEmailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<String>(
              value: _ownerGender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                prefixIcon: Icon(Icons.people_outline),
              ),
              items: const [
                DropdownMenuItem(value: 'male', child: Text('Male')),
                DropdownMenuItem(value: 'female', child: Text('Female')),
                DropdownMenuItem(
                    value: 'other', child: Text('Prefer not to say')),
              ],
              onChanged: (v) => setState(() => _ownerGender = v),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _ownerAgeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                prefixIcon: Icon(Icons.cake_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Form(
        key: _page2Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Business Details',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.xs),
            Text('Describe the business sector and size.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6))),
            const SizedBox(height: AppSpacing.xl),
            DropdownButtonFormField<BusinessSector>(
              value: _sector,
              decoration: const InputDecoration(
                labelText: 'Business Sector *',
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: BusinessSector.values
                  .map(
                    (s) => DropdownMenuItem(
                        value: s, child: Text(_sectorLabel(s))),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _sector = v!),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _subsectorCtrl,
              decoration: const InputDecoration(
                labelText: 'Sub-sector / Specific Activity',
                prefixIcon: Icon(Icons.work_outline),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _employeeCountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of Employees',
                prefixIcon: Icon(Icons.group_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _yearFoundedCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Year Founded',
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Form(
        key: _page3Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location & Baseline',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.xs),
            Text('Capture the enterprise location and starting baseline.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6))),
            const SizedBox(height: AppSpacing.xl),
            TextFormField(
              controller: _addressCtrl,
              decoration: const InputDecoration(
                labelText: 'Street Address',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cityCtrl,
                    decoration:
                        const InputDecoration(labelText: 'City / Town *'),
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'City is required'
                        : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    controller: _districtCtrl,
                    decoration:
                        const InputDecoration(labelText: 'District'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _regionCtrl,
              decoration: const InputDecoration(
                labelText: 'Region',
                prefixIcon: Icon(Icons.map_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Baseline Status',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _baselineBookkeepingCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Bookkeeping Score (0–100)',
                prefixIcon: Icon(Icons.book_outlined),
                helperText: 'Current bookkeeping practice level',
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<String>(
              value: _baselineLoanStatus,
              decoration: const InputDecoration(
                labelText: 'Loan Repayment Status',
                prefixIcon: Icon(Icons.account_balance_outlined),
              ),
              items: ['No loan', 'On Track', 'Delayed', 'Defaulted']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (v) => setState(() => _baselineLoanStatus = v!),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _baselineSalesCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Monthly Sales Volume (GHS)',
                prefixIcon: Icon(Icons.trending_up_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md +
            MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentPage > 0)
            OutlinedButton(
              onPressed: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              ),
              child: const Text('Back'),
            ),
          if (_currentPage > 0) const SizedBox(width: AppSpacing.md),
          Expanded(
            child: ElevatedButton(
              onPressed: _nextPage,
              child: Text(_currentPage < 2 ? 'Next' : 'Save Enterprise'),
            ),
          ),
        ],
      ),
    );
  }

  String _sectorLabel(BusinessSector s) {
    switch (s) {
      case BusinessSector.agriculture:
        return 'Agriculture';
      case BusinessSector.manufacturing:
        return 'Manufacturing';
      case BusinessSector.trade:
        return 'Trade / Commerce';
      case BusinessSector.services:
        return 'Services';
      case BusinessSector.technology:
        return 'Technology';
      case BusinessSector.healthcare:
        return 'Healthcare';
      case BusinessSector.education:
        return 'Education';
      case BusinessSector.construction:
        return 'Construction';
      case BusinessSector.other:
        return 'Other';
    }
  }
}
