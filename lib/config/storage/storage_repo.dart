// for next functionalities
// import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// abstract class StorageRepo {

//   Future<String?> uploadProfileImageMobile(String path, String filename);

//   Future<String?> uploadProfileImageWeb(Uint8List filebytes, String filename);

// }

// Future<String?> uploadFile(String path, String fileName, String folder) async {
//   try {
//     final file = File(path);

//     final storageRef = await storage.ref().child('$folder/$fileName');

//     final UploadTask = await uploadTask.ref.getDownloadURL();

//     final downloadUrl = await uploadTask.ref.getDownloadURL();
    
//   } catch (err){

//   }
// }