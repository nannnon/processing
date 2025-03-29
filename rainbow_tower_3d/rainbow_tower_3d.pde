Tower tower;
float cameraRadian = 0;

void setup()
{
  size(512, 512, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  tower = new Tower();
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  
  // カメラ
  {
    final float r = 500;
    float x = r * cos(cameraRadian);
    float z = r * sin(cameraRadian);
    camera(x, -50, z, 0, -170, 0, 0, 1, 0);
    
    final float delta = 0.01;
    cameraRadian += delta;
    if (cameraRadian >= 2 * PI)
    {
      cameraRadian -= 2 * PI;
    }
  }
  
  colorMode(RGB, 1);
  background(0);
  
  tower.draw();
  
  //saveFrame("######.png");
}
