import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes.dart';
import '../../../../shared/components/buttons/primary_button.dart';
import '../../../../shared/components/inputs/text_input_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
              const SizedBox(height: 16),
              const SizedBox(height: 14),
              Text(
                'welcome'.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 30),
              TextInputField(
                controller: _emailController,
                label: 'email'.tr(),
                icon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'required_field'.tr();
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
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'required_field'.tr();
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.go(AppRoutes.forgotPassword),
                  child: Text('forgot_password'.tr()),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'login'.tr(),
                onPressed: _login,
                fullWidth: true,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => context.go(AppRoutes.signup),
                child: Text.rich(
                  TextSpan(
                    text: 'no_account'.tr(),
                    children: [
                      TextSpan(
                        text: ' ${'sign_up'.tr()}',
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

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Mock login delay
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to passenger home on success
    if (mounted) {
      context.go(AppRoutes.passengerHome);
    }

    setState(() => _isLoading = false);
  }
}
