import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class EditCustomerScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String address;
  final String notes;

  const EditCustomerScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.notes,
  });

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _addressController = TextEditingController(text: widget.address);
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _updateCustomer() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Customer updated successfully!'),
        backgroundColor: DeniBookColors.paid,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final initial = widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '?';

    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Edit Customer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: DeniBookColors.surfaceCard,
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: DeniBookColors.textWhite,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(widget.phone, style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 14)),
            const SizedBox(height: 28),

            CustomTextField(
              label: 'Full Name *',
              hintText: 'Enter name',
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Phone Number *',
              hintText: 'Enter phone',
              controller: _phoneController,
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
              hintText: 'Enter notes',
              controller: _notesController,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Update Customer',
              onPressed: _updateCustomer,
            ),
          ],
        ),
      ),
    );
  }
}
