import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProvider = Provider(
  (_) => FirebaseFirestore.instance,
);

final firebaseAuthProvider = Provider(
  (_) => FirebaseAuth.instance,
);

final formKeyProvider = Provider(
  (ref) => GlobalKey<FormState>(),
);
