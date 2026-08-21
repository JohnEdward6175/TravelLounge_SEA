import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for formatting dates

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.white), // Makes text white
        ),
        backgroundColor: Colors.red,
        centerTitle: true, // Centers the title
        automaticallyImplyLeading: false, // Hides default back arrow
        actions: [
          // This is your new Close Button
          
        ],
      ),
      body: Column(
        children: [
          _buildMonthHeader(),
          const SizedBox(height: 8),
          _buildWeekDays(),
          const SizedBox(height: 8),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  // ---------------- Month Header ----------------
  Widget _buildMonthHeader() {
    String monthYear = DateFormat.yMMMM().format(_focusedDate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            setState(() {
              _focusedDate = DateTime(
                _focusedDate.year,
                _focusedDate.month - 1,
              );
            });
          },
        ),
        Text(
          monthYear,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.red),
          onPressed: () {
            setState(() {
              _focusedDate = DateTime(
                _focusedDate.year,
                _focusedDate.month + 1,
              );
            });
          },
        ),
      ],
    );
  }

  // ---------------- Weekday Labels ----------------
  Widget _buildWeekDays() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((day) => Expanded(
                  child: Center(
                child: Text(
                  day,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
              )))
          .toList(),
    );
  }

  // ---------------- Calendar Grid ----------------
  Widget _buildCalendarGrid() {
    int year = _focusedDate.year;
    int month = _focusedDate.month;

    DateTime firstDayOfMonth = DateTime(year, month, 1);
    int weekDayOfFirst = firstDayOfMonth.weekday % 7; // Sunday=0

    int daysInMonth = DateTime(year, month + 1, 0).day;

    List<Widget> dayWidgets = [];

    // Empty slots before first day
    for (int i = 0; i < weekDayOfFirst; i++) {
      dayWidgets.add(const SizedBox());
    }

    // Days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime currentDay = DateTime(year, month, day);
      bool isSelected = _selectedDate.year == currentDay.year &&
          _selectedDate.month == currentDay.month &&
          _selectedDate.day == currentDay.day;
      bool isToday = DateTime.now().year == currentDay.year &&
          DateTime.now().month == currentDay.month &&
          DateTime.now().day == currentDay.day;

      dayWidgets.add(GestureDetector(
        onTap: () {
          setState(() {
            _selectedDate = currentDay;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.red
                : isToday
                    ? Colors.red.shade100
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              '$day',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ));
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        children: dayWidgets,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
