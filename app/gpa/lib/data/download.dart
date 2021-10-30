import 'package:path_provider/path_provider.dart';

Future<void> downloadFileExample() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  File downloadToFile = File('${appDocDir.path}/download-logo.png');

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('uploads/logo.png')
        .writeToFile(downloadToFile);
  } on firebase_core.FirebaseException catch (e) {
    
  }
}

Future<void> handleTaskExample1() async {
  firebase_storage.UploadTask task = firebase_storage.FirebaseStorage.instance
      .ref('uploads/hello-world.txt')
      .putString('Hello World');

  try {
    
    firebase_storage.TaskSnapshot snapshot = await task;
    print('Uploaded ${snapshot.bytesTransferred} bytes.');
  } on firebase_core.FirebaseException catch (e) {
    
    
    print(task.snapshot);

    if (e.code == 'permission-denied') {
      print('User does not have permission to upload to this reference.');
    }
    
  }
}