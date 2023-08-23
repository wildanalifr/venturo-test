import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xffF6F6F6),
        ),
        child: Container(
          height: 194,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xfff6f6f6),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 24, left: 23, right: 23, bottom: 5),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Total Pesanan ( ${controller.totalItems.length ?? 0} Menu) :",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                          Text("Rp ${controller.totalRupiahs.value}",
                              style: const TextStyle(
                                color: Color(0xff009AAD),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 19,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Voucher",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(Container(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 20, 25, 0),
                                width: 428,
                                height: 212,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    color: Colors.white),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Punya kode voucher?",
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      const Text("Masukan kode voucher disini ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      TextFormField(
                                        controller:
                                            controller.voucherController.value,
                                        decoration: const InputDecoration(
                                            suffixIcon: Icon(Icons.close)),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return '';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: MyButton(() {
                                          controller
                                              .getVoucher(controller
                                                  .voucherController.value.text)
                                              .then((value) => {Get.back()});
                                        }, "Validasi Voucher"),
                                      )
                                    ])));
                          },
                          child: Obx(
                            () => Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    controller.dataVoucher.value.datas == null
                                        ? const Text("Input Voucher",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ))
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${controller.dataVoucher.value.datas?.kode}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              Text(
                                                  " Rp ${controller.dataVoucher.value.datas?.nominal}",
                                                  style: const TextStyle(
                                                    color: Color(0xffD81D1D),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ],
                                          )
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '>',
                                  style: TextStyle(color: Color(0xffAFAFAF)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Total Pembayaran",
                              style: TextStyle(
                                color: Color.fromRGBO(46, 46, 46, 0.75),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          Obx(
                            () =>
                                Text("Rp ${controller.getResult().toString()}",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 154, 173, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    )),
                          ),
                        ],
                      ),
                      MyButton(() {}, "Pesan Sekarang")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 31, left: 10, right: 10),
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.data.value.datas?.length,
                  itemBuilder: (context, index) {
                    final data = controller.data.value.datas?[index];
                    return Obx(() => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: const Color(0xffDFDFDF),
                                    child: Image.network(
                                      data!.gambar!,
                                      width: 75,
                                      height: 75,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${data.nama}",
                                          style: const TextStyle(
                                            color: Color(0xff2E2E2E),
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text("Rp ${data.harga}",
                                          style: const TextStyle(
                                            color: Color(0xff009AAD),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/vector.svg',
                                            width: 13,
                                            height: 11,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      child: SvgPicture.asset(
                                          'assets/btn_minus.svg'),
                                      onTap: () {
                                        controller.decrement(index);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    Text(controller.items[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    InkWell(
                                      child: SvgPicture.asset(
                                          'assets/btn_add.svg'),
                                      onTap: () {
                                        controller.increment(index);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ))),
    );
  }

  ElevatedButton MyButton(Function OnTap, String? text) {
    return ElevatedButton(
      onPressed: () {
        OnTap();
      },
      child: Text(text!),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: const Color(0xff00717F)),
    );
  }
}
