
import 'dart:math';

import 'package:triviabank/data/model/trivia_question_entry.dart';
import 'package:triviabank/ui/trivia_question_card.dart';
import 'package:triviabank/util/am_localizations.dart';
import 'package:flutter/material.dart';

class TriviaScreen extends StatefulWidget {

  final List<TriviaQuestionEntry> triviaQuestionEntryList;

  TriviaScreen({Key key, this.triviaQuestionEntryList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {

  void _letUserKnowIfIncorrect(TriviaQuestionEntry questionEntry, String newValueSelected) {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(AmLocalizations.of(context).triviaTime,),),
      body: Container(
        height: double.maxFinite,
        child: new Stack(
          children: <Widget>[
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.topCenter,
                child: Text('You have ${widget.triviaQuestionEntryList.length} questions to answer', style: TextStyle(color: Colors.white),),
              )
            ),
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.topCenter,
                child: Column(
                  children: <Widget>[
                    for (TriviaQuestionEntry triviaQuestionEntry in widget.triviaQuestionEntryList)
                      TriviaQuestionCard(triviaQuestionEntry: triviaQuestionEntry, onValueSelected: _letUserKnowIfIncorrect)
                  ],
                )
              )
            ),
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text(AmLocalizations.of(context).back, style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                    ),
                    RaisedButton(
                      //onPressed: bloc.logoutUser,
                      child: Text(AmLocalizations.of(context).next, style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}