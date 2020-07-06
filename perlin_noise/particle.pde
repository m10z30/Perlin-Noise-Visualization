class Particle{
  PVector pos = new PVector(random(width),random(height));
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  PVector prevPos = pos.copy();
  
  float maxSpeed = 2;
  
  void update(){
    prevPos = pos.copy();
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force){
    acc.add(force);
    
  }
  
  float xoff1 = 0;
  float xoff2 = 100000;
  float xoff3 = 1000000;
  
  
  void show(){
    stroke(noise(xoff1) * 255, noise( xoff2) * 255, noise(xoff3) * 255, 3);
    line(prevPos.x , prevPos.y, pos.x, pos.y);
    xoff1 += 0.01;
    xoff2 += 0.01;
    xoff3 += 0.01;
    
    //point(pos.x, pos.y);
  }
  
  void follow(PVector[] vectors){
    int x = floor(pos.x/scl);
    int y = floor(pos.y/scl);
    int index = x + y * cols;
    if (index < vectors.length){
      PVector force = vectors[index];
      applyForce(force);
    }
    
  }
  
  void updatePrev(){
    prevPos = pos.copy();
  }
  
  
  void edges(){
    if (pos.x > width) {
      pos.x = 0;
      updatePrev(); 
    }
    else if(pos.x < 0){ 
      pos.x = width;
      updatePrev();
    }
    if (pos.y > height){ 
      pos.y = 0;
      updatePrev();
    }
    else if(pos.y< 0){ 
      pos.y = height;
      updatePrev();
    }
  }
  
}
