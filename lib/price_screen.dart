import 'package:bitcoin_tracker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

List<DropdownMenuItem> getDropdownItem() {
  List<DropdownMenuItem<String>> dropDownItem = [];
  for (String currency in currenciesList) {
    var newItem = DropdownMenuItem(
      child: Text(currency),
      value: currency,
    );
    dropDownItem.add(newItem);
  }
  return dropDownItem;
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';
  @override
  Widget build(BuildContext context) {
    getDropdownItem();
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
                value: selectedCurrency,
                items: getDropdownItem(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                    print(selectedCurrency);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
// CupertinoPicker(
//     itemExtent: 36.0,
//     onSelectedItemChanged: (selectedCurrency) {
//       setState(() {
//         print(selectedCurrency);
//       });
//     },
//     children: getDropdownItem()),
