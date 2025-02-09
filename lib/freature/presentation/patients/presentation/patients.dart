import 'package:flutter/material.dart';

import '../../../../core/models/patient.dart';
import '../../../../core/utils/config/constants.dart';
import '../../doctor/presentation/widgets/patient_card.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({super.key});
  static String routeName = '/patients_page';

  @override
  PatientsPageState createState() => PatientsPageState();
}

class PatientsPageState extends State<PatientsPage> {
  String sortType = 'A - Z';
  List<Patient> sortedPatients = [];

  @override
  void initState() {
    super.initState();
    _sortPatients();
  }

  void _sortPatients() {
    setState(() {
      sortedPatients = List.from(patients);
      if (sortType == 'A - Z') {
        sortedPatients.sort((a, b) => a.name.compareTo(b.name));
      } else if (sortType == 'Patient ID') {
        sortedPatients.sort((a, b) => a.id.compareTo(b.id));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Patients',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: kPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefultPadding, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort By',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  height: 35,
                  width: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F4F5),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blue, width: 1.5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: sortType,
                      alignment: AlignmentDirectional.center,
                      dropdownColor: const Color(0xffF2F4F5),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.blue),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'A - Z',
                          alignment: Alignment.center,
                          child: Text('A - Z'),
                        ),
                        DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: 'Patient ID',
                          child: Text('Patient ID'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          sortType = value!;
                          _sortPatients();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sortedPatients.length,
              itemBuilder: (context, index) {
                return PatientCard(
                  patient: sortedPatients[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
