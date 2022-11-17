import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:surah_munjiat_v2/Constant/color.dart';

class DropDown extends StatefulWidget {
  final String? title;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final void Function(String?)? onChanged;
  const DropDown(
      {Key? key,
      this.title,
      this.validator,
      this.items,
      this.value,
      this.onChanged})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      alignment: AlignmentDirectional.center,
      isExpanded: true,
      hint: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(widget.title!),
          ),
        ],
      ),
      validator: widget.validator,
      items: widget.items,
      value: widget.value,
      onChanged: widget.onChanged,
      selectedItemHighlightColor: const Color(0xFF18A0FB),
      icon: const Icon(Icons.expand_more),
      iconEnabledColor: Colors.black,
      iconDisabledColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: primaryColor),
        ),
      ),
      dropdownMaxHeight: 20.h,
      dropdownElevation: 1,
      scrollbarRadius: const Radius.circular(40),
      scrollbarThickness: 1,
      scrollbarAlwaysShow: false,
    );
  }
}
