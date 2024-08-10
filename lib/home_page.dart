import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedGender = 0;
  int _height = 170;
  int _age = 23;
  int _weight = 65;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          setState(() {
            _bmi = _weight / pow(_height / 100, 2);
          });
        },
        child: const Icon(Icons.calculate),
      ),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          _genderSelector(),
          _heightInput(),
          _weightInput(),
          _ageInput(),
          _bmiResult(),
        ],
      ),
    );
  }

  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _genderIcon(Icons.male, "Male", 0),
          _genderIcon(Icons.female, "Female", 1),
        ],
      ),
    );
  }

  Widget _genderIcon(IconData icon, String label, int gender) {
    return Column(
      children: [
        IconButton(
          iconSize: 60,
          onPressed: () {
            setState(() {
              _selectedGender = gender;
            });
          },
          icon: Icon(
            icon,
            color: _selectedGender == gender
                ? Colors.lightBlue
                : Colors.grey,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _heightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            activeColor: Colors.lightBlue,
            min: 0,
            max: 300,
            divisions: 300,
            value: _height.toDouble(),
            onChanged: (value) {
              setState(() {
                _height = value.toInt();
              });
            },
          ),
          Text(
            "$_height cm",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _weightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          const Text(
            "Weight",
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            activeColor: Colors.lightBlue,
            min: 0,
            max: 200,
            divisions: 200,
            value: _weight.toDouble(),
            onChanged: (value) {
              setState(() {
                _weight = value.toInt();
              });
            },
          ),
          Text(
            "$_weight kg",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          const Text(
            "Age",
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            activeColor: Colors.lightBlue,
            min: 1,
            max: 100,
            divisions: 99,
            value: _age.toDouble(),
            onChanged: (value) {
              setState(() {
                _age = value.toInt();
              });
            },
          ),
          Text(
            "$_age years",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bmiResult() {
    String resultMessage;
    if (_bmi < 18.5) {
      resultMessage = "You are underweight. Take food well";
    } else if (_bmi < 24.9) {
      resultMessage = "You have a normal weight. Excellent !";
    } else if (_bmi < 29.9) {
      resultMessage = "You are overweight. Lose weight";
    } else {
      resultMessage = "You have obesity. Take cautions.";
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "BMI: ${_bmi.toStringAsFixed(1)}",
            style: const TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            resultMessage,
            style: const TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
