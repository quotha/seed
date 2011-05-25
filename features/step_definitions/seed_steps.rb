Given /^the seed module$/ do
  load 'seed.rb'
end

Given /^a hash with some stats$/ do
  @stats = {'ab' => 2, 'h' => 1}
end

Given /^a hash with some more stats$/ do
  @stats = {'ab' => 24, 'h' => 10, 'bb' => 5, 'hbp' => 1, 'sf' => 2,
            's' => 6, 'd' => 3, 't' => 0, 'hr' => 1}
end

Then /^the batting average method should give the correct average$/ do
  @avg = Seed::batting_avg @stats
  @avg.should == 0.5
end

Then /^the on base percentage method should give the correct percentage$/ do
  @obp = Seed::on_base_per @stats
  @obp.should == 0.5
end

Then /^the slugging percentage method should give the correct percentage$/ do
  @slg = Seed::slugging_per @stats
  @slg.should.to_s == '0.666666666666667'
end
