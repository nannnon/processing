Tower tower;

void setup()
{
  size(512, 512);
  tower = new Tower();
}

void draw()
{
  colorMode(RGB, 1);
  background(0);
  tower.draw();
  
  //saveFrame("######.png");
}
