import 'package:bobawithflutter/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingFacility extends StatefulWidget {
  const BookingFacility({Key? key}) : super(key: key);

  @override
  State<BookingFacility> createState() => _BookingFacilityState();
}

class _BookingFacilityState extends State<BookingFacility> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();

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

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
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
              height: 40,
              padding:
                  EdgeInsets.only(left: defaultMargin, right: defaultMargin),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: backgroundColor5,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                isExpanded: true,
                style: primaryTextStyle,
                dropdownColor: backgroundColor2,
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
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
            ],
          ),
        ],
      ),
    );
  }
}
