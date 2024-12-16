import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart'; 
import 'package:flutter/material.dart';

class PegawaiController extends GetxController {
  //TODO: Implement MahasiswaController
  late TextEditingController cId;
  late TextEditingController cNama;
  late TextEditingController cJabatan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pegawai = firestore.collection('pegawai');

    return pegawai.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference pegawai = firestore.collection('pegawai');
    return pegawai.snapshots();
  }

  void add(String id, String nama, String jabatan) async {
    CollectionReference pegawai = firestore.collection("pegawai");

    try {
      await pegawai.add({
        "id": id,
        "nama": nama,
        "jabatan": jabatan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai",
          onConfirm: () {
            cId.clear();
            cNama.clear();
            cJabatan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pegawai.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    return docRef.get();
  }

  void Update(String id, String nama, String jabatan) async {
    DocumentReference pegawaiById = firestore.collection("pegawai").doc(id);

    try {
      await pegawaiById.update({
        "id": id,
        "nama": nama,
        "jabatan": jabatan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Pegawai.",
        onConfirm: () {
          cId.clear();
          cNama.clear();
          cJabatan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pegawai.",
      );
    }
  }

    void delete(String id) {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  


  @override
  void onInit() {
    // TODO: implement onInit
    cId = TextEditingController();
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cId.dispose();
    cNama.dispose();
    cJabatan.dispose();
    super.onClose();
  }
}