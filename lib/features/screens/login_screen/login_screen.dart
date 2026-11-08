import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../main_screen_wrapper_&_logic/main_screen_logic.dart';
import 'register_screen.dart';

class DeniBookLoginPage extends StatefulWidget {
  const DeniBookLoginPage({super.key});

  @override
  State<DeniBookLoginPage> createState() => _DeniBookLoginPageState();
}

class _DeniBookLoginPageState extends State<DeniBookLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreenLogic()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo & Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: DeniBookColors.surfaceCard,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  size: 64,
                  color: DeniBookColors.yellow,
                ),
              ),
              const SizedBox(height: 16),
              // Title
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Deni',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: DeniBookColors.textWhite,
                      ),
                    ),
                    TextSpan(
                      text: 'Book',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: DeniBookColors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Track Sales. Manage Debts.\nGrow Your Business.',
                style: TextStyle(
                  color: DeniBookColors.textMuted,
                  fontSize: 14,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: '',
                      hintText: 'Username',
                      controller: _usernameController,
                      prefixIcon: const Icon(Icons.person_outline, color: DeniBookColors.textMuted),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: '',
                      hintText: 'Password',
                      controller: _passwordController,
                      isPassword: _isObscured,
                      prefixIcon: const Icon(Icons.lock_outline, color: DeniBookColors.textMuted),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: DeniBookColors.textMuted,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              activeColor: DeniBookColors.yellow,
                              checkColor: Colors.black,
                              onChanged: (val) {
                                setState(() {
                                  _rememberMe = val ?? false;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(color: DeniBookColors.textMuted, fontSize: 13),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: DeniBookColors.textMuted, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Login Button
                    CustomButton(
                      text: 'Login',
                      onPressed: _handleLogin,
                    ),
                    const SizedBox(height: 32),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: DeniBookColors.textMuted, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: DeniBookColors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
