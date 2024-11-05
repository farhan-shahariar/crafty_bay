
import 'package:crafty_bay/app.dart';
import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 80,),
              const AppLogoWidget(),
              const SizedBox(height: 24,),
              Text('Welcome Back', style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 8,),
              Text('Please Enter Your Email Address', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black54
              ),),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                )
              ),
              const SizedBox(height: 16,),
              ElevatedButton(

                  onPressed: _onTapNextButton, child: const Text('NEXT'))
            ],


          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    Get.to(() => const OtpVerificationScreen());
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
