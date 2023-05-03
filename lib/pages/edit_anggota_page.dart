import 'package:crud_flutter_cubit_project/cubit/anggota_cubit.dart';
import 'package:crud_flutter_cubit_project/models/anggota.dart';
import 'package:crud_flutter_cubit_project/routes/AppRoutes.dart';
import 'package:crud_flutter_cubit_project/widget/custom_button.dart';
import 'package:crud_flutter_cubit_project/widget/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAnggotaPage extends StatelessWidget {
  final Anggota? anggota;
  const EditAnggotaPage({
    super.key,
    this.anggota,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: anggota!.name);
    final priceController =
        TextEditingController(text: anggota!.price.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Anggota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Nama Anggota'),
            CustomInput(controller: nameController, hintText: 'Nama Anggota'),
            Text('Gaji Anggota'),
            CustomInput(
              keyboardType: TextInputType.number,
              controller: priceController,
              hintText: 'Gaji Anggota',
            ),
            CustomButton(
              onPressed: () {
                final price = int.parse(priceController.text);
                final inputAnggota = Anggota(
                  id: anggota!.id,
                  name: nameController.text,
                  price: price,
                );
                context.read<AnggotaCubit>().updateAnggota(inputAnggota);
                Navigator.pushReplacementNamed(context, AppRoute.homePage);
              },
              title: 'Save',
              height: 50,
              backgroundColor: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
