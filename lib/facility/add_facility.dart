import 'dart:convert';
import 'dart:io';

import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:bobawithflutter/services/facility_service.dart'
    as facilityService;

class AddFacility extends StatefulWidget {
  @override
  State<AddFacility> createState() => _AddFacilityState();
}

class _AddFacilityState extends State<AddFacility> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController bodyController = TextEditingController(text: '');

  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    final ImagePicker pick = ImagePicker();
    if (type == "camera") {
      image = await pick.getImage(
        source: ImageSource.camera,
      );
    } else {
      image = await pick.getImage(
        source: ImageSource.gallery,
      );
    }

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
      });
    }

    print(selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;

    uploadHandling() async {
      if (await facilityProviderAmu.addFacility(
          nameController.text,
          bodyController.text,
          userLoginModel.token.toString(),
          selectedImage!.path)) {
        Navigator.pop(context);
      } else {
        print('gagal');
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor2,
        title: Text(
          'Add Facility',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_name.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        autocorrect: true,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Facility Name',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipOval(
                  // ignore: unnecessary_null_comparison
                  child: selectedImage != null
                      ? Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        )
                      : Image.network(
                          'https://cdn.pixabay.com/photo/2018/12/07/10/03/animal-3861398_960_720.png',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget bodyInput() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Body',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Card(
                color: backgroundColor2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: primaryTextStyle,
                    controller: bodyController,
                    maxLines: 8, //or null
                    decoration: InputDecoration.collapsed(
                      hintText: "Enter your text here",
                      hintStyle: primaryTextStyle,
                    ),
                  ),
                ))
          ],
        ),
      );
    }

    Widget imageInput() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Image',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_name.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        chooseImage("gallery");
                      },
                      child: Text(
                        'Upload Image',
                        style: primaryTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin,
          ),
          height: 50,
          width: 250,
          child: TextButton(
            onPressed: uploadHandling,
            child: Text(
              'Upload',
              style: primaryTextStyle.copyWith(fontSize: 18),
            ),
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameInput(),
              imageInput(),
              bodyInput(),
              buttonSubmit(),
            ],
          )
        ],
      ),
    );
  }
}
