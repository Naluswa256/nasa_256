import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../features/authentication/view/authentication/interestPage/controller/chooseinterestcontroller.dart';
import '../color.dart';

class GridItem extends StatefulWidget {
  final InterestsInfo? item;
  final ValueChanged<bool>? isSelected;
  final int? selectedLength;

  const GridItem({
    super.key,
    this.item,
    this.isSelected,
    this.selectedLength,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;
  final ChooseInterestController yourInterestsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected!(isSelected);
        });
      },
      child: Container(
        width: Get.width / 2,
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color: isSelected ? primaryColor : greyEB,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.item!.image.toString(),
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              widget.item!.title.toString(),
              style: const TextStyle(
                color: blackcolor,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
