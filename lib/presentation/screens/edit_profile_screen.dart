import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  void saveAndClose() {
    controller.saveProfile();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.goToProfileWithoutSave();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: controller.goToProfileWithoutSave,
          ),
          title: Text('edit_profile'.tr),
          actions: [
            IconButton(
              onPressed: saveAndClose,
              icon: const Icon(Icons.done),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => controller.profileController.user().avatar != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: Image.file(
                            controller.profileController.user().avatar ??
                                File(''),
                          ).image,
                        )
                      : SvgPicture.asset(
                          'assets/empty_avatar.svg',
                          height: 100,
                          width: 100,
                        ),
                ),
                TextButton(
                  onPressed: controller.pickImageFromGallery,
                  child: Text('change_profile_photo'.tr),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: Text('confirmed'.tr),
                    subtitle: Text('confirmed_desc'.tr),
                    secondary: Icon(
                      Icons.check_circle,
                      color: controller.profileController.user().isChecked
                          ? Colors.blue
                          : Colors.black,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.profileController.user().isChecked,
                    onChanged: (isChecked) {
                      controller.changeCheckedStatus();
                    },
                  ),
                ),
                TextFormField(
                  controller: controller.nameTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'name'.tr,
                  ),
                ),
                TextFormField(
                  controller: controller.userNameTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'username'.tr,
                  ),
                ),
                TextFormField(
                  controller: controller.bioTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'bio'.tr,
                  ),
                ),
                TextFormField(
                  controller: controller.postsTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'posts'.tr,
                  ),
                ),
                TextFormField(
                  controller: controller.followersTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'followers'.tr,
                  ),
                ),
                TextFormField(
                  controller: controller.followingsTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'followings'.tr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
