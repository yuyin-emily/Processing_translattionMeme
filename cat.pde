class cat
{
  float size=100,
        x=0,
        y=height,
        xSpeed=10,
        ySpeed=-10,
        rotateAngle=0,
        rotateSpeed=PI/16;
        
  int backgroundNumber=0;
        
  void show()
  {
    translate(x,y);
    imageMode(CENTER);
    rotate(rotateAngle);
    image(meow,0,0,size,size);
  }
  
  void backgroundShow()
  {
    imageMode(CORNER);
    image(background[backgroundNumber],0,0,width,height);
    if(backgroundNumber==2)
    {
      if(direction<2)
      {
        blackHoleY=30;
      }
      else
      {
        blackHoleY=height-30;
      }
      if(direction==0 || direction==3)
      {
        blackHoleX=width-30;
      }
      else
      {
        blackHoleX=30;
      }
      imageMode(CENTER);
      image(blackHole,blackHoleX,blackHoleY,size*3,size*3);
    }
  }
  
  void dirchange()
  {
    direction++;
    imageMode(CORNER);
    if(direction>3)
    {
      direction=0;
      y=height;
      x=0;
      ySpeed=-ySpeed;
    }
    else if(direction==1)
    {
      y=height;
      x=width;
      xSpeed=-xSpeed;
    }
    else if(direction==2)
    {
      y=0;
      x=width;
      ySpeed=-ySpeed;
    }
    else if(direction==3)
    {
      x=0;
      y=0;
      xSpeed=-xSpeed;
    }
  }
  
  void top()
  {
    if(y<0 || y>height)
    {
      bigCatSwitch=int(random(5))%5==0;
      translate(0,0);
      backgroundNumber++;
      if(backgroundNumber>=3)
      {
        backgroundNumber=0;
      }
      c.dirchange();
    }
  }
  
  void bigger()
  {
    if(x==width/2 & y==height/2)
    {
      if(bigCatSwitch)
      {
        rotateAngle++;
        if(rotateAngle<tl)
        {
          translate(x,y);
          imageMode(CENTER);
          rotate(0);
          image(bigCat,0,0,size*5,size*5);
        }
        else
        {
          rotateAngle=0;
          tl=120;
          bigCatSwitch=false;
        }
      }
      else
      {
        c.move();
      }
    }
    else
    {
      c.move();
    }
  }
  
  void move()
  {
    if(!mousePressed)
    {
      y+=ySpeed;
      x+=xSpeed;
      rotateAngle+=rotateSpeed;
    }
    else if (mouseButton == LEFT)
    {
      rotateAngle+=rotateSpeed;
    }
    else if (mouseButton == CENTER)
    {
      y+=ySpeed*map(mouseX+mouseY,0,width+height,0.5,2);
      x+=xSpeed*map(mouseX+mouseY,0,width+height,0.5,2);
      rotateAngle+=rotateSpeed;
    }
    c.top();
    c.show();
  }
}
