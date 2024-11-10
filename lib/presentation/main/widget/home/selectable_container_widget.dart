import 'package:fashion/data/resources/color_manager.dart';
import 'package:fashion/data/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class SelectableContainerList extends StatefulWidget {
  const SelectableContainerList({super.key});

  @override
  State<SelectableContainerList> createState() =>
      _SelectableContainerListState();
}

class _SelectableContainerListState extends State<SelectableContainerList> {
  List name = [
    {"title":"All"},
    {"title":"Newest"},
    {"title":"Popular"},
    {"title":"Man"},
    {"title":"Woman"},
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: name.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? ColorManager.primary
                    : ColorManager.white,
                borderRadius: BorderRadius.circular(170),
                border: Border.all(
                  color: selectedIndex == index
                      ? ColorManager.primary
                      : Colors.grey,
                  width: 1,
                ),
              ),
              child: Text(
                name[index]["title"],
                style: selectedIndex == index
                    ? AppTextStyles.mediumWhiteTitle14
                    : AppTextStyles.mediumTitle14,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
      ),
    );
  }
}