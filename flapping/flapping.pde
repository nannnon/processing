float g_t = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  colorMode(HSB, 1, 1, 1);
}

void draw()
{
  background(0);
  
  noFill();

  float anchor_x1 = 924;
  float anchor_y1 = 512;
  float control_x2 = 100;
  float control_y2 = 100;
  float control_x3 = 924;
  float control_y3 = 1500;
  float anchor_x4 = -4300;
  float anchor_y4 = 1024;

  //stroke(1, 0.5, 0.5);
  //line(anchor_x1, anchor_y1, control_x2, control_y2);
  //line(control_x3, control_y3, anchor_x4, anchor_y4);
  //stroke(1, 1, 1);
  //bezier(anchor_x1, anchor_y1, control_x2, control_y2, control_x3, control_y3, anchor_x4, anchor_y4);

  g_t += PI / 80;

  final int Num = 800;
  for (int i = 0; i < Num; ++i)
  {
    float x1 = anchor_x1;
    float y1 = anchor_y1 + sin(g_t + i / float(Num)) * Num / 2;
    float x2 = control_x2;
    float y2 = control_y2;
    float x3 = control_x3;
    float y3 = control_y3;
    float x4 = anchor_x4;
    float y4 = anchor_y4;
    stroke(i / float(Num), 0.5, 0.5);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
  
  saveFrame("frames/######.png");
}
