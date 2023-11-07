// import 'package:flutter/material.dart';

// class FullButton extends StatelessWidget {
//   final String selectedValue;
//   final List<String> items;
//   final ValueChanged<String> onChanged;
//   final String hint;

//   const FullButton({
//     super.key,
//     required this.selectedValue,
//     required this.items,
//     required this.onChanged,
//     this.hint = 'Select an option',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
//       value: selectedValue,
//       dropdownColor: Colors.white,
//       isDense: true,
//       isExpanded: false,
//       iconEnabledColor: Colors.white,
//       focusColor: const Color.fromARGB(255, 32, 13, 13),
//       onChanged: onChanged,
//       items: items.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Container(
//             height: 40,
//             width: 163,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 1), // Add a border
//             ),
//             child: Center(
//               child: Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ),
//         );
//       }).toList(), 
//     );
//   }
// }
