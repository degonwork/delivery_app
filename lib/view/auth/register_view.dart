import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/view/auth/login_view.dart';
import 'package:get/get.dart';
import '../../core/viewmodel/auth_view_model.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    AuthViewModel auth = Get.find<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(() => const LoginView());
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const CustomText(text: "Sign up", fontSize: 30),
                const SizedBox(height: 50),
                CustomTextFormField(
                  text: "Name",
                  hintText: "Pesa",
                  onSave: (value) {
                    auth.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                  },
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  text: "Email",
                  hintText: "dtlong.work@gmail.com",
                  onSave: (value) {
                    auth.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                  },
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  text: "Password",
                  hintText: "*****************",
                  onSave: (value) {
                    auth.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                  },
                ),
                const SizedBox(height: 80),
                CustomButton(
                    textColor: Colors.white,
                    color: primaryColor,
                    text: "Sign Up",
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        auth.createAccountWithEmailAndPassword();
                        print("Created an account");
                        Get.to(() => const LoginView());
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "Have an account?  ",
                      color: Colors.black,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginView());
                        },
                        child: const CustomText(
                          text: "Login",
                          color: primaryColor,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
