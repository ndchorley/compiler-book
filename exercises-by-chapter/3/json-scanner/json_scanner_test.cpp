#include <string>
#include <vector>

using namespace std;
using namespace std::string_literals;

#include <gtest/gtest.h>
#include <gmock/gmock.h>

enum class Token {
    STRING
};

vector<Token> scan(string json) {
    return vector { Token::STRING };
}


TEST(JsonScannerTest, It_finds_a_string) {
    auto json = R"("cat")"s;

    auto result = scan(json);

    ASSERT_THAT(result.front(), testing::Eq(Token::STRING));
}
