import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_test/app/modules/home/models/menu_model.dart';
import 'package:venturo_test/app/modules/home/models/voucher_model.dart';
import 'package:venturo_test/app/modules/home/services/menu_services.dart';

class HomeController extends GetxController {
  var data = MenuModel().obs;
  var dataVoucher = MenuVoucher().obs;
  RxBool isLoading = false.obs;
  var items = <int>[].obs;
  var totalRupiahs = 0.obs;
  var totalItems = [].obs;

  var voucherController = TextEditingController().obs;

  Future getData() async {
    try {
      isLoading(true);
      await MenuService.getAllMenu().then((value) {
        isLoading(false);
        if (value is MenuModel) {
          data.value = value;
        }

        List.generate(data.value.datas!.length, (index) {
          items.add(0);
        });
      });
    } catch (e) {}
  }

  Future getVoucher(String? kode) async {
    try {
      await MenuService.getVoucher(kode!).then((value) => {
            if (value is MenuVoucher) {dataVoucher.value = value},
          });
    } catch (e) {}
  }

  void increment(index) {
    items[index]++;
    var itemPrice = data.value.datas![index].harga!;
    totalRupiahs.value += itemPrice;

    var itemId = data.value.datas![index].id;
    if (!totalItems.any((item) => item['id'] == itemId)) {
      totalItems.add({"id": itemId});
    }

    update();
  }

  void decrement(index) {
    var harga = data.value.datas![index].harga;
    if (items[index] != 0) {
      items[index]--;
      totalRupiahs.value -= harga!;
    }

    if (items[index] == 0) {
      var itemId = data.value.datas![index].id;
      totalItems.removeWhere((item) => item['id'] == itemId);
    }

    update();
  }

  int getResult() {
    var result = 0;

    if (dataVoucher.value.datas != null) {
      if (dataVoucher.value.datas!.nominal != null) {
        if (dataVoucher.value.datas!.nominal! < totalRupiahs.value) {
          result = totalRupiahs.value - dataVoucher.value.datas!.nominal!;
        } else if (dataVoucher.value.datas!.nominal! > totalRupiahs.value) {
          result = 0;
        }
      } else {
        result = totalRupiahs.value;
      }
    } else {
      result = totalRupiahs.value;
    }

    return result;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
