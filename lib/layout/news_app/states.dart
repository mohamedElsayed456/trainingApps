abstract class NewsStates{}

class NewsInitialStates  extends NewsStates{}

class NewsBottomnavStates  extends NewsStates{}

class NewsgetbusinessloadingStates  extends NewsStates{}

class NewsbusinesssuccessStates  extends NewsStates{}

class NewsbusinesserrorStates  extends NewsStates
{
final String error;
NewsbusinesserrorStates(this.error);
}

class NewsgetsportsloadingStates  extends NewsStates{}

class NewssportssuccessStates  extends NewsStates{}

class NewssportserrorStates  extends NewsStates
{
final String error;
NewssportserrorStates(this.error);
}

class NewsgetscienceloadingStates  extends NewsStates{}

class NewssciencesuccessStates  extends NewsStates{}

class NewsscienceerrorStates  extends NewsStates
{
final String error;
NewsscienceerrorStates(this.error);
}

class NewsgetsearchloadingStates  extends NewsStates{}

class NewssearchsuccessStates  extends NewsStates{}

class NewssearcherrorStates  extends NewsStates
{
final String error;
NewssearcherrorStates(this.error);
}

class AppChangeModeState extends NewsStates{}
