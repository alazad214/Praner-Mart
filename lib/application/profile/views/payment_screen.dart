import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      cardNumber: '**** **** **** 1234',
      cardHolder: 'John Doe',
      expiryDate: '12/24',
    ),
    PaymentMethod(
      cardNumber: '**** **** **** 5678',
      cardHolder: 'Jane Smith',
      expiryDate: '11/23',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
        backgroundColor: Color(0xFF0F2027),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddPaymentMethodDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            final paymentMethod = paymentMethods[index];
            return _buildPaymentMethodCard(context, paymentMethod);
          },
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(BuildContext context, PaymentMethod paymentMethod) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/icons/credit_card.svg',
          height: 40,
          width: 40,
        ),
        title: Text(
          paymentMethod.cardHolder,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(paymentMethod.cardNumber),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            _showDeleteConfirmationDialog(context, paymentMethod);
          },
        ),
        onTap: () {
          // Navigate to edit payment method screen
        },
      ),
    );
  }

  void _showAddPaymentMethodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Payment Method'),
          content: AddPaymentMethodForm(onAdd: (newMethod) {
            setState(() {
              paymentMethods.add(newMethod);
            });
            Navigator.of(context).pop();
          }),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, PaymentMethod paymentMethod) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Payment Method'),
          content: Text('Are you sure you want to delete this payment method?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  paymentMethods.remove(paymentMethod);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class AddPaymentMethodForm extends StatefulWidget {
  final void Function(PaymentMethod) onAdd;

  AddPaymentMethodForm({required this.onAdd});

  @override
  _AddPaymentMethodFormState createState() => _AddPaymentMethodFormState();
}

class _AddPaymentMethodFormState extends State<AddPaymentMethodForm> {
  final _formKey = GlobalKey<FormState>();
  late String _cardNumber;
  late String _cardHolder;
  late String _expiryDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Card Number'),
            keyboardType: TextInputType.number,
            onChanged: (value) => _cardNumber = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a card number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Card Holder'),
            onChanged: (value) => _cardHolder = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the card holder\'s name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
            keyboardType: TextInputType.number,
            onChanged: (value) => _expiryDate = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the expiry date';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onAdd(PaymentMethod(
                  cardNumber: _cardNumber,
                  cardHolder: _cardHolder,
                  expiryDate: _expiryDate,
                ));
              }
            },
            child: Text('Add Payment Method'),
          ),
        ],
      ),
    );
  }
}

class PaymentMethod {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  PaymentMethod({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });
}
