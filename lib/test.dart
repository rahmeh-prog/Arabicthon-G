// void everything() async {
//   _imagePath = imagePath;
//   final bytes = Io.File(_imagePath!).readAsBytesSync();
//   String base64Encode(List<int> bytes) => base64.encode(bytes);
//   print(base64.encode(bytes));
//   var encodedimage = base64.encode(bytes);
//   dynamic response = await getResults(encodedimage);
//   if (response.statusCode == 200) {
//     print(response.body);
//     dynamic resultDict = jsonDecode(response.body);
//     dynamic result = resultDict["result"];
//     print(result);
//   } else
//     print("*****************************************************");
// }
//
// setState(() {
// everything();
// });
// }
