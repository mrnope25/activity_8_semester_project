import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

enum ReportUiState { idle, loading, success, empty, error }

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Simulated storage: reports live in memory only (no REST API / database yet).
  final List<String> _reports = [];

  ReportUiState _uiState = ReportUiState.empty;
  bool _simulateFailure = false;

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    // Guard against duplicate submissions while a request is pending.
    if (_uiState == ReportUiState.loading) return;
    if (!_formKey.currentState!.validate()) return;

    final title = _titleController.text.trim();
    setState(() => _uiState = ReportUiState.loading);

    try {
      // Simulated async request (replace with a REST API call later).
      await Future<void>.delayed(const Duration(seconds: 3));
      if (_simulateFailure) throw Exception('Simulated failure');
      if (!mounted) return;
      setState(() {
        _reports.insert(0, title);
        _uiState = ReportUiState.success;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _uiState = ReportUiState.error);
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _titleController.clear();
    _locationController.clear();
    _descriptionController.clear();
    setState(() => _uiState = ReportUiState.idle);
  }

  String? _validateTitle(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Title is required';
    if (text.length < 3) return 'Title must be at least 3 characters';
    return null;
  }

  String? _validateRequired(String? value) =>
      (value == null || value.trim().isEmpty) ? 'This field is required' : null;

  String? _validateDescription(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Description is required';
    if (text.length < 10) {
      return 'Please describe the symptom in at least 10 characters';
    }
    return null;
  }

  Widget _buildStatusPanel() {
    switch (_uiState) {
      case ReportUiState.idle:
        return const SizedBox.shrink();

      case ReportUiState.loading:
        return const Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text('Submitting report... (simulated, please wait)'),
            ),
          ],
        );

      case ReportUiState.success:
        return Card(
          color: Colors.green.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Success: report saved (simulated). It now appears in the list below.',
                ),
                const SizedBox(height: 12),
                AppButton(label: 'Submit another report', onPressed: _resetForm),
              ],
            ),
          ),
        );

      case ReportUiState.empty:
        return const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'No reports yet. Fill out the form above and press Submit Report '
              'to create your first one.',
            ),
          ),
        );

      case ReportUiState.error:
        return Card(
          color: Colors.red.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Error: submission failed (simulated). Check your input and try again.',
                ),
                const SizedBox(height: 12),
                AppButton(label: 'Retry', onPressed: _submitReport),
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = _uiState == ReportUiState.loading;

    return Scaffold(
      appBar: AppBar(title: const Text('Symptom Report')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextField(
                        label: 'Report title',
                        controller: _titleController,
                        validator: _validateTitle,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        label: 'Body area / location',
                        controller: _locationController,
                        validator: _validateRequired,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        label: 'Symptom description',
                        controller: _descriptionController,
                        maxLines: 4,
                        validator: _validateDescription,
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _simulateFailure,
                  onChanged: isLoading
                      ? null
                      : (v) => setState(() => _simulateFailure = v ?? false),
                  title: const Text('Simulate failure (to test the Error state)'),
                ),
                const SizedBox(height: 8),
                AppButton(
                  label: 'Submit Report',
                  onPressed: isLoading ? null : _submitReport,
                ),
                const SizedBox(height: 16),
                _buildStatusPanel(),
                if (_reports.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text(
                    'Submitted reports (simulated)',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  for (final title in _reports)
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.description_outlined),
                        title: Text(title),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
