import 'package:flutter/material.dart';
import 'package:customizable_date_picker/customizable_date_picker.dart' as dp;
import 'package:customizable_date_picker/customizable_date_picker.dart';

import '../color_picker_dialog.dart';
import '../color_selector_btn.dart';
import '../event.dart';

/// Page with [dp.DayPicker].
class DayPickerPage extends StatefulWidget {
  /// Custom events.
  final List<Event> events;
  final TextStyle dayHeaderStyle;

  ///
  const DayPickerPage({
    Key? key,
    this.events = const [],
    this.dayHeaderStyle = const TextStyle(
      color: Colors.red,
    ),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DayPickerPageState();
}

class _DayPickerPageState extends State<DayPickerPage> {
  DateTime _selectedDate = DateTime.now();

  final DateTime _firstDate = DateTime.now()
      .subtract(const Duration(days: 30)); //Define date range to display
  final DateTime _lastDate = DateTime.now()
      .add(const Duration(days: 391)); //Define date range to display

  Color selectedDateStyleColor = Colors.blue;
  Color selectedSingleDateDecorationColor = Colors.red;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    selectedDateStyleColor = Theme.of(context).colorScheme.onSecondary;
    selectedSingleDateDecorationColor = Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    // add selected colors to default settings
    dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
      selectedDateStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: selectedDateStyleColor),
      selectedSingleDateDecoration: BoxDecoration(
        color: selectedSingleDateDecorationColor,
        shape: BoxShape.circle,
      ),
      dayHeaderStyle: DayHeaderStyle(
        textStyle: widget.dayHeaderStyle,
      ),
      dayHeaderTitleBuilder: _dayHeaderTitleBuilder,
    );

    return Flex(
      direction: MediaQuery.of(context).orientation == Orientation.portrait
          ? Axis.vertical
          : Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: dp.DayPicker.single(
            selectedDate: _selectedDate,
            onChanged: _onSelectedDateChanged,
            firstDate: _firstDate,
            lastDate: _lastDate,
            datePickerStyles: styles,
            datePickerLayoutSettings: const dp.DatePickerLayoutSettings(
              maxDayPickerRowCount: 2,
              showPrevMonthEnd: false,
              showNextMonthStart: false,
            ),
            // selectableDayPredicate: _isSelectableCustom,
            eventDecorationBuilder: _eventDecorationBuilder,
          ),
        ),
        SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Selected date styles",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ColorSelectorBtn(
                        title: "Text",
                        color: selectedDateStyleColor,
                        showDialogFunction: _showSelectedDateDialog,
                        colorBtnSize: 42.0,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      ColorSelectorBtn(
                        title: "Background",
                        color: selectedSingleDateDecorationColor,
                        showDialogFunction: _showSelectedBackgroundColorDialog,
                        colorBtnSize: 42.0,
                      ),
                    ],
                  ),
                ),
                Text("Selected: $_selectedDate")
              ],
            ),
          ),
        ),
      ],
    );
  }

  // select text color of the selected date
  void _showSelectedDateDialog() async {
    Color? newSelectedColor = await showDialog(
        context: context,
        builder: (_) => ColorPickerDialog(
              selectedColor: selectedDateStyleColor,
            ));

    if (newSelectedColor != null) {
      setState(() {
        selectedDateStyleColor = newSelectedColor;
      });
    }
  }

  // select background color of the selected date
  void _showSelectedBackgroundColorDialog() async {
    Color? newSelectedColor = await showDialog(
        context: context,
        builder: (_) => ColorPickerDialog(
              selectedColor: selectedSingleDateDecorationColor,
            ));

    if (newSelectedColor != null) {
      setState(() {
        selectedSingleDateDecorationColor = newSelectedColor;
      });
    }
  }

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  // ignore: prefer_expression_function_bodies
  bool _isSelectableCustom(DateTime day) {
    return day.weekday < 6;
  }

  dp.EventDecoration? _eventDecorationBuilder(DateTime date) {
    List<DateTime> eventsDates =
        widget.events.map<DateTime>((e) => e.date).toList();

    bool isEventDate = eventsDates.any((d) =>
        date.year == d.year && date.month == d.month && d.day == date.day);

    BoxDecoration roundedBorder = BoxDecoration(
        border: Border.all(
          color: Colors.deepOrange,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)));

    return isEventDate
        ? dp.EventDecoration(boxDecoration: roundedBorder)
        : null;
  }
}

String _dayHeaderTitleBuilder(
        int dayOfTheWeek, List<String> localizedHeaders) =>
    localizedHeaders[dayOfTheWeek].substring(0, 3);
