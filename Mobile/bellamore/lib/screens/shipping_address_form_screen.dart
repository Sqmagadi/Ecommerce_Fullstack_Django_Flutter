import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shipping_address_provider.dart';

class ShippingAddressForm extends StatefulWidget {
  @override
  _ShippingAddressFormState createState() => _ShippingAddressFormState();
}

class _ShippingAddressFormState extends State<ShippingAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _countryController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    final provider = Provider.of<ShippingAddressProvider>(context, listen: false);
    try {
      await provider.fetchShippingAddress();
      final shippingAddress = provider.shippingAddress;
      if (shippingAddress != null) {
        _phoneController.text = shippingAddress.phone ?? '';
        _fullNameController.text = shippingAddress.fullName ?? '';
        _emailController.text = shippingAddress.email ?? '';
        _address1Controller.text = shippingAddress.address1 ?? '';
        _address2Controller.text = shippingAddress.address2 ?? '';
        _cityController.text = shippingAddress.city ?? '';
        _stateController.text = shippingAddress.state ?? '';
        _zipcodeController.text = shippingAddress.zipcode ?? '';
        _countryController.text = shippingAddress.country ?? '';
      }
    } catch (error) {
      // Handle fetch error
      // ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar(
          // content: Text('Error fetching data: $error'),
      //   // ),
      // );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipcodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _phoneController.clear();
    _fullNameController.clear();
    _emailController.clear();
    _address1Controller.clear();
    _address2Controller.clear();
    _cityController.clear();
    _stateController.clear();
    _zipcodeController.clear();
    _countryController.clear();
  }

  void _saveForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      final provider = Provider.of<ShippingAddressProvider>(context, listen: false);
      try {
        await provider.createOrUpdateShippingAddress(
          phone: _phoneController.text,
          fullName: _fullNameController.text,
          email: _emailController.text,
          address1: _address1Controller.text,
          address2: _address2Controller.text,
          city: _cityController.text,
          state: _stateController.text,
          zipcode: _zipcodeController.text,
          country: _countryController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Shipping address saved successfully'),
          ),
        );
        Navigator.pop(context);
      } catch (error) {
        // Handle save error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving data: $error'),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(labelText: 'Full Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _address1Controller,
                      decoration: InputDecoration(labelText: 'Address 1'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _address2Controller,
                      decoration: InputDecoration(labelText: 'Address 2'),
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(labelText: 'City'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _stateController,
                      decoration: InputDecoration(labelText: 'State'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your state';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _zipcodeController,
                      decoration: InputDecoration(labelText: 'Zip Code'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your zip code';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _countryController,
                      decoration: InputDecoration(labelText: 'Country'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your country';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _clearForm,
                          child: Text('Clear'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _saveForm,
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
