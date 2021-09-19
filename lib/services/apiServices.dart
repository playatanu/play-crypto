import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List> getPost() async {
    try {
      String url =
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=INR&order=market_cap_desc&per_page=1000&page=1&sparkline=false';
      var response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (e) {
      return Future.error('error');
    }
  }
}
