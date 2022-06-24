import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeselectorForm extends StatelessWidget {
  RangeselectorForm({
    Key? key,
    required this.fromkey,
    required this.MaxValueSetter,
    required this.MinValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> fromkey;
  final IntValueSetter MaxValueSetter;
  final IntValueSetter MinValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectorTextFromField(
              labelText: 'Minimum',
              intvalueSetter: (value) => MaxValueSetter,
            ),
            SizedBox(
              height: 12,
            ),
            SelectorTextFromField(
              labelText: 'Maximum',
              intvalueSetter: (value) => MinValueSetter,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorTextFromField extends StatelessWidget {
  SelectorTextFromField({
    Key? key,
    required this.labelText,
    required this.intvalueSetter,
  }) : super(key: key);

  final String labelText;

  final IntValueSetter intvalueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: labelText),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intvalueSetter(int.parse(newValue ?? '')),
    );
  }
}
