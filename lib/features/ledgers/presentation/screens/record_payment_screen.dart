import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_date_picker_field.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/outstanding_balance_card.dart';
import 'success_message_dialog.dart';

class RecordPaymentScreen extends StatefulWidget {
  final String? customerName;
  final String? balance;

  const RecordPaymentScreen({
    super.key,
    this.customerName,
    this.balance,
  });

  @override
  State<RecordPaymentScreen> createState() => _RecordPaymentScreenState();
}

class _RecordPaymentScreenState extends State<RecordPaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCustomer;
  DateTime _selectedDate = DateTime.now();
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();
  final _notesController = TextEditingController();
  String _paymentMethod = 'Cash';

  final List<String> _customers = [
    'John Mwangi',
    'Mary Joseph',
    'Peter Hassan',
    'Amina Salum',
    'David Kimani',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.customerName != null && _customers.contains(widget.customerName)) {
      _selectedCustomer = widget.customerName;
    } else {
      _selectedCustomer = _customers.first;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _savePayment() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessMessageDialog(
            title: 'Payment Recorded!',
            amount: 'TZS ${_amountController.text.isNotEmpty ? _amountController.text : '20,000'}',
            customerName: _selectedCustomer ?? 'John Mwangi',
            newBalance: 'TZS 60,000',
            date: '05 Sep 2025',
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
        title: const Text('Record Payment'),
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
                  items: _customers.map((c) {
                    return DropdownMenuItem(value: c, child: Text(c));
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedCustomer = val),
                ),
                const SizedBox(height: 16),
                OutstandingBalanceCard(
                  amount: widget.balance ?? 'TZS 80,000',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Payment Amount *',
                  hintText: 'Enter amount',
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v == null || v.isEmpty ? 'Please enter payment amount' : null,
                ),
                const SizedBox(height: 16),
                CustomDatePickerField(
                  label: 'Date *',
                  selectedDate: _selectedDate,
                  onDateSelected: (d) => setState(() => _selectedDate = d),
                ),
                const SizedBox(height: 20),

                // Transaction Method
                const Text(
                  'Transaction Method',
                  style: TextStyle(
                    color: DeniBookColors.textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _methodRadio('Cash'),
                    const SizedBox(width: 16),
                    _methodRadio('Mobile Money'),
                  ],
                ),
                Row(
                  children: [
                    _methodRadio('Bank'),
                    const SizedBox(width: 16),
                    _methodRadio('Other'),
                  ],
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: 'Reference (optional)',
                  hintText: 'Enter reference',
                  controller: _referenceController,
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
                  text: 'Save Payment',
                  onPressed: _savePayment,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _methodRadio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: _paymentMethod,
          activeColor: DeniBookColors.yellow,
          onChanged: (val) {
            if (val != null) setState(() => _paymentMethod = val);
          },
        ),
        Text(value, style: const TextStyle(color: DeniBookColors.textWhite, fontSize: 14)),
      ],
    );
  }
}
