import 'package:get/get.dart';
import 'package:craigshop/utils/local_storage.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var mobileNumber = ''.obs;
  var address = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch the existing details from local storage
    fetchExistingDetails();
  }

  void fetchExistingDetails() {
    // Retrieve the existing details from local storage
    name.value = LocalStorage.getString('name');
    email.value = LocalStorage.getString('email');
    mobileNumber.value = LocalStorage.getString('mobileNumber');
    address.value = LocalStorage.getString('address');
  }

  void updateName(String newName) {
    name.value = newName;
    // Save the updated name to local storage
    LocalStorage.saveString('name', newName);
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
    // Save the updated email to local storage
    LocalStorage.saveString('email', newEmail);
  }

  void updateMobileNumber(String newMobileNumber) {
    mobileNumber.value = newMobileNumber;
    // Save the updated mobile number to local storage
    LocalStorage.saveString('mobileNumber', newMobileNumber);
  }

  void updateAddress(String newAddress) {
    address.value = newAddress;
    // Save the updated address to local storage
    LocalStorage.saveString('address', newAddress);
  }
}
