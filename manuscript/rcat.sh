#!/bin/bash
echo "" >> $2
echo '```ruby' >> $2
cat $1 >> $2
echo '```' >> $2
echo "" >> $2
