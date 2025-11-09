# 🏥 Hospital Management System (Dart Console App)

A simple **Hospital Management System** built with **Dart**, designed for **educational purposes** to demonstrate object-oriented programming, file handling (JSON storage), and console-based UI design.

---

## 📘 Overview

This project simulates a basic hospital management workflow:
- Managing **Staff** (Doctors, Nurses, Administrative Personnel)
- Managing **Patients**
- Managing **Rooms**
- Creating and managing **Appointments**

All data (staff, patients, rooms, and appointments) are stored as JSON files in the `data/` directory.

---

## 🧠 Key Features

✅ Object-Oriented Design using Dart Classes  
✅ JSON File Storage for Persistent Data  
✅ Enum-based Appointment Time Slots  
✅ Console-based Interactive UI  
✅ Supports Multiple Modules:
- Staff Management
- Patient Management
- Room Management
- Appointment Management

---

## 🏗️ Project Structure

lib
├── assets
│   ├── appointment
│   │   └── appointments.dart
│   ├── patient
│   │   └── patients.dart
│   ├── room
│   │   └── rooms.dart
│   └── staff
│       ├── doctors.dart
│       ├── nurse.dart
│       └── administrative_personnels.dart
├── data
│   ├── admin
│   │   └── admin_repository.dart
│   ├── appointment
│   │   └── appointment_repository.dart
│   ├── doctor
│   │   └── doctor_repository.dart
│   ├── nurse
│   │   └── nurse_repository.dart
│   ├── patient
│   │   └── patient_repository.dart
│   ├── room
│   │   └── room_repository.dart
│   └── base_path.dart
├── domain
│   ├── appointment
│   │   ├── appointment_time.dart
│   │   └── appointment.dart
│   ├── hospital
│   │   └── hospital.dart
│   ├── patient
│   │   └── patient.dart
│   ├── room
│   │   └── room.dart
│   └── staff
│       └── staff.dart
├── ui
│   ├── appointment
│   │   └── manage_appointment_console.dart
│   ├── patient
│   │   └── manage_patient_console.dart
│   ├── room
│   │   └── manage_room_console.dart
│   ├── staff
│   │   └── manage_staff_console.dart
│   └── hospital_console.dart
├── util
│   └── input_validator.dart
└── main.dart
    
---

## ⚙️ Getting Started

### 1️⃣ Prerequisites
Make sure Dart SDK is installed:
```bash
dart --version
```

---

### 2️⃣ Clone the repository
```console
git clone https://github.com/YongVuthivathnakk/Hospital-Management-Dart.git
cd hospital-management-dart
```

---

🧑‍💻 Educational Purpose

This project is not intended for production use.
It was created for learning and practicing:

+ Dart OOP design
+ Console input/output
+ JSON serialization
+ Basic software architecture (domain & UI separation)

---

📜 License

This project is open-source and available under the MIT License.
You are free to use, modify, and distribute it for learning purposes.
