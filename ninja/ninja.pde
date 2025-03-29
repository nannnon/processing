Tower tower = new Tower();
Ninjas ninjas = new Ninjas();
float cameraRadian = 0;

void setup()
{
  size(512, 512, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  
  PFont font = createFont("HiraginoSans-W0", 50);
  textFont(font);
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  
  {
    float r = 30;
    float x = r * cos(cameraRadian);
    float y = -Tower.towerHeight / 2;
    float z = r * sin(cameraRadian);
    camera(x, y, z, 0, y, 0, 0, 1, 0);
    cameraRadian += 0.01;
  }
  
  background(0);
  
  tower.display();
  ninjas.display();
  
  ninjas.update();
}
