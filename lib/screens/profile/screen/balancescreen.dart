import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Balance',
          style: TextStyle(
            color: Color(0xFF161722),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Coins Balance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              width: Get.width,
              decoration: BoxDecoration(
                color: whitecolor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 14.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(coin),
                  const Text(
                    '261',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 46,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(width: Get.width * .20)
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            PrimaryButton(ontap: () {}, title: "Recharge"),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 0.8,
              width: Get.width,
              color: lightborderColor,
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "LIVE Gifts",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: SizedBox(
                  width: Get.width * .40,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "\$0",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF86878B),
                          fontSize: 16,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                          letterSpacing: -0.16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: greyColor,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
