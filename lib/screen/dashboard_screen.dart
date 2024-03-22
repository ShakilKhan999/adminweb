import 'package:adminweb/controller/dashboard_controller.dart';
import 'package:adminweb/repository/dashboard_repository.dart';
import 'package:adminweb/screen/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController dashboardController =
      Get.put(DashboardController());
  // String? selectedGender;
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
                    side: const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: const [
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
                              child: Text(
                                'Full Name',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Date of birth',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Subject',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
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
                              child: SizedBox(
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
                      child: Obx(
                        () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: dashboardController.userList.value.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(color: Colors.grey),
                                itemBuilder: (BuildContext context, int index) {
                                  final user =
                                      dashboardController.userList[index];
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(user.fullName.toString()),
                                              const Text('location'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(user.gender.toString()),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child:
                                            Text(user.dateOfBirth.toString()),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            user.subjectCategory.toString()),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8.w),
                                          child: Text(
                                            user.email.toString(),
                                            // textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                          value: user.agreeToMarketing,
                                          onChanged: (value) async {
                                            await dashboardController
                                                .updateUser(
                                                    userId: user.id,
                                                    fullName: user.fullName,
                                                    dateOfBirth: user
                                                        .dateOfBirth
                                                        .toString(),
                                                    gender: user.gender,
                                                    agreeToMarketing:
                                                        value!,
                                                    correspond: user.correspond,
                                                    updatedAt: user.updatedAt
                                                        .toString(),
                                                    lat: user.latitude,
                                                    long: user.longitude,
                                                    createdAt: user.createdAt
                                                        .toString(),
                                                    subjectCategory:
                                                        user.subjectCategory[0]);
                                            setState(() {
                                              user.agreeToMarketing =
                                                  value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                          value: user.correspond,
                                          onChanged: (value) async {
                                            await dashboardController
                                                .updateUser(
                                                    userId: user.id,
                                                    fullName: user.fullName,
                                                    dateOfBirth: user
                                                        .dateOfBirth
                                                        .toString(),
                                                    gender: user.gender,
                                                    agreeToMarketing: user.agreeToMarketing,
                                                    correspond: value!,
                                                    updatedAt: user.updatedAt
                                                        .toString(),
                                                    lat: user.latitude,
                                                    long: user.longitude,
                                                    createdAt: user.createdAt
                                                        .toString(),
                                                    subjectCategory:
                                                        user.subjectCategory[0]);
                                            setState(() {
                                              user.correspond = value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          _showEditDialog(context, user);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () async {
                                          await DashboardRepository().deleteUser(userId: user.id);
                                          dashboardController.fetchUserList();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ]),
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

  void _showEditDialog(BuildContext context, user) {
    TextEditingController fullNameController =
        TextEditingController(text: user.fullName);
    dashboardController.selectedGender.value = user.gender;
    TextEditingController subjectController = TextEditingController(
        text: user.subjectCategory.isEmpty ? '' : user.subjectCategory[0]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Edit User Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              // TextFormField(
              //   controller: genderController,
              //   decoration: const InputDecoration(labelText: 'Gender'),
              // ),
              const SizedBox(
                height: 20,
              ),
              const Text("Gender"),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 1.0.w, top: 1.h, bottom: 1.h, left: 1.w),
                    child: DropdownButton<String>(
                      value: dashboardController.selectedGender.value,
                      onChanged: (String? newValue) {
                        setState(() {
                          dashboardController.selectedGender.value = newValue!;
                          dashboardController.isGenderSelected.value = true;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFF0a7bc4),
                      ),
                      iconSize: 10.sp,
                      underline: Container(),
                      items: <String>[
                        'Male',
                        'Female',
                        'Others',
                        'Prefer not say'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   controller: dobController,
              //   decoration: const InputDecoration(labelText: 'Date of Birth'),
              // ),
              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(labelText: 'Subject'),
              ),

              const SizedBox(
                height: 30,
              ),
              const Text("Date of birth"),

              GestureDetector(
                onTap: () {
                  _showCupertinoDatePicker();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  width: 100.w,
                  height: 40.h,
                  padding: EdgeInsets.only(top: 4.h, left: 4.w, bottom: 4.h),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          dashboardController.isDateSelected.value
                              ? _formatDate(dashboardController.dateTime.value)
                              : _formatDate(DateTime.parse(user.dateOfBirth)),
                          style: TextStyle(
                            fontSize: 4.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Color(0xFF0a7bc4),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                // var headers = {'Content-Type': 'application/json'};
                // var request = http.Request(
                //     'PATCH',
                //     Uri.parse(
                //         'https://tiny-jade-chicken-hose.cyclic.app/api/v1/user/update-user-by-id/${user.id}'));
                // request.body = json.encode({
                //   "SubjectCategory": [subjectController.text],
                //   "_id": user.id,
                //   "fullName": fullNameController.text,
                //   "AppKey": "app1",
                //   "dateOfBirth": dashboardController.isDateSelected.value
                //       ? _dateTime.toString()
                //       : user.dateOfBirth.toString(),
                //   "Gender": dashboardController.isGenderSelected.value
                //       ? dashboardController.selectedGender.value
                //       : user.gender,
                //   "agreeToMarketing": user.agreeToMarketing,
                //   "latitude": user.latitude,
                //   "longitude": user.longitude,
                //   "createdAt": user.createdAt.toString(),
                //   "updatedAt": user.updatedAt.toString(),
                //   "__v": 0,
                //   "correspond": user.correspond
                // });
                // request.headers.addAll(headers);

                // http.StreamedResponse response = await request.send();

                // if (response.statusCode == 200) {
                //   print(await response.stream.bytesToString());
                // } else {
                //   print(response.reasonPhrase);
                // }

                await dashboardController
                    .updateUser(
                        userId: user.id,
                        fullName: fullNameController.text,
                        dateOfBirth: dashboardController.isDateSelected.value
                            ? dashboardController.dateTime.value
                                .toUtc()
                                .toIso8601String()
                            : user.dateOfBirth.toString(),
                        gender: dashboardController.isGenderSelected.value
                            ? dashboardController.selectedGender.value
                            : user.gender,
                        agreeToMarketing: user.agreeToMarketing,
                        correspond: user.correspond,
                        updatedAt: user.updatedAt.toString(),
                        lat: user.latitude,
                        long: user.longitude,
                        createdAt: user.createdAt.toString(),
                        subjectCategory: subjectController.text)
                    .then((value) {
                  Navigator.of(context).pop();
                });
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoDatePicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          // height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    dashboardController.isDateSelected.value = true;

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: const Color(0xFF5F8B95),
                      fontSize: 5.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: dashboardController.dateTime.value,
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime(2025),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      dashboardController.dateTime.value = newDate;
                      dashboardController.isDateSelected.value = true;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDate(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }
}
