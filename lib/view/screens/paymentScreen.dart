import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel/constants.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:travel/controller/pflightProvider.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({super.key});

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TabBar(
            onTap: (value) {
              _pageController.animateToPage(value,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceOut);
            },
            controller: _tabController,
            tabs: [
              tabBar('Visa', 'assets/icons/visa.png'),
              tabBar('Paypal', 'assets/icons/paypal.png'),
              tabBar('Cash', 'assets/icons/money.png')
            ]),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [
              VisaPaymentScreen('Visa'),
              VisaPaymentScreen('PayPal'),
              AtOfficeScreen()
            ],
          ),
        )
      ],
    ));
  }
}

class AtOfficeScreen extends StatelessWidget {
  const AtOfficeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Phone number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: 'Enter your phone number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                // Perform payment action
              },
              child: Icon(Icons.arrow_forward),
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Please Notice That our office time start at 10 AM until 10 PM,\nExcept Sunday start at 2 PM until 8 Pm',
            style: constants().bigFontStyle.copyWith(color: Colors.black),
          ),
          Expanded(
              child: Center(
                  child: Lottie.asset(
                      'assets/lotties/65162-isometric-plane.json')))
        ]),
      ),
    );
  }
}

class tabBar extends StatelessWidget {
  String index, img;
  tabBar(this.index, this.img);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$index'),
              Spacer(),
              Expanded(
                  child: Image.asset(
                img,
              ))
            ],
          )),
    );
  }
}

class VisaPaymentScreen extends StatefulWidget {
  String cardName;
  VisaPaymentScreen(this.cardName);
  @override
  _VisaPaymentScreenState createState() => _VisaPaymentScreenState();
}

class _VisaPaymentScreenState extends State<VisaPaymentScreen>{
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
            
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Amount: ${Provider.of<flight>(context).seatsNum*800}\$,',style: constants().bigFontStyle.copyWith(color: Colors.black),)),
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  cardBgColor: Colors.black,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  bankName: widget.cardName,
                  frontCardBorder:
                      !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                  backCardBorder:
                      !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                 
                 
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Glassmorphism',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              Switch(
                                value: useGlassMorphism,
                                inactiveTrackColor: Colors.grey,
                                activeColor: Colors.white,
                               
                                onChanged: (bool value) => setState(() {
                                  useGlassMorphism = value;
                                }),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Card Image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              Switch(
                                value: useBackgroundImage,
                                inactiveTrackColor: Colors.grey,
                                activeColor: Colors.white,
                                
                                onChanged: (bool value) => setState(() {
                                  useBackgroundImage = value;
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: _onValidate,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                             
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
}
}
