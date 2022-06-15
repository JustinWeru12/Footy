import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:football/api/crud.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

class SelectProfilePicture extends StatefulWidget {
  const SelectProfilePicture({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectProfilePictureState();
  }
}

class _SelectProfilePictureState extends State<SelectProfilePicture> {
  bool _isLoading = false;
  File? newProfilPic;
  CrudMethods crudObj = CrudMethods();
  final picker = ImagePicker();

  updateProfilPicture(picUrl) {
    Map<String, dynamic> userMap = {'picture': picUrl};
    crudObj.createOrUpdateUserData(userMap);
  }

  Future getImageFromGallery() async {
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      newProfilPic = File(tempImage!.path);
    });
  }

  Future getImageFromCamera() async {
    var tempImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      newProfilPic = File(tempImage!.path);
    });
  }

  uploadImage() async {
    User user = FirebaseAuth.instance.currentUser!;
    final firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('profilePics/${user.uid}.jpg');
    final firebase_storage.UploadTask task =
        firebaseStorageRef.putFile(newProfilPic!);
    if (task.snapshot.state == firebase_storage.TaskState.running) {
      setState(() {
        _isLoading = true;
      });
    }
    task.whenComplete(() async {
      var downloadUrl = await task.snapshot.ref.getDownloadURL();
      var url = downloadUrl.toString();
      updateProfilPicture(url);
      setState(() {
        _isLoading = false;
      });
      Navigator.pop(context);
    });
  }

  Widget enableUpload() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: getImageFromGallery,
          child: Image.file(
            newProfilPic!,
            height: 200,
            width: 200,
          ),
        ),
        _isLoading == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        primary: const Color(0xFFe0fcdf),
                        textStyle: const TextStyle(
                          color: Colors.black87,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Color(0xFF0fbc00),
                      ),
                      onPressed: uploadImage,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          primary: const Color(0xFFe0fcdf),
                          textStyle: const TextStyle(
                            color: Colors.black87,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xFF0fbc00),
                        ),
                        onPressed: () {} // cropImage,
                        ),
                  ),
                ],
              )
            : Container(
                margin: const EdgeInsets.only(top: 18.0),
                child: const CircularProgressIndicator()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: newProfilPic == null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text('Select Profile Picture',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 15,
                                  )),
                    )
                  : enableUpload(),
            )
          ],
        ),
        newProfilPic == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: const Color(0xFFebdffc),
                      textStyle: const TextStyle(color: Colors.black87),
                    ),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.folder,
                          color: Color(0xFF004d7a),
                        ),
                        Text('Gallery', style: TextStyle(color: Colors.black87))
                      ],
                    ),
                    onPressed: getImageFromGallery,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: const Color(0xFFebdffc),
                      textStyle: const TextStyle(color: Colors.black87),
                    ),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Color(0xFF008793),
                        ),
                        Text('Camera', style: TextStyle(color: Colors.black87))
                      ],
                    ),
                    onPressed: getImageFromCamera,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
