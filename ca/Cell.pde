class Cell
{
  final int NeighborsSize = 3;
  
  private final int _x;
  private final int _z;
  private boolean _state;
  private boolean _nextState;
  private float _velocity;
  private float _height;
  private Cell _neighbors[][];  // x, z
  
  Cell(int x, int z)
  {
    _x = x;
    _z = z;
    _state = false;
    _nextState = false;
    _velocity = 0;
    _height = 0;
    _neighbors = new Cell[NeighborsSize][NeighborsSize];
  }
  
  boolean getState()
  {
    return _state;
  }
  
  void setNextState(boolean state)
  {
    _nextState = state;
  }
  
  float getHeight()
  {
    return _height;
  }
  
  void setHeight(float h)
  {
    _height = h;
  }
  
  void addNeighbor(int dx, int dz, Cell cell)
  {
    if (dx < -1 || dx > 1 || dz < -1 || dz > 1 || (dx == 0 && dz == 0))
    {
      throw new IllegalArgumentException();
    }
    
    _neighbors[dx + 1][dz + 1] = cell;
  }
  
  void update()
  {
    // セルオートマトン関連の更新
    {
      // 周りのセルの生状態をカウント
      int liveCellCounter = 0;
      for (int i = -1; i <= 1; ++i)
      {
        for (int j = -1; j <= 1; ++j)
        {
          if (i == 0 && j == 0)
          {
            continue;
          }
          
          if (_neighbors[i + 1][j + 1].getState())
          {
            ++liveCellCounter;
          }
        }
      }
      
      if (_state)  // 生
      {
        if (liveCellCounter == 2 || liveCellCounter == 3)
        {
          _nextState = true;
        }
        else
        {
          _nextState = false;
        }
      }
      else  // 死
      {
        if (liveCellCounter == 3)
        {
          _nextState = true;
        }
      }
    }
    
    // 波関連の更新
    {
      // 減衰
      final float F = 0.005;
      _velocity -= F * _velocity;
      
      for (int i = -1; i <= 1; ++i)
      {
        for (int j = -1; j <= 1; ++j)
        {
          if (i == 0 && j == 0)
          {
            continue;
          }
          
          final float K = 0.05;
          
          int u = _x + i;
          int v = _z + j;
          if (u == -1 || u == CellsNum || v == -1 || v == CellsNum)
          {
            // 画面端は固定端として処理
            _velocity += K * (0 - _height);
          }
          else if ((i + j) % 2 != 0)
          { 
            // 上下左右との変位差から加速度を算出して加算
            _velocity += K * (_neighbors[i + 1][j + 1].getHeight() - _height);
          }
        }
      }
    }
  }
  
  void display()
  {
    // 状態が変わったら波を立てる
    if (!_state && _nextState)
    {
      final float WaveStrength = 0.125;
      _velocity += WaveStrength;
    }
    
    _state = _nextState;
    _height += _velocity;
    
    // 高さを描画用にclipする
    float h = _height;
    final float MaxHRange = 90;
    final float MinHRange = -20;
    if (h > MaxHRange)
    {
      h = MaxHRange;
    }
    else if (h < MinHRange)
    {
      h = MinHRange;
    }
    h -= MinHRange;
    
    stroke(0);
    if (_state)
    {
      fill(0.875, 1, 1);
    }
    else
    {
      float hue = map(h, 0, MaxHRange - MinHRange, 0.75, 0);
      fill(hue, 1, 1);
    }

    pushMatrix();    
    translate(_x * CellSize, 0, _z * CellSize);
    box(CellSize, h, CellSize);
    popMatrix();
  }
}
