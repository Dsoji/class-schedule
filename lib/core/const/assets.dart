import 'const_barrel.dart';

/// Contains all the paths of image used across the project.
/// Every image path variable name must contain a name and its extension.
/// example :
///
/// for an image with name avatar.png,
/// a suitable variable can be [avatarImagePng].
/// ```dart
/// static const sampleImagePng = "$_base/image.png";
/// ```
/// can be used by doing
/// ```dart
/// ImageAssets.sampleImagePng
/// ```
class ImageAssets {
  static const _base = BasePaths.baseImagePath;

  static const logo = '$_base/logo.png';
  static const logos = '$_base/logos.png';
  static const bye = '$_base/bye.png';
  static const pdf = '$_base/pdf.png';
  static const xcancel = '$_base/Group.png';
  static const plus = '$_base/plus.png';
  static const bk = '$_base/openbook.png';
  static const book = '$_base/book.png';
  static const view = '$_base/Grp.png';
  static const upldM = '$_base/bok.png';
  static const upldA = '$_base/upld.png';
  static const send = '$_base/send.png';
  static const pswrd = '$_base/pswrd.png';
  static const doc = '$_base/doc.png';

}

class SvgAssets {
  static const _base = BasePaths.baseSvgPath;

  static const student = '$_base/student.svg';
  static const instructor = '$_base/instructor.svg';
  static const ass = '$_base/assignment.svg';
  static const bell = '$_base/bell.svg';
  static const cal = '$_base/calender.svg';
  static const book = '$_base/bk.svg';
  static const pswrd = '$_base/pswrd.svg';
  static const speaker = '$_base/speaker.svg';
  static const buk = '$_base/book.svg';
  static const menu = '$_base/menu_low.svg';
  static const dwnld = '$_base/download.svg';
  static const x = '$_base/fi_x.svg';
}
