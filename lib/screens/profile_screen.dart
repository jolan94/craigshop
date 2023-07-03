import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:craigshop/controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial values of the text fields from the stored values
    profileController.fetchExistingDetails();
    nameController.text = profileController.name.value;
    emailController.text = profileController.email.value;
    mobileNumberController.text = profileController.mobileNumber.value;
    addressController.text = profileController.address.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      _pickedImage != null ? FileImage(_pickedImage!) : null,
                  child: _pickedImage == null
                      ? const Icon(
                          Icons.person,
                          size: 60,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
              TextField(
                controller: addressController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // _showUpdateProfileDialog(
                  //   nameController,
                  //   emailController,
                  //   mobileNumberController,
                  //   addressController,
                  // );
                  profileController.updateName(nameController.text);
                  profileController.updateEmail(emailController.text);
                  profileController
                      .updateMobileNumber(mobileNumberController.text);
                  profileController.updateAddress(addressController.text);
                  Get.back();
                  Get.snackbar("Success", "Details saved successfully");
                },
                child: const Text('Update Profile'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }
}
