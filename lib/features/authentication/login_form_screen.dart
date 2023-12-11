import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/ssizes.dart';
import 'package:tiktok_clone/features/authentication/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interest_scrren.dart';

class LoginFormScrren extends StatefulWidget {
  const LoginFormScrren({super.key});

  @override
  State<LoginFormScrren> createState() => _LoginFormScrrenState();
}

class _LoginFormScrrenState extends State<LoginFormScrren> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _loginData = {};

  void _onSubmitTap(BuildContext context) {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const InterestScrren(),
            ), (route) {
          return false;
        });
      }
    }
  }

  bool _isWrongEmail(String? value) {
    if (value != null) {
      if (value.length > 3) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  bool _isWrongPassword(String? value) {
    if (value != null) {
      if (value.length > 8) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.size36,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (_isWrongEmail(value)) {
                    return 'i dont like your email $value';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _loginData['email'] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                validator: (value) {
                  if (_isWrongPassword(value)) {
                    return 'Wrong password';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _loginData['Password'] = newValue;
                  }
                },
              ),
              Gaps.v36,
              GestureDetector(
                onTap: () => _onSubmitTap(context),
                child: const FormButton(
                  disabled: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
