import 'package:bitcoin_tracker/service/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/ratecard_widget.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';
  List<String> crypto = cryptoList;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownItem.add(newItem);
    }
    return DropdownButton(
        value: selectedCurrency,
        items: dropDownItem,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
          });
        });
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(Text(currency));
    }
    return CupertinoPicker(
        itemExtent: 36.0,
        onSelectedItemChanged: (selectedCurrency) {
          setState(() {
            selectedCurrency;
          });
        },
        children: pickerItem);
  }

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=B9F47E50-1DEB-4F14-8626-5E75FE2AEC79#'),
    );
    var data = json.decode(response.body);
    return data['rate'];
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.all(18),
          itemBuilder: (context, index) {
            return RateCard(
                selectedCurrency: selectedCurrency, crypto: cryptoList[index]);
          }),
      bottomSheet: Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: Platform.isIOS ? iosPicker() : androidDropdown(),
      ),
    );
  }
}

// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.stretch,
//   children: <Widget>[
//     Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: RateCard(
//         selectedCurrency: selectedCurrency,
//         crypto: cryptoList[0],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: RateCard(
//         selectedCurrency: selectedCurrency,
//         crypto: cryptoList[1],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: RateCard(
//         selectedCurrency: selectedCurrency,
//         crypto: cryptoList[2],
//       ),
//     ),
//   ],
// ),
