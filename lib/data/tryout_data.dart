import 'package:shine/data/selection_data.dart';
import 'package:shine/screens/library.dart';
import 'package:shine/screens/selection.dart';
import 'package:shine/screens/time_table.dart';

List<Map<String,Object>> tryoutData = [
    {
      "name": "Library",
      "body contents":[
        "Want to read some books?",
        "Want to learn a life lesson?",
        "Want to know about a great person?" 
        ],
      "navigation address": const LibraryScreen()
    },
    {
      "name": "Notes",
      "body contents":[
        "Want to revise your chapters?",
        "Want to know a chapter's summary?",
        "Want to have help in understanding the chapter?" 
        ],
      "navigation address": SelectionScreen(screenTitle: "Notes",selectables: classes,)
    },
    {
      "name": "Reference",
      "body contents":[
        "Need help by outsources?",
        "Want to learn more than what you got?",
        "We have got some books you would like.",
        ],
      "navigation address": SelectionScreen(screenTitle: "Reference",selectables:classes,)
    },
    {
      "name": "Music",
      "body contents":[
        "Want to relax?",
        "Stressed out ? listen to some music.",
        "Do you know what doctors say? \"music is good for health \"", 
        ],
      "navigation address":  const LibraryScreen() 
    },
    {
      "name": "Time table",
      "body contents":[
        "Time management is Important.",
        "Having a schedule is way better than doing stuff on time.",
        "Lets conquer time!" 
        ],
      "navigation address":  const TimeTableScreen() 
    },
    {
      "name": "Question bank",
      "body contents":[
        "Want questions to practice?",
        "Want to check your Brains potential?",
        "We have a bank that lends you questions." 
        ],
      "navigation address": SelectionScreen(screenTitle: "Question Bank",selectables: classes,) 
    },    
];