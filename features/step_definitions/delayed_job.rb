
Given /^the jobs are dispatched$/ do
  Delayed::Worker.new.work_off
end
