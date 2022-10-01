// import 'dart:convert';

// import 'package:ecommerce_app/constant/api_config.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// Future getLogin() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   var myKey = preferences.getString("token") ?? "";
//   var headers = {'mykey': myKey};
//   final response = await http.get(
//     Uri.parse(Config.leadList),
//   );
//   if (response.statusCode == 200) {
//     var leadData = jsonDecode(response.body);
//         SharedPreferences preferences = await SharedPreferences.getInstance();
//         preferences.setString("token", localUser);
//       }
//     } else {
//       print(response.body.toString());
//       var loginResponse = json.decode(response.body);
//       String msg = loginResponse['msg'];
//       final snackBar = SnackBar(
//         content: Text(msg.toString(), style: kLCAtStyle),
//         backgroundColor: (Colors.black12),
//         action: SnackBarAction(
//           label: 'dismiss',
//           onPressed: () {},
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }

//     // await leadData
//     //     .map<LeadListModel>((json) => LeadListModel.fromJson(json))
//     //     .toList();
//     return leadData;
//   } else {
//     throw Exception("Failed to load from API");
//   }
// }
