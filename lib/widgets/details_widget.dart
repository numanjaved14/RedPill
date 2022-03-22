import 'package:flutter/material.dart';

class DetailsWidget extends StatefulWidget {
  final snap;
  String status;
  DetailsWidget({
    Key? key,
    required this.snap,
    required this.status,
  }) : super(key: key);

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.snap['vacstatus'] == widget.status
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: ListTile(
              title: Text(widget.snap['firstname'].toString()),
              subtitle: Text(widget.snap['time'].toString()),
            ),
          )
        : Container();
  }
}
