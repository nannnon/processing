ArrayList<Point> g_points = new ArrayList<Point>();
PVector g_targetPos = new PVector(0, 0, 0);
float g_theta = 0;

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  //background(128, 128, 255);
  background(0);
  
  // Point追加
  g_points.add(new Point(g_targetPos));

  // ターゲット移動
  final float MoveVecAbs = 0.1;
  PVector move = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  move = move.normalize().mult(MoveVecAbs);
  g_targetPos = PVector.add(g_targetPos, move);
  
  // カメラ移動
  final float R = 10;
  g_theta += PI / 100;
  float cameraX = g_targetPos.x + R * cos(g_theta);
  float cameraZ = g_targetPos.z + R * sin(g_theta);
  camera(cameraX, g_targetPos.y, cameraZ, g_targetPos.x, g_targetPos.y, g_targetPos.z, 0, 1, 0);
  
  // 描画
  for (Point p : g_points)
  {
    p.display();
  }
}
