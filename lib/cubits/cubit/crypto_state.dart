part of 'crypto_cubit.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoState {
  const CryptoInitial();

  @override
  List<Object> get props => [];
}

class CryptoLoading extends CryptoState {
  const CryptoLoading();

  @override
  List<Object> get props => [];
}

class CryptoLoaded extends CryptoState {
  final List<Crypto> cryptolist;
  const CryptoLoaded({
    this.cryptolist,
  });

  @override
  List<Object> get props => [cryptolist];

  CryptoLoaded copyWith({
    List<Crypto> cryptolist,
  }) {
    return CryptoLoaded(
      cryptolist: cryptolist ?? this.cryptolist,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cryptolist': cryptolist?.map((x) => x?.toJson())?.toList(),
    };
  }

  factory CryptoLoaded.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CryptoLoaded(
      cryptolist:
          List<Crypto>.from(map['cryptolist']?.map((x) => Crypto.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoLoaded.fromJson(String source) =>
      CryptoLoaded.fromMap(json.decode(source));

  @override
  String toString() => 'CryptoLoaded(cryptolist: $cryptolist)';
}
