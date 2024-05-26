import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDE9F7),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+34, left: 18, right: 15),
            child: Row(
              children: [
              Container(
                height: 47,
                width: 47,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffDDE9F7),
                  border: Border.all(color: Color(0xffEAF2F9), width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/man.png',
                  ),
                ),
              ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Text('Good afternoon,',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(
                        color: Color(0xff3D5284),
                        fontSize: 12,
                        height: 1.253,
                        fontWeight: FontWeight.w600
                      )
                      ),
                        Text('John Doe',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                                color: Color(0xff02012D),
                                fontSize: 16,
                                height: 1.2,
                                fontWeight: FontWeight.w600
                            )
                        )
                    ],),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 27,
                      width: 27,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffDDE9F7),
                          boxShadow: [
                            BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                            BoxShadow(color: Color(0xff000000).withOpacity(0.2),spreadRadius: 2, blurRadius: 2)
                          ],
                          border: Border.all(color: Color(0xffEAF2F9), width: 2)
                      ),
                      child: Icon(Icons.message,color: Color(0xff5A6571),size: 12,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                        height: 27,
                        width: 27,
                        clipBehavior: Clip.hardEdge,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffDDE9F7),
                            boxShadow: [
                              BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                              BoxShadow(color: Color(0xff000000).withOpacity(0.2),spreadRadius: 2, blurRadius: 2)
                            ],
                            border: Border.all(color: Color(0xffEAF2F9), width: 2)
                        ),
                        child: Icon(Icons.notifications,color: Color(0xff5A6571),size: 12,),
                      ),
                    ),
                ],)
            ],),
          ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: ElevatedButton(onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {

                    return AlertDialog(
                      title: Text('Todo'),
                      content: SizedBox(
                        height: 200,
                        width: double.maxFinite,
                        child:  FirestoreListView(
                          shrinkWrap: true,
                          query: FirebaseFirestore.instance.collection('users').doc('user-1').collection('tasks'),
                          itemBuilder: (context, data){
                            return GestureDetector(
                              onTap: ()async{
                               await FirebaseFirestore.instance.collection('users').doc('user-1').collection('tasks').doc(data.id).update({
                                 'marked':!data['marked']
                               });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(data['marked']?Icons.check_box:Icons.square_outlined, color: Color(0xff3D5284),),
                                  ),
                                  Flexible(
                                    child: Text(data.data()['tsk'],
                                        style: GoogleFonts.outfit(
                                            color: Color(0xff3D5284),
                                            fontSize: 14,
                                            height: 1.253,
                                            fontWeight: FontWeight.w500
                                        )
                                    ),
                                  )
                                ],),
                            );
                          },
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(68),
                    padding: const EdgeInsets.only(left: 10, right: 17),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    backgroundColor: Color(0xffE3EDF7),
                    surfaceTintColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                  ),
                  child: Row(
                                  children: [
                  Container(
                    height: 55,
                    width: 55,
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDDE9F7),
                        boxShadow: [
                          BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                          BoxShadow(color: Color(0xff000000).withOpacity(0.1),spreadRadius: 2, blurRadius: 2)
                        ],
                        border: Border.all(color: Color(0xffEAF2F9), width: 2)
                    ),
                    child:  Text('0%',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                            color: Color(0xff1E94FF),
                            fontSize: 10,
                            height: 1.253,
                            fontWeight: FontWeight.w800
                        )
                    ),
                  ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 18, right: 5),
                                        child: Text('This is a task list that Opens a dialogue box showing tasks, read more...',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.outfit(
                                                color: Color(0xff3D5284),
                                                fontSize: 12,
                                                height: 1.253,
                                                fontWeight: FontWeight.w500
                                            )
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: Color(0xff3D5284),size: 15,)
                                  ],
                                )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 29, right: 19),
              child: Text('Ordinary Title 1',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(
                      color: Color(0xff02012D),
                      fontSize: 16,
                      height: 1.253,
                      fontWeight: FontWeight.w600
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
              child: Wrap(
               alignment: WrapAlignment.spaceBetween,
                spacing: 12,
                children: [
                Container(
                  height: 98,
                  width: 98,
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                      color: Color(0xffDDE9F7),
                      boxShadow: [
                        BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                        BoxShadow(color: Color(0xff000000).withOpacity(0.1),spreadRadius: 2, blurRadius: 2)
                      ],
                      border: Border.all(color: Color(0xffEAF2F9), width: 2)
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Icon(Icons.man,color:Color(0xff1e94ff))
                        ],),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Button 1 Name',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.outfit(
                                        color: Color(0xff3D5284),
                                        fontSize: 12,
                                        height: 1.253,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            )
                          ],),
                      ),
                    ],
                  ),
                ),
                  Container(
                    height: 98,
                    width: 98,
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffDDE9F7),
                        boxShadow: [
                          BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                          BoxShadow(color: Color(0xff000000).withOpacity(0.1),spreadRadius: 2, blurRadius: 2)
                        ],
                        border: Border.all(color: Color(0xffEAF2F9), width: 2)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.man,color:Color(0xff1e94ff))
                            ],),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('Button 1 Name',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                          color: Color(0xff3D5284),
                                          fontSize: 12,
                                          height: 1.253,
                                          fontWeight: FontWeight.w500
                                      )
                                  ),
                                ),
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 98,
                    width: 98,
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffDDE9F7),
                        boxShadow: [
                          BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                          BoxShadow(color: Color(0xff000000).withOpacity(0.1),spreadRadius: 2, blurRadius: 2)
                        ],
                        border: Border.all(color: Color(0xffEAF2F9), width: 2)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.man,color:Color(0xff1e94ff))
                            ],),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('Button 1 Name',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                          color: Color(0xff3D5284),
                                          fontSize: 12,
                                          height: 1.253,
                                          fontWeight: FontWeight.w500
                                      )
                                  ),
                                ),
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 29, right: 19),
              child: Text('Ordinary Title 2',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(
                      color: Color(0xff02012D),
                      fontSize: 16,
                      height: 1.253,
                      fontWeight: FontWeight.w600
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
              child: Container(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffEDF3FA),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Text('This is a state box with a message, showing that the section is empty right now',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          color: Color(0xff797C7B).withOpacity(0.5),
                          fontSize: 12,
                          height: 1.253,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 29, right: 19),
              child: Text('Ordinary Title 3',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(
                      color: Color(0xff02012D),
                      fontSize: 16,
                      height: 1.253,
                      fontWeight: FontWeight.w600
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 10),
              child: Container(
                height: 408,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
                  gradient: RadialGradient(
                      radius: 6,
                      colors: [
                    Color(0xffDCE8F7),
                    Colors.black.withOpacity(0.1),
                  ]),
                  color: Color(0xffDCE8F7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 12),
                             child: ElevatedButton(onPressed: (){},
                                 style: ElevatedButton.styleFrom(
                                   fixedSize: Size(308, 314),
                                   foregroundColor: Colors.transparent,
                                   surfaceTintColor: Colors.transparent,
                                   padding: EdgeInsets.zero,
                                   backgroundColor: Color(0xffE3EDF7),
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                                 ),
                                 child:Column(
                               crossAxisAlignment: CrossAxisAlignment.stretch,
                               children: [
                               Image.asset('assets/diet.png', fit: BoxFit.fitWidth,),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.stretch,
                                     children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 13,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                                color: Color(0xffffffff),
                                              ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 4),
                                             child: Text('Food',
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,
                                                 style: GoogleFonts.outfit(
                                                     color: Color(0xff898D91),
                                                     fontSize: 8,
                                                     height: 1.253,
                                                     fontWeight: FontWeight.normal
                                                 )
                                             ),
                                           ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Text('January 1st, 2024',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.outfit(
                                                    color: Color(0xff898D91),
                                                    fontSize: 8,
                                                    height: 1.253,
                                                    fontWeight: FontWeight.normal
                                                )
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 18,
                                            width: 18,
                                            clipBehavior: Clip.hardEdge,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffDDE9F7),
                                                boxShadow: [
                                                  BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                                                  BoxShadow(color: Color(0xff000000).withOpacity(0.2),spreadRadius: 2, blurRadius: 2)
                                                ],
                                                border: Border.all(color: Color(0xffEAF2F9), width: 2)
                                            ),
                                            child: Icon(Icons.bookmark_border,color: Color(0xff0579FF),size: 12,),
                                          ),
                                        ],
                                      ),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 10),
                                         child: Text('You can choose to add any title to this article which opens in full view on the next page',
                                             maxLines: 2,
                                             overflow: TextOverflow.ellipsis,
                                             style: GoogleFonts.outfit(
                                                 color: Color(0xff3D5284),
                                                 fontSize: 14,
                                                 height: 1.253,
                                                 fontWeight: FontWeight.w600
                                             )
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 5),
                                         child: Text('This is the description that can work for any article. It can  begin with one line or it can stretch up to 2 lines or maybe even three, you might need to pay attention to the width or the height of this section.',
                                             maxLines: 3,
                                             overflow: TextOverflow.ellipsis,
                                             style: GoogleFonts.outfit(
                                                 color: Color(0xff666666),
                                                 fontSize: 8,
                                                 height: 1.253,
                                                 fontWeight: FontWeight.w400
                                             )
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 5),
                                         child: Row(children: [
                                           Padding(
                                             padding: const EdgeInsets.only(right: 5),
                                             child: Container(
                                               height: 11,
                                               decoration: BoxDecoration(
                                                 border: Border.all(color: Color(0xff4d4d4d)),
                                                 borderRadius: BorderRadius.all(Radius.circular(4)),
                                                 color: Colors.transparent,
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 4),
                                                 child: Text('Food',
                                                     maxLines: 1,
                                                     overflow: TextOverflow.ellipsis,
                                                     style: GoogleFonts.outfit(
                                                         color: Color(0xff898D91),
                                                         fontSize: 6,
                                                         height: 1.253,
                                                         fontWeight: FontWeight.normal
                                                     )
                                                 ),
                                               ),
                                             ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(right: 5),
                                             child: Container(
                                               height: 11,
                                               decoration: BoxDecoration(
                                                 border: Border.all(color: Color(0xff4d4d4d)),
                                                 borderRadius: BorderRadius.all(Radius.circular(4)),
                                                 color: Colors.transparent,
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 4),
                                                 child: Text('Diet',
                                                     maxLines: 1,
                                                     overflow: TextOverflow.ellipsis,
                                                     style: GoogleFonts.outfit(
                                                         color: Color(0xff898D91),
                                                         fontSize: 6,
                                                         height: 1.253,
                                                         fontWeight: FontWeight.normal
                                                     )
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ],),
                                       )
                                     ],
                                   ),
                                 )
                               ],
                             )),
                           ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(308, 314),
                                      foregroundColor: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      backgroundColor: Color(0xffE3EDF7),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                                  ),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Image.asset('assets/diet.png', fit: BoxFit.fitWidth,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 13,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                                    color: Color(0xffffffff),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                    child: Text('Food',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.outfit(
                                                            color: Color(0xff898D91),
                                                            fontSize: 8,
                                                            height: 1.253,
                                                            fontWeight: FontWeight.normal
                                                        )
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text('January 1st, 2024',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.outfit(
                                                          color: Color(0xff898D91),
                                                          fontSize: 8,
                                                          height: 1.253,
                                                          fontWeight: FontWeight.normal
                                                      )
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  height: 18,
                                                  width: 18,
                                                  clipBehavior: Clip.hardEdge,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffDDE9F7),
                                                      boxShadow: [
                                                        BoxShadow(color: Color(0xffE3EDF7), spreadRadius: 3, ),
                                                        BoxShadow(color: Color(0xff000000).withOpacity(0.2),spreadRadius: 2, blurRadius: 2)
                                                      ],
                                                      border: Border.all(color: Color(0xffEAF2F9), width: 2)
                                                  ),
                                                  child: Icon(Icons.bookmark_border,color: Color(0xff0579FF),size: 12,),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Text('You can choose to add any title to this article which opens in full view on the next page',
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.outfit(
                                                      color: Color(0xff3D5284),
                                                      fontSize: 14,
                                                      height: 1.253,
                                                      fontWeight: FontWeight.w600
                                                  )
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Text('This is the description that can work for any article. It can  begin with one line or it can stretch up to 2 lines or maybe even three, you might need to pay attention to the width or the height of this section.',
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.outfit(
                                                      color: Color(0xff666666),
                                                      fontSize: 8,
                                                      height: 1.253,
                                                      fontWeight: FontWeight.w400
                                                  )
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 5),
                                                  child: Container(
                                                    height: 11,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xff4d4d4d)),
                                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text('Food',
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: GoogleFonts.outfit(
                                                              color: Color(0xff898D91),
                                                              fontSize: 6,
                                                              height: 1.253,
                                                              fontWeight: FontWeight.normal
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 5),
                                                  child: Container(
                                                    height: 11,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xff4d4d4d)),
                                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text('Diet',
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: GoogleFonts.outfit(
                                                              color: Color(0xff898D91),
                                                              fontSize: 6,
                                                              height: 1.253,
                                                              fontWeight: FontWeight.normal
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 73,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size.fromHeight(32),
                                padding: const EdgeInsets.only(left: 10, right: 17),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                backgroundColor: Color(0xffE3EDF7),
                                surfaceTintColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text('Open List',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.outfit(
                                      color: Color(0xff3D5284),
                                      fontSize: 12,
                                      height: 1.253,
                                      fontWeight: FontWeight.w500
                                  )
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
              child: Text(' this is a random photo note with nothing specific, but could contain details that end this page',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                      color: Color(0xff797C7B),
                      fontSize: 12,
                      height: 1.253,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Privacy',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          color: Color(0xff0666EB),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff0666EB),
                          fontSize: 14,
                          height: 1.253,
                          fontWeight: FontWeight.w500
                      )
                  ),
                  Text('Terms',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          color: Color(0xff0666EB),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff0666EB),
                          fontSize: 14,
                          height: 1.253,
                          fontWeight: FontWeight.w500
                      )
                  ),
              ],),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
