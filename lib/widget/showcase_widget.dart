import 'package:flutter/material.dart';
import 'package:january6_staggered_grid_view/model/showcase.dart';

class ShowcaseWidget extends StatelessWidget {
  final Showcase showcase;

  const ShowcaseWidget({
    @required this.showcase,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(showcase.image, fit: BoxFit.cover),
              ),
              Material(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8)),
                ),
                child: Icon(Icons.image, color: Colors.black.withOpacity(0.8)),
              )
            ],
          ),
          buildInfo(context),
        ],
      );

  Widget buildInfo(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 4),
            Text(showcase.title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(showcase.owner, style: Theme.of(context).textTheme.caption),
          ],
        ),
      );
}
