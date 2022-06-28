import 'dart:io';

import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/button_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingBookingPage extends StatefulWidget {
  late final FacilityProviderAmu facilityProviderAmu;
  BookingBookingPage(this.facilityProviderAmu);

  @override
  State<BookingBookingPage> createState() => _BookingBookingPageState();
}

class _BookingBookingPageState extends State<BookingBookingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  late final facility = widget.facilityProviderAmu.facilityamu
      .map((facility) => facility.name)
      .toList();
  String? _currentFacility;

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: startTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != startTime) {
      setState(() {
        startTime = timeOfDay;
      });
    }
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: endTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != startTime) {
      setState(() {
        endTime = timeOfDay;
      });
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    String tanggal =
        "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";

    String jamMulai = "${startTime.hour}:${startTime.minute}";
    String jamAkhir = "${endTime.hour}:${endTime.minute}";

    addBookingHandling() async {
      int? id;
      for (int i = 0; i < widget.facilityProviderAmu.facilityamu.length; i++) {
        if (_currentFacility == facility[i]) {
          id = i;
        }
      }
      final test = widget.facilityProviderAmu.facilityamu
          .map((facility) => facility.id)
          .toList();

      var idbenran = test[id!];

      setState(() {
        isLoading = true;
      });

      await bookingProvider.addBooking(userLoginModel.token.toString(),
          idbenran!.toInt(), tanggal, jamMulai, jamAkhir);

      Navigator.pushNamed(context, '/user/home');
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

    Widget facilityInput() {
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
              'Facility List',
              style: primaryTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding:
                  EdgeInsets.only(left: defaultMargin, right: defaultMargin),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor5,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonFormField<String>(
                value: _currentFacility,
                style: primaryTextStyle,
                dropdownColor: backgroundColor3,
                items: facility.map((facility) {
                  return DropdownMenuItem(
                    value: facility,
                    child: Text('$facility'),
                  );
                }).toList(),
                onChanged: (val) => setState(() {
                  _currentFacility = val;
                  print(_currentFacility);
                }),
                hint: Text(
                  'Pilih Facility',
                  style: primaryTextStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget dateInput() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tahun Bulan Tanggal Booking',
              style: primaryTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text("Choose Date"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              style: secondaryTextStyle,
            )
          ],
        ),
      );
    }

    Widget startTimeInput() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jam mulai Booking',
              style: primaryTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text("Choose Time"),
            ),
            Text(
              "${startTime.hour}:${startTime.minute}",
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget endTimeInput() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jam Akhir Booking',
              style: primaryTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _selectEndTime(context);
              },
              child: Text("Choose Time"),
            ),
            Text(
              "${endTime.hour}:${endTime.minute}",
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Column(
        children: [
          Container(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: defaultMargin),
                height: 50,
                width: 250,
                child: TextButton(
                  onPressed: addBookingHandling,
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/user/home', (route) => false);
                  child: Text(
                    'Add Booking',
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
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Column(
            children: [
              facilityInput(),
              dateInput(),
              startTimeInput(),
              endTimeInput(),
              isLoading ? ButtonLoading() : button(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
