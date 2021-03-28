abstract class Either<L, R> {
  final L? left;
  final R? right;

  Either({this.left, this.right});

  bool get isLeft => this.left != null;
  bool get isRight => this.right != null;

  void fold({required Function(L? l) onLeft, required Function(R? r) onRight}) {
    if (!isRight) {
      onLeft(this.left);
    }
    else {
      onRight(this.right);
    }
  }
}

class Right<L, R> extends Either<L, R> {
  Right(right): super(right: right);
}

class Left<L, R> extends Either<L, R> {
  Left(left) : super(left: left);
}