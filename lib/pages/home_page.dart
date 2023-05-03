import 'package:crud_flutter_cubit_project/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/anggota_cubit.dart';
import '../widget/custom_button.dart';
import '../widget/custom_card.dart';
import 'edit_anggota_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addAnggotaPage);
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Home Page',
          ),
        ),
        body: BlocBuilder<AnggotaCubit, AnggotaState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.anggota.isEmpty) {
              return Center(
                child: Text(
                  'Produk masih kosong',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return ListView.separated(
                  itemBuilder: (_, index) {
                    final anggota = state.anggota[index];
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: CustomCard(
                        children: [
                          Text(
                            anggota.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            anggota.price.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              CustomButton(
                                backgroundColor: Colors.amber,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditAnggotaPage(
                                          anggota: anggota,
                                        ),
                                      ));
                                },
                                title: 'Edit',
                                height: 30,
                                width: 100,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomButton(
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  context
                                      .read<AnggotaCubit>()
                                      .deleteAnggota(anggota);
                                },
                                title: 'Delete',
                                height: 30,
                                width: 100,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: state.anggota.length);
            }
          },
        ));
  }
}
