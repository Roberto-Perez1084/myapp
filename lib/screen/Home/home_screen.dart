import 'package:flutter/material.dart';
import '../../bottom_nav_bar.dart';
import '../Details/detail_wallet.dart';
import 'total_wallet_bal.dart';

class WalletHomeScreen extends StatefulWidget {
  const WalletHomeScreen({super.key});

  @override
  _WalletHomeScreenState createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 232, 252),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: [
          myAppBar(),
          const SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailWalletScreen()),
                    );
                  },
                  child: TotalWalletBalance(
                    context: context,
                    totalBalance: '\$39,584',
                    crypto: "Dinero en Billetera",
                    percentage: 3.55,
                  ),
                ),
                TotalWalletBalance(
                  context: context,
                  totalBalance: '\$12,540',
                  crypto: 'Bonos por compras',
                  percentage: -9.999,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Productos adquiridos',
                    style: TextStyle(color: Colors.black38)),
                Row(children: [
                  Text(
                    'Todos',
                    style: TextStyle(color: Colors.black38),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black38),
                ])
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    recentTransaction(
                      iconUrl:
                          'https://icons.iconarchive.com/icons/wackypixel/lesters-electric-guitar/256/Burst-Guitar-icon.png',
                      percentage: 4.32,
                      myCrypto: 'Gibson Les Paul',
                      balance: '\$45,000',
                      profit: '\Guitarra',
                    ),
                    recentTransaction(
                      iconUrl:
                          'https://icons.iconarchive.com/icons/robsonbillponte/sinem/256/File-Music-icon.png',
                      percentage: 3.97,
                      myCrypto: 'Orange Crush 20',
                      balance: '\$5,000',
                      profit: '\Amplificador',
                    ),
                    recentTransaction(
                      iconUrl:
                          'https://icons.iconarchive.com/icons/salleedesign/music/256/guitar-stratocaster-orange-icon.png',
                      percentage: 13.55,
                      myCrypto:  'Fender Stratocaster',
                      balance: '\$42,000',
                      profit:'\Guitarra',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container myAppBar() {
    return Container(
      height: 110,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.notes,
            color: Colors.black87,
          ),
          const Text(
            "Wallets",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset("images/icon1.png", height: 25),
        ],
      ),
    );
  }
}

class recentTransaction extends StatelessWidget {
  const recentTransaction({
    super.key,
    required this.iconUrl,
    required this.percentage,
    required this.myCrypto,
    required this.balance,
    required this.profit,
  });

  final String iconUrl;
  final double percentage;
  final String myCrypto;
  final balance;
  final profit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              iconUrl,
              width: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    myCrypto,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    profit,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$balance',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  percentage >= 0 ? '+$percentage%' : '$percentage%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: percentage >= 0 ? Colors.green : Colors.pink,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}