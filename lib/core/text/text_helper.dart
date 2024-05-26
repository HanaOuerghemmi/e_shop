String textcateWithEllipsis({required int cutoff, required String myString}) {
  return (myString.length <= cutoff)
      ? myString
      : '${myString.substring(0, cutoff)}...';
}
