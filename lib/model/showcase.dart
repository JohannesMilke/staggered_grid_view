import 'package:meta/meta.dart';

@immutable
class Showcase {
  final String image;
  final String title;
  final String owner;

  const Showcase(
      {@required this.image, @required this.title, @required this.owner});
}
