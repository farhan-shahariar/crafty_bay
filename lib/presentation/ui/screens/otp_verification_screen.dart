import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

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
              Text('Enter OTP Code', style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 8,),
              Text('A 6 digit OTP has been sent to your email.', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black54,
              ), ),
              const SizedBox(height: 16,),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                length: 6,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  inactiveColor: AppColors.themeColor,


                ),
                controller: _otpTEController,

                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                appContext: context,


              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: _onTapNextButton, child: const Text('NEXT')),
              const SizedBox(height: 16,),
              RichText(text: TextSpan(
                text: 'This code will expire in ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey
                ),
                children: const [
                  TextSpan(
                    text: '120S',
                    style: TextStyle(
                      color: AppColors.themeColor
                    )
                  ),
                ]
              ),),
              TextButton(onPressed: () {}, child: const Text('Resend Code'),),


            ],
          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    Get.to(() => const CompleteProfileScreen());
  }
  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
