#Installing Minitest

#To get the latest version of Minitest run:
$ gem install minitest

#Verify you have Minitest with:
$ gem list minitest

# *** LOCAL GEMS ***
# minitest (5.4.3)
# You should see version 5.4.3 or higher. You may also have multiple versions of the minitest gem installed.

# Verifying The Installation
# Create a temporary Ruby file so we can write some code to verify that Minitest was installed properly. In the new file, write the following code:


# in temp.rb
require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end

# Then run this file as you would any Ruby file. If you named it temp.rb, you'd run it like this:
# $ ruby temp.rb
# Run options: --seed 30741

# # Running:

# MyFirstTest .

# Finished in 0.001034s, 967.2303 runs/s, 967.2303 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips