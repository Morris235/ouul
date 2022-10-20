import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Card(
            color: const Color(0xfff2f2f2),
            child: Container(
              width: 400,
              height: 300,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.person_2_outlined),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(color: Color(0xff2D9CDB))),
                          filled: true,
                          fillColor: Colors.white),
                      maxLines: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('0 / 300'),
                        OutlinedButton(
                          onPressed: () => {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => const Color(0xff212121)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(26)))),
                          child: const Text(
                            '등록',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}
