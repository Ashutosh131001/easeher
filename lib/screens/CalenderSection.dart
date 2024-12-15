import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PeriodTrackers extends StatefulWidget {
  const PeriodTrackers({super.key});

  @override
  State<PeriodTrackers> createState() => _PeriodTrackersState();
}

class _PeriodTrackersState extends State<PeriodTrackers> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<DateTime> periodDays = [
    DateTime.utc(2024, 11, 22),
    DateTime.utc(2024, 11, 23),
    DateTime.utc(2024, 11, 24),
  ];

  final List<double> ovulationChances = [30, 40, 50, 70, 80, 60, 55];

  bool isPeriodsDay(DateTime day) {
    return periodDays.any((periodDay) => isSameDay(periodDay, day));
  }

  void togglePeriodsDay(DateTime day) {
    setState(() {
      if (isPeriodsDay(day)) {
        periodDays.removeWhere((periodsDay) =>
            isSameDay(periodsDay, day)); // Remove if already selected
      } else {
        periodDays.add(day); // Add if not selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Period Tracker',
              style: TextStyle(
                color: Color(0xFF5C6BC0),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Wrap Column with SingleChildScrollView
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onDayLongPressed: (selectedDay, focusedDay) {
                        togglePeriodsDay(selectedDay);
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          if (isPeriodsDay(day)) {
                            return Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                          return null;
                        },
                      ),
                      calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: const BoxDecoration(
                          color: Colors.pinkAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Chances of Ovulation',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                    color: Colors.white54,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 10,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, _) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text("Sun");
                                  case 1:
                                    return const Text("Mon");
                                  case 2:
                                    return const Text("Tue");
                                  case 3:
                                    return const Text("Wed");
                                  case 4:
                                    return const Text("Thu");
                                  case 5:
                                    return const Text("Fri");
                                  case 6:
                                    return const Text("Sat");
                                  default:
                                    return const Text('');
                                }
                              },
                              interval: 1,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(
                              ovulationChances.length,
                              (index) => FlSpot(
                                index.toDouble(),
                                ovulationChances[index],
                              ),
                            ),
                            isCurved: true,
                            color: Colors.deepPurple,
                            barWidth: 4,
                            dotData: const FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.blue.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
