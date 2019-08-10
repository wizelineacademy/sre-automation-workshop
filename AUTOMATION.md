# Automation

manual operation -> software-based automation -> autonomous system
High ----- human intervention ----- Low ----- None

## Values of automation

Consistency: any action performed by a human or humans hundreds of times won’t be performed the same way each time: even with the best will in the world, very few of us will ever be as consistent as a machine. This inevitable lack of consistency leads to mistakes, oversights, issues with data quality, and, yes, reliability problems.

A Platform: that can be extended, applied to more systems, or perhaps even spun out for profit. also centralizes mistakes, a bug fixed in the code will be fixed there once and forever. can be extended to perform additional tasks. can export metrics about its performance

Faster Repairs: resolve common faults in a system (a frequent situation for SRE-created automation). If automation runs regularly and successfully enough, the result is a reduced mean time to repair (MTTR) for those common faults.

Faster Action: humans don’t usually react as fast as machines.

Time Saving: effort saved in not requiring a task to be performed manually versus the effort required to write it. anyone can execute the task. Decoupling operator from operation is very powerful.

## Examples of Automation

- User account creation
- Cluster or infrastructure turnup and turndown for services
- Software or hardware installation preparation and decommissioning
- Rollouts of new software versions
- Runtime configuration changes
- A special case of runtime config changes: changes to your dependencies
- Automatic generation of code and templatization

## Our Favorites Tools for Automation

- Bash
- Python
- Terraform

Workshop: My Blog In the Cloud

## Reference

https://landing.google.com/sre/sre-book/chapters/automation-at-google/
https://landing.google.com/sre/sre-book/chapters/eliminating-toil/