abstract class counterstates{}

class counterinitialstate extends counterstates{}

class counterminusstate extends counterstates
{
 final int counter;
counterminusstate(this.counter);
}
class counterplusstate extends counterstates
{
final int counter;
counterplusstate(this.counter);
}