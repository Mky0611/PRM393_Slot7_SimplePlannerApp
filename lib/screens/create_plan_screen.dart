import 'package:flutter/material.dart';
import 'package:simple_planner/models/plan.dart';
import 'package:simple_planner/widgets/primary_button.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 10),
    );

    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _savePlan() {
    final title = _titleController.text.trim();
    final date = _selectedDate;
    final time = _selectedTime;

    if (title.isEmpty || date == null || time == null) {
      return;
    }

    Navigator.pop(context, Plan(title: title, date: date, time: time));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Plan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Plan title',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: Text(
                _selectedDate == null
                    ? 'Select date'
                    : '${_selectedDate!.year.toString().padLeft(4, '0')}-'
                          '${_selectedDate!.month.toString().padLeft(2, '0')}-'
                          '${_selectedDate!.day.toString().padLeft(2, '0')}',
              ),
              onTap: _pickDate,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time),
              title: Text(
                _selectedTime == null
                    ? 'Select time'
                    : '${_selectedTime!.hour.toString().padLeft(2, '0')}:'
                          '${_selectedTime!.minute.toString().padLeft(2, '0')}',
              ),
              onTap: _pickTime,
            ),
            const SizedBox(height: 16),
            PrimaryButton(text: 'Save Plan', onPressed: _savePlan),
          ],
        ),
      ),
    );
  }
}
