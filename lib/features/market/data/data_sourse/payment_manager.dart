import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clintSecret = await _getClintSecrete(
        (amount * 100).toString(),
        currency,
      );
      await _intializePaymentSheet(clintSecret);
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        print('Payment cancelled by user');
      } else {
        throw Exception(e.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> _intializePaymentSheet(String clintSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clintSecret,
        merchantDisplayName: 'coin_gecko',
      ),
    );
  }

  static Future<String> _getClintSecrete(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {'amount': amount, 'currency': currency},
    );

    return response.data['client_secret'];
  }
}
