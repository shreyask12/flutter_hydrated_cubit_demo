import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crytobloc/models/crypto.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> with HydratedMixin {
  CryptoCubit() : super(CryptoInitial()) {
    hydrate();
  }
  Response response;
  Dio dio = new Dio();

  Future fetchCryptoLists() async {
    try {
      response = await dio.get(
          "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=100");
      // print(response.data.toString());

      if (response.statusCode == 200) {
        // print(responsedecode);
        List<Crypto> lists = [];
        lists = (response.data as List).map((k) => Crypto.fromJson(k)).toList();
        return lists;
      }
    } catch (e) {
      return e.toString();
    }
  }

  getCryptoLists() async {
    emit(CryptoLoading());

    var data;

    data = await fetchCryptoLists();

    List<Crypto> cryptoLists = [];
    cryptoLists = data;
    emit(CryptoLoaded(cryptolist: cryptoLists));
  }

  @override
  CryptoState fromJson(Map<String, dynamic> json) {
    if (json != null) {
      try {
        return CryptoLoaded.fromMap(json);
      } catch (e) {
        return null;
      }
    } else {
      getCryptoLists();
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(CryptoState state) {
    if (state is CryptoLoaded) {
      return state.toMap();
    } else {
      if (state is CryptoInitial) {
        getCryptoLists();
      }
      return null;
    }
  }
}
