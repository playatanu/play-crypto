import 'package:flutter/material.dart';
import 'package:playcrypto/coindetels.dart';
import 'services/apiServices.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService postService = ApiService();

  @override
  void initState() {
    postService.getPost();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF151026)),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        accentColor: Color(0xFF151026),
        scaffoldBackgroundColor: Color(0xFF151026),
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        canvasColor: Color(0xFF151026),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PLAYCRYPTO'),
        ),
        body: FutureBuilder(
            future: postService.getPost(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String price =
                          (snapshot.data?[index]['current_price']).toString();
                      String rank =
                          (snapshot.data?[index]['market_cap_rank']).toString();

                      String high =
                          (snapshot.data?[index]['high_24h']).toString();
                      String low =
                          (snapshot.data?[index]['low_24h']).toString();

                      String pricePar = double.parse(((snapshot.data?[index]
                                  ['price_change_percentage_24h']))
                              .toStringAsFixed(2))
                          .toString();

                      String marketcap = double.parse(((snapshot.data?[index]
                                  ['market_cap_change_percentage_24h']))
                              .toStringAsFixed(2))
                          .toString();

                      String ath = double.parse(((snapshot.data?[index]['ath']))
                              .toStringAsFixed(2))
                          .toString();

                      Color selectColor;
                      ((snapshot.data?[index]['price_change_percentage_24h']) >
                              0)
                          ? selectColor = const Color(0xff4caf50)
                          : selectColor = const Color(0xfff44336);

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoinDetels(
                                        name: (snapshot.data?[index]['name']),
                                        image: (snapshot.data?[index]['image']),
                                        per: pricePar.toString(),
                                        price: price.toString(),
                                        ath: ath,
                                        rank: rank,
                                        high: high,
                                        low: low,
                                        symbol: (snapshot.data?[index]
                                                ['symbol'])
                                            .toString(),
                                        marketcup: marketcap,
                                      )));
                        },
                        child: ListTile(
                            title: Text(snapshot.data?[index]['name']),
                            subtitle: Text(
                              '₹ $price',
                              style: TextStyle(color: Colors.white30),
                            ),
                            trailing: Text(
                              '$pricePar %',
                              style: TextStyle(
                                  color: selectColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            leading: Image.network(
                              snapshot.data?[index]['image'],
                              width: 40,
                              fit: BoxFit.fill,
                            )

                            // subtitle: Text(snapshot.data?[index]['current_price']),
                            //trailing: )
                            ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('data');
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
