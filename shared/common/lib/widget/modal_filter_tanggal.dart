import 'package:core/dependency.dart';
import 'package:flutter/material.dart';

import '../common.dart';

final _formKey = GlobalKey<FormBuilderState>();

class ModalFilterRentangTanggal extends StatelessWidget with BaseWidget {
  final bool isSingleDate;
  final String? title;
  final String? hintStart;
  final String? hintEnd;
  const ModalFilterRentangTanggal({
    super.key,
    this.isSingleDate = false,
    this.title,
    this.hintStart,
    this.hintEnd,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? awal;
    DateTime? akhir;
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title ?? "Filter",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: TextFieldForm(
                  label: "",
                  hint: hintStart ?? "Tanggal awal",
                  name: "awal",
                  readOnly: true,
                  suffixIcon: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final result = await showBaseModal<DateTime>(
                        context, (p0) => ModalPilihTanggal(),
                        isScrollControlled: true);
                    if (result != null) {
                      awal = result;
                      _formKey.setValue(
                          "awal", result.getFormatedString("MMMM yyyy"));
                    }
                  },
                )),
                if (!isSingleDate) const CustomText(" - "),
                if (!isSingleDate)
                  Expanded(
                      child: TextFieldForm(
                    label: "",
                    hint: hintEnd ?? "Tanggal akhir",
                    name: "akhir",
                    suffixIcon: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final result = await showBaseModal<DateTime>(
                          context, (p0) => ModalPilihTanggal(),
                          isScrollControlled: true);
                      if (result != null) {
                        akhir = result;
                        _formKey.setValue(
                            "akhir", result.getFormatedString("MMMM yyyy"));
                      }
                    },
                  )),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
                onPressed: () {
                  if (_formKey.isNotValid) {
                    return;
                  }
                  Navigator.pop(context, {"awal": awal, "akhir": akhir});
                },
                buttonText: "Tampilkan"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ModalPilihTanggal extends StatefulWidget {
  final DateTime? initial;
  final bool showDay;
  final bool showMonth;
  final bool showYear;
  const ModalPilihTanggal({
    super.key,
    this.initial,
    this.showDay = false,
    this.showMonth = true,
    this.showYear = true,
  });

  @override
  State<ModalPilihTanggal> createState() => _ModalPilihTanggalState();
}

final _datePickerForm = GlobalKey<FormState>();

class _ModalPilihTanggalState extends State<ModalPilihTanggal> {
  late DateTime pick;
  @override
  void initState() {
    pick = widget.initial ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _datePickerForm,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              "Pilih Tanggal",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 16),
            DropdownDatePicker(
              selectedDay: pick.day,
              selectedMonth: pick.month,
              selectedYear: pick.year,
              inputDecoration: const InputDecoration(
                contentPadding: EdgeInsets.all(2),
                filled: true,
                fillColor: Colors.white,
                hintStyle:
                    TextStyle(fontSize: 12, color: ColorPalletes.abuabuNormal),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: ColorPalletes.abuabuNormal)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: ColorPalletes.abuabuNormal)),
              ),
              onChangedDay: (value) => setState(() {
                pick = pick.copyWith(day: value);
              }),
              onChangedMonth: (value) => setState(() {
                pick = pick.copyWith(month: value);
              }),
              onChangedYear: (value) => setState(() {
                pick = pick.copyWith(year: value);
              }),
              showDay: widget.showDay,
              showMonth: widget.showMonth,
              showYear: widget.showYear,
              hintMonth: "Bulan",
              hintYear: "Tahun",
              isFormValidator: true,
              locale: "id",
            ),
            const SizedBox(height: 16),
            CustomButton(
                onPressed: () {
                  if (_datePickerForm.currentState?.validate() == false) {
                    return;
                  }
                  print(pick.toIso8601String());
                  Navigator.pop(context, pick);
                },
                buttonText: "Pilih"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
