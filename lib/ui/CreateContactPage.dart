import 'package:flutter/material.dart';
import 'package:offline_phone_book/utils/database.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({super.key});

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameController = TextEditingController();

    _phoneController.dispose();
    _phoneController = TextEditingController();

    _emailController.dispose();
    _emailController = TextEditingController();

    super.dispose();
  }

  Future<void> _addData() async {
    await SQLHelper.createData(
        _nameController.text, _phoneController.text, _emailController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New Contact Added !!!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () {
              _addData();
            },
          )
        ],
        title: const Text(
          'Create contact',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: _nameController,
              cursorColor: Colors.black,
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                ),
                //suffixIcon: Icon(Icons.clear),
                labelText: 'Name',
                hintText: 'Md Ashraful Kabir Ashik',
                hintStyle: TextStyle(color: Colors.black26),
                //helperText: 'Username : bigm',
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              obscureText: false,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                //suffixIcon: Icon(Icons.clear),
                labelText: 'Phone',
                hintText: '0181XXXXXXX',
                hintStyle: TextStyle(color: Colors.black26),
                //helperText: 'Password : 12345',
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              obscureText: false,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
                //suffixIcon: Icon(Icons.clear),
                labelText: 'Email',
                hintText: 'example@gmail.com',
                hintStyle: TextStyle(color: Colors.black26),
                //helperText: 'Password : 12345',
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
