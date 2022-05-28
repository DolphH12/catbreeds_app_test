import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/cat_model.dart';

class CatsProvider {
  Future<List<CatsModel>> getCats() async {
    var headers = {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'};
    var request =
        http.Request('GET', Uri.parse('https://api.thecatapi.com/v1/breeds'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final decodedData = json.decode(await response.stream.bytesToString());
    final List<CatsModel> cats = [];

    if (decodedData == null) return [];

    decodedData.forEach((prod) {
      final prodTemp = CatsModel.fromJson(prod);
      cats.add(prodTemp);
    });

    if (response.statusCode == 200) {
      return cats;
    } else {
      return [];
    }
  }
}
