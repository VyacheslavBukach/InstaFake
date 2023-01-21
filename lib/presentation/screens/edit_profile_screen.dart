import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';
import '../widgets/avatar_widget.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: Get.back,
          ),
          title: controller.userUuid == null
              ? Text('create_user'.tr)
              : Text('edit_profile'.tr),
          actions: [
            IconButton(
              onPressed: () {
                controller.saveProfile();
                Get.back();
              },
              icon: Icon(
                Icons.done,
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Stack(
                    children: [
                      AvatarWidget(
                        avatar: controller.avatarPath.value,
                        hasStory: controller.currentUserHasStory(),
                        radius: 50,
                      ),
                      Visibility(
                        visible: controller.isProfileOnline(),
                        child: Positioned(
                          right: 10,
                          bottom: 10,
                          child: SvgPicture.asset(
                            'assets/online_icon.svg',
                            // color: Colors.red,
                            // width: 32,
                            // height: 32,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: controller.pickImageFromGallery,
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text('change_profile_photo'.tr),
                ),
                Obx(
                  () => controller.avatarPath.value != null
                      ? TextButton(
                          onPressed: controller.deleteImage,
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Text('delete_photo'.tr),
                        )
                      : const SizedBox.shrink(),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: Text('verified'.tr),
                    subtitle: Text('verified_desc'.tr),
                    secondary: Visibility(
                      visible: controller.isConfirmedProfile(),
                      child: SvgPicture.asset(
                        'assets/verified_icon.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.isConfirmedProfile.value,
                    onChanged: (_) {
                      controller.isConfirmedProfile.toggle();
                    },
                  ),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: Text('active_now'.tr),
                    subtitle: Text('active_desc'.tr),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.isProfileOnline.value,
                    onChanged: (_) {
                      controller.isProfileOnline.toggle();
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
