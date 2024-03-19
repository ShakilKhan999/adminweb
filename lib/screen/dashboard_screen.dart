import 'package:adminweb/screen/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User {
  String fullName;
  String gender;
  String dob;
  String subject;
  String phone;
  bool agreeToUpdates;
  bool correspondInWelsh;

  User({
    required this.fullName,
    required this.gender,
    required this.dob,
    required this.subject,
    required this.phone,
    required this.agreeToUpdates,
    required this.correspondInWelsh,
  });
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<User> userList = [
    User(
      fullName: 'John Doe',
      gender: 'Male',
      dob: '1990-01-01',
      subject: 'Mathematics',
      phone: '+1234567890',
      agreeToUpdates: true,
      correspondInWelsh: false,
    ),
    User(
      fullName: 'Jane Smith',
      gender: 'Female',
      dob: '1995-05-05',
      subject: 'Science',
      phone: '+1987654321',
      agreeToUpdates: false,
      correspondInWelsh: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Text(
                'User List',
                style: TextStyle(fontSize: 6.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F4F6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Full Name',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Date of birth',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Subject',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Agree to marking updates.',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 10.w,
                                child: Text(
                                  'Correspond in Welsh',
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(204, 204, 204, 0.2),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: userList
                            .map((user) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Text(
                                            user.fullName,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          user.gender,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          user.dob,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          user.subject,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          user.phone,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Checkbox(
                                            value: user.agreeToUpdates,
                                            onChanged: (value) {
                                              setState(() {
                                                user.agreeToUpdates =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Checkbox(
                                            value: user.correspondInWelsh,
                                            onChanged: (value) {
                                              setState(() {
                                                user.correspondInWelsh =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          _showEditDialog(context, user);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, User user) {
    TextEditingController _fullNameController =
        TextEditingController(text: user.fullName);
    TextEditingController _genderController =
        TextEditingController(text: user.gender);
    TextEditingController _dobController =
        TextEditingController(text: user.dob);
    TextEditingController _subjectController =
        TextEditingController(text: user.subject);
    TextEditingController _phoneController =
        TextEditingController(text: user.phone);
    bool _agreeToUpdates = user.agreeToUpdates;
    bool _correspondInWelsh = user.correspondInWelsh;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Edit User Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(labelText: 'Subject'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  user.fullName = _fullNameController.text;
                  user.gender = _genderController.text;
                  user.dob = _dobController.text;
                  user.subject = _subjectController.text;
                  user.phone = _phoneController.text;
                  user.agreeToUpdates = _agreeToUpdates;
                  user.correspondInWelsh = _correspondInWelsh;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
