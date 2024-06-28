
import 'package:daum_postcode_view/daum_postcode_view.dart';
import 'package:flutter/material.dart';

import '../../framework/debug/i_log.dart';

void main() {
  runApp(const DaumPostcodeSearchExample());
}

class DaumPostcodeSearchExample extends StatelessWidget {
  const DaumPostcodeSearchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DaumPostcodeView(
          onComplete: (model) {
            // onComplete 정의
            ILog.debug("???", model);
          },
          options: const DaumPostcodeOptions(
            animation: true,
            hideEngBtn: false,
            themeType: DaumPostcodeThemeType.darknessTheme,
          ),
        ),
      ),
    );
  }
}
