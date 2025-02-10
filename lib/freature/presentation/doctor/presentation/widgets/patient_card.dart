import 'package:flutter/material.dart';

import '../../../../../core/models/patient.dart';
import '../../../../../core/utils/config/constants.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.patient,
  });
  final Patient patient;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        selected: true,
        selectedTileColor: kLightPrimaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        tileColor: const Color(0xffF2F4F5),
        leading: CircleAvatar(
          backgroundImage: AssetImage(patient.imageUrl),
          radius: 40,
        ),
        title: Text(patient.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kPrimaryColor)),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),
          const Text('Appointment Date'),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            Text(patient.appointmentTime,
                style: const TextStyle(color: Colors.red)),
            const Icon(
              Icons.arrow_forward_rounded,
              size: 20,
              color: Colors.red,
            ),
            Text(patient.appointmentTime,
                style: const TextStyle(color: Colors.red)),
            const SizedBox(
              width: 10,
            ),
            Text(patient.appointmentDate,
                style: const TextStyle(color: Colors.red)),
          ]),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[400],
              ),
              child: Text(patient.isPaid ? 'Paid' : 'Unpaid',
                  style: const TextStyle(color: Colors.white))),
        ]),
        style: ListTileStyle.drawer,
      ),
    );
  }
}
