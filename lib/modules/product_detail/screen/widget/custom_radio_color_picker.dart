import 'package:flutter/material.dart';

class CustomRadioColorPicker extends StatefulWidget {
  const CustomRadioColorPicker({Key? key, required this.listModel}) : super(key: key);

  final List<RadioColorPickerModel> listModel;

  @override
  State<CustomRadioColorPicker> createState() => _RadioColorPickerControlState();
}

class _RadioColorPickerControlState extends State<CustomRadioColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: widget.listModel
            .asMap()
            .entries
            .map((e) => InkWell(
                  splashColor: widget.listModel[e.key].buttonColor,
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    setState(() {
                      for (var element in widget.listModel) {
                        element.isSelected = false;
                      }
                      widget.listModel[e.key].isSelected = true;
                    });
                  },
                  child: RadioColorPicker(widget.listModel[e.key]),
                ))
            .toList());
  }
}

class RadioColorPickerModel {
  bool isSelected;
  final Color buttonColor;

  RadioColorPickerModel(this.isSelected, this.buttonColor);
}

class RadioColorPicker extends StatelessWidget {
  final RadioColorPickerModel _item;
  const RadioColorPicker(this._item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: _item.isSelected ? _item.buttonColor : const Color(0x00000000),
          ),
          borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.circle,
        color: _item.buttonColor,
        size: 26,
      ),
    );
  }
}
