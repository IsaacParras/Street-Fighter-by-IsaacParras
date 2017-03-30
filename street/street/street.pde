PImage fons1;
PImage homer_idle, homer_puny, homer_patada, homer_defensa, homer;
PImage bart, bart_idle, bart_defensa, bart_patada, bart_puny;
int bartx, barty;
int homerx;
int homery;
int comptaHomerIdle, comptaHomerPatada, comptaHomerDefensa, comptaHomerPuny;
int comptaBartIdle, comptaBartPatada, comptaBartDefensa, comptaBartPuny;
float homervidatot;
float homervidarest;
float bartvidatot ;
float bartvidarest  ;


void setup() {
  size (950, 600);
  fons1 = loadImage("fondo2.jpg");
  homervidatot=100;
  homervidarest=100;
  bartvidatot=100;
  bartvidarest=100;
  //homerposicions
  homer_idle = loadImage("homer_idle.png");
  homer_puny = loadImage("homer_puny.png");
  homer_patada = loadImage("homer_patada.png");
  homer_defensa = loadImage("homer_defensa.png");
  //bartposicions
  bart_idle = loadImage("bart_idle.png");
  bart_puny = loadImage("bart_puny.png");
  bart_defensa = loadImage("bart_defensa.png");
  bart_patada = loadImage("bart_patada.png");
  //fideposicions
  homer=homer_idle;
  homerx=200;
  homery=300;
  bartx=550;
  barty=300;
  comptaHomerIdle=0;
  comptaHomerPatada=0;
  comptaHomerPuny=0;
  comptaHomerDefensa=0;


  comptaBartIdle=0;
  comptaBartPuny=0;
  comptaHomerDefensa=0;
  comptaHomerPatada=0;


  bart=bart_idle;
}

void draw() {
  image (fons1, 0, 0, width, height);
  image (homer, homerx, homery, 200, 300);
  image (bart, bartx, barty, 200, 300);
  dibuixaBarres();
  augmentaComptadors();
  //comptadorhomer
  if (comptaHomerIdle>=15) {
    homer=homer_idle;
  }
 /* if (comptaHomerPuny>=15) {
    homer=homer_idle;
  }
  if (comptaHomerPatada>=15) {
    homer=homer_idle;
  }
  if (comptaHomerDefensa>=15) {
    homer=homer_idle;
  }*/

  if (bartx<=0) {
    bartx=width-width-10;
  }
  if (bartx>=width-150) {
    bartx=width-150;
  }
  //comptabart
  if (comptaBartIdle>=15) {
    bart=bart_idle;
/* 
}
  if (comptaBartPatada>=15) {
    bart=bart_idle;
  }
  if (comptaBartPuny>=15) {
    bart=bart_idle;
  }
  if (comptaBartDefensa>=15) {
    bart=bart_idle;
  }

  if (bartx<=0) {
    bartx=width-width-10;
  }
  if (bartx>=width-150) {
    bartx=width-150;
    */
  }
  
}


void augmentaComptadors() {
  comptaHomerIdle++;
  comptaHomerPatada++;
  comptaHomerDefensa++;
  comptaHomerPuny++;


  comptaBartIdle++;
  comptaBartPatada++;
  comptaBartDefensa++;
  comptaBartPuny++;
}
void keyPressed() {
  //HOMER
  if (key=='d') {
    homerx=homerx+10;
  }
  if (key=='a') {
    homerx=homerx-10;
  }
  if (key=='q') {
    homer=homer_puny;
    comptaHomerIdle=0;
    //comptaHomerPuny=0;
  }
  if (key=='e') {
    homer=homer_patada;
    comptaHomerIdle=0;
  }
  if (key=='w') {
    homer=homer_defensa;
    comptaHomerIdle=0;
  }
  //BART
  if (keyCode==RIGHT) {
    bartx=bartx+10;
  }
  if (keyCode==LEFT) {
    bartx=bartx-10;
  }
  if (keyCode==SHIFT) {
    bart=bart_puny;
    comptaBartIdle=0;
  }
  if (keyCode==DOWN) {
    bart=bart_patada;
    if (comptaBartPatada>20) {
      comptaBartIdle=0;
    }
  }
  if (keyCode==UP) {
    bart=bart_defensa;
    comptaBartIdle=0;
  }
  if (homervidarest==0) {
    noLoop();
  }

  //VIDA
  if (comptaBartPatada>10 && bartx<=homerx+200 && bartx>homerx && bart==bart_patada) {
    homervidarest=homervidarest-10;
  }
}

void dibuixaBarres() {

  /***
   *
   *Homer
   *
   */


  noStroke();
  fill(255, 0, 0);
  rect (22, 13, width/2-53, 20);


  float h=(width/2-53)*(homervidarest/homervidatot);
  fill(0, 255, 0);
  rect (22, 13, h, 20);

  stroke(255, 255, 255);
  noFill();
  strokeWeight(4);
  rect (20, 10, width/2-50, 25);


  /***
   *
   *Bart
   *
   */

  noStroke();
  fill(255, 0, 0);
  rect (width/2+30, 10, width/2-50, 25);

  float b=(width/2-50)*(bartvidarest/bartvidatot);
  fill(0, 255, 0);
  rect (width/2+30, 12, b, 22);

  stroke(255, 255, 255);
  noFill();
  strokeWeight(4);
  rect (width/2+30, 10, width/2-50, 25);
  /*

   float b=(width/2-33)*(bartvidarest/bartvidatot);
   fill(0, 255, 0);
   rect (22, 13, b, 20);*/
}