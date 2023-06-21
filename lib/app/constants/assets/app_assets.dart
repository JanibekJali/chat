import 'package:flutter_svg/svg.dart';

class AppAssests {
  static const String _illustrations = 'assets/vectors/illustrations';
  static const String _icons = 'assets/vectors/icons';
  static const Map<String, String> _paths = {
    'walkthrough': '$_illustrations/walkthrough.svg',
    'chat_icon': '$_icons/chat_icon.svg',
  };
  static SvgPicture walkthrough({required double? height}) {
    return SvgPicture.asset(_paths['walkthrough']!);
  }
}
