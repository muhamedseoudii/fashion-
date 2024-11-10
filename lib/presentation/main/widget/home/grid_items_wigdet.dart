import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/resources/assets_manager.dart';
import '../../../../data/resources/color_manager.dart';
import '../../../../data/resources/styles_manager.dart';

class GridItemsWidget extends StatelessWidget {
  final String type, rate, price;
  final IconData? icon;
  final void Function()? onTapFavorite;

  const GridItemsWidget(
      {super.key,
      this.onTapFavorite,
      required this.type,
      required this.rate,
      required this.price, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156,height: 200,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.topRight,
              height: 150,
              decoration: BoxDecoration(
                  color: ColorManager.grey1,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorManager.offWhite,
                child: InkWell(
                    onTap: onTapFavorite,
                    child: Icon(icon,color: ColorManager.primary,)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type, style: AppTextStyles.mediumTitle14),
                Row(
                  children: [
                    SvgPicture.asset(IconAssets.starIcon),
                    Text(rate, style: AppTextStyles.smallTitleGrey12),
                  ],
                ),
              ],
            ),
            Text(price, style: AppTextStyles.mediumTitle14),
          ],
        ),
      ),
    );
  }
}
