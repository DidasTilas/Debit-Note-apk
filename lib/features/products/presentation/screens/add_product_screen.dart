import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_field.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _costController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  String _selectedUnit = 'pcs';
  DateTime _dateIn = DateTime.now();

  final List<String> _units = ['pcs', 'kg', 'bags', 'boxes', 'liters', 'cartons'];

  @override
  void dispose() {
    _nameController.dispose();
    _costController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product saved successfully!'),
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
        title: const Text('Add Product'),
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
                  label: 'Product Name *',
                  hintText: 'e.g. Sugar, Rice, Cooking Oil',
                  controller: _nameController,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter product name' : null,
                ),
                const SizedBox(height: 16),
                CustomDropdownField<String>(
                  label: 'Unit *',
                  hintText: 'Select unit',
                  value: _selectedUnit,
                  items: _units.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedUnit = val);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Cost Price (TZS) *',
                  hintText: 'e.g. 2500',
                  controller: _costController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter cost price' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Selling Price (TZS) *',
                  hintText: 'e.g. 3000',
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter selling price' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Quantity Arrived *',
                  hintText: 'e.g. 50',
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter quantity' : null,
                ),
                const SizedBox(height: 16),
                CustomDatePickerField(
                  label: 'Date Arrived *',
                  selectedDate: _dateIn,
                  onDateSelected: (d) => setState(() => _dateIn = d),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Save Product',
                  onPressed: _saveProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
