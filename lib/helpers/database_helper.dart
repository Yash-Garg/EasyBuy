import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy/widgets/custom_snack.dart';
import 'package:get/get.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUserDetails(String name, String number, String mail) {
  return users.add({
    'name': name,
    'mobile': number,
    'email': mail,
  }).then(
    (value) =>
        Get.showSnackbar(customSnack(null, 'Added user details to firestore'))!
            .catchError(
      (error) =>
          Get.showSnackbar(customSnack('Error', 'Failed to add user details')),
    ),
  );
}
