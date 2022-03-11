import 'package:cardexam/model/model.dart';
import 'package:cardexam/pages/add_page.dart';
import 'package:cardexam/service/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);
  static const String id = 'cards_page';

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  bool isLoading = false;
  List<ModelCard> cards = [];


  void _apiPostList() {
    setState(() {
      isLoading = true;
    });
    Network.GET(Network.API_GET, Network.paramsEmpty()).then((response) {
      if(response != null) {
        setState(() {
          _showResponse(response);
        });
      } else {
        if (kDebugMode) {
          print("Response is null");
        }
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  void _showResponse(String? response) {
    setState(() {
      isLoading = false;
      if (response != null) {
        cards = Network.parseResponse(response);
      }
    });
  }

  @override
  void initState() {
    _apiPostList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Good Morning,",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w400),),
                  Text("Jony",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/images/img.png"),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [

          ////////////////////ADD CARD



             Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 25,),

                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                        ),
                        child: Column(
                          children: [

                            const SizedBox(height: 15,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Image.asset('assets/images/img_1.png', height: 35, width: 60, fit: BoxFit.cover,),

                                  Text("VISA",style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ),)

                                ],
                              ),
                            ),

                            const SizedBox(height: 25,),

                            Center(
                              child: Text(cards[index].cardNumber, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
                            ),

                            const SizedBox(height: 30,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("CARD HOLDER", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),),

                                      const SizedBox(height: 5,),

                                      Text(cards[index].cardHolder, style: const TextStyle(color: Colors.black, fontSize: 18),),
                                    ],
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("EXPIRES", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),),

                                      const SizedBox(height: 5,),

                                      Text(cards[index].expiredDate, style: const TextStyle(color: Colors.black, fontSize: 18),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),


                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      border: Border.all(width: 1, color: Colors.grey.shade300)
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, AddCardPage.id);
                            },
                            icon: Icon(Icons.add_box_outlined, size: 40,)
                        ),

                        const SizedBox(height: 5,),
                        const Text("Add new card", style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30,),
              ],
            ),
          ),
          isLoading ?  CircularProgressIndicator() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}