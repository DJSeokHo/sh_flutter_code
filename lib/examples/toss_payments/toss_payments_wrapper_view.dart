import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/agreement_status.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/model/tosspayments_result.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

import '../../framework/debug/i_log.dart';

void main() {
  runApp(
    Container(
      color: Colors.white,
      child: Column(
        children: [
          TossPaymentsWrapperView(
            clientKey: "test_ck_d26DlbXAaV0BYWADWl48qY50Q9RB", // test
            // clientKey: dotenv.get("CLIENT_KEY_PAYPAL"), // overseas test
            customerKey: "USER_3",
            price: 5000,
            currency: Currency.KRW,
            country: "KR",
            variantKey: "DEFAULT",
            needToAgree: () {

            },
            onSuccess: (paymentKey, orderId, amount) {

            },
          )
        ],
      ),
    )
  );
}

const _tag = "TossPaymentsWrapperView";

class TossPaymentsWrapperView extends StatefulWidget {
  const TossPaymentsWrapperView({super.key, required this.clientKey, required this.customerKey, required this.price, required this.currency, required this.country, required this.variantKey, required this.onSuccess, this.needToAgree});

  final String clientKey;
  final String customerKey;
  final int price;
  final Currency currency;
  final String country; // "KR", "US"
  final String variantKey; // "DEFAULT", "walalandPaypal"

  final Function(String paymentKey, String orderId, String amount) onSuccess;
  final Function? needToAgree;

  @override
  State<StatefulWidget> createState() {
    return _TossPaymentsWrapperView();
  }
}

class _TossPaymentsWrapperView extends State<TossPaymentsWrapperView> {

  late PaymentWidget _paymentWidget;
  PaymentMethodWidgetControl? _paymentMethodWidgetControl;
  AgreementWidgetControl? _agreementWidgetControl;

  @override
  void initState() {
    super.initState();

    /// PaymentWidget 객체를 초기화합니다.
    _paymentWidget = PaymentWidget(
        clientKey: widget.clientKey,
        customerKey: widget.customerKey,
        // paymentWidgetOptions: PaymentWidgetOptions(brandPayOption: BrandPayOption(info.redirectUrl ?? ""))
    );

    /// [renderPaymentMethods] 함수로 결제수단 위젯을 렌더링합니다.
    _paymentWidget.renderPaymentMethods(
      selector: 'methods',
      amount: Amount(value: widget.price, currency: widget.currency, country: widget.country), options: RenderPaymentMethodsOptions(variantKey: widget.variantKey)
    ).then((control) {
      _paymentMethodWidgetControl = control;
    }, onError: (e) {
      // Get.offAndToNamed("/result", arguments: fail);
      final Fail fail = e;
      ILog.debug(_tag, "${fail.orderId} ${fail.errorCode} ${fail.errorMessage}");
      return;
    });

    /// [renderAgreement] 함수로 약관 위젯을 렌더링합니다.
    _paymentWidget.renderAgreement(
        selector: 'agreement',
        // options: RenderAgreementOptions(variantKey: info.variantKeyAgreement ?? "")
    ).then((control) {
      _agreementWidgetControl = control; // Future.then을 통해 _agreementWidgetControl을 초기화합니다.
    }, onError: (e) {
      final Fail fail = e;
      ILog.debug(_tag, "${fail.orderId} ${fail.errorCode} ${fail.errorMessage}");
      return;
    });

    // eventCenter.on(Constants.eventTossPayment, this, (arrow, any, data) async {
    //
    //   if (_agreementWidgetControl == null || _paymentMethodWidgetControl == null) {
    //     return;
    //   }
    //
    //   final agreementStatus = await _agreementWidgetControl?.getAgreementStatus();
    //
    //   if (agreementStatus?.agreedRequiredTerms == null || agreementStatus?.agreedRequiredTerms == false) {
    //     if (widget.needToAgree != null) {
    //       widget.needToAgree!();
    //     }
    //     return;
    //   }
    //
    //   final paymentMethod = await _paymentMethodWidgetControl!.getSelectedPaymentMethod();
    //
    //   ILog.debug(_tag, paymentMethod.method);
    //
    //   // 결제 금액 변경 -> 쿠폰 또는 포인트 적용 (필요하면)
    //   // await _paymentMethodWidgetControl?.updateAmount(amount: your_new_amount);
    //
    //   String code = data["code"];
    //   String name = data["name"];
    //
    //   ILog.debug(_tag, "orderId $code, orderName $name");
    //
    //   final paymentResult = await _paymentWidget.requestPayment(
    //       paymentInfo: PaymentInfo(
    //       orderId: code,
    //       orderName: name,
    //     )
    //   );
    //
    //   if (paymentResult.fail != null) {
    //     ILog.debug(_tag, "${paymentResult.fail!.orderId} ${paymentResult.fail!.errorCode} ${paymentResult.fail!.errorMessage}");
    //     return;
    //   }
    //
    //   if (paymentResult.success != null) {
    //     ILog.debug(_tag, "${paymentResult.success!.orderId} ${paymentResult.success!.paymentKey} ${paymentResult.success!.amount}");
    //     widget.onSuccess(paymentResult.success!.paymentKey, paymentResult.success!.orderId, paymentResult.success!.amount.toString());
    //   }
    //
    //   // //4.⭐️ 클라이언트단 결제상태 저장 및 라우팅
    //   // ref
    //   //     .read(clientPaymentControllerProvider.notifier)
    //   //     .routePayingScreen(paymentResult: paymentResult);
    //
    // }, log: true);
  }

  @override
  void dispose() {
    // eventCenter.off(this, log: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// UI 상에서 원하는 위치에 PaymentMethodWidget 위젯을 추가합니다.
        PaymentMethodWidget(
          paymentWidget: _paymentWidget,
          selector: 'methods',
          onCustomRequested: (key) {
            ILog.debug(_tag, "onCustomRequested $key");
          },
          onCustomPaymentMethodSelected: (key) {
            ILog.debug(_tag, "onCustomPaymentMethodSelected $key");
          },
          onCustomPaymentMethodUnselected: (key) {
            ILog.debug(_tag, "onCustomPaymentMethodUnselected $key");
          },
        ),

        /// UI 상에서 원하는 위치에 AgreementWidget 위젯을 추가합니다.
        AgreementWidget(
          paymentWidget: _paymentWidget,
          selector: 'agreement',
          onChange: (status) {
            ILog.debug(_tag, "agreement ${status.agreedRequiredTerms}");

            for (AgreementTerm item in status.terms) {
              ILog.debug(_tag, "agreement required ${item.required}");
              ILog.debug(_tag, "agreement agreed ${item.agreed}");
            }
          },
        ),
      ],
    );
  }
}