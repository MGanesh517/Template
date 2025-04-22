
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PickerType { date, range, time, dateTime, year, month, quarter, week }

class CommonDatePicker extends StatelessWidget {
  final String? label;
  final PickerType pickerType;
  final DateTime? selectedDate;
  final DateTimeRange? selectedRange;
  final Function(DateTime)? onDateSelected;
  final Function(DateTimeRange)? onRangeSelected;
  final bool needConfirm;
  final bool showTime;
  final bool isDisabled;

  const CommonDatePicker({
    super.key,
    this.label,
    required this.pickerType,
    this.selectedDate,
    this.selectedRange,
    this.onDateSelected,
    this.onRangeSelected,
    this.needConfirm = false,
    this.showTime = false,
    this.isDisabled = false,
  });

  String formatDate(DateTime date) {
    return "${date.year}-${twoDigits(date.month)}-${twoDigits(date.day)}";
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  DateTime getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  Future<void> select(BuildContext context) async {
    if (isDisabled) return;

    final now = DateTime.now();

    switch (pickerType) {
      case PickerType.date:
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) onDateSelected?.call(picked);
        break;

      case PickerType.range:
        final picked = await showDateRangePicker(
          context: context,
          initialDateRange:
              selectedRange ??
              DateTimeRange(start: now, end: now.add(const Duration(days: 7))),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                    maxHeight: 600,
                  ),
                  child: Material(color: Colors.transparent, child: child),
                ),
              ),
            );
          },
        );
        if (picked != null) onRangeSelected?.call(picked);
        break;

      case PickerType.time:
        final picked = await showTimePicker(
          context: context,
          initialTime: selectedDate != null
                  ? TimeOfDay.fromDateTime(selectedDate!)
                  : TimeOfDay.now(),
        );
        if (picked != null) {
          final dt = DateTime(
            now.year,
            now.month,
            now.day,
            picked.hour,
            picked.minute,
          );
          onDateSelected?.call(dt);
        }
        break;

      case PickerType.dateTime:
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          final pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(selectedDate ?? now),
          );
          if (pickedTime != null) {
            final dt = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            onDateSelected?.call(dt);
          }
        }
        break;

      case PickerType.year:
        showCustomPicker(
          context,
          label: "Select Year",
          items: List.generate(101, (i) => (2000 + i).toString()),
          onSelected: (value) {
            final year = int.tryParse(value);
            if (year != null) onDateSelected?.call(DateTime(year));
          },
        );
        break;

      case PickerType.month:
        showCustomPicker(
          context,
          label: "Select Month",
          items: List.generate(
            12,
            (i) => DateFormat.MMMM().format(DateTime(0, i + 1)),
          ),
          onSelected: (value) {
            final month = DateFormat.MMMM().parse(value).month;
            onDateSelected?.call(DateTime(now.year, month));
          },
        );
        break;

      case PickerType.quarter:
        showCustomPicker(
          context,
          label: "Select Quarter",
          items: ["Q1", "Q2", "Q3", "Q4"],
          onSelected: (value) {
            final quarter = {"Q1": 1, "Q2": 4, "Q3": 7, "Q4": 10}[value]!;
            onDateSelected?.call(DateTime(now.year, quarter));
          },
        );
        break;

      case PickerType.week:
        // For week selection, we'll use date picker but process it to get the week
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          // Calculate the start of the week for the selected date
          final startOfWeek = getStartOfWeek(picked);
          onDateSelected?.call(startOfWeek);
        }
        break;
    }
  }

  void showCustomPicker(
    BuildContext context, {
    required String label,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        String selected = items.first;
        return AlertDialog(
          title: Text(label),
          content: SizedBox(
            height: 200,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: 0),
              itemExtent: 32.0,
              onSelectedItemChanged: (index) {
                selected = items[index];
              },
              children: items.map((e) => Center(child: Text(e))).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onSelected(selected);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  String getDisplayValue() {
    if (pickerType == PickerType.range && selectedRange != null) {
      return "${DateFormat.yMd().format(selectedRange!.start)} → ${DateFormat.yMd().format(selectedRange!.end)}";
    } else if (selectedDate != null) {
      switch (pickerType) {
        case PickerType.year:
          return DateFormat.y().format(selectedDate!);
        case PickerType.month:
          return DateFormat.yMMM().format(selectedDate!);
        case PickerType.quarter:
          final m = selectedDate!.month;
          final q = (m ~/ 3) + 1;
          return "Q$q ${selectedDate!.year}";
        case PickerType.time:
          return DateFormat.Hm().format(selectedDate!);
        case PickerType.dateTime:
          return DateFormat.yMd().add_Hm().format(selectedDate!);
        case PickerType.week:
          // Display the week range
          final start = selectedDate!; // This should already be the start of week
          final end = start.add(const Duration(days: 6));
          return "${formatDate(start)} → ${formatDate(end)}";
        default:
          return DateFormat.yMd().format(selectedDate!);
      }
    }
    return "Select";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => select(context),
      child: AbsorbPointer(
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
              borderSide: BorderSide()
            ),
            suffixIcon: Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.onSurface),
          ),
          child: Text(getDisplayValue(), style: TextStyle(
            color: Theme.of(context).colorScheme.surfaceContainer,
          )
          ),
        ),
      ),
    );
  }
}


