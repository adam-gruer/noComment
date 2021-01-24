test_that("Remove commented  characters returns evaluatable code", {

  commented_code = c("# 1 + 1",  "#' 3 + 3")
  noComments <- removeCommentCharacters(commented_code)
#to do  sourcetools::tokenize_string(noComments)

  expect_equal(removeCommentCharacters(commented_code), c("1 + 1",  " 3 + 3"))

})
