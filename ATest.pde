Test Atest;

void setup(){
  noStroke();
  size(700, 1250);
  textAlign(CENTER, CENTER);
  textSize(50);
  Atest = new Test("zad1");
  //MainScreen=new QuestionScreen(zad.Q(2));
  
}



void draw(){
  background(130, 0, 150);
  Atest.update();
}

class Test{
  int[][][] results;
  boolean[] checklist;
  int questAmount;
  int questCurrent;
  QuestSet zad;
  QuestionScreen MainScreen;
  
  Test(String TestName){
    zad = new QuestSet(TestName);
    questAmount = zad.len();
    results = new int[questAmount][3][];
    checklist = new boolean[questAmount];
    for(int i=0; i<questAmount; i++)checklist[i] = true;
    SetRandomQuestion();                          //change that too.
  }
                                                  //dodać podobną metode, ustawiającą pytania po koleji, 
                                                  //zrobić funkcje zarządzająca którym sposobem ustawiamy pytania oraz
                                                  //dodać implementacje tej zmeinnej w danych, testu.
  void SetRandomQuestion(){                       //dodać tutaj licznik ile pytań już zadano, żeby zorientować się że nie ma już pytań do wylosowania.
    int r = int(random(0, questAmount));
    if(checklist[r]){
      checklist[r]=false;
      MainScreen = new QuestionScreen(zad.Q(r));
      results[r][0] =  MainScreen.cAnswer;
      questCurrent = r;
    }
    else{
      SetRandomQuestion();
    }
  }
  
  void collectResults(){
    results[questCurrent][1] = MainScreen.Answer;
    results[questCurrent][2] = new int[] {int(compareArrays(results[questCurrent][1], results[questCurrent][0]))};
    print(results[questCurrent][2][0], ENTER);
    SetRandomQuestion();                           //jak bęðzie to co wyżej chce zmienić to na ogół
     
  }
  
  void update(){
    MainScreen.update();
    if(MainScreen.posted)collectResults();
  }
}