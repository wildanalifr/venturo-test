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
            // height: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xfff6f6f6)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23, right: 23, top: 23),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Pesanan (Menu) :",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                          Obx(() => Text("Rp ${controller.totalRupiahs.value}",
                              style: const TextStyle(
                                color: Color(0xff009AAD),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )))
                        ],
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
                          const Text('Voucher'),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Punya kode voucher'),
                                    const Text('Masukkan kode voucher disini'),
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
                                    const SizedBox(
                                      width: double.infinity,
                                    ),
                                  ],
                                ),
                              ));
                            },
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.bottomSheet(Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 20, 25, 0),
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
                                              const Text(
                                                  "Masukan kode voucher disini ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              TextFormField(
                                                controller: controller
                                                    .voucherController.value,
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIcon:
                                                            Icon(Icons.close)),
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
                                                          .voucherController
                                                          .value
                                                          .text)
                                                      .then((value) => {
                                                            print(
                                                                'hasil $value'),
                                                            Get.back()
                                                          });
                                                }, "Validasi Voucher"),
                                              )
                                            ])));
                                  },
                                  child: Obx(
                                    () => Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            controller.dataVoucher.value
                                                        .datas ==
                                                    null
                                                ? Text("Input Voucher",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))
                                                : Text(
                                                    "${controller.dataVoucher.value.datas!.kode}",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                            Text(
                                                " Rp ${controller.dataVoucher.value.datas!.nominal}",
                                                style: TextStyle(
                                                  color: Color(0xffD81D1D),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '>',
                                          style: TextStyle(
                                              color: Color(0xffAFAFAF)),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Pembayaran",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Text(
                              "",
                              // "Rp ${controller.getResult().toString()}",
                              // "Rp",  // Remove this line
                              style: const TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MyButton(() {}, "Pesan Sekarang"),
                    ],
                  ),
                )
              ],
            ),
          )),
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
