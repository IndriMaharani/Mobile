import 'package:flutter/material.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';
import 'package:get/get.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cId,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Id"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: controller.cJabatan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Jabatan"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cId.text,
                controller.cNama.text,
                controller.cJabatan.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
