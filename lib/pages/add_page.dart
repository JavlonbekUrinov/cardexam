import 'package:cardexam/model/model.dart';
import 'package:cardexam/pages/home_page.dart';
import 'package:cardexam/service/service.dart';
import 'package:flutter/material.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);
  static const String id = 'add_card_page';

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

///////////add mock
  void _apiCreatePost(ModelCard card) {
    setState(() {
      isLoading = true;
    });
    Network.POST(Network.API_POST, Network.paramsPost(card)).then((response) {
      if(response != null) {
        setState(() {
          isLoading = false;
        });
      }

    });
  }
      /////////////add
  void _addCard() {
    if(cardNumberController.text.trim().isNotEmpty && dayController.text.trim().isNotEmpty && monthController.text.trim().isNotEmpty && cvvController.text.trim().isNotEmpty && nameController.text.trim().isNotEmpty) {
      _apiCreatePost(
          ModelCard(cardNumberController.text.trim(), nameController.text.trim(), dayController.text.trim() + '/' + monthController.text.trim(), cvvController.text.trim())
      );
      Navigator.pushReplacementNamed(context, CardsPage.id);
    } else {
      print("Please fill all of them");
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pushReplacementNamed(context, CardsPage.id);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 65,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add your card", style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),

                        IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.zoom_out_map, color: Colors.white,)
                        )

                      ],
                    ),

                    const SizedBox(height: 20,),

                    const Text("Fill in the fields below or use camera phone", style: TextStyle(color: Colors.white, fontSize: 16),),

                    const SizedBox(height: 20,),

                    const Text("Your card number", style: TextStyle(color: Colors.white, fontSize: 18),),

                    const SizedBox(height: 5,),

                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        controller: cardNumberController,
                        decoration: const InputDecoration(
                            hintText: "Card number",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                          // suffix:
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    //#DateCVV
                    Container(
                      // width: MediaQuery.of(context).size.width - 50,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          //#ExpiryDate
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Expiry date", style: TextStyle(color: Colors.white, fontSize: 17),),

                                const SizedBox(height: 7,),

                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                          color: Colors.white
                                      ),
                                      child: TextField(
                                        controller: dayController,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          // hintText: "Card number",
                                          // hintStyle: TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                          // suffix:
                                        ),
                                      ),
                                    ),

                                    Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                          color: Colors.white
                                      ),
                                      child: TextField(
                                        controller: monthController,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          // hintText: "Card number",
                                          // hintStyle: TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                          // suffix:
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //#CVV2
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("CVV2", style: TextStyle(color: Colors.white, fontSize: 17),),

                                const SizedBox(height: 7,),

                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white
                                  ),
                                  child: TextField(
                                    controller: cvvController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: "CVV2",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                      // suffix:
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    const Text("Full name", style: TextStyle(color: Colors.white, fontSize: 17),),

                    const SizedBox(height: 7,),

                    //#Fullname
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "FullName",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                          // suffix:
                        ),
                      ),
                    ),


                    const SizedBox(height: 30,),

                    Center(
                      child: MaterialButton(
                        height: 55,
                        minWidth: MediaQuery.of(context).size.width - 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        onPressed: (){
                          _addCard();
                        },
                        child: const Text("Add card", style: TextStyle(fontSize: 19),),
                      ),
                    ),
                  ],
                ),
              ),
              isLoading ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: CircularProgressIndicator())
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}