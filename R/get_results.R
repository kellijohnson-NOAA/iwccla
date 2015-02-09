#' Read in results from Man-v14z.for

#' @param data A \code{RES0} file as output from \code{Man-v14z.for}
#' @return A list of data

#' @author Kelli Faye Johnson

get_results <- function(data) {
  results <- list()

  # ntrials: number of trials
  results$ntrials <- max(as.numeric(sapply(
    strsplit(data[grep("Trial", data)], "[[:space:]]+"), "[[", 2)))

  # nyears: number of years in simulation
  results$nyears <- grep("Number of years in simulation", data, value = TRUE)
  results$nyears <- as.numeric(tail(unlist(strsplit(
    results$nyears, "[[:space:]]+")), 1))

  # msyl: MSYL Outputs
  # MSYLT1, MSYLT0, MSYLT2, AMSYR1, AMSYL1, AMSYR0, AMSYL0, AMSYR2, AMSYL2
  outs <- sapply(strsplit(grep("MSYL Outputs", data, value = TRUE), ":"), "[[", 2)
  outs <- lapply(strsplit(outs, "[[:space:]]+"), function(x) {
    as.numeric(x[x != ""])
    })
  outs <- as.data.frame(do.call("rbind", outs))
  colnames(outs) <- c("MSYLT1", "MSYLT0", "MSYLT2", "AMSYR1", "AMSYL1",
                      "AMSYR0", "AMSYL0", "AMSYR2", "AMSYL2")
  results$msyl <- outs

  # biomass:
  # c("Year", "PTRUE", "PSURV", "Catch", "BIRSUM")

  results$biomass <- list()
  results$ptrueterminal <- vector(length = results$ntrials)
  results$psurvterminal <- vector(length = results$ntrials)
  results$catchterminal <- vector(length = results$ntrials)
  out.line <- grep("CM 1", data) + 1

  for (yr in seq_along(out.line)) {
    out <- data[out.line[yr]:(out.line[yr] + results$nyears)]
    out <- lapply(out, function(x) {
      temp <- unlist(strsplit(x, "[[:space:]]+")[[1]])
      temp[!temp %in% ""]
      })
    out <- as.data.frame(apply(do.call("rbind", out), 2, as.numeric))
    colnames(out) <- c("year", "ptrue", "psurv", "catch", "birsum")
    results$biomass[[yr]] <- out
    results$ptrueterminal[yr] <- tail(out$ptrue, 2)[1]
    results$psurvterminal[yr] <- tail(out$psurv, 2)[1]
    results$catchterminal[yr] <- tail(out$catch, 2)[1]
  }

  # k1: Carrying capacity of the 1+ population
  out <- grep("Carrying capacity \\(mature\\)", data, value = TRUE)
  out <- as.numeric(tail(unlist(strsplit(out, "[[:space:]]")), 1))
  results$k1 <- out

  # km: Carrying capacity of the mature population
  out <- grep("Carrying capacity \\(1\\+\\)", data, value = TRUE)
  out <- as.numeric(tail(unlist(strsplit(out, "[[:space:]]")), 1))
  results$km <- out

  # nzero: NZERO
  out <- unlist(strsplit(grep("NZERO", data, value = TRUE), ":"))[2]
  results$nzero <- as.numeric(gsub(" ", "", out))

  # msy:


  invisible(return(results))
}