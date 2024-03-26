import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/searchcontroller.dart';
import 'searchdetailscreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchScreenController searchController = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width:width <700 ?Get.width * .70: Get.width * .75,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: searchController.controller.text.isNotEmpty
                              ? primaryColor
                              : Colors.transparent),
                      color: searchController.controller.text.isNotEmpty
                          ? lightpinkColor
                          : greyEB,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: searchController.controller,
                      onChanged: (val) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: searchController.controller.text.isNotEmpty
                                ? primaryColor
                                : Colors.transparent,
                          ),
                          hintStyle: const TextStyle(
                            color: Color(0xFFB5C1D1),
                            fontSize: 16,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Search"),
                    )),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              children: [
                Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  'Clear All',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: searchController.recentlist.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                        children: [
                          Text(
                            searchController.recentlist[index],
                            style: const TextStyle(
                              color: greyColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                color: greyColor,
                              ))
                        ],
                      )),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Suggested Searches',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  itemCount: searchController.suggestlist.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(() => const SearchDetailScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              searchController.suggestlist[index],
                              style: const TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: greyColor,
                                ))
                          ],
                        ),
                      )),
            )
          ]),
        ),
      ),
    );
  }
}
