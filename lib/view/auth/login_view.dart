import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/core/viewmodel/auth_view_model.dart';
import 'package:flutter_firebase/view/auth/register_view.dart';
import 'package:flutter_firebase/view/widget/custom_button.dart';
import 'package:flutter_firebase/view/widget/custom_button_social.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:flutter_firebase/view/widget/custom_text_form_field.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    AuthViewModel auth = Get.find<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "Welcome", fontSize: 30),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const RegisterView());
                      },
                      child: const CustomText(
                          text: "Sign Up", color: primaryColor, fontSize: 18),
                    ),
                  ],
                ),
                const CustomText(
                    text: "Sign in to Continue",
                    fontSize: 14,
                    color: Colors.grey),
                const SizedBox(height: 30),
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
                const SizedBox(height: 20),
                const CustomText(
                  text: "Forgot password !",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    textColor: Colors.white,
                    color: primaryColor,
                    text: "Sign In",
                    onPressed: () async {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        await auth.signInWithEmailAndPassword();
                      }
                    }),
                const SizedBox(height: 20),
                const CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 40),
                CustomButtonSocial(
                  text: "Sign in with Google",
                  imageName: "assets/images/google.png",
                  onPressed: () async {
                    await auth.googleSignInMethod();
                  },
                ),
                const SizedBox(height: 20),
                CustomButtonSocial(
                  text: "Sign in with Facebook",
                  imageName: "assets/images/facebook.png",
                  onPressed: () async {
                    await auth.facebookSigninMethod();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
