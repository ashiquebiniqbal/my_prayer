import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_prayer/model/LocalPrayer.dart';
import 'package:my_prayer/responsive/sizeconfig.dart';
import 'package:my_prayer/screens/widgets/widget_time.dart';
import 'package:my_prayer/viewmodel/viewmodel_alarm_toogle.dart';
import 'package:provider/provider.dart';

class WidgetPrayerList extends StatefulWidget {
  final List<ModelLocalPrayer> prayer;
  final bool isAmPm;
  final Function onAlarmClick;

  WidgetPrayerList(
      {@required this.prayer,
      @required this.onAlarmClick,
      @required this.isAmPm});

  @override
  _WidgetPrayerListState createState() => _WidgetPrayerListState();
}

class _WidgetPrayerListState extends State<WidgetPrayerList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {

    ViewModelAlarmToggle toogle = Provider.of<ViewModelAlarmToggle>(context,listen: false);
    toogle.fetchAlarms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
        key: UniqueKey(),
        padding: EdgeInsets.only(
          bottom: SizeConfig.heightMultiplier,
          left: SizeConfig.widthMultiplier * 4,
          right: SizeConfig.widthMultiplier * 4,
        ),
        itemBuilder: (con, position) {
          return Container(
            height: SizeConfig.heightMultiplier * 10,
            margin:
                EdgeInsets.symmetric(vertical: SizeConfig.widthMultiplier * 2),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.imageSizeMultiplier * 2)),
            ),
            child: Container(
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 4,
                  right: SizeConfig.widthMultiplier * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.prayer[position].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).accentColor,
                            fontSize: SizeConfig.textMultiplier * 2),
                      ),
                      WidgetTime(
                        isAP: widget.isAmPm,
                        titleSize: SizeConfig.textMultiplier * 3,
                        time: widget.prayer[position].time,
                        subTitleSize: SizeConfig.textMultiplier * 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 3,
                      ),
                      Consumer<ViewModelAlarmToggle>(
                          builder: (context, data, child) {
                        return IconButton(
                          icon: data.alarms[position]
                              ? Icon(
                                  Icons.access_alarm,
                                  size: SizeConfig.imageSizeMultiplier * 8,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.alarm_off,
                                  size: SizeConfig.imageSizeMultiplier * 8,
                                  color: Theme.of(context).accentColor,
                                ),
                          onPressed: () {
                            widget.onAlarmClick(
                                position, data.alarms[position]);
                            data.updateStatus(position, !data.alarms[position]);
                          },
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.prayer.length);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
