import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final int level;
  final String menuLabel;
  final Color bgColor;
  final String imageLocation;
  final double iconSize;

  MenuItem(
      {this.bgColor,
      this.iconSize,
      this.imageLocation,
      this.menuLabel,
      this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Level ' + level.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10.0),
          CircleAvatar(
            backgroundColor: bgColor,
            backgroundImage: ExactAssetImage(imageLocation),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              //onTap: () => print('yay'),
              onTap: () => Navigator.pushNamed(context, '/quiz'),
            ),
            // child: Image.asset(
            //   imageLocation,
            //   // fit: BoxFit.cover,
            //   scale: iconSize,
            // ),
            radius: 50.0,
          ),
          SizedBox(height: 10.0),
          Text(
            menuLabel,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
