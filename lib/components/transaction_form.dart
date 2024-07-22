import 'package:expenses/components/adaptive_button.dart';
import 'package:expenses/components/adaptive_date_picker.dart';
import 'package:expenses/components/adaptive_text_field.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm(BuildContext context) {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + mediaQuery.viewInsets.bottom),
          child: Column(
            children: [
              AdaptiveTextField(
                controller: _titleController,
                submitForm: (_) => _submitForm(context),
                label: 'Título',
              ),
              AdaptiveTextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                submitForm: (_) => _submitForm(context),
                label: 'Valor R\$',
              ),
              AdaptiveDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptiveButton(
                      label: 'Nova transação',
                      onPressed: () => _submitForm(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
