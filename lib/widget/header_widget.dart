import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          buildHeaderBackground(),
          Positioned(
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => [
                    PopupMenuItem(child: Text('View Profile')),
                    PopupMenuItem(child: Text('Add to friends')),
                  ],
            ),
            right: 0,
          ),
          Positioned(
            child: buildHeaderContent(context),
            bottom: 0,
            left: 24,
          ),
        ],
      );

  Widget buildHeaderContent(BuildContext context) => Row(
        children: <Widget>[
          buildProfile(context),
          SizedBox(width: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'TasteMe',
                style: Theme.of(context).primaryTextTheme.title,
              ),
              SizedBox(height: 16),
              buildFollowButton(context),
            ],
          ),
        ],
      );

  Widget buildFollowButton(BuildContext context) => Container(
        child: FlatButton(
          child: Text(
            'Follow',
            style: Theme.of(context).primaryTextTheme.body1,
          ),
          onPressed: () {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.blue,
        ),
        decoration: decoration(context),
      );

  Widget buildProfile(BuildContext context) {
    final image = DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        'images/profile.jpg',
      ),
    );

    return Container(
      width: 92,
      height: 92,
      decoration: decoration(context, image: image),
    );
  }

  Widget buildHeaderBackground() => Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 152,
            child: Image.asset(
              'images/pancake.jpg',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 24),
        ],
      );

  Decoration decoration(BuildContext context, {DecorationImage image}) =>
      BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor, spreadRadius: 4)
        ],
        image: image,
      );
}
