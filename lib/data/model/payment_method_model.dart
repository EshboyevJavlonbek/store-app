class PaymentMethodModel {
  final int id, card;
  final String promo;

  PaymentMethodModel({
    required this.id,
    required this.card,
    required this.promo,
  });

  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "card": card,
      "promo": promo,
    };
  }
}
