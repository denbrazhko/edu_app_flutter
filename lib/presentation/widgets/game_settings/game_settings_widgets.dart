import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameSettingsTopBar extends StatelessWidget {
  final Widget body;
  final String image;

  const GameSettingsTopBar(this.body, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 360 / 195,
        child: Stack(
          children: [_backgroundImage(), body],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16)),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class GameSettingsTags extends StatelessWidget {
  final List<String> tags;

  const GameSettingsTags(this.tags, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 21),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _getChildren(),
        ),
      ),
    );
  }

  List<Widget> _getChildren() {
    final children = <Widget>[];
    var first = true;
    for (final tag in tags) {
      if (first) {
        children.add(Container(
          margin: const EdgeInsets.only(left: 16),
          child: _tag(tag),
        ));
        first = false;
        continue;
      }
      children.add(_tag(tag));
    }
    return children;
  }

  Widget _tag(String tag) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          tag,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }
}
