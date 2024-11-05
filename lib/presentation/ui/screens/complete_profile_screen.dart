
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';



class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shoppingAddressTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32,),
              const AppLogoWidget(),
              const SizedBox(height: 24,),
              Text('Complete Profile', style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 8,),
              Text('Get started with us with your details.',textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black54
              ),),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _firstNameTEController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                )
              ),
              const SizedBox(height: 8,),
              TextFormField(
                textInputAction: TextInputAction.next,
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  )
              ),
              const SizedBox(height: 8,),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  )
              ),
              const SizedBox(height: 8,),
              TextFormField(
                textInputAction: TextInputAction.next,
                  controller: _cityTEController,
                  decoration: const InputDecoration(
                    hintText: 'City',
                  )
              ),
              const SizedBox(height: 8,),
              TextFormField(
                  controller: _shoppingAddressTEController,
                  decoration: const InputDecoration(
                    hintText: 'Shopping Address',
                  ),
                maxLines: 4,
              ),
              const SizedBox(height: 16,),
              ElevatedButton(

                  onPressed: _onTapCompleteButton, child: const Text('COMPLETE'))
            ],


          ),
        ),
      ),
    );
  }
  void _onTapCompleteButton(){}
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shoppingAddressTEController.dispose();
    super.dispose();
  }
}
