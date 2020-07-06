

float inc = 0.01;

float scl = 10;

int cols, rows;

float zoff = 0;

Particle[] particles = new Particle[10000];

PVector[] flowfield;


void setup(){
  size(1200, 600, P2D);
  cols = floor(width/ scl);
  rows = floor(height / scl);
  
  flowfield = new PVector[cols * rows];
  
  for(int i = 0 ; i < particles.length;i++){
    particles[i] = new Particle();
  }
  
}



void draw(){
  //background(255);
  float yoff = 0;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      int index = x + y * cols;
      float angle = noise(xoff, yoff,zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.6);
      flowfield[index] = v;
      xoff += inc;
      
      
      
      ///////////////////////////////////////
      //for showing the vectors and debugging
      //stroke(0, 100);
      //push();
      //translate(x * scl , y * scl);
      //rotate(v.heading());
      //strokeWeight(1);
      
      //line(0, 0, scl, 0);
      
      //pop();
      //fill(r);
      //rect(x * scl, y * scl, scl, scl);
      /////////////////////////////////////////
    
    
    }
  yoff += inc;
  }
  
  zoff += 0.0001;
  
  
  
  
  
  
  for(int i = 0 ; i < particles.length;i++){
    particles[i].follow(flowfield);
    particles[i].update();
    particles[i].show();
    particles[i].edges();
  }
  
  
  
  
  
  
  
}
