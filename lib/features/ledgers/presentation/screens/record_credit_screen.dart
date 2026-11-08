import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_field.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'success_message_dialog.dart';

class RecordCreditScreen extends StatefulWidget {
  final String? customerName;

  const RecordCreditScreen({super.key, this.customerName});

  @override
  State<RecordCreditScreen> createState() => _RecordCreditScreenState();
}

class _RecordCreditScreenState extends State<RecordCreditScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCustomer;
  String? _selectedProduct;
  DateTime _selectedDate = DateTime.now();
  final _quantityController = TextEditingController(text: '1');
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  final List<String> _customers = [
    'John Mwangi',
    'Mary Joseph',
    'Peter Hassan',
    'Amina Salum',
    'David Kimani',
  ];

  final Map<String, int> _productPrices = {
    'Sugar (3,000 / kg)': 3000,
    'Rice (2,800 / kg)': 2800,
    'Cooking Oil (7,500 / L)': 7500,
    'Wheat Flour (22,000 / bag)': 22000,
  };

  @override
  void initState() {
    super.initState();
    if (widget.customerName != null && _customers.contains(widget.customerName)) {
      _selectedCustomer = widget.customerName;
    } else {
      _selectedCustomer = _customers.first;
    }
    _selectedProduct = _productPrices.keys.first;
    _quantityController.addListener(_calculateAmount);
    _calculateAmount();
  }

  void _calculateAmount() {
    final qty = int.tryParse(_quantityController.text.trim()) ?? 0;
    final unitPrice = _productPrices[_selectedProduct] ?? 0;
    final total = qty * unitPrice;
    _amountController.text = total > 0 ? total.toString() : '';
  }

  @override
  void dispose() {
    _quantityController.removeListener(_calculateAmount);
    _quantityController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveCredit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessMessageDialog(
            title: 'Credit Recorded!',
            amount: 'TZS ${_amountController.text}',
            customerName: _selectedCustomer ?? 'John Mwangi',
            newBalance: 'TZS 130,000',
            date: '07 Sep 2025',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Record Credit'),
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
                CustomDropdownField<String>(
                  label: 'Customer *',
                  hintText: 'Select customer',
                  value: _selectedCustomer,
                  items: _customers.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (val) => setState(() => _selectedCustomer = val),
                ),
                const SizedBox(height: 16),
                CustomDropdownField<String>(
                  label: 'Product *',
                  hintText: 'Select product',
                  value: _selectedProduct,
                  items: _productPrices.keys.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedProduct = val;
                      _calculateAmount();
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Quantity Sold *',
                  hintText: 'Enter quantity',
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter quantity' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Auto-Calculated Total Amount (TZS) *',
                  hintText: 'Total Amount',
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Amount required' : null,
                ),
                const SizedBox(height: 16),
                CustomDatePickerField(
                  label: 'Date *',
                  selectedDate: _selectedDate,
                  onDateSelected: (d) => setState(() => _selectedDate = d),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Notes (optional)',
                  hintText: 'Additional notes',
                  controller: _notesController,
                  maxLines: 2,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Save Credit',
                  onPressed: _saveCredit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
