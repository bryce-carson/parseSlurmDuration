# Copyright 2022 Bryce Carson
# Author: Bryce Carson <bcars268@mtroyal.ca>
# URL: https://github.com/bryce-carson/slurmDuration
#
# parseSlurmDuration.R is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# parseSlurmDuration.R is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

parseSlurmDuration <- function(duration) {
  stopifnot(is.character(duration), length(duration) == 1)
  duration_strings <- strsplit(duration, "[:-]")[[1]]
  switch (length(duration_strings),
    paste0("PT", duration_strings, "M"),
    if (grepl(":", duration)) {
      paste0("PT", duration_strings[1], "M", duration_strings[2], "S")
    } else {
      paste0("P", duration_strings[1], "DT", duration_strings[2], "H")
    },
    if (!grepl("-", duration)) {
      paste0("PT",
             duration_strings[1], "H",
             duration_strings[2], "M",
             duration_strings[3], "S"
             )
    } else {
      paste0("P",
             duration_strings[1], "DT",
             duration_strings[2], "H",
             duration_strings[3], "M")
    },
    paste0("P", duration_strings[1], "DT",
           duration_strings[2], "H",
           duration_strings[3], "M",
           duration_strings[4], "S")
  )
}
