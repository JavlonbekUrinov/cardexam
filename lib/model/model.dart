
import 'dart:convert';

List<ModelCard> imagesFromJson(String str) => List<ModelCard>.from(json.decode(str).map((x) => ModelCard.fromJson(x)));

String imagesToJson(List<ModelCard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCard{

  late String cardNumber;
  late String cardHolder;
  late String expiredDate;
  late String cvv2;

  ModelCard(this.cardNumber, this.cardHolder, this.expiredDate, this.cvv2);

  ModelCard.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'].toString();
    cardHolder = json['cardHolder'];
    expiredDate = json['expiredDate'].toString();
    cvv2 = json['cvv2'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardNumber'] = cardNumber.toString();
    map['cardHolder'] = cardHolder;
    map['expiredDate'] = expiredDate.toString();
    map['cvv2'] = cvv2.toString();
    return map;
  }

}