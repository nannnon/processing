class Edge
{
  private Node _n0;
  private Node _n1;
  
  Edge(Node n0, Node n1)
  {
    _n0 = n0;
    _n1 = n1;
  }
  
  void display()
  {
    noFill();
    stroke(255, 64);
    line(_n0._x, _n0._y, _n1._x, _n1._y);
  }
}
