import 'package:url_launcher/url_launcher.dart';

class HttpService {

  static sendMessage(
      String number,
      String message,
      String name,
      String total,
      String time,
      String uniqueId,
      String typeOrder,
      String datePickupDelivery,
      String hourPickupDelivery,
      String city,
      String address
      ) async {

    print('Coglione 1');
    var url = 'https://api.whatsapp.com/send/?phone=$number&text=$message';
    print(url);
      try{
        await launch(url);
      }catch(e){
        print('Exception Crud: ' + e.toString());
      }


  }
}
