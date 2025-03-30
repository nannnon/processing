
void displayCartesianCoordinateSystem()
{
  final int Gap = 64;
  
  background(0);
  
  // 垂直方向の線を描く
  for (int x = 0; x < width; x += Gap)
  {
    stroke(255);
    line(x, 0, x, height - 1);
  }
  
  // 水平方向の線を描く
  for (int y = 0; y < width; y += Gap)
  {
    stroke(255);
    line(0, y, width - 1, y);
  }
}

float getRho(int x, int y)
{
  float rho = log(sqrt(pow(x - width/2, 2) + pow(y - height/2, 2)));
  if (rho < 0)
  {
    rho = 0;
  }
  return rho;
}

void applyInvLogPolarMapping()
{
  PImage img = copy();
  img.loadPixels();
  
  background(0);
  
  final float maxRho = getRho(0, 0);
  
  loadPixels();
  for (int destY = 0; destY < height; ++destY)
  {
    for (int destX = 0; destX < width; ++destX)
    {
      float rho = getRho(destX, destY);
      float theta = atan2(destY - height/2, destX - width/2);
      
      int originX = round(rho / maxRho * (width - 1));
      int originY = round((theta + PI) / (2 * PI) * (height - 1));
      
      if (originX >= 0 && originX < width && originY >= 0 && originY < height)
      {
        int originIndex = originY * width + originX;
        int destIndex = destY * width + destX;
        pixels[destIndex] = img.pixels[originIndex];
      }
    }
  }
  updatePixels();
}

PImage g_img;
float g_x = 0;
float g_y = 0;
float g_vx = 10;
float g_vy = 2;

void setup()
{
  size(2049, 2049, P2D);
  g_img = loadImage("image.png");
}

void draw()
{
  displayCartesianCoordinateSystem();
  
  g_x += g_vx;
  g_y += g_vy;
  if (g_x < 0 || g_x + g_img.width >= width)
  {
    g_x -= g_vx;
    g_vx *= -1;
  }
  if (g_y < 0 || g_y + g_img.height >= height)
  {
    g_y -= g_vy;
    g_vy *= -1;
  }
  
  image(g_img, g_x, g_y);
  
  applyInvLogPolarMapping();
  
  saveFrame("frames/######.png");
}
