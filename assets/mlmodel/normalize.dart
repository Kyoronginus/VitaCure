// import numpy as np

// # Data input pengguna
// data_user = {
//     "heart_rate": 94,
//     "systolic_bp": 120,
//     "diastolic_bp": 80,
//     "bmi": 22,
//     "glucose": 96
// }

// # Nilai min dan max berdasarkan dataset training
// scaling_factors = {
//     "heart_rate": (40, 180),       # Min=40, Max=180
//     "systolic_bp": (80, 180),      # Min=80, Max=180
//     "diastolic_bp": (50, 120),     # Min=50, Max=120
//     "bmi": (15, 40),               # Min=15, Max=40
//     "glucose": (70, 200)           # Min=70, Max=200
// }

// # Normalisasi menggunakan Min-Max Scaling
// normalized_data = {
//     key: (value - scaling_factors[key][0]) / (scaling_factors[key][1] - scaling_factors[key][0])
//     for key, value in data_user.items()
// }

// print("Data setelah normalisasi:", normalized_data)