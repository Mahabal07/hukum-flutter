import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MilkCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MilkCalculator extends StatefulWidget {
  @override
  _MilkCalculatorState createState() => _MilkCalculatorState();
}

class _MilkCalculatorState extends State<MilkCalculator> {
  bool isNavbarVisible = false;
  DateTime? selectedDate;

  void toggleNavbar() {
    setState(() {
      isNavbarVisible = !isNavbarVisible;
    });
  }

  void submitForm() {
    // Add your form submission logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Milk Dairy Report'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Text(
                'Milk Calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Add navigation logic for Home
              },
            ),
            ListTile(
              title: Text('Item'),
              onTap: () {
                // Add navigation logic for Item
              },
            ),
            ListTile(
              title: Text('Milk History'),
              onTap: () {
                // Add navigation logic for Milk History
              },
            ),
            ListTile(
              title: Text('Item History'),
              onTap: () {
                // Add navigation logic for Item History
              },
            ),
            ListTile(
              title: Text('Account History'),
              onTap: () {
                // Add navigation logic for Account History
              },
            ),
            ListTile(
              title: Text('Milk Rate'),
              onTap: () {
                // Add navigation logic for Milk Rate
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Date:'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                  text: selectedDate != null
                      ? formatDate(selectedDate!, [yyyy, '-', mm, '-', dd])
                      : '',
                ),
              ),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    child: Text('Morning'),
                    value: 'morning',
                  ),
                  DropdownMenuItem(
                    child: Text('Evening'),
                    value: 'evening',
                  ),
                ],
                onChanged: (value) {
                  // Handle dropdown value change
                },
                decoration: InputDecoration(labelText: 'Morning or Evening:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Litres:'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
