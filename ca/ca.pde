final float CellSize = 1;
final int CellsNum = 100;
Cell g_cells[][];  //; x, z

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 2000);
  colorMode(HSB, 1, 1, 1);
  
  // セルを生成
  g_cells = new Cell[CellsNum][CellsNum];
  for (int x = 0; x < CellsNum; ++x)
  {
    for (int z = 0; z < CellsNum; ++z)
    {
      g_cells[x][z] = new Cell(x, z);
    }
  }
  
  // 近傍セルを登録
  for (int x = 0; x < CellsNum; ++x)
  {
    for (int z = 0; z < CellsNum; ++z)
    {
      Cell targetCell = g_cells[x][z];
      
      for (int dx = -1; dx <= 1; ++dx)
      {
        for (int dz = -1; dz <= 1; ++dz)
        {
          if (dx == 0 && dz == 0)
          {
            continue;
          }
          
          // 近傍セルの座標を計算
          int neiX = x + dx;
          if      (neiX == -1)       { neiX = CellsNum - 1; }
          else if (neiX == CellsNum) { neiX = 0; }
          
          int neiZ = z + dz;
          if      (neiZ == -1)       { neiZ = CellsNum - 1; }
          else if (neiZ == CellsNum) { neiZ = 0; }
          
          // 登録
          targetCell.addNeighbor(dx, dz, g_cells[neiX][neiZ]);
        }
      }
    }
  }
  
  resetCA();
}

void draw()
{
  float len = CellSize * CellsNum;
  camera(len / 2, -100, len / 2 - 100, len / 2, 0, len / 2, 0, 1, 0);
  
  background(0);
  
  for (Cell[] cellsRow : g_cells)
  {
    for (Cell c : cellsRow)
    {
      c.update();
    }
  }
  
  for (Cell[] cellsRow : g_cells)
  {
    for (Cell c : cellsRow)
    {
      c.display();
    }
  }
  
  //saveFrame("frames/######.png");
}

void resetCA()
{
  for (int x = 0; x < CellsNum; ++x)
  {
    for (int z = 0; z < CellsNum; ++z)
    {
      Cell targetCell = g_cells[x][z];
      boolean nextState = (random(1) < 0.5) ? false : true;
      targetCell.setNextState(nextState);
    }
  }
}

void mousePressed()
{
  resetCA();
}
