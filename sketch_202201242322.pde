boolean left,   //物体を右に移動させる
  up,   //物体を下に下げる
  right,   //物体を左に移動させる
  down,   //物体を上に上げる
  rotateright,   //物体を右に回転させる
  rotateleft,   //物体を左に回転させる
  forward,   //物体に近づく
  back,   //物体から遠ざかる
  topspin,   //物体を前回転させる
  backspin;   //物体を下回転させる
float coordX=0, coordY=0, coordZ=0, rotateA=0, rotateB=0;

void setup(){
  size(1600,900,P3D);
  background(0);
  lights();
  camera(0,0,250,0,0,0,0,1,0);
}


void keyPressed() {
  if (keyCode == 37)  left  = true; //←
  if (keyCode == 38)  up  = true; //↑
  if (keyCode == 39)  right  = true; //→
  if (keyCode == 40)  down  = true; //↓
  if (keyCode == 65)  rotateright  = true; //A
  if (keyCode == 68)  rotateleft  = true; //D
  if (keyCode == 69)  forward  = true; //E
  if (keyCode == 81)  back  = true; //Q
  if (keyCode == 83) topspin = true; //S
  if (keyCode == 87) backspin = true; //W
}


void keyReleased() {
  if (keyCode == 37)  left  = false; //←
  if (keyCode == 38)  up  = false; //↑
  if (keyCode == 39)  right  = false; //→
  if (keyCode == 40)  down  = false; //↓
  if (keyCode == 65)  rotateright  = false; //A
  if (keyCode == 68)  rotateleft  = false; //D
  if (keyCode == 69)  forward  = false; //E
  if (keyCode == 81)  back  = false; //Q
  if (keyCode == 83) topspin = false; //S
  if (keyCode == 87) backspin = false; //W
}


void draw(){
  background(0);
  
  /*ーーーーーーーー移動ーーーーーーーー*/
  if(left){
    if(coordX<250){
      coordX=coordX+1.5;
    }
  }
  if(up){
    if(coordY<250){
      coordY=coordY+1.5;
    }
  }
  if(right){
    if(coordX>-250){
      coordX=coordX-1.5;
    }
  }
  if(down){
    if(coordY>-250){
      coordY=coordY-1.5;
    }
  }
  if(rotateright){
      rotateB=rotateB+1;
  }
  if(rotateleft){
      rotateB=rotateB-1;
  }
  if(forward){
    if(coordZ<160){
      coordZ=coordZ+2;
    }
  }
  if(back){
    if(coordZ>-500){
      coordZ=coordZ-2;
    }
  }
  if(topspin){
    if(radians(rotateA)<PI/2){
      rotateA=rotateA+1;
    }
  }
  if(backspin){
    if(radians(rotateA)>-PI/2){
      rotateA=rotateA-1;
    }
  }
  
  translate(coordX,coordY,coordZ);
  rotateX(radians(rotateA));
  rotateY(radians(rotateB));
  /*ーーーーーーーー移動ーーーーーーーー*/
  
  /*ーーーーーーーー軸ーーーーーーーー*/
  float axisweight=(250-coordZ)/500;  //画面の拡大に合わせて軸線の太さを変える
  strokeWeight(axisweight);
  stroke(255,0,0); //赤色X軸
  line(-5000,0,0,5000,0,0);
  stroke(0,255,0); //緑色Y軸
  line(0,-5000,0,0,5000,0);
  stroke(0,0,255); //青色Z軸
  line(0,0,-5000,0,0,5000);
  
  int i;
  for(i=-1000; i<=1000; i+=100){
    strokeWeight(axisweight/4);
    stroke(255); //白色XZ平面
    line(-1000,0,i,1000,0,i);
    line(i,0,-1000,i,0,1000);
  }
  /*ーーーーーーーー軸ーーーーーーーー*/

}
