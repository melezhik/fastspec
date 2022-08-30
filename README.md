# Fastspec

Ran rakudo spec tests in parallel on multiple hosts using Tomtit and Cromtit


# Design

So an idea is to split t/spec/spectest.chunk.data into chunks
and test against those chunks on parallel hosts:


```
                     /-------> spec, part 1 ---> host A
                    /
                   /
    /-------------\
    |kick off host| ---------> spec, part 2  ---> host B (kickoff host)
    \-------------/\
                    \
                     \-------> spec, part 3 ---> host C



```

On 2 hosts parallelization the overall build time is about 11 minutes
(including Rakudo build ad install time) against 23 minute of an
official Rakudo Ado pipeline.

# Example hosts configuration

See `cromtit.yaml`

# Author

Alexey Melezhik



