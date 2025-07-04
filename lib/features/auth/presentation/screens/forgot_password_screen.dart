import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/components/buttons/primary_button.dart';
import '../../../../shared/components/inputs/text_input_field.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
              Text('reset_password'.tr(),
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              Text('reset_password_instructions'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 30),
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
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'reset_password'.tr(),
                onPressed: _resetPassword,
                fullWidth: true,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('back_to_login'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Mock reset password delay
    await Future.delayed(const Duration(seconds: 2));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('reset_link_sent'.tr())),
    );

    Navigator.pop(context);
    setState(() => _isLoading = false);
  }
}
