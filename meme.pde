import ddf.minim.*;

PImage[] background = new PImage[3];
PImage meow,blackHole,bigCat;
Minim music;
AudioPlayer player;
int direction=0,blackHoleX=0,blackHoleY=height,t=0,tl=60;
cat c;
boolean bigCatSwitch=int(random(5))%5==0;

void setup()
{
  size(600,600);
  c = new cat();
  music = new Minim(this);
  player = music.loadFile("music.mp3");
  
  for(int i=1;i<=3;i++)
  {
    background[i-1]=loadImage(str(i)+".jpg");
  }
  
  meow=loadImage("meow.png");
  blackHole=loadImage("blackhole.png");
  bigCat=loadImage("bigcat.png");
  player.play();
  
}

void draw()
{
  if(!player.isPlaying())
  {
    player.rewind();
    player.play();
  }
  
  background(#A7D8FF);
  c.backgroundShow();
  c.bigger();
  //c.show();
  
}
