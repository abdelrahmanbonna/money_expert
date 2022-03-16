import 'dart:convert';

class User {
  final String userName, imageURL;
  final double cashBalance, bankBalance;
  User({
    required this.userName,
    required this.imageURL,
    required this.bankBalance,
    required this.cashBalance,
  });


  User copyWith({
    String? userName,imageURL,
    double? cashBalance, bankBalance,
  }) {
    return User(
      userName: userName ?? this.userName,
      imageURL: imageURL ?? this.imageURL,
      bankBalance: bankBalance ?? this.bankBalance,
      cashBalance: cashBalance ?? this.cashBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'imageURL':imageURL,
      'bankBalance': bankBalance,
      'cashBalance':cashBalance,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName:map['userName'] ?? '',imageURL: map['imageURL'] ?? '',
      bankBalance: map['bankBalance'],
      cashBalance:  map['cashBalance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(userName: $userName , imageURL: $imageURL, bankBalance: $bankBalance, cashBalance: $cashBalance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.userName==userName&& imageURL == imageURL &&
      other.bankBalance == bankBalance && other.cashBalance == cashBalance;
  }

  @override
  int get hashCode => userName.hashCode ^ imageURL.hashCode ^ bankBalance.hashCode ^ cashBalance.hashCode;
}
