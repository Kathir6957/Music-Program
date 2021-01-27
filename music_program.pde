import ddf.minim.*;

Minim minim;
AudioPlayer Vishnu;
AudioPlayer Away;
//AudioPlayer jazz2;
//AudioPlayer jazz3;

float x;


void setup(){
  // setup
  noStroke();
  size(600,800);
  
  minim = new Minim(this);
  
  Vishnu = minim.loadFile("Vishnu.mp3");
  //jazz2 = minim.loadFile("Too Hip To Retire.mp3");
  //jazz3 = minim.loadFile("Whiplash.mp3");  
  
  Vishnu.play();
}

void draw(){
  background(#2F2D2E);
    
  // Bar
  fill(#792359);
  rect(0,600,600,200);
  
  // Play/Pause Circle
  strokeWeight(1);
  stroke(#FD3E81);
  circle(width/2,700,100);
  noStroke();
  
  // Play/Pause Cycle
  if (Vishnu.isPlaying()==true){
    fill(#FD3E81);
    rect(width/2-20,675,10,50);
    rect(width/2+10,675,10,50);
  } else {
    // Pause Vector
    fill(#FD3E81);
    triangle(width/2-15,675,width/2+25,700,width/2-15,725);
  }
  
  // Seek Backwards Vector
  fill(#FD3E81);
  rect(width/2-145,675,10,50);
  triangle(width/2-130,700, width/2-90,675, width/2-90,725);
  
  // Seek Forward Vector
  fill(#FD3E81);
  rect(width/2+135,675,10,50);
  triangle(width/2+130,700, width/2+90,675, width/2+90,725);
  
  // Duration Info
  x = map(Vishnu.position(),0,Vishnu.length(),0,width);
  strokeWeight(2);
  stroke(#FD3E81);
  line(0,600,x,600);
  noStroke();
  
  // Stop Button
  //save button
fill(#792359);
rect(530,height-800,70,60);
fill(#FD3E81);
textSize(16);
text("STOP",545,height-760);


 
}

void mouseReleased(){
  // mousePressed for Play Button
  if (hoverPlay()==true && Vishnu.isPlaying() ){
    Vishnu.pause();
  } else if (hoverPlay()==true && Vishnu.position() == Vishnu.length() ){
    Vishnu.rewind();
    Vishnu.play();
  } else if (hoverPlay()==true ) {
    Vishnu.play();
  }
  
  // mousePressed for Backwards Button
  if (hoverBack()==true && Vishnu.position() < 3000) {
    Vishnu.pause();
    Vishnu = minim.loadFile("Away.mp3");
    Vishnu.play();
  } else {
    Vishnu.rewind();
  }
}
  
  
 



// Boolean for Play/Pause Button
boolean hoverPlay() {
 if (mouseX >= width/2-50 && mouseX <= width/2+50 && mouseY >= 650 && mouseY <= 750){
   return true;
 } else {
   return false;
 }
}
 
boolean hoverBack() {
  if (mouseX >= width/2-145 && mouseX <= width/2-90 && mouseY >= 650 && mouseY <= 750){
    return true;
  } else {
    return false;
 }
}

boolean hoverForward() {
  if (mouseX >= width/2+90 && mouseX <= width/2+145 && mouseY >= 650 && mouseY <= 750){
    return true;
  } else {
    return false;
  }
}

void quitButtonMouseClicked() {
  if (mouseX >= width*545  && mouseX <= width && mouseY >= height*0 && mouseY <= height-800); {
    exit();
  }
}
