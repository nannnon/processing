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
      
      // 上下左右との変位差から加速度を算出して加算
      for (int i = -1; i <= 1; ++i)
      {
        for (int j = -1; j <= 1; ++j)
        {
          if (i == 0 && j == 0)
          {
            continue;
          }
          
          if ((i + j) % 2 != 0)
          { 
            final float K = 0.05;
            _velocity += K * (_neighbors[i + 1][j + 1].getHeight() - _height);
          }
        }
      }
    }
  }
  
  void display()
  {
    // 状態が変わったら波を立てる
    final float WaveStrength = 100;
    if (_state && !_nextState)
    {
      _velocity -= WaveStrength;
    }
    else if (!_state && _nextState)
    {
      _velocity += WaveStrength;
    }
    
    _state = _nextState;
    _height += _velocity;
    
    // 高さを描画用にclipする
    float h = _height;
    {
      final float MaxHRange = 30;
      if (h > MaxHRange)
      {
        h = MaxHRange;
      }
      else if (h < -MaxHRange)
      {
        h = -MaxHRange;
      }
      h += MaxHRange;
    }
    
    stroke(0);
    if (_state)
    {
      fill(0, 255, 0);
    }
    else
    {
      fill(128, 128, 128);
    }

    pushMatrix();    
    translate(_x * CellSize, 0, _z * CellSize);
    box(CellSize, h, CellSize);
    popMatrix();
  }
}
