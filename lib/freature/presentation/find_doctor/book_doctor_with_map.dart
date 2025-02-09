import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'bookdoctor.dart';

class DoctorDetailsPage extends StatelessWidget {
  final double doctorLatitude = 29.31370783697074; // Example doctor location
  final double doctorLongitude = 30.85184264917924;
  static String routeName = '/doctor_details';
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Doctor Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/img_smiling_asian_d.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dr. Pediatrician',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Specialist Cardiologist',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            const Text(
                              '\$28.00/hr',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectTimePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF407BFF),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // تغيير اللون إلى الأبيض
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Statistics
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatistic('100', 'Rating'),
                  _buildStatistic('500', 'Reviews'),
                  _buildStatistic('700', 'Patient'),
                ],
              ),
            ),

            // Services Section
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Service Items
            _buildServiceItem(
              '1',
              'Patient care should be the number one priority.',
              Colors.blue,
            ),
            _buildServiceItem(
              '2',
              'If you run your practice you know how frustrating.',
              Colors.green,
            ),
            _buildServiceItem(
              '3',
              "That's why some of appointment reminder system.",
              Colors.orange,
            ),

            // Location Section
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Interactive Map
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: FlutterMap(
                options: MapOptions(
                    // center: LatLng(doctorLatitude, doctorLongitude),
                    // zoom: 15.0
                    ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  //here is the marker
                  //
                  //   MarkerLayer(
                  //     markers: [
                  //       Marker(
                  //         point:
                  //         LatLng(doctorLatitude, doctorLongitude),
                  //         width: 40,
                  //         height: 40,
                  //         child: Container(
                  //           decoration: const BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: Colors.blue,
                  //           ),
                  //           child: const Icon(
                  //             Icons.location_on,
                  //             color: Colors.white,
                  //             size: 20,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(String number, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
