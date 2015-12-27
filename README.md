# gcdproj
Peer analysis for getting and cleaning data


Reasonably straightforward analysis.  up until the begin merging comment, the script is just reading csv files into memory.

Once the all-too-many files are in memory, we use the next 3 lines to merge the test and training data.

After this, we apply the names from the features file to the huge dataset in xdat, then scrape that for only columns with the word, "mean" in them, dropping the rest of the columns to create the first tidyset variable.  This leaves us with a large table without unique values.  the dplyr library is then loaded to do the somewhat complicated line that averages all the columns once grouped by activity and subject, that is that we take BOTH columns to be a combined key, then apply the mean() function down each column in order to leave us with 1 reading per subject/activity pair.  Finally, we write out the table with row.names=FALSE as per instructions.