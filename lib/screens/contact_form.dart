import 'package:flutter/material.dart';
import 'package:poc_byte_bank_v2/database/dao/contact_dao.dart';
import 'package:poc_byte_bank_v2/models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  void _createContact(context) {
    final String name = _nameController.text;
    final int? accountNumber = int.tryParse(_accountNumberController.text);

    if (name.isNotEmpty && accountNumber != null) {
      final Contact newContact = Contact(null, name, accountNumber);
      _dao.save(newContact).then((id) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('new contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('full name'),
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                controller: _nameController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('account number'),
                  ),
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                  controller: _accountNumberController,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () => _createContact(context),
                      child: const Text('Create')),
                ),
              )
            ],
          ),
        ));
  }
}
