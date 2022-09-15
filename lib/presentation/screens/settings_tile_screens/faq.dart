import 'package:flutter/material.dart';

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
      body: Padding(
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
                  headerBuilder: (BuildContext context, bool isExpanded) {
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
      ),
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
