"""
=============================================================================
Fitness Tracker & Personal Wellness Report Generator - Root Launcher
=============================================================================
Bennett University - School of Computer Science Engineering & Technology
Course: Computational Thinking and Programming (2026CSAE100)

Run this script to launch the application:
    python3 run.py
=============================================================================
"""

import sys
import os

# Add fitness_tracker to sys.path
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.join(BASE_DIR, "fitness_tracker")
sys.path.insert(0, PROJECT_DIR)

from app import app, init_csv_files, load_profiles, seed_demo_data

if __name__ == "__main__":
    init_csv_files()
    if not load_profiles():
        seed_demo_data()

    print("\n" + "=" * 70)
    print(" BENNETT UNIVERSITY - SCSET (Academic Year 2026–27)")
    print(" Computational Thinking & Programming (2026CSAE100)")
    print(" Fitness Tracker & Personal Wellness Report Generator")
    print("=" * 70)
    print(" Server running at: http://127.0.0.1:5001")
    print(" Press CTRL+C to stop the server.")
    print("=" * 70 + "\n")

    app.run(debug=True, host="127.0.0.1", port=5001)
