
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

class FlutterBasicSystemDatePicker extends StatelessWidget {
  const FlutterBasicSystemDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Switch Example"),
        ),
        body: _ContentStateView(),
      ),
    );
  }
}

class _ContentStateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  DateTime _dateNow = DateTime.now();
  TimeOfDay _timeNow = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    ILog.debug("", _dateNow);
    ILog.debug("", _dateNow.millisecondsSinceEpoch);
    ILog.debug("", DateTime.fromMillisecondsSinceEpoch(_dateNow.millisecondsSinceEpoch));
    ILog.debug("", "${_dateNow.year}-${_dateNow.month}-${_dateNow.day} ${_dateNow.hour}:${_dateNow.minute}:${_dateNow.second}");

    ILog.debug("tag", formatDate(DateTime(_dateNow.year, _dateNow.month, _dateNow.day), [yyyy, '-', mm, '-', dd]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell( // 带水波纹的可点击组件
              onTap: () {

                _selectDate(
                  context,
                  _dateNow,
                  _dateNow,
                  DateTime(2023),
                  (result) {
                    if (result != null) {

                      setState(() {
                        _dateNow = result;
                      });

                    }
                  }
                );

              }, // 带水波纹的可点击组件
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 16,),
                  Text(formatDate(DateTime(_dateNow.year, _dateNow.month, _dateNow.day), [yyyy, '-', mm, '-', dd])),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 6,),
                ],
              ),
            ),
            InkWell( // 带水波纹的可点击组件
              onTap: () {

                _selectTime(
                    context,
                    _timeNow,
                    (result) {
                      if (result != null) {

                        setState(() {
                          _timeNow = result;
                        });

                      }
                    }
                );

              }, // 带水波纹的可点击组件
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 16,),
                  Text(_timeNow.format(context)),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 6,),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20,),

      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context,
      DateTime initialDate,
      DateTime firstDate,
      DateTime lastDate,
      void Function(DateTime? result) onResult
  ) async {

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate
    );

    ILog.debug("???", "result is $result");
    onResult(result);
  }

  Future<void> _selectTime(
      BuildContext context,
      TimeOfDay initialTime,
      void Function(TimeOfDay? result) onResult
      ) async {

    var result = await showTimePicker(
        context: context,
        initialTime: initialTime
    );

    ILog.debug("???", "result is $result");
    onResult(result);
  }
}