class Ship extends GameObject
{
    float w = 50;
    float halfW = w / 2;
    float rad = 20;
    int up, left, right, fire;
    
    Ship(int up, int left, int right, int fire)
    {
      super();
      this.up = up;
      this.left = left;
      this.right = right;
      this.fire = fire;
    }
    
    Ship()
    {
      super();
      up = UP;
      right = RIGHT;
      left = LEFT;
      fire = ALT;
     
    }
    
    void bullet()
    {
       fill(0, 0, 255);
       ellipse(position.x, position.y, rad, rad);   
    }
    
    void display()
    {
      
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);
      line(-halfW/2, halfW/5, 0, -halfW);
      line(-halfW/2, halfW/5, -halfW, 0);
      line(-halfW, 0, -halfW, halfW);
      line(-halfW, halfW, -halfW/2, halfW/2);
      line(halfW/2, halfW/5, 0, -halfW);
      line(halfW/2, halfW/5, halfW, 0);
      line(halfW, 0, halfW, halfW);
      line(halfW, halfW, halfW/2, halfW/2);
      line( -halfW/2, halfW/2, halfW/2, halfW/2);
      noStroke();
      noFill();
      ellipse(0, 0, w, w);
      
       if (position.x < 0) {
    position.x = position.x + width;
  }
   if (position.x > width) {
      position.x = 0;
    }
    if (position.y < 0) {
      position.y = position.y + height;
    }
    if (position.y > height) {
      position.y = 0;
    }
    
      popMatrix();
    }
    
     void asteroidDisplay()
    {
      
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);
      ellipse(0, 0, w*1.5, w*1.5);
      popMatrix();
    }
    
    void update()
    {
       if (keys[up])
       {
         float newtons = 300;
         force = PVector.mult(forward, newtons);
         //player = minim.loadFile("ship.wav");
         //player.loop();
       }
       
       if (keys[right])
       {
         theta += 0.1f;
       }
       
       if (keys[left])
       {
        theta -= 0.1f;
       }
       
       if (keys[fire])
       {
        bullet();
       }
       
       forward.x = sin(theta);
       forward.y = - cos(theta);
     
      acceleration = PVector.mult(force, 1.0f / mass);
      velocity.add(PVector.mult(acceleration, timeDelta));
      position.add(PVector.mult(velocity, timeDelta));
      force.x = 0;
      force.y = 0;
     
    }
}

