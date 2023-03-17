
# frozen_string_literal: true

title 'DPS Labs - AWS Service Account Profiles'

describe aws_iam_group(group_name: 'DPSTeamMemberGroup') do
  it { should exist }
  its('users') { should include('DPSSimpleServiceAccount') }
end

describe aws_iam_policy(policy_name: 'DPSTeamMemberGroup') do
  it { should exist }
  its('attached_groups') { should cmp('DPSTeamMemberGroup') }
end

describe aws_iam_user(user_name: 'DPSSimpleServiceAccount') do
  it { should exist }
end

describe aws_iam_group(group_name: 'DPSNonprodServiceAccountGroup') do
  it { should exist }
  its('users') { should include('DPSNonprodServiceAccount') }
end

describe aws_iam_group(group_name: 'DPSProdServiceAccountGroup') do
  it { should exist }
  its('users') { should include('DPSProdServiceAccount') }
end

# describe aws_iam_group(group_name: 'DPSCoreLabsTeamGroup') do
#   it { should exist }
# end

describe aws_iam_user(user_name: 'DPSNonprodServiceAccount') do
  it { should exist }
end

describe aws_iam_user(user_name: 'DPSProdServiceAccount') do
  it { should exist }
end
