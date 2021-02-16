import 'package:crytobloc/cubits/cubit/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoScreen extends StatefulWidget {
  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  CryptoCubit _cryptos;

  @override
  void initState() {
    super.initState();
    _cryptos = context.read<CryptoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoScreen'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _cryptos.getCryptoLists(),
          ),
        ],
      ),
      body: Container(
        // color: Colors.yellow,
        child: BlocBuilder<CryptoCubit, CryptoState>(builder: (context, state) {
          if (state is CryptoLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CryptoLoaded) {
            print(state.cryptolist.length);
            return createList(state);
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget createList(CryptoLoaded state) {
    return ListView.builder(
      itemCount: state.cryptolist.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(20.0),
          leading: Container(
              height: 100,
              width: 50,
              child: Image.network(state.cryptolist[index].logo)),
          title: Text(state.cryptolist[index].coinName),
          trailing: Text(state.cryptolist[index].acronym),
        );
      },
    );
  }
}
