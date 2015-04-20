class AIShip extends Ship
{
  ArrayList<PVector> path = new ArrayList<PVector>();
  int current = 0;
  float maxForce = 100;
  
  AIShip()
  {
   super(); 
   for (int i = 0 ; i < 10 ; i ++)
   {
    path.add(new PVector(random(0, width), random(0, height))); 
   }
  }
  
  void update()
  {
    PVector target = path.get(current);
    PVector sForce = PVector.sub(target, position);
    sForce.normalize();
    sForce.mult(maxForce);
    
    //line(position.x, position.y, position.x + sForce.x, position.y + sForce.y);
    
    force = PVector.sub(sForce, velocity);
    
    if (PVector.dist(target, position) < 20)
    {
     current ++; 
     if (current == path.size())
     {
       current = 0;
     }
    }
  
    acceleration = PVector.mult(force, 1.0f / mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    position.add(PVector.mult(velocity, timeDelta));
    force.x = 0;
    force.y = 0;
    forward = velocity.get();
    forward.normalize();  
    theta = atan2(forward.y, forward.x) + HALF_PI;
  }
  
  void display()
  {
   super.display();
   stroke(255, 0, 0);
   for (int i = 1 ; i < path.size() ; i ++)
    {
       PVector start = path.get(i - 1);
       PVector end = path.get(i);
       
       line(start.x, start.y, end.x, end.y);
    } 
  }
  
}

//if you a egiven a vector and need the angle from it its easiest to use an atan function
