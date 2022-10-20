import 'package:flutter/material.dart';

class ReplyWriteCard extends StatelessWidget {
  const ReplyWriteCard({super.key});

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/test_avatar.png')),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'id',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Noto_Sans_KR',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(color: Color(0xff2D9CDB))),
                          filled: true,
                          fillColor: Colors.white),
                      // 입력 필드 선택시 라인 확장
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Noto_Sans_KR',
                                fontWeight: FontWeight.w700),
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
