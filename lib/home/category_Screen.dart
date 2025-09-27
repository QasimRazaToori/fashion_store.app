import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:get/get.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int SelectedIndex = 0;
  final categories = ['Ali', 'Men', 'Women', 'Girl'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: List.generate(
            categories.length,
            (index) => Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                      child: ChoiceChip(
                        label: Text(
                          categories[index],
                          style: AppTextStyle.withColor(
                            SelectedIndex == index
                                ? AppTextStyle.withWeight(
                                    AppTextStyle.BodySmall, FontWeight.w600)
                                : AppTextStyle.BodySmall,
                            SelectedIndex == index
                                ? Colors.white
                                : isDark
                                    ? Colors.grey[300]!
                                    : Colors.grey[600]!,
                          ),
                        ),
                        selected: SelectedIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            SelectedIndex = selected ? index : SelectedIndex;
                          });
                        },
                        selectedColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            isDark ? Colors.grey[800] : Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: SelectedIndex == index ? 2 : 0,
                        pressElevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(
                            color: SelectedIndex == index
                                ? Colors.transparent
                                : isDark
                                    ? Colors.grey[700]!
                                    : Colors.grey[300]!,
                            width: 1),
                      )),
                )),
      ),
    );
  }
}
