import 'package:get/get.dart';
import 'package:mighty_school/api_handle/api_checker.dart';
import 'package:mighty_school/common/widget/custom_snackbar.dart';
import 'package:mighty_school/feature/payment_gateway/domain/model/payment_gateway_model.dart';
import 'package:mighty_school/feature/payment_gateway/domain/repository/payment_gateway_repository.dart';

class PaymentGatewayController extends GetxController implements GetxService {
  final PaymentGatewayRepository paymentGatewayRepository;
  PaymentGatewayController({required this.paymentGatewayRepository});

  PaymentGatewayModel? paymentGatewayModel;
  PaymentGatewayItem? payStackPaymentGatewayItem;
  PaymentGatewayItem? razorPayPaymentGatewayItem;
  PaymentGatewayItem? stripePaymentGatewayItem;
  PaymentGatewayItem? payPalPaymentGatewayItem;
  PaymentGatewayItem? sslCommerzPaymentGatewayItem;
  PaymentGatewayItem? paymobAcceptPaymentGatewayItem;
  PaymentGatewayItem? flutterWavePaymentGatewayItem;
  PaymentGatewayItem? senangPayPaymentGatewayItem;
  PaymentGatewayItem? payTmPaymentGatewayItem;
  PaymentGatewayItem? bKashPaymentGatewayItem;
  Future<void> getSaasPaymentGateway() async {
    Response? response = await paymentGatewayRepository.getPaymentGateway();
    if (response?.statusCode == 200) {
      paymentGatewayModel = PaymentGatewayModel.fromJson(response!.body);

    PaymentGatewayItem? findGatewaySafe(String name) {
        final list = paymentGatewayModel?.data;
        if (list == null) return null;
        for (var item in list) {
          if (item.name == name) return item;
        }
        return null;
      }

      payStackPaymentGatewayItem = findGatewaySafe("paystack");
      razorPayPaymentGatewayItem = findGatewaySafe("razor_pay");
      stripePaymentGatewayItem = findGatewaySafe("stripe");
      payPalPaymentGatewayItem = findGatewaySafe("paypal");
      sslCommerzPaymentGatewayItem = findGatewaySafe("ssl_commerz");
      paymobAcceptPaymentGatewayItem = findGatewaySafe("paymob_accept");
      flutterWavePaymentGatewayItem = findGatewaySafe("flutterwave");
      senangPayPaymentGatewayItem = findGatewaySafe("senang_pay");
      payTmPaymentGatewayItem = findGatewaySafe("paytm");
      bKashPaymentGatewayItem = findGatewaySafe("bkash");

    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }



  bool isLoading = false;
  Future<void> editPaymentGateway(PaymentGatewayItem item) async {
    isLoading = true;
    update();
    Response? response = await paymentGatewayRepository.editPaymentGateway(item);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
     showCustomSnackBar("updated_successfully".tr, isError: false);
     getSaasPaymentGateway();
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }



  Future<void> paymentGatewayStatusUpdate(int id) async {
    Response? response = await paymentGatewayRepository.updateStatus(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSaasPaymentGateway();
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


  int? selectedIndex;
  String? selectedPaymentType;
  void selectPaymentType(int index, String paymentType) {
    selectedIndex = index;
    selectedPaymentType = paymentType;
    update();
  }



}
  