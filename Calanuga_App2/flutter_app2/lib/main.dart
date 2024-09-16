import 'package:flutter/material.dart';

void main() {
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Application',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _username = '';
  // ignore: unused_field
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset('Asset/bank.jpeg', 
              fit: BoxFit.cover,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Color.fromARGB(255, 100, 213, 228),
                      border: OutlineInputBorder(),
                      
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  const SizedBox(height: 30),
                  
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Color.fromARGB(255, 100, 213, 228),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), backgroundColor:  const Color.fromARGB(255, 206, 182, 173),), 

      drawer: const BankDrawer(),
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset('Asset/bank2.jpg', 
              fit: BoxFit.cover,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome back, John Wick!",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 127, 198, 216)),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Quick Actions:",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 43, 194, 231)),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountOverviewPage()));
                      },
                      child: const Text("Account Overview",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 7, 6)),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MoneyTransferPage()));
                      },
                      child: const Text("Money Transfer",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 7, 6)),)
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BillPaymentsPage()));
                      },
                      child: const Text("Bill Payments",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 7, 6)),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionHistoryPage()));
                      },
                      child: const Text("Transaction History",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 7, 6)),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), backgroundColor:  const Color.fromARGB(255, 206, 182, 173)),      

      drawer: const BankDrawer(),
      body: const Center(
        child: Text("Account Balance: \$5,000.00"),
      ),
    );
  }
}

class BankDrawer extends StatelessWidget {
  const BankDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://www.google.com/imgres?q=icon%203d%20man&imgurl=https%3A%2F%2Fimg.freepik.com%2Fpremium-psd%2Fdesigner-man-3d-icon-avatar-people_431668-1343.jpg&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Fpremium-psd%2Fdesigner-man-3d-icon-avatar-people_47772100.htm&docid=iKIcy5IxDjEJaM&tbnid=5RPBlJb5AyGwXM&vet=12ahUKEwiszdnQssKIAxUIhlYBHf3bG80QM3oECFUQAA..i&w=626&h=626&hcb=2&ved=2ahUKEwiszdnQssKIAxUIhlYBHf3bG80QM3oECFUQAA'),
                ),
                SizedBox(height: 10),
                Text(
                  'John Wick',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'johnwick@gmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Account Overview'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountOverviewPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Money Transfer'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MoneyTransferPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text('Bill Payments'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BillPaymentsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Transaction History'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionHistoryPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}

class AccountOverviewPage extends StatelessWidget {
  const AccountOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Overview",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      )),
           backgroundColor:  const Color.fromARGB(255, 132, 243, 234),
      body: const Center(child: Text("Account Balance: \$5,000.00",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}

class MoneyTransferPage extends StatelessWidget {
  const MoneyTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Money Transfer", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
      backgroundColor:  const Color.fromARGB(255, 132, 243, 234),
      body: const Center(child: Text("Transfer funds between accounts", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
    );
  }
}

class BillPaymentsPage extends StatelessWidget {
  const BillPaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bill Payments",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
      backgroundColor:  const Color.fromARGB(255, 132, 243, 234),
      body: const Center(child: Text("Pay your bills here",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction History",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
      backgroundColor:  const Color.fromARGB(255, 132, 243, 234),
      body: const Center(child: Text("Your past transactions",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
      backgroundColor:  const Color.fromARGB(255, 132, 243, 234),
      body: const Center(child: Text("Settings page",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)),
    );
  }
}
