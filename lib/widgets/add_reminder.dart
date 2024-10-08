import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remindits/model/reminder_model.dart';
import 'package:remindits/utils/app_colors.dart';

addReminder(BuildContext context, String uid) {
  TimeOfDay time = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  add(String uid, TimeOfDay time) {
    try {
      DateTime dateTime = DateTime(1970, 1, 1, time.hour, time.minute);
      Timestamp timestamp = Timestamp.fromDate(dateTime);
      ReminderModel reminderModel = ReminderModel();
      reminderModel.time = timestamp;
      reminderModel.onOff = false;
      if (titleController.text.isNotEmpty) {
        reminderModel.title = titleController.text;
      } else {
        reminderModel.title = 'Reminder';
      }
      if (descController.text.isNotEmpty) {
        reminderModel.description = descController.text;
      } else {
        reminderModel.description = 'Reminders';
      }
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('reminder')
          .get()
          .then((querySnapshot) {
        int reminderIndex =
            querySnapshot.docs.length; // dapatkan jumlah dokumen
        String reminderIndexString;
        if (reminderIndex < 10) {
          reminderIndexString = 'reminder_$reminderIndex';
        } else {
          String alphabet = String.fromCharCode(
              64 + (reminderIndex - 9)); // konversi ke karakter alfabet
          reminderIndexString = 'reminder_$alphabet';
        }
        FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('reminder')
            .doc(reminderIndexString) // gunakan nilai index
            .set(reminderModel.toMap());
      });
      Fluttertoast.showToast(msg: 'Reminder Added');
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text('Add Reminder'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Make a new reminder"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      controller: titleController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Add title',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor1,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      maxLines: 3,
                      controller: descController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Add Description',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor1,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
          
                      if (newTime == null) return;
                      setState(
                        () {
                          time = newTime;
                        },
                      );
                    },
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: AppColors.primaryColor1,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          time.format(context).toString(),
                          style: TextStyle(
                              color: AppColors.primaryColor1, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: AppColors.textColor1),
                ),
              ),
              TextButton(
                onPressed: () {
                  add(uid, time);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: AppColors.primaryColor1),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
