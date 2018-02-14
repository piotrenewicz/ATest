class Button{
  int x, y, w, h;
  color nbc=color(255, 0, 0);
  color cbc=color(0, 255, 0);
  color tc=color(0);
  String t="unnamed";
  int ID;
  boolean on=true;
  int clicked=0;
  int clickLen=10;
  int mode=0;
  boolean active=false;
  /*modespreadsheet:
    0-button
    1-toggle
  */
  
  Button(int x_, int y_, int w_, int h_, String t_, int ID_, color nbc_, color cbc_, color tc_){
    x=x_; y=y_; w=w_; h=h_; t=t_; nbc=nbc_; cbc=cbc_; tc=tc_; ID=ID_;
  }
  Button(int x_, int y_, int w_, int h_, String t_, int ID_){
    x=x_; y=y_; w=w_; h=h_; t=t_; ID=ID_;
  }
  Button(int x_, int y_, int w_, int h_){
    x=x_; y=y_; w=w_; h=h_;  ID=0;
  }
  
  void update(){
    if(on){
      fill(nbc);
      if(clicked>0){
        fill(cbc);
        if(mode==0)clicked-=1;
      }
      rect(x, y, w, h, 15);
      fill(tc);
      text(t, x+w/2, y+h/2);
    }
  }
  
  int MouseX, MouseY, xOffset, yOffset;
  
  void setOffset(int xOffset_, int yOffset_){
    xOffset=xOffset_; yOffset=yOffset_;
  }
  
  void RenCoords(){
    MouseX=mouseX-xOffset;
    MouseY=mouseY-yOffset;
  }
  
  void Click(){
    if(on){
      RenCoords();
      if(MouseX>x && MouseX<x+w && MouseY>y && MouseY<y+h){
        if(mode==0){
          clicked=clickLen;
          active=true;
        }else if(mode==1){
          active=!active;
          clicked=int(active);
        }
        //run the specified function for the button from here, I don't yet know how to do this.
        
        
      }
    }
  }
}

class QuestSet{
  Table data;
  QuestSet(String Qfile){
    data = loadTable(Qfile+".csv","header");
  }
  
  int len(){
    return data.getRowCount();
  }
  
  TableRow Q(int i){
    TableRow row = data.getRow(i);
    return row;
  }
}

void mousePressed(){
  for(Button that: Atest.MainScreen.Grid)that.Click();
  Atest.MainScreen.postAnswer.Click();
}

boolean compareArrays(int[] a, int[] b){
  int len1 = a.length;
  int len2 = b.length;
  if(len1 == len2){
    for (int i=0; i<len1; i++){
      if(!(a[i]==b[i])){
        return false;
      }
    }
  }else{
    return false;
  }
  return true;
}