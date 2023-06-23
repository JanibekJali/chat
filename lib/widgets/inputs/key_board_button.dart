import 'package:flutter/material.dart';

class KeyBoardButton extends StatelessWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final void Function(String text) onKeyboardTap;
  // final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const KeyBoardButton(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: mainAxisAlignment,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: leftIcon)),
              _calcButton('0'),
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: rightButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: textColor),
          ),
        ));
  }
}
