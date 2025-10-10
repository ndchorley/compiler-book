#include <string>
#include <vector>

using namespace std;
using namespace std::string_literals;

#include <gtest/gtest.h>
#include <gmock/gmock.h>

enum class Token {
    STRING
};

class InvalidJson : std::exception {};

vector<Token> scan(string json) {
    if (json.front() != '"') throw InvalidJson();

    return vector { Token::STRING };
}

TEST(JsonScannerTest, It_finds_a_string) {
    auto json = R"("cat")"s;

    auto result = scan(json);

    ASSERT_THAT(result.front(), testing::Eq(Token::STRING));
}

TEST(JsonScannerTest, It_fails_if_the_string_does_not_start_with_quotes) {
    auto invalid_json = R"(cat")"s;

    ASSERT_THROW(scan(invalid_json), InvalidJson);
}
