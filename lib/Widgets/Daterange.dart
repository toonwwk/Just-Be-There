import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jbt/helper.dart';

class DateRange extends StatefulWidget {
  @override
  _DateRangeState createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTimeRange dateRange;

  String getStart() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange.start);
    }
  }

  String getTill() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange.end);
    }
  }
  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: appColor.darkGray,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextField(
              readOnly: true,
              decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.date_range,
                color: appColor.green,
                ),
                enabledBorder: border,
                focusedBorder: border,
                hintText: (getStart() + " - " + getTill()),
                hintStyle: appTextStyle.regular15Green,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 3,
                ),
              ),
            onTap: () => pickDateRange(context),
        ),
    );
  }

  Future pickDateRange(BuildContext context) async {

    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}