import 'package:flutter/material.dart';
import 'package:news/News/NewsContiner.dart';
import 'package:news/Taps/tap_item.dart';
import 'package:news/model/SourcesRespones.dart';

class TapContaner extends StatefulWidget {
  List<Source> SourcesList;

  TapContaner({required this.SourcesList});

  @override
  State<TapContaner> createState() => _TapContanerState();
}

class _TapContanerState extends State<TapContaner> {
  int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.SourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.SourcesList.map((source) => TapItem(source: source,

                isSelected: selectedindex == widget.SourcesList.indexOf(source)))
                .toList(),

          ),
          Expanded(child: NewsContinar(source: widget.SourcesList[selectedindex])),
        ],
      ),
    );
  }
}
