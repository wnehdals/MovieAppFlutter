import 'package:first_flutter/present/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditText extends StatefulWidget {
  bool isEnable;
  String? hint;
  double? textSize;
  String suffixIcon;
  EdgeInsets? margin;
  String? text;
  int? maxLength;
  TextInputAction textInputAction;
  TextInputType textInputType;
  VoidCallback suffixClickListener;
  TextEditingController textEditingController;

  EditText({
    Key? key,
    this.isEnable = true,
    this.hint,
    this.textSize = 16.0,
    this.suffixIcon = "",
    this.margin = EdgeInsets.zero,
    this.text,
    this.maxLength,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    required this.suffixClickListener,
    required this.textEditingController
  });

  @override
  State<StatefulWidget> createState() => _EditTextState();

}
class _EditTextState extends State<EditText> {
  String clearIcon = "";
  void _textWatcher() {
    setState(() {
      widget.text = widget.textEditingController.text;
      if (widget.text == null || widget.text!.isEmpty) {
        clearIcon = "";
      } else {
        clearIcon = 'assets/images/ic_clear_black.svg';
      }
    });
  }
  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_textWatcher);
  }
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [
          TextFormField(
            readOnly: !widget.isEnable,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            maxLength: widget.maxLength,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: ContextColors.black,
                fontSize: widget.textSize
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: ContextColors.gray400,
                fontSize: widget.textSize
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: ContextColors.gray200, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ContextColors.gray200, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ContextColors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  clearIcon.isEmpty
                      ? const SizedBox()
                      : IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      widget.textEditingController.clear();
                    },
                    visualDensity: VisualDensity(horizontal: -4),
                    icon: SvgPicture.asset(clearIcon),
                    iconSize: 16,
                  ),
                  widget.suffixIcon.isEmpty
                      ? const SizedBox()
                      : IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.suffixClickListener,
                    constraints: const BoxConstraints(),
                    visualDensity: VisualDensity(horizontal: -4),
                    icon: SvgPicture.asset(widget.suffixIcon!),
                    iconSize: 24,
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}