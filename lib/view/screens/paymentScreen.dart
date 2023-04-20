import 'package:flutter/material.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({super.key});

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
  }

  @override
  void dispose() {
    super.dispose();
  }
int selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          TabBar(
            onTap: (value) {
              setState(() {
                selected=value;
              });
              
            },
            controller: _tabController,
            
            tabs: [
             tabBar('Visa','assets/icons/visa.png'),
              tabBar('Paypal','assets/icons/paypal.png'),
               tabBar('Pay at office','assets/icons/workspace.png')
            ]),
             Expanded(
               child: PageView(children: [
                VisaPaymentScreen(),
                VisaPaymentScreen(),
               ],),
             )
        ],
      )
    );
  }
}

class tabBar extends StatelessWidget {
  String index,img;
  tabBar(this.index,this.img);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(padding: EdgeInsets.all(10), child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$index'),
          Spacer(),
          Expanded(child: Image.asset(img,))
        ],
      )),
    );
  }
}




class VisaPaymentScreen extends StatefulWidget {
  @override
  _VisaPaymentScreenState createState() => _VisaPaymentScreenState();
}

class _VisaPaymentScreenState extends State<VisaPaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter card number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expiry Date',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: expiryDateController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter CVV',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Perform payment action
                },
                child: Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
