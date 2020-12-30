import 'dart:io';

import 'package:canaarange/screens/home/DistrubutorHome.dart';
import 'package:canaarange/screens/home/DonorHome.dart';
import 'package:canaarange/services/firebase/auth.dart';
import 'package:canaarange/styles/styles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:goaltracker/screens/auth/welcome.dart';
// import 'package:goaltracker/screens/home/home.dart';
// import 'package:goaltracker/services/fire/auth.dart';

import 'package:image_picker/image_picker.dart';

import 'login.dart';

class RegisterDistributor extends StatefulWidget {
  static const routename = "/reg";

  @override
  _RegisterDistributorState createState() => _RegisterDistributorState();
}

class _RegisterDistributorState extends State<RegisterDistributor> {
  File _imageFile;
  AuthService _auth = AuthService();

  bool hidden = true;
  bool loading = false;
  bool loadingGoogle = false;

  bool checkedValue = false;

  final _formKey = GlobalKey<FormState>();

  String countryDropDownButtonValue = "Canada";
  String provinceDropDownButtonValue = "Ontario";
  String categoryDropDownButtonValue = "Food";
  String indDropDownButtonValue = "+1";

  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _passconfirm = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _position = TextEditingController();
  TextEditingController _institution = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _address = TextEditingController();

  String _type = 'Distributor';
  String avatarPath = '';

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected =
        await ImagePicker().getImage(source: source, imageQuality: 70);

    setState(() {
      _imageFile = File(selected.path);
    });
  }

  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://goaltracker-dc635.appspot.com');

  UploadTask _uploadTask;

  UploadTask _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    _uploadTask = _storage.ref().child(filePath).putFile(_imageFile);

    return _uploadTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.1,
              // ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Bssahtek',
              //     style: BigBoldHeading,
              //   ),
              // ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Distributor Account',
                  style: BigBoldHeading,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create an account to continue as a Distributor',
                  style: GreySubtitle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Align(
              //       alignment: Alignment.center,
              //       child: CircleAvatar(
              //         radius: 50,
              //         backgroundColor: kSecondaryColor,
              //         child: ClipOval(
              //           child: new SizedBox(
              //             width: 100.0,
              //             height: 100.0,
              //             child: (_imageFile != null)
              //                 ? Image.file(
              //               _imageFile,
              //               fit: BoxFit.fill,
              //             )
              //                 : Image.network(
              //               "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              //               fit: BoxFit.fill,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(top: 60.0),
              //       child: IconButton(
              //         icon: Icon(
              //           FontAwesomeIcons.camera,
              //           size: 30.0,
              //         ),
              //         onPressed: () {
              //           _pickImage(
              //             ImageSource.gallery,
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstName,
                        autofillHints: [
                          AutofillHints.name,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'First name',
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _lastName,
                        autofillHints: [
                          AutofillHints.name,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Last Name',
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _position,
                        autofillHints: [
                          AutofillHints.name,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Position',
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _institution,
                        autofillHints: [
                          AutofillHints.name,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Institution',
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        hint: Text('Ind'),
                        // validator: (value) {
                        //   if (dropDownButtonValue != "Male" || dropDownButtonValue != "Female") {
                        //     return "Please select gender";
                        //   }
                        // },
                        onChanged: (value) {
                          setState(() {
                            indDropDownButtonValue = value;
                            print(value);
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('+1'),
                            value: '011',
                          ),
                          DropdownMenuItem(
                            child: Text('+2'),
                            value: '002',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _number,
                        autofillHints: [
                          AutofillHints.name,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Phone number',
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.category,
                  ),
                ),
                hint: Text('Category'),
                // validator: (value) {
                //   if (dropDownButtonValue != "Male" || dropDownButtonValue != "Female") {
                //     return "Please select gender";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    categoryDropDownButtonValue = value;
                    print(value);
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('Food'),
                    value: 'Food',
                  ),
                  DropdownMenuItem(
                    child: Text('IT'),
                    value: 'IT',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.map,
                  ),
                ),
                hint: Text('Country'),
                // validator: (value) {
                //   if (dropDownButtonValue != "Male" || dropDownButtonValue != "Female") {
                //     return "Please select gender";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    countryDropDownButtonValue = value;
                    print(value);
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('Canada'),
                    value: 'Canada',
                  ),
                  DropdownMenuItem(
                    child: Text('USA'),
                    value: 'USA',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.house,
                  ),
                ),
                hint: Text('Province'),
                // validator: (value) {
                //   if (dropDownButtonValue != "Male" || dropDownButtonValue != "Female") {
                //     return "Please select gender";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    provinceDropDownButtonValue = value;
                    print(value);
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('Ontario'),
                    value: 'Ontario',
                  ),
                  DropdownMenuItem(
                    child: Text('Toronto'),
                    value: 'Toronto',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _email,
                autofillHints: [
                  AutofillHints.email,
                ],
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                ),
                validator: (String value) {
                  if (value == '') {
                    return 'This field is required';
                  }
                  if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return 'Please enter correct email';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _address,
                autofillHints: [
                  AutofillHints.name,
                ],
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  hintText: 'Address',
                ),
                validator: (value) {
                  if (value == '') {
                    return 'This field is required';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 10,
              ),

              TextFormField(
                obscureText: hidden,
                obscuringCharacter: '*',
                controller: _pass,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: Icon(
                      hidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'This field is required';
                  }
                  if (value.length < 8) {
                    return 'Password length must be atleast 8 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: hidden,
                obscuringCharacter: '*',
                controller: _passconfirm,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: Icon(
                      hidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'This field is required';
                  }
                  if (value.length < 8) {
                    return 'Password length must be atleast 8 characters long';
                  }
                  if (value != _pass.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              // CheckboxListTile(
              //   title: RichText(
              //       text: TextSpan(children: [
              //         TextSpan(
              //             text: 'By Creating an account you agree to our ',
              //             style: GreySubtitle),
              //         TextSpan(
              //             text: 'Terms & Conditions', style: SmallBoldBlackText)
              //       ])),
              //   value: checkedValue,
              //   onChanged: (newValue) {
              //     setState(() {
              //       checkedValue = newValue;
              //     });
              //   },
              //   controlAffinity:
              //   ListTileControlAffinity.leading, //  <-- leading Checkbox
              // ),
              SizedBox(
                height: 20,
              ),
              loading == true
                  ? CircularProgressIndicator()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: RaisedButton(
                        elevation: 0,
                        textColor: Colors.white,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });

                          if (!_formKey.currentState.validate()) {
                            setState(() {
                              loading = false;
                            });
                            return;
                          }

                          // uploading the image, to add later
                          // var upload = await _startUpload();
                          //
                          // var url = await upload.ref.getDownloadURL();

                          // login

                          String numberFull =
                              indDropDownButtonValue + _number.text;

                          var result =
                              _auth.signUpWithEmailAndPasswordDistributor(
                                  _email.text,
                                  _pass.text,
                                  _firstName.text,
                                  _lastName.text,
                                  countryDropDownButtonValue,
                                  provinceDropDownButtonValue,
                                  _position.text,
                                  _institution.text,
                                  numberFull,
                                  categoryDropDownButtonValue,
                                  _address.text,
                                  _type);

                          if (result == null) {
                            print('ERROR LOGIN WITH EMAIL AND PASSWORD');
                            setState(() {
                              loading = false;
                            });
                          } else {
                            setState(() {
                              loading = false;
                            });

                            // Navigator.pop(context);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DistriHome()));
                          }

                          setState(() {
                            loading = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text('SIGN UP'),
                            Icon(Icons.exit_to_app)
                          ],
                        ),
                      ),
                    ),
              FlatButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WrapperUser()));
                },
                child: RichText(
                  text: TextSpan(
                    style: GreySubtitle,
                    text: "ALREADY HAVE AN ACCOUNT? ",
                    children: [
                      TextSpan(
                        style: GreySubtitle.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        text: "LOGIN",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // loadingGoogle == true
              //     ? CircularProgressIndicator()
              //     : Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 45,
              //   child: RaisedButton(
              //     elevation: 0,
              //     textColor: Colors.white,
              //     color: Colors.blue,
              //     onPressed: () async {
              //       setState(() {
              //         loadingGoogle = true;
              //       });
              //
              //       var result = await _auth.signUpWithGoogle();
              //       if (result == null) {
              //         setState(() {
              //           loadingGoogle = false;
              //         });
              //         print('GOOGLE LAUGH IN ERROR');
              //       } else {
              //         setState(() {
              //           loadingGoogle = false;
              //         });
              //
              //         // Navigator.pop(context);
              //         // Navigator.push(
              //         //     context,
              //         //     MaterialPageRoute(
              //         //         builder: (context) => HomeScreen()));
              //       }
              //
              //       setState(() {
              //         loadingGoogle = false;
              //       });
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text('SIGN UP WITH GOOGLE '),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Icon(
              //           FontAwesomeIcons.google,
              //           size: 18,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
