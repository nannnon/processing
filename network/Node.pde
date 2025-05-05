class Node
{
  final float _x;
  final float _y;
  private ArrayList<Node> _adjacentNodes;
  
  Node(float x, float y)
  {
    _x = x;
    _y = y;
    _adjacentNodes = new ArrayList<Node>();
  }
  
  void addAdjacentNodes(ArrayList<Node> allNodes, float distanceThreashold)
  {
    for (Node n : allNodes)
    {
      // 自分自身だったらスキップ
      if (n == this)
      {
        continue;
      }
      
      // 既に追加されていたらスキップ
      boolean alreadyAdded = false;
      for (Node n2 : _adjacentNodes)
      {
        if (n == n2)
        {
          alreadyAdded = true;
          break;
        }
      }
      if (alreadyAdded)
      {
        continue;
      }
      
      // 距離が閾値以下なら追加
      float distance = dist(_x, _y, n._x, n._y);
      if (distance <= distanceThreashold)
      {
        addAdjacentNodes(n);
        n.addAdjacentNodes(this);
        g_edges.add(new Edge(this, n));
      }
    }
  }
  
  void addAdjacentNodes(Node n)
  {
    if (n == this)
    {
      throw new IllegalArgumentException();
    }
    
    _adjacentNodes.add(n);
  }
  
  Node getRandomAdjacentNode()
  {
     if (_adjacentNodes.size() == 0)
     {
       return null;
     }
     else
     {
       int i = int(random(_adjacentNodes.size()));
       return _adjacentNodes.get(i);
     }
  }
  
  void display()
  {
    final float Radius = 10;
    noFill();
    stroke(255, 64);
    ellipse(_x, _y, Radius, Radius);
  }
}
