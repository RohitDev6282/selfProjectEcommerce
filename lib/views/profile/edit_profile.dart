import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum ImageSourceType { gallery, camera }

class ProfileEditingPage extends StatefulWidget {
  final String? title;
  const ProfileEditingPage({Key? key, this.title}) : super(key: key);

  @override
  State<ProfileEditingPage> createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  // void _handleURLButtonPress(BuildContext context, var type) {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  // }

  // var type;
  // ImagePicker picker = ImagePicker();
  String? status;
  String? base64Image;
  File? tempFile;
  String error = 'Error';

  // set _imageFile(XFile? value) {
  //   _image= value == null ? null : <XFile>[value];
  // }

  dynamic _pickImageError;

  // final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  String finalId = "";
  var _image;

  bool _isLoading = false;
  var _selectState;
  var _selectCity;
  bool waiting = true;
  var imagePicker;

  @override
  void initState() {
    super.initState();
    _getStateList();
    // imagePicker = ImagePicker();
  }

  List state = [];
  List city = [];

  Future<String> _getStateList() async {
    String url = "https://quickplayers.com/api/state.php";
    var response = await http.get(Uri.parse(url));
    var getState = jsonDecode(response.body);
    setState(() {
      state = getState;
    });
    return "success";
  }

  Future<String> _getCityList() async {
    var queryuri = "https://quickplayers.com/api/city.php";
    final queryParams = {"state_id": _selectState};

    var queryStrings = Uri(queryParameters: queryParams).query;
    var request = queryuri + '?' + queryStrings;
    print(request);
    var response = await http.get(Uri.parse(request));
    final getCity = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        city = getCity;
      });
      // print(statesList);

    } else if (getCity["success"] == 0) {
      throw Exception('Failed to load data from API');
    }
    return "success";
  }

  final _formKey = GlobalKey<FormState>();
  late ScaffoldMessengerState scaffoldMessenger;
  final TextEditingController _profileImageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Future<void> _onImageButtonPressed(ImageSource source,
  //     {BuildContext? context, bool isMultiImage = false}) async {
  //   if (isMultiImage) {
  //     final XFile? pickedFile = await _picker.pickImage(
  //       source: source,
  //     );
  //     setState(() {
  //       _image = pickedFile as Future<XFile>?;
  //     });
  //   }
  // }

  choseImage() {
    setState(() async {
      // XFile? image = await picker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    if (null == tempFile) {
      setStatus(error);
      return;
    }
    String fileName = tempFile!.path.split('/').last;
  }

  // Widget _previewImages() {
  //   if (_image != null) {
  //     return ListView.builder(
  //       shrinkWrap: true,
  //       key: UniqueKey(),
  //       itemBuilder: (BuildContext context, int index) {
  //         // Why network for web?
  //         // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
  //         return kIsWeb
  //             ?
  //             // CircleAvatar(
  //             //     radius: 60,
  //             //     backgroundImage: NetworkImage(
  //             //       _image!;
  //             //     ),
  //             //   )

  //             CircleAvatar(
  //                 radius: 80,
  //                 backgroundImage: NetworkImage(_image.))
  //             : CircleAvatar(
  //                 radius: 80,
  //                 backgroundImage:
  //                     FileImage(File(_image))
  //               );
  //       },
  //       // itemCount: _imageFileList!.length,
  //     );
  //   } else if (_pickImageError != null) {
  //     return Text(
  //       'Pick image error: $_pickImageError',
  //       textAlign: TextAlign.center,
  //     );
  //   } else {
  //     return const Center(
  //       child: CircleAvatar(
  //           radius: 60,
  //           backgroundImage: AssetImage("assets/images/profile.jpg")),
  //     );
  //   }
  // }

  // Widget _handlePreview() {
  //   return _previewImages();
  // }

  // Future<void> retrieveLostData() async {
  //   final LostDataResponse response = await _picker.retrieveLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     setState(() {
  //       _imageFile = response.file;
  //       _imageFileList = response.files;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Profile Editing"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          // FutureBuilder<File>(
          //     // future: _image,
          //     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          //   if (snapshot.connectionState == ConnectionState.done &&
          //       null != snapshot.data) {
          //     tempFile = snapshot.data;
          //     base64Image = base64Encode(snapshot.data!.readAsBytesSync());
          //     // return Image.file(snapshot.data);
          //   } else if (null != snapshot.data) {
          //     return const Text("Error");
          //   } else {
          //     return const CircleAvatar(
          //         radius: 80,
          //         backgroundImage: AssetImage(
          //           'assets/images/profile.jpg',
          //         ));
          //   }
          //   return const Text("werffd");
          // }),

          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: imageProfile()),
          // MemberBanner(upperheight: 30),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextFieldWidget(
                hinttest: "Enter the name",
                controller: _nameController,
                label: 'Name',
              ),

              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                validiate: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Email Address ';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Please a valid Email';
                  }
                  return null;
                },
                hinttest: "Enter the email",
                controller: _emailController,
                label: 'Email',
              ),

              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                hinttest: "Enter the Mobile no.",
                controller: _mobileController,
                label: 'Mobile',
              ),

              // spaceBetweenDetail,
              const SizedBox(
                height: 10,
              ),

              TextFieldWidget(
                hinttest: "Enter the street address",
                controller: _addressController,
                label: 'Address',
              ),

              // spaceBetweenDetail,
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                hinttest: "Enter the Area Code",
                controller: _pinCodeController,
                label: 'Pincode',
              ),

              // spaceBetweenDetail,
              const SizedBox(
                height: 10,
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.89,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kGreyColor),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownButton(
                    hint: const Text(
                      "Select the State",
                      style: kLTextStyle,
                    ),
                    underline: DropdownButtonHideUnderline(child: Container()),
                    isExpanded: true,
                    items: state.map((val) {
                      return DropdownMenuItem(
                        child: Text(
                          val['state_name'],
                          style: kLTextStyle,
                        ),
                        value: val['id'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectState = value;
                        _getCityList();
                      });
                    },
                    value: _selectState,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.89,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kGreyColor),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: DropdownButton(
                      hint: const Text(
                        "Select the city",
                        style: kLTextStyle,
                      ),
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      isExpanded: true,
                      items: city
                          .map((item) => DropdownMenuItem(
                                child: Text(
                                  item['city_name'],
                                  style: kLTextStyle,
                                ),
                                value: item['id'],
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectCity = value;
                        });
                      },
                      value: _selectCity,
                    )),
              ),
              const SizedBox(height: 10),

              const MyStatefulWidget(),

              const SizedBox(height: 10),
            ]),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kButtonColor,
                side: const BorderSide(width: 2.5, color: Colors.white),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                if (_emailController.text.isEmpty ||
                    _nameController.text.isEmpty ||
                    _mobileController.text.isEmpty ||
                    _addressController.text.isEmpty ||
                    _pinCodeController.text.isEmpty) {
                  scaffoldMessenger.showSnackBar(
                      const SnackBar(content: Text("Please Fill all fileds")));
                  return;
                }
                // userUpdate(
                //   'images',
                //   File('assets/images/profile.jpg'),
                //   _nameController.text,
                //   _emailController.text,
                //   _mobileController.text,
                //   _addressController.text,
                //   _pinCodeController.text,
                // );
              },
              child: const Text("Profile Update", style: kLTextStyle),
            ),
          ),
        ]),
      )),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: [
        Center(
          child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[200],
              ),
              child: _image != null
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _image,
                          height: 150.0,
                          width: 100.0,
                        ),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Upload your Image",
                          style: kWhiteLrgTextStyle,
                        ),
                      ),
                    )),
        ),
        // !kIsWeb && defaultTargetPlatform == TargetPlatform.android
        //     ? FutureBuilder<void>(
        //         // future: retrieveLostData(),
        //         builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        //           switch (snapshot.connectionState) {
        //             case ConnectionState.none:
        //             case ConnectionState.waiting:
        //               return const Text(
        //                 'You have not yet picked an image.',
        //                 textAlign: TextAlign.center,
        //               );
        //             case ConnectionState.done:
        //               return _handlePreview();
        //             default:
        //               {
        //                 return const Text(
        //                   'You have not yet picked an image.',
        //                   textAlign: TextAlign.center,
        //                 );
        //               }
        //           }
        //         },
        //       )
        //     : _handlePreview(),
        Positioned(
            bottom: 8,
            right: 120,
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: Center(
                    child: IconButton(
                  onPressed: () async {
                    // var source = type == ImageSourceType.camera
                    //     ? ImageSource.camera
                    //     : ImageSource.gallery;
                    // XFile image = await imagePicker.pickImage(
                    //     source: source,
                    //     imageQuality: 50,
                    //     preferredCameraDevice: CameraDevice.front);
                    // setState(() {
                    //   _image = File(image.path);
                    // });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ))

                //  IconButton(
                //   onPressed: () {
                //     showModalBottomSheet(
                //         context: context, builder: (builder) => bottomSheet());
                //   },
                //   icon: const Icon(Icons.file_upload,
                //       color: Colors.white, size: 22),
                // ),
                // decoration: const BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.all(Radius.circular(20))),
                )),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Your Photo",
              style: kLTextStyle,
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        // var source = type == ImageSourceType.camera
                        //     ? ImageSource.camera
                        //     : ImageSource.gallery;
                        // XFile image = await imagePicker.pickImage(
                        //     source: source,
                        //     imageQuality: 50,
                        //     preferredCameraDevice: CameraDevice.front);
                        // setState(() {
                        //   _image = File(image.path);
                        // });

                        // _onImageButtonPressed(ImageSource.camera,
                        //     context: context);
                      },
                      child: const Icon(Icons.camera)),
                  const SizedBox(width: 30),
                  ElevatedButton(
                      onPressed: () {
                        // _handleURLButtonPress(context, ImageSourceType.camera);
                        // _onImageButtonPressed(
                        //   ImageSource.gallery,
                        //   context: context,
                        //   isMultiImage: false,
                        // );
                      },
                      child: const Icon(
                        Icons.file_upload,
                        color: kWhiteColor,
                      ))
                ],
              ),
            )
          ]),
    );
  }

  TextField buildTextField(String labelText, String placeholder) {
    return TextField(
        decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(bottom: 3),
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: placeholder,
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  // Future<UserUpdateModel?> userUpdate(String image, String file, String name,
  //     String email, String mobile, String address, String pinCode) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var getUserId = preferences.getString("userId");

  //   Map data = {
  //     'user_id': getUserId,
  //     'image': base64Image,
  //     "imageName": file,
  //     'name': name,
  //     'email': email,
  //     'mobile': mobile,
  //     'address': address,
  //     'state_id': _selectState,
  //     'city_id': _selectCity,
  //     "location": "location",
  //     'pincode': pinCode,
  //   };

  //   var response = await http.post(Uri.parse(Config.userUpdateAPi), body: data);
  //   var updateResponse = json.decode(response.body);
  //   if (updateResponse["success"] == 1) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text(updateResponse["message"].toString()),
  //             actions: <Widget>[
  //               ElevatedButton(
  //                 child: const Text("OK"),
  //                 onPressed: () {
  //                   Navigator.pushReplacement(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => const ProfilePage()));
  //                 },
  //               ),
  //             ],
  //           );
  //         });
  //   } else if (updateResponse["success"] == 0) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text(updateResponse["message"].toString()),
  //             actions: <Widget>[
  //               ElevatedButton(
  //                 child: const Text("OK"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           );
  //         });
  //   }
  //   return null;
  // }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _dropDownValue = "Select the Gender";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kGreyColor,
            ),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  color: Colors.grey.withOpacity(0.0),
                  spreadRadius: 3,
                  blurRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: DropdownButton(
            hint: Text(
              _dropDownValue,
              style: kLTextStyle,
            ),
            underline: DropdownButtonHideUnderline(child: Container()),
            isExpanded: true,
            style: kLTextStyle,
            items: ['Male', 'Female', 'Others'].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (String? val) {
              setState(
                () {
                  _dropDownValue = val!;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
