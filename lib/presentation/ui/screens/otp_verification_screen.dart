import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/snack_message.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();
  final ReadProfileController _readProfileController = Get.find<ReadProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogoWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'A 6 digit OTP has been sent to your email.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black54,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  key: _formKey,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter OTP code that has been sent to your email!';
                    }
                    return null;
                  },
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
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<OtpVerificationController>(
                    builder: (otpVerificationController) {
                  return Visibility(
                    visible: !otpVerificationController.inProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: const Text('NEXT'),
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                    text: 'This code will expire in ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    children: const [
                      TextSpan(
                        text: '120S',
                        style: TextStyle(color: AppColors.themeColor),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Resend Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    bool result = await _otpVerificationController.verifyOtp(
        widget.email, _otpTEController.text);
    if (result) {
      bool readProfileResult = await _readProfileController.getProfileDetails(_otpVerificationController.accessToken);
      if(readProfileResult){
        if(_readProfileController.isProfileCompleted){
          Get.offAll(() => const MainBottomNavScreen());
        }
        else{
          Get.to(
                () => const CompleteProfileScreen(),
          );
        }
      }
      else {
        if (mounted) {
          return showSnackBarMessage(
              _readProfileController.errorMessage!, context, true);
        }
      }

    } else {
      if (mounted) {
        return showSnackBarMessage(
            _otpVerificationController.errorMessage!, context, true);
      }
    }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
