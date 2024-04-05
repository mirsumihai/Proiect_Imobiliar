
class House {

  House({
    required this.id,
    required this.price,
    required this.country,
    required this.city,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.squareMeters,
    required this.garages,
    required this.kitchens,
    required this.isFavorite
  });

  int price;
  int bedrooms;
  int bathrooms;
  int garages;
  int kitchens;
  String country;
  String city;
  String address;
  double squareMeters;
  int id;
  bool isFavorite;
}
