import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/database.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _refreshData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameController = TextEditingController();
    super.dispose();
  }

  List<Map<String, dynamic>> _allData = [];

  void _searchData(String name) async {
    if (name.isEmpty) {
      _refreshData();
    } else {
      final data = await SQLHelper.searchByName(name);
      setState(() {
        _allData = data;
      });
    }
  }

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
    });
  }

  Future<void> _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Contact Deleted !!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        surfaceTintColor: Colors.transparent,
        title: TextField(
          keyboardType: TextInputType.text,
          controller: _nameController,
          onChanged: (value) {
            _searchData(value);
          },
          cursorColor: Colors.black,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            suffixIcon: IconButton(
              onPressed: _nameController.clear,
              icon: const Icon(Icons.clear),
            ),
            //labelText: 'Name',
            hintText: 'Search By Name',
            hintStyle: const TextStyle(
                color: Colors.black26, fontWeight: FontWeight.w900),
            //helperText: 'Username : bigm',
            filled: false,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        itemCount: _allData.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Card(
            elevation: 1,
            color: Colors.white,
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _allData[index]['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    _allData[index]['phone'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                _allData[index]['email'],
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  _deleteData(_allData[index]['id']);
                  _refreshData();
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
