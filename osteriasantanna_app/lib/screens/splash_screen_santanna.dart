import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../databundle/databundleprovider.dart';
import '../osteriasantanna/swagger.models.swagger.dart';
import '../utils/costants.dart';
import 'menu/home_screen.dart';

class SplashScreenSantAnna extends StatefulWidget {
  static String id = 'homeosteria';
  @override
  _SplashScreenSantAnnaState createState() => _SplashScreenSantAnnaState();
}

class _SplashScreenSantAnnaState extends State<SplashScreenSantAnna> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBundleNotifier>(
      builder: (child, bundleNotifier, _){
        return SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 0),
                Container(
                  width: 200,
                  height: 300,
                  color: Colors.white,
                  child: Image.asset('images/donna.png',

                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: OSTERIA_GOLD)
                                )
                            )
                        ),
                        onPressed: () async {
                      try{
                        Response<List<Product>> apiV1ProductFindallGet = await bundleNotifier.getSwaggerClient().apiV1ProductFindallGet();
                        Response<List<Wine>> apiV1WineFindallGet = await bundleNotifier.getSwaggerClient().apiV1WineFindallGet();
                        Response<List<Sushi>> apiV1SushiFindallGet = await bundleNotifier.getSwaggerClient().apiV1SushiFindallGet();


                        if(apiV1ProductFindallGet.isSuccessful){
                          bundleNotifier.setProdList(apiV1ProductFindallGet.body);
                        }

                        if(apiV1WineFindallGet.isSuccessful){
                          bundleNotifier.setWineList(apiV1WineFindallGet.body);
                        }

                        if(apiV1SushiFindallGet.isSuccessful){
                          bundleNotifier.setSushiList(apiV1SushiFindallGet.body);
                        }

                        Navigator.pushNamed(context, HomeScreen.id);
                      }catch(e){
                        print(e);
                      }

                    }, child: Text('Accedi', style: TextStyle(fontWeight: FontWeight.bold, color:
                    OSTERIA_GOLD, fontSize: 25, fontFamily: 'Dance'))),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}