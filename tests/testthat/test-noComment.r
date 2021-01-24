test_that("Remove commented  characters returns evaluatable code", {

  commented_code = c("# 1 + 1",  "#' 3 + 3")
  noComments <- removeCommentCharacters(commented_code)
#to do  sourcetools::tokenize_string(noComments)

  expect_equal(eval(str2lang(noComments[1])), 2)
  expect_equal(eval(str2lang(noComments[2])), 6)


})
