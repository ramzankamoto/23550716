# Function to perform linear regression to find the effect of being an EU country while controlling for additional variables
lm_eu_effect <- function(data, dependent_var, control_vars = NULL) {
    # Check if the necessary columns are present
    if (!("eu_member" %in% colnames(data))) {
        stop("Data frame must contain the column: eu_member")
    }

    # Construct the formula for the linear model
    formula <- as.formula(paste(dependent_var, "~ eu_member",
                                if (!is.null(control_vars)) paste("+", paste(control_vars, collapse = " + ")) else ""))

    # Fit the linear model
    model <- lm(formula, data = data)

    # Return the summary of the model
    summary(model)
}

