class QuestionScreen {
  int xOffset=width/2;
  int yOffset=height/5;
  String Question;
  boolean mode=true;
  boolean posted=false;
  Button[] Grid;
  Button postAnswer;
  int[] Answer;
  int[] cAnswer;
  

  QuestionScreen(TableRow p) {
    Grid = new Button[4];
    
    Question=p.getString("pyt");



    Grid[0]=new Button(-(xOffset-20), -(yOffset-20), xOffset-25, yOffset-25, p.getString("0"), 0);
    Grid[1]=new Button(5, -(yOffset-20), xOffset-25, yOffset-25, p.getString("1"), 1);
    Grid[2]=new Button(-(xOffset-20), 5, xOffset-25, yOffset-25, p.getString("2"), 2);
    Grid[3]=new Button(5, 5, xOffset-25, yOffset-25, p.getString("3"), 3);

    postAnswer=new Button(-(xOffset-20), -(yOffset-50), 2*(xOffset-20), yOffset-40, "post", 0);
    postAnswer.setOffset(xOffset, yOffset*3);
    mode = boolean(p.getInt("typ"));
    
    //if (!mode)postAnswer.on=false;

    for (Button in : Grid) {
      in.setOffset(xOffset, yOffset*4);
      in.mode=1;
    }
    
    cAnswer = sort(int(split(p.getString("pop"),";")));
  }

  void update() {
    drawInterface();
    if(!mode)checkInput();
    if(postAnswer.active)postInput();
  }
  
  void drawInterface(){
    pushMatrix();
      translate(xOffset, 0);
      pushMatrix();
        translate(0, yOffset*4);
        for (Button that : Grid)that.update();
      popMatrix();
      pushMatrix();
        translate(0, yOffset*1/2);
        text(Question, 0, 0);
      popMatrix();
      pushMatrix();
        translate(0, yOffset*3);
        postAnswer.update();
      popMatrix();
    popMatrix();  
  }
  
  void checkInput(){
    if(!mode){
      for (Button in1 : Grid){
        if(in1.active){
          for(Button in2 : Grid)if(!in2.active)in2.clicked=0;
          in1.active=false;
        }
      }
    }
  }
      
      //Answer = append(Answer, that.ID); 
    
    void postInput(){
      Answer = new int[0];
      for (Button in : Grid)if(in.clicked>0){
        Answer = append(Answer, in.ID);
        in.clicked=0;
        in.active=false;
      }
      postAnswer.active=false;
      posted=true;
    }
    
    
}