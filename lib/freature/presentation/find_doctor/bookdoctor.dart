import 'package:flutter/material.dart';

import 'table.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  @override
  _SelectTimePageState createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  int selectedDateIndex = 1; // Default to "Tomorrow"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // عدلنا TRANSPORT إلى لون أبيض
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Select Time',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Doctor info section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/img_user.png'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Shruti Kedia',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'General Dental Clinic',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Date selection
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildDateButton('Today, 23 Feb', 0),
                SizedBox(width: 8),
                _buildDateButton('Tomorrow, 24 Feb', 1),
                SizedBox(width: 8),
                _buildDateButton('Thu, 25 Feb', 2),
              ],
            ),
          ),

          // No slots available message
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'No slots available',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to AppointmentPage when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Next availability on Wed, 24 Feb'),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: BorderSide(color: Colors.blue),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Contact Clinic'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateButton(String text, int index) {
    bool isSelected = selectedDateIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDateIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
