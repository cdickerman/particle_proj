 //cursor, 3d (a little bit of depth)
 //make the acceleration decrease as a result of time
 //send to github
 
 int nparticles = 10222;
 ArrayList<Particle> particles = new ArrayList<Particle>();
 
Particle createParticle()
{
  int r = (int)random(3,5);
  PVector position = new PVector(random(r, width-r), random(r, height-r));
  PVector velocity = PVector.random2D();
  velocity.setMag(1);
  int c = color(random(255), random(255), random(255));
  noStroke();
  
  Particle p = new Particle(r, position, velocity,c);
  return p;
}

  void setup() {
    for (int i = 0; i < nparticles; i++)
    {
      Particle p = createParticle();
      particles.add(p);
    }
    
    fullScreen();
    background(0);
    noCursor();
}

void draw() 
{

 background(0); //take this out for cool line drawing effect (might also need to remove bounces off walls)
 for (Particle p : particles)
    {
      p.display();
    }
 fill(100);
 ellipse(mouseX, mouseY, 10, 10);
    
 for (Particle p: particles)
  {
   /* PVector force = new PVector(mouseX, mouseY);
    PVector pforce = new PVector(pmouseX, pmouseY);
    force.sub(pforce);
    force.setMag((pmouseX-mouseX)+(pmouseY-mouseY));
    float distance = dist(p.position.x, p.position.y, mouseX, mouseY);
    force.mult(-1/distance); 
    */
    
    PVector push = new PVector(mouseX-p.position.x, mouseY-p.position.y);
    float pushMag = push.mag();
    push.mult(.3/(sq(pushMag)));
    push.mult(sqrt(sq(mouseX-pmouseX)+sq(mouseY-pmouseY)));
    
    p.push(push);
    
    //find vector from mouse to p, scale into unit vector , scale by the distance between mouse and pmouse
   // float distance = dist(p.position.x, p.position.y, mouseX, mouseY)<70);
    
  }
}

void mousePressed() {
 for (Particle p: particles){
   p.position.x = random(0,width);
   p.position.y = random(0,height);
   p.velocity = PVector.random2D();
   p.velocity.setMag(1);

  }
}