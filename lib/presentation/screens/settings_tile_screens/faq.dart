import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_flutter/business_logic/faq/faq_cubit.dart';
import 'package:odc_flutter/business_logic/faq/faq_state.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../styles/colours.dart';

class FAQScreen extends StatefulWidget {
  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faqs = [
    FAQ(
      body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
      text: 'FAQ1',
      isExpanded: false,
    ),
    FAQ(
      body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
      text: 'FAQ2',
      isExpanded: false,
    ),
    FAQ(
      body: 'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
      text: 'FAQ3',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    FaqCubit faqCubit = FaqCubit.get(context);

    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'FAQ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              centerTitle: true,
            ),
            body: (state is FaqLoading || faqCubit.faqModel == null)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ExpansionPanelList(
                          animationDuration: Duration(milliseconds: 1),
                          elevation: 1,
                          expandedHeaderPadding: EdgeInsets.all(8),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              faqs[index].isExpanded = !isExpanded;
                            });
                          },
                          children: faqs.map<ExpansionPanel>((FAQ faq) {
                            return ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text(faq.text),
                                );
                              },
                              body: ListTile(
                                title: Text(faq.body),
                              ),
                              isExpanded: faq.isExpanded,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: faqCubit.faqModel?.List_FAQData.length,
                      itemBuilder: (BuildContext context, int index) {
                        //card of question & answer
                        return Card(
                          margin: const EdgeInsets.all(20),
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ToggleList(
                            shrinkWrap: true,
                            toggleAnimationDuration:
                                const Duration(milliseconds: 400),
                            scrollPosition: AutoScrollPosition.begin,
                            children: [
                              //toggle question
                              ToggleListItem(
                                itemDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                headerDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                title: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: RichText(
                                        text: HTML.toTextSpan(
                                      context,
                                      "${faqCubit.faqModel!.List_FAQData[index].question}",
                                      defaultTextStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: black,
                                        decoration: TextDecoration.none,
                                        fontSize: 17.0,
                                      ),
                                    )),
                                  ),
                                ),

                                //toggle answer
                                content: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: RichText(
                                        text: HTML.toTextSpan(
                                      context,
                                      "${faqCubit.faqModel!.List_FAQData[index].answer}",
                                      defaultTextStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: black,
                                        decoration: TextDecoration.none,
                                        fontSize: 17.0,
                                      ),
                                    ))),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ));
      },
    );
  }
}

class FAQ {
  final String text;
  final String body;
  bool isExpanded;

  FAQ({
    required this.body,
    required this.text,
    required this.isExpanded,
  });
}
