import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class BookingFacility extends StatefulWidget {
  const BookingFacility({Key? key}) : super(key: key);

  @override
  State<BookingFacility> createState() => _BookingFacilityState();
}

class _BookingFacilityState extends State<BookingFacility> {
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
              style: primaryTextStyle,
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

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Column(
            children: [
              facilityInput(),
            ],
          ),
        ],
      ),
    );
  }
}
