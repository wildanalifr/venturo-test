import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:venturo_test/app/modules/home/models/menu_model.dart';
import 'package:venturo_test/app/modules/home/models/voucher_model.dart';

class MenuService {
  static Future getAllMenu() async {
    try {
      final response =
          await http.get(Uri.parse('https://tes-mobile.landa.id/api/menus'));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return MenuModel.fromJson(jsonResponse);
      }
    } catch (e) {}
  }

  static Future getVoucher(String? kode) async {
    try {
      final response = await http.get(
          Uri.parse('https://tes-mobile.landa.id/api/vouchers?kode=$kode'));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return MenuVoucher.fromJson(jsonResponse);
      }
    } catch (e) {}
  }
}
