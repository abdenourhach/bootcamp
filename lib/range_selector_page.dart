import 'package:bootcampfirst/Randomizer_page.dart';
import 'package:flutter/material.dart';

import 'RngeSelector_Form.dart';

class RangeSelectorPage extends StatefulWidget {
  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPage();
}

class _RangeSelectorPage extends State<RangeSelectorPage> {
  final fromkey = GlobalKey<FormState>();

  int _min = useState<>(0);
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select Range'),
      ),
      body: RangeselectorForm(
        fromkey: fromkey,
        MaxValueSetter: (value) => _min = value,
        MinValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
//todo validate the form
          if (fromkey.currentState?.validate() == true) {
            fromkey.currentState?.save();
//todo  navigator to the generator page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizePage(min: _min, max: _max),
              ),
            );
          }
        },
      ),
    );
  }
}
