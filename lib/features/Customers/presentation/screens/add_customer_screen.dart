import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveCustomer() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Customer added successfully!'),
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
        title: const Text('Add Customer'),
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
                  label: 'Full Name *',
                  hintText: 'Enter customer name',
                  controller: _nameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter full name' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone Number *',
                  hintText: 'Enter phone number',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter phone number' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Address',
                  hintText: 'Enter address',
                  controller: _addressController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Notes',
                  hintText: 'Additional notes (optional)',
                  controller: _notesController,
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Save Customer',
                  onPressed: _saveCustomer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
