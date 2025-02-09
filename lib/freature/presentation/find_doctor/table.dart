import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  AppointmentPageState createState() => AppointmentPageState();
}

class AppointmentPageState extends State<AppointmentPage> {
  late DateTime currentMonth;
  late DateTime selectedDate;
  String selectedTime = '02:00 PM';
  String selectedReminder = '25';

  final List<String> timeSlots = [
    '10:00 AM',
    '12:00 AM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
  ];

  final List<String> reminderOptions = [
    '50',
    '40',
    '25',
    '10',
    '35',
  ];

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime(2021, 2);
    selectedDate = DateTime(2021, 2, 17);
  }

  // Get the number of days in the current month
  int get daysInMonth {
    final nextMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    return nextMonth.day;
  }

  // Get the index of the first day of the month (0 = Monday, 6 = Sunday)
  int get firstDayOffset {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    return (firstDay.weekday - 1) % 7;
  }

  void previousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
      if (selectedDate.month != currentMonth.month) {
        selectedDate = DateTime(currentMonth.year, currentMonth.month, 1);
      }
    });
  }

  void nextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
      if (selectedDate.month != currentMonth.month) {
        selectedDate = DateTime(currentMonth.year, currentMonth.month, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Appointment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFA3CAF8), // Light blue
              Color(0xFFE6D5F7), // Light purple
              Color(0xFFB8E5FF), // Another light blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Month and Navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('MMMM yyyy').format(currentMonth),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.chevron_left),
                                onPressed: previousMonth,
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                              SizedBox(width: 16),
                              IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: nextMonth,
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      _buildCalendarGrid(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),
              Text(
                'Available Time',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      timeSlots.map((time) => _buildTimeSlot(time)).toList(),
                ),
              ),

              SizedBox(height: 24),
              Text(
                'Reminder Me Before',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: reminderOptions
                      .map((mins) => _buildReminderOption(mins))
                      .toList(),
                ),
              ),

              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Column(
      children: [
        // Days of week header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: daysOfWeek
              .map((day) => SizedBox(
                    width: 30,
                    child: Text(
                      day,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 8),
        // Calendar days
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: 42, // 6 weeks * 7 days
          itemBuilder: (context, index) {
            // Calculate the day number considering the offset
            final dayNumber = index - firstDayOffset + 1;

            // Check if the day is within the current month
            if (dayNumber < 1 || dayNumber > daysInMonth) {
              return Container();
            }

            final currentDate =
                DateTime(currentMonth.year, currentMonth.month, dayNumber);
            final isSelected = currentDate.year == selectedDate.year &&
                currentDate.month == selectedDate.month &&
                currentDate.day == selectedDate.day;
            final isToday = currentDate.year == DateTime.now().year &&
                currentDate.month == DateTime.now().month &&
                currentDate.day == DateTime.now().day;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = currentDate;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.blue
                      : (isToday ? Colors.blue[50] : null),
                ),
                child: Center(
                  child: Text(
                    '$dayNumber',
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : (isToday ? Colors.blue : Colors.black),
                      fontWeight: isSelected || isToday
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time) {
    final isSelected = time == selectedTime;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.blue[50],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildReminderOption(String minutes) {
    final isSelected = minutes == selectedReminder;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedReminder = minutes;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.blue[50],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          '$minutes Mins',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
