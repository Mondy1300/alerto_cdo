import 'package:alerto_cdo_v1/model/report.dart';
import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  // const ReportTile({Key? key}) : super(key: key);

  final Report report;
  ReportTile({required this.report});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Icon(Icons.report),
          title: Text(report.type!),
          subtitle: Text(report.description!),
        ),
      ),
    );
  }
}
