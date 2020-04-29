class RestaurantTable{

  final String tableId;
  final int tableNo;
  final int seats;

  RestaurantTable({this.tableId, this.tableNo, this.seats});

  Map<String, dynamic> toJson() => {
    'tableId': tableId,
    'tableNo': tableNo,
    'seats': seats,
  };

    RestaurantTable.fromJson(Map<String, dynamic> json)
      : tableId = json['tableId'] ?? '',
        tableNo = json['tableNo'] ?? 0,
        seats = json['seats'] ?? 0;

}