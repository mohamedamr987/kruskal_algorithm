import 'package:kruskal/kruskal.dart';

void main(List<String> arguments) {
  List<Edge> inputEdges = [];
  List<String> inputVertices=[];
  inputEdges.add( Edge(5, "0", "1"));
  inputEdges.add( Edge(3, "1", "2"));
  inputEdges.add( Edge(1, "2", "3"));
  inputEdges.add(Edge(2, "0", "2"));
  inputEdges.add(Edge(4, "1", "3"));

  inputVertices.add("0");
  inputVertices.add("1");
  inputVertices.add("2");
  inputVertices.add("3");
  KruskalAlgorithm kruskalAlgorithm = KruskalAlgorithm(inputEdges, inputVertices);
  print("Answer : ${kruskalAlgorithm.execute()}");
  print(kruskalAlgorithm.getCost());
}
