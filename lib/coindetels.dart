import 'package:flutter/material.dart';

class CoinDetels extends StatefulWidget {
  CoinDetels(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.per,
      required this.ath,
      required this.rank,
      required this.symbol,
      required this.marketcup,
      required this.high,
      required this.low})
      : super(key: key);

  final String name, image, price, per, ath, rank, symbol, marketcup, high, low;

  @override
  _CoinDetelsState createState() => _CoinDetelsState();
}

class _CoinDetelsState extends State<CoinDetels> {
  @override
  Widget build(BuildContext context) {
    var perW = widget.per;
    var price = widget.price;
    var ath = widget.ath;
    var rank = widget.rank;
    var high = widget.high;
    var low = widget.low;
    var marketcup = widget.marketcup;
    var symbol = widget.symbol.toUpperCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  widget.image,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '24 Hours',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                //total
                Text(
                  '$ath ($perW %)',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '₹ $price',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'RANK $rank',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'GLOBAL RANKING',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: 50,
                ),

                Column(
                  children: [
                    ListTile(
                      leading: Text('Name'),
                      trailing: Text(widget.name),
                    ),
                    ListTile(
                      leading: Text('Symbol'),
                      trailing: Text(symbol),
                    ),
                    ListTile(
                      leading: Text('Price'),
                      trailing: Text('$price'),
                    ),
                    ListTile(
                      leading: Text('High'),
                      trailing: Text('$high'),
                    ),
                    ListTile(
                      leading: Text('Low'),
                      trailing: Text('$low'),
                    ),
                    ListTile(
                      leading: Text('ATH'),
                      trailing: Text('$ath'),
                    ),
                    ListTile(
                      leading: Text('Market Cup'),
                      trailing: Text('$marketcup %'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
