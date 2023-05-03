import 'package:crud_flutter_cubit_project/models/anggota.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/anggota_cubit.dart';
import '../routes/AppRoutes.dart';
import '../widget/custom_button.dart';
import '../widget/custom_input.dart';

class AddAnggotaPage extends StatelessWidget {
  AddAnggotaPage({
    super.key,
  });
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Anggota'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Nama Anggota'),
              CustomInput(controller: nameController, hintText: 'Nama Anggota'),
              const SizedBox(
                height: 20,
              ),
              Text('Gaji Anggota'),
              CustomInput(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  hintText: 'Gaji Anggota'),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                backgroundColor: Colors.blueAccent,
                height: 50,
                onPressed: () {
                  final price = int.parse(priceController.text);
                  final anggota =
                      Anggota(name: nameController.text, price: price);
                  context.read<AnggotaCubit>().addAnggota(anggota);
                  Navigator.of(context).pushReplacementNamed(AppRoute.homePage);
                },
                title: 'Save',
              )
            ],
          ),
        ),
      ),
    );
  }
}
