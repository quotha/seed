Given /^the seed module$/ do
  load 'seed.rb'
end

Given /^a hash with some stats$/ do
  @stats = {'ab' => 101, 'h' => 33, 'bb' => 13, 'hbp' => 1, 'sf' => 5,
            's' => 21, 'd' => 9, 't' => 1, 'hr' => 2}
end

Then /^the batting average method should give the correct average$/ do
  @avg = Seed::batting_avg @stats
  @avg.to_s.should == '0.326732673267327'
end

Then /^the on base percentage method should give the correct percentage$/ do
  @obp = Seed::on_base_per @stats
  @obp.to_s.should == '0.391666666666667'
end

Then /^the slugging percentage method should give the correct percentage$/ do
  @slg = Seed::slugging_per @stats
  @slg.to_s.should == '0.495049504950495'
end

Then /^the on base plus slugging method should give the correct percentage$/ do
  @ops = Seed::on_base_plus_slugging @stats
  @ops.to_s.should == '0.886716171617162'
end

Then /^runs created method should give the correct value$/ do
  @rc = Seed::runs_created @stats
  @rc.to_s.should == '20.1754385964912'
end

Given /^a hash with some pitching stats$/ do
  @pitching_stats = {'era' => 3, 'ip' => 8, 'bb' => 2, 'h' => 5}
end

Then /^the earned run average method should give the correct average$/ do
  @era = Seed::earned_run_avg @pitching_stats
  @era.to_s.should == '3.375'
end

Then /^the whip method should give the correct value$/ do
  @whip = Seed::whip @pitching_stats
  @whip.to_s.should == '0.875'
end
