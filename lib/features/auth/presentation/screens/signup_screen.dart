import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../shared/components/buttons/primary_button.dart';
import '../../../../shared/components/inputs/text_input_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/yugo_logo.png', width: 120),
              const SizedBox(height: 30),
              Text('create_account'.tr(),
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 30),
              TextInputField(
                controller: _nameController,
                label: 'full_name'.tr(),
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'required_field'.tr();
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextInputField(
                controller: _emailController,
                label: 'email'.tr(),
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'required_field'.tr();
                  if (!value.contains('@')) return 'invalid_email'.tr();
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextInputField(
                controller: _phoneController,
                label: 'phone'.tr(),
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'required_field'.tr();
                  if (value.length < 10) return 'invalid_phone'.tr();
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextInputField(
                controller: _passwordController,
                label: 'password'.tr(),
                icon: Icons.lock,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'required_field'.tr();
                  if (value.length < 6) return 'password_too_short'.tr();
                  return null;
                },
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'sign_up'.tr(),
                onPressed: _signUp,
                fullWidth: true,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.login),
                child: Text.rich(
                  TextSpan(
                    text: 'already_have_account'.tr(),
                    children: [
                      TextSpan(
                        text: ' ${'login'.tr()}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Mock signup delay
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to passenger home on success
    Navigator.pushReplacementNamed(context, AppRoutes.passengerHome);

    setState(() => _isLoading = false);
  }
}
