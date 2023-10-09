import 'package:alsagr_app/data_sources/next_match_api.dart';
import 'package:alsagr_app/models/next_match_model.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class Mathsport extends StatefulWidget {
  const Mathsport({Key? key}) : super(key: key);

  @override
  State<Mathsport> createState() => _MathsportState();
}

class _MathsportState extends State<Mathsport> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NextMatchModel?>(
      future: NextMatchDataSources().getNextMatch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final NextMatchModel? match = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(height: 18.0),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: const Color.fromARGB(255, 164, 127, 162),
                        width: 2.0,
                        style: BorderStyle.none, // نمط الحافة المتقطعة
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 115, 62, 97)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(6, 6),
                        ),
                        const BoxShadow(
                          color: Color.fromARGB(255, 236, 233, 233),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(-6, -6),
                        ),
                      ],
                    ),
                    width:
                        MediaQuery.of(context).size.width, // تغيير عرض الحاوية
                    child: Center(
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'المباراة القادمة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  // SizedBox(
                                  //   height: 80,
                                  //   width: 100,
                                  // ),
                                  Center(
                                      child: Image.network(
                                    match?.away?.image ?? "",
                                    height: 100,
                                    width: 50,
                                  )),
                                  Text(match?.away?.name ?? ""),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                                height: 10,
                              ),
                              const Center(
                                child: Text(
                                  'vs',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  // SizedBox(
                                  //   height: 80,
                                  //   width: 100,
                                  // ),
                                  Center(
                                      child: Image.network(
                                    match?.home?.image ?? "",
                                    height: 100,
                                    width: 50,
                                  )),
                                  Text(match?.home?.name ?? ""),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'الموعد',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: 2),
                                      Icon(EneftyIcons.clock_2_outline),
                                    ],
                                  ),
                                  Text(
                                      "${(match?.time?.day ?? 00).toString()}/${(match?.time?.month ?? 00).toString() ?? " "}/${(match?.time?.year ?? 00).toString() ?? " "}")
                                ],
                              ),
                              Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'المكان',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: 2),
                                      Icon(EneftyIcons.location_outline),
                                    ],
                                  ),
                                  Text(match?.location ?? ""),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
