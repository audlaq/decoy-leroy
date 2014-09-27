class IssuesController < AdminController
  def index
    # TODO: find the decoy by the session
    @decoy = @decoys.first

    # TODO: find the issues by the decoy
    @issues = [
        "Lateness",
        "Forgot to buy a birthday gift",
        "You committed a prank",
        "Said something dumb on Twitter",
        "Ran out of cash",
        "Caught speeding",
        "Caught coming from a strip club",
        "Murder",
        "Sexting",
        "Caught in infidelity",
        "Accused of eating the last piece of fried chicken",
        "Overlooked an important work email",
        "Caught stealing Nike Air Jordans",
        "Guessing wrong on Family Fued",
        "Untidey",
        "At the bar, but wallet at home.",
        "Accused of photohopping your pictures on Instagram pictures",
        "Not being able to hail a cab",
        "Unsuccessfully singing Taylor Swift's 'Shake It Off'",
        "Forgetting to walk your dog.",
        "Incorrectly spelling the name of a foriegn exchange student",
        "Not making restuarant reservations for your 5th anniversary",
        "Accused of freestyling over the PA system at work",
        "Tanking the economy (a white banker)"
    ]
  end
end