import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/ssizes.dart';
import 'package:tiktok_clone/features/authentication/form_button.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initdate = DateTime.now();

  @override
  void initState() {
    super.initState();

    _setTextFieldDate(initdate);
  }

  void _setTextFieldDate(DateTime date) {
    final textdate = date.toString().split(" ").first;

    _birthdayController.value = TextEditingValue(text: textdate);
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginFormScrren(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SSizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "When's your birthday?",
                      style: TextStyle(
                        fontSize: SSizes.size24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v8,
                    Text(
                      "Your birthday won't be shown publicly.",
                      style: TextStyle(
                        fontSize: SSizes.size16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                FaIcon(
                  FontAwesomeIcons.cakeCandles,
                  size: 60,
                )
              ],
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ))),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v28,
            GestureDetector(
              onTap: () => _onNextTap(),
              child: const FormButton(disabled: false),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            maximumDate: initdate,
            initialDateTime: initdate,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
