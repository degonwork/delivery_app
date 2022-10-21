import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/viewmodel/control_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/profile_view_model.dart';
import 'package:flutter_firebase/view/controller_view.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<ProfileViewModel>(
                builder: (profileViewModel) {
                  return !profileViewModel.isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: profileViewModel.userModel == null
                                  ? CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        child: Image.asset(
                                          "assets/images/avatar.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        profileViewModel.userModel!.pic!,
                                      ),
                                    ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: profileViewModel.userModel!.name!,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: profileViewModel.userModel!.email!,
                                  fontSize: 20,
                                  color: Colors.black,
                                )
                              ],
                            )
                          ],
                        )
                      : const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 90),
              ListTile(
                title: const CustomText(
                  text: 'Edit Profile',
                  fontSize: 20,
                ),
                leading: Image.asset(
                  'assets/images/edit.png',
                  height: 30,
                  width: 30,
                ),
                trailing: const Icon(Icons.navigate_next),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const CustomText(
                  text: 'Shopping Address',
                  fontSize: 20,
                ),
                leading: Image.asset(
                  'assets/images/placeholder.png',
                  height: 30,
                  width: 30,
                ),
                trailing: const Icon(Icons.navigate_next),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const CustomText(
                  text: 'Order History',
                  fontSize: 20,
                ),
                leading: Image.asset(
                  'assets/images/clock.png',
                  height: 30,
                  width: 30,
                ),
                trailing: const Icon(Icons.navigate_next),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const CustomText(
                  text: 'Cards',
                  fontSize: 20,
                ),
                leading: Image.asset(
                  'assets/images/credit-card.png',
                  height: 30,
                  width: 30,
                ),
                trailing: const Icon(Icons.navigate_next),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const CustomText(
                  text: 'Notifications',
                  fontSize: 20,
                ),
                leading: Image.asset(
                  'assets/images/notification.png',
                  height: 30,
                  width: 30,
                ),
                trailing: const Icon(Icons.navigate_next),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.find<ProfileViewModel>().signOut();
                  Get.offAll(() => const ControllerView());
                  Get.put(ControlViewModel());
                },
                child: ListTile(
                  title: const CustomText(
                    text: 'Log Out',
                    fontSize: 20,
                  ),
                  leading: Image.asset(
                    'assets/images/logout.png',
                    height: 30,
                    width: 30,
                  ),
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
