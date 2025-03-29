void setup()
{
  size(1024, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
}

final float cubesInterval = 10;
final float cubeSize = 1;
final int cubesNum = 30;

float cx = cubesNum * cubesInterval / 2.0 + cubesInterval / 2;
float cy = cubesNum * cubesInterval / 2.0 + cubesInterval / 2;
float cz = cubesNum * cubesInterval;

void draw()  
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  
  camera(cx, cy, cz, cx, cy, 0, 0, 1, 0);
  
  colorMode(RGB, 1);
  background(0);
  
  for (int i = 0; i < cubesNum; ++i)
  {
    for (int j = 0; j < cubesNum; ++j)
    {
      for (int k = 0; k < cubesNum; ++k)
      {
        pushMatrix();
        
        float x = i * cubesInterval;
        float y = j * cubesInterval;
        float z = k * cubesInterval;
        translate(x, y, z);
        
        noStroke();
        colorMode(HSB, 1);
        fill(float(i) / cubesNum, 1, 1);
        box(cubeSize);
        
        popMatrix();
      }
    }
  }
  
  cz -= 0.3;
  
  //saveFrame("######.png");
}
