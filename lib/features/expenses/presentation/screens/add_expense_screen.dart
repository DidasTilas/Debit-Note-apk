import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_field.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  String _selectedCategory = 'Transport';
  DateTime _expenseDate = DateTime.now();

  final List<String> _categories = [
    'Transport',
    'Loading & Unloading',
    'Packaging',
    'Storage & Rent',
    'Utilities',
    'Other Expense',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense recorded successfully!'),
          backgroundColor: DeniBookColors.paid,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Add Expense'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: 'Expense Description *',
                  hintText: 'e.g. Transport for Rice delivery',
                  controller: _nameController,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter expense name' : null,
                ),
                const SizedBox(height: 16),
                CustomDropdownField<String>(
                  label: 'Category *',
                  hintText: 'Select category',
                  value: _selectedCategory,
                  items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedCategory = val);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Amount (TZS) *',
                  hintText: 'e.g. 15000',
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter amount' : null,
                ),
                const SizedBox(height: 16),
                CustomDatePickerField(
                  label: 'Date *',
                  selectedDate: _expenseDate,
                  onDateSelected: (d) => setState(() => _expenseDate = d),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Notes (optional)',
                  hintText: 'Additional details',
                  controller: _notesController,
                  maxLines: 2,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Save Expense',
                  onPressed: _saveExpense,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
