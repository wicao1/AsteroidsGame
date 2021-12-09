ArrayList <Asteroid> myAsteroid = new ArrayList <Asteroid>();
Spaceship rsBob = new Spaceship(); // rs = rocketship
Star [] starfield = new Star[300]; 
public void setup() 
{
  size(500,500);
  noStroke();
  for(int i=0; i<starfield.length; i++){
    starfield[i] = new Star();
  }
  for(int i=0; i<20; i++){
    myAsteroid.add(new Asteroid());  
  }
}
public void draw() 
{
  background(0);
  rsBob.move();
  rsBob.show();
  for(int i=0; i<starfield.length; i++){
    starfield[i].show();
  }
  for(int i=0; i<myAsteroid.size(); i++){
    myAsteroid.get(i).move();
    myAsteroid.get(i).show();
    float d = dist((float)rsBob.getX(),(float)rsBob.getY(), (float)myAsteroid.get(i).getX(), (float)myAsteroid.get(i).getY());
    if(d<10){
      myAsteroid.remove(i);
    }
  }
}
public void keyPressed(){
  if(key == 'a'){
    rsBob.turn(-20);
  }
  if(key == 'd'){
    rsBob.turn(20);
  }
  if(key == 'w'){
    rsBob.accelerate(.5);
  }
  if(key == 's'){
    rsBob.accelerate(-1);
  }
  if(key == 'q'){
    rsBob.myXspeed = rsBob.myYspeed = 0;
    rsBob.myCenterX = (int)(Math.random()*500);
    rsBob.myCenterY = (int)(Math.random()*500);
    rsBob.myPointDirection = (int)(Math.random()*500);
  }
}
