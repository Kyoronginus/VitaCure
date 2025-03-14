# VitaCure

## Overview
Vitacure adalah aplikasi kesehatan yang dirancang untuk membantu pengguna dalam memantau kesehatan mereka secara lebih efisien. Aplikasi ini menyediakan fitur pemantauan kondisi kesehatan berbasis data pengguna serta penilaian dalam score, konsultasi dengan dokter, serta AI chatbot yang dapat diajak berbicara.

## Fitur Utama
- Register & Login : Membuat akun dan masuk ke akun.
- Penilaian Skor Kesehatan : Memberikan pengguna skor kesehatan berdasarkan analisis data (Detak jantung, BMI, gula darah, tekanan darah sistol dan diastol).
- AI Chatbot : Chatbot model blenderbot 400M distill.
- Konsultasi : membuat jadwal konsultasi dengan dokter

## Tech Stack :
Backend : 
- Database : Firestore Database
- Authentication : Firebase Authentication
- Chatbot : Hugging Face API

Frontend : 
- Framework : Flutter

Implementasi : 
1. Konfigurasi Firebase Firestore dan Authentication untuk database, dan register & login.
2. Menyiapkan API Key di Hugging Face (https://huggingface.co/) untuk integrasi chatbot
3. Pembuatan UI/UX dengan flutter
4. Build dan deploy dengan command git : Build flutter apk
