import 'package:chopper/chopper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osteriasantannamenu/utils/costants.dart';
import 'package:provider/provider.dart';
import '../../../databundle/databundleprovider.dart';
import '../../../osteriasantanna/swagger.enums.swagger.dart';
import '../../../osteriasantanna/swagger.models.swagger.dart';
import '../../../utils/utils.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {


  late TextEditingController nameController;
  late TextEditingController ingredientsController;
  late TextEditingController priceController;

  @override
  void initState() {
    nameController = TextEditingController();
    ingredientsController = TextEditingController();
    priceController = TextEditingController();
    dropdownvalue = productCategoryToJson(widget.product.category)!;
    super.initState();
  }

  String dropdownvalue = 'ANTIPASTI';

  @override
  Widget build(BuildContext context) {

    return Consumer<DataBundleNotifier>(
      builder: (child, databundle, _){

        return GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.blueGrey),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text('Crea vino', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.grey.shade700, fontFamily: 'Dance')),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(

                children: [
                  buildTextFieldInput(nameController, "Nome"),
                  buildTextFieldInput(ingredientsController, "Ingredienti"),
                  buildTextFieldInput(priceController, "Prezzo"),

                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      focusColor: OSTERIA_GOLD,
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 20,
                            color: OSTERIA_GOLD,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: OSTERIA_GOLD,
                                  fontFamily: 'Dance'
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: createList()
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                      value: dropdownvalue,
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value.toString();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: OSTERIA_GOLD,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 300,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: OSTERIA_GOLD,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 5,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 10,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 10,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if(nameController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                                content: Text('Errore. Nome Obbligatorio'),
                              )
                          );
                        }else if(priceController.text == ''){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                                content: Text('Errore. Prezzo Obbligatorio'),
                              )
                          );
                        }else if(double.tryParse(priceController.text.replaceAll(',', '.')) == null){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                                content: Text('Errore. Il prezzo deve essere un numero'),
                              )
                          );
                        }else{
                          Response apiProductSave = await databundle.getSwaggerClient().apiV1ProductSavePost(
                              category: dropdownvalue,
                              name: nameController.text,
                              available: true,
                              price: double.parse(priceController.text.replaceAll(',', '.')),
                              productId: 0,
                              ingredients: ingredientsController.text,
                              subCategory: ''
                          );

                          if(apiProductSave.isSuccessful){

                            Response<List<Product>> apiProd = await databundle.getSwaggerClient().apiV1ProductFindallGet();
                            if(apiProd.isSuccessful){
                              databundle.setProdList(apiProd.body);
                            }
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Utils.getWineColor(wineWineTypeFromJson(dropdownvalue)),
                                  content: Text('${nameController.text} creato correttamente'),
                                )
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.red,
                                  content: Text('Errore. ' + apiProductSave.error.toString()),
                                )
                            );
                          }
                        }

                      },
                      child: Text('Crea Prodotto'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.lightGreen)),
                    ),
                  )
                ],
              ),
            ),

          ),
        );
      },

    );
  }

  buildTextFieldInput(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            labelText: label,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide:
              BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: OutlineInputBorder()),
        controller: controller,
      ),
    );
  }

  List<String> createList() {
    List<String> list = [];
    ProductCategory.values.forEach((element) {
      if(element != 'swaggerGeneratedUnknown' && element != 'null'){
        list.add(productCategoryToJson(
            element
        ).toString());
      }
    });
    return list;
  }

}
