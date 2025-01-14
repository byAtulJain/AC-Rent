import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Admin Nav Bar/app_bar.dart';
import '../Admin Nav Bar/app_drawer.dart';

class ManageRentPeriodPage extends StatefulWidget {
  @override
  _ManageRentPeriodPageState createState() => _ManageRentPeriodPageState();
}

class _ManageRentPeriodPageState extends State<ManageRentPeriodPage> {
  final TextEditingController _rentPeriodController = TextEditingController();
  bool _isLoading = false;

  Future<void> _addRentPeriod() async {
    if (_rentPeriodController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseFirestore.instance.collection('Rent Period').add({
          'period': _rentPeriodController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rent period added successfully!')),
        );

        _rentPeriodController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding rent period: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _deleteRentPeriod(
      String rentPeriodId, String rentPeriodName) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Check if the rent period is used in any product
      final productsSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('rentPeriod', isEqualTo: rentPeriodName)
          .get();

      if (productsSnapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Rent period is used in products and cannot be deleted.')),
        );
      } else {
        await FirebaseFirestore.instance
            .collection('Rent Period')
            .doc(rentPeriodId)
            .delete();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rent period deleted successfully!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting rent period: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double baseTextScale = isSmallScreen ? 0.8 : 1.0;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Manage Rent Periods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rentPeriodController,
              decoration: InputDecoration(
                labelText: 'Rent Period',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _addRentPeriod,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF990011), // Button color
              ),
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      'Add Rent Period',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Rent Period')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final rentPeriods = snapshot.data?.docs ?? [];

                  return ListView.builder(
                    itemCount: rentPeriods.length,
                    itemBuilder: (context, index) {
                      final rentPeriod = rentPeriods[index];
                      return ListTile(
                        title: Text(rentPeriod['period']),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Color(0xFF990011)),
                          onPressed: () => _deleteRentPeriod(
                              rentPeriod.id, rentPeriod['period']),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rentPeriodController.dispose();
    super.dispose();
  }
}
