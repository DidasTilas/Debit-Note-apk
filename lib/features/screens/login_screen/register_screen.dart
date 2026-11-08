import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../main_screen_wrapper_&_logic/main_screen_logic.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _businessNameController = TextEditingController();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_onFullNameChanged);
  }

  void _onFullNameChanged() {
    final text = _fullNameController.text.trim();
    if (text.isNotEmpty) {
      final firstName = text.split(' ').first.toLowerCase();
      _usernameController.text = firstName;
    } else {
      _usernameController.text = '';
    }
  }

  @override
  void dispose() {
    _fullNameController.removeListener(_onFullNameChanged);
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _businessNameController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account & Business created successfully!'),
          backgroundColor: DeniBookColors.paid,
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainScreenLogic()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      appBar: AppBar(
        title: const Text('Create Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DeniBookColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Setup Your SME Business',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: DeniBookColors.textWhite,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Register your account and business details to get started.',
                  style: TextStyle(color: DeniBookColors.textMuted, fontSize: 14),
                ),
                const SizedBox(height: 28),

                CustomTextField(
                  label: 'Full Name *',
                  hintText: 'e.g. John Mwangi',
                  controller: _fullNameController,
                  prefixIcon: const Icon(Icons.person_outline, color: DeniBookColors.textMuted),
                  validator: (v) => v == null || v.isEmpty ? 'Please enter full name' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Auto-Generated Username *',
                  hintText: 'Username (from First Name)',
                  controller: _usernameController,
                  prefixIcon: const Icon(Icons.alternate_email, color: DeniBookColors.textMuted),
                  validator: (v) => v == null || v.isEmpty ? 'Username required' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password *',
                  hintText: 'Set your password',
                  controller: _passwordController,
                  isPassword: _isObscured,
                  prefixIcon: const Icon(Icons.lock_outline, color: DeniBookColors.textMuted),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: DeniBookColors.textMuted,
                    ),
                    onPressed: () => setState(() => _isObscured = !_isObscured),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please set password';
                    if (v.length < 4) return 'Password must be at least 4 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Business Name *',
                  hintText: 'e.g. Mwangi General Store',
                  controller: _businessNameController,
                  prefixIcon: const Icon(Icons.storefront_outlined, color: DeniBookColors.textMuted),
                  validator: (v) => v == null || v.isEmpty ? 'Please enter business name' : null,
                ),
                const SizedBox(height: 32),

                CustomButton(
                  text: 'Create Business & Account',
                  onPressed: _handleRegister,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
