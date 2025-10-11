import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class Sizeselector extends StatefulWidget {
  const Sizeselector({super.key});

  @override
  State<Sizeselector> createState() => _SizeselectorState();
}

class _SizeselectorState extends State<Sizeselector> {
  int selectedSize = 0;
  final sizes = ['S', 'M', 'L', 'XL'];
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            sizes.length,
            (index) => Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(sizes[index]),
                    selected: selectedSize == index,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedSize = selected ? index : selectedSize;
                      });
                    },
                    selectedColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      color:
                          selectedSize == index ? Colors.white : Colors.black,
                    ),
                  ),
                )));
  }
}
