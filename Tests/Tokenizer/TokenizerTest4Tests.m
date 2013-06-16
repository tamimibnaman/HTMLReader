// This file was autogenerated from Tests/html5lib/tokenizer/test4.test.

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTokenizer.h"

@interface TokenizerTest4Tests : SenTestCase

@end

@implementation TokenizerTest4Tests
        
- (void)test0
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z/0  <>"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"StartTag",@"z",@{@"0":@"",@"<":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"< in attribute name");
}
        
- (void)test1
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z x=<>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"z",@{@"x":@"<"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"< in attribute value");
}
        
- (void)test2
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z=z=z>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"z",@{@"z":@"z=z"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"= in unquoted attribute value");
}
        
- (void)test3
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z =>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"z",@{@"=":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"= attribute");
}
        
- (void)test4
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z ==>"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"StartTag",@"z",@{@"=":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"== attribute");
}
        
- (void)test5
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z ===>"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"StartTag",@"z",@{@"=":@"="}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"=== attribute");
}
        
- (void)test6
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z ====>"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@"ParseError",@[@"StartTag",@"z",@{@"=":@"=="}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"==== attribute");
}
        
- (void)test7
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z=\"&\">"];
    NSArray *tokens = @[@[@"StartTag",@"z",@{@"z":@"&"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Allowed \" after ampersand in attribute value");
}
        
- (void)test8
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z=\"&'\">"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"z",@{@"z":@"&'"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Non-allowed ' after ampersand in attribute value");
}
        
- (void)test9
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&'>"];
    NSArray *tokens = @[@[@"StartTag",@"z",@{@"z":@"&"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Allowed ' after ampersand in attribute value");
}
        
- (void)test10
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&\"'>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"z",@{@"z":@"&\""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Non-allowed \" after ampersand in attribute value");
}
        
- (void)test11
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&xlink_xmlns;'>bar<z>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"z",@{@"z":@"&xlink_xmlns;"}],@[@"Character",@"bar"],@[@"StartTag",@"z",@{}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Text after bogus character reference");
}
        
- (void)test12
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&#x0020; foo'>bar<z>"];
    NSArray *tokens = @[@[@"StartTag",@"z",@{@"z":@"  foo"}],@[@"Character",@"bar"],@[@"StartTag",@"z",@{}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Text after hex character reference");
}
        
- (void)test13
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo \"='bar'>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"\"":@"bar"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Attribute name starting with \"");
}
        
- (void)test14
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo '='bar'>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"'":@"bar"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Attribute name starting with '");
}
        
- (void)test15
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a\"b='bar'>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"a\"b":@"bar"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Attribute name containing \"");
}
        
- (void)test16
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a'b='bar'>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"a'b":@"bar"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Attribute name containing '");
}
        
- (void)test17
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a=b'c>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"a":@"b'c"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Unquoted attribute value containing '");
}
        
- (void)test18
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a=b\"c>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"a":@"b\"c"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Unquoted attribute value containing \"");
}
        
- (void)test19
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a=\"b\"c>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"a":@"b",@"c":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Double-quoted attribute value not followed by whitespace");
}
        
- (void)test20
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a='b'c>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"foo",@{@"a":@"b",@"c":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Single-quoted attribute value not followed by whitespace");
}
        
- (void)test21
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<br a='b'/>"];
    NSArray *tokens = @[@[@"StartTag",@"br",@{@"a":@"b"},@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Quoted attribute followed by permitted /");
}
        
- (void)test22
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<bar a='b'/>"];
    NSArray *tokens = @[@[@"StartTag",@"bar",@{@"a":@"b"},@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Quoted attribute followed by non-permitted /");
}
        
- (void)test23
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doctype html \r"];
    NSArray *tokens = @[@"ParseError",@[@"DOCTYPE",@"html",[NSNull null],[NSNull null],@NO]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"CR EOF after doctype name");
}
        
- (void)test24
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z\r"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"CR EOF in tag name");
}
        
- (void)test25
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z/"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Slash EOF in tag name");
}
        
- (void)test26
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x0"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Zero hex numeric entity");
}
        
- (void)test27
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#0"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Zero decimal numeric entity");
}
        
- (void)test28
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041;"];
    NSArray *tokens = @[@[@"Character",@"A"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Zero-prefixed hex numeric entity");
}
        
- (void)test29
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065;"];
    NSArray *tokens = @[@[@"Character",@"A"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Zero-prefixed decimal numeric entity");
}
        
- (void)test30
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x &#X "];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"&#x "],@"ParseError",@[@"Character",@"&#X "]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Empty hex numeric entities");
}
        
- (void)test31
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&# &#; "];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"&# "],@"ParseError",@[@"Character",@"&#; "]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Empty decimal numeric entities");
}
        
- (void)test32
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x10000;"];
    NSArray *tokens = @[@[@"Character",@"𐀀"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Non-BMP numeric entity");
}
        
- (void)test33
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#X10FFFF;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"􏿿"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Maximum non-BMP numeric entity");
}
        
- (void)test34
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x110000;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Above maximum numeric entity");
}
        
- (void)test35
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x80000041;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"32-bit hex numeric entity");
}
        
- (void)test36
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x100000041;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"33-bit hex numeric entity");
}
        
- (void)test37
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#4294967361;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"33-bit decimal numeric entity");
}
        
- (void)test38
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x10000000000000041;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"65-bit hex numeric entity");
}
        
- (void)test39
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#18446744073709551681;"];
    NSArray *tokens = @[@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"65-bit decimal numeric entity");
}
        
- (void)test40
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#xD7FF;&#xD800;&#xD801;&#xDFFE;&#xDFFF;&#xE000;"];
    NSArray *tokens = @[@[@"Character",@"퟿"],@"ParseError",@[@"Character",@"�"],@"ParseError",@[@"Character",@"�"],@"ParseError",@[@"Character",@"�"],@"ParseError",@[@"Character",@"�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Surrogate code point edge cases");
}
        
- (void)test41
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<X>"];
    NSArray *tokens = @[@[@"StartTag",@"x",@{}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Uppercase start tag name");
}
        
- (void)test42
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</X>"];
    NSArray *tokens = @[@[@"EndTag",@"x"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Uppercase end tag name");
}
        
- (void)test43
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<x X>"];
    NSArray *tokens = @[@[@"StartTag",@"x",@{@"x":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Uppercase attribute name");
}
        
- (void)test44
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<x@AZ[`az{ @AZ[`az{>"];
    NSArray *tokens = @[@[@"StartTag",@"x@az@[`az@{",@{@"@az@[`az@{":@""}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Tag/attribute name case edge values");
}
        
- (void)test45
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<x x=1 x=2 X=3>"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"StartTag",@"x",@{@"x":@"1"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Duplicate different-case attributes");
}
        
- (void)test46
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</x X>"];
    NSArray *tokens = @[@"ParseError",@[@"EndTag",@"x"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Uppercase close tag attributes");
}
        
- (void)test47
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</x x x>"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"EndTag",@"x"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Duplicate close tag attributes");
}
        
- (void)test48
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<br/>"];
    NSArray *tokens = @[@[@"StartTag",@"br",@{},@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Permitted slash");
}
        
- (void)test49
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<xr/>"];
    NSArray *tokens = @[@[@"StartTag",@"xr",@{},@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Non-permitted slash");
}
        
- (void)test50
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</br/>"];
    NSArray *tokens = @[@"ParseError",@[@"EndTag",@"br"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Permitted slash but in close tag");
}
        
- (void)test51
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DoCtYpE HtMl PuBlIc \"AbC\" \"XyZ\">"];
    NSArray *tokens = @[@[@"DOCTYPE",@"html",@"AbC",@"XyZ",@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype public case-sensitivity (1)");
}
        
- (void)test52
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!dOcTyPe hTmL pUbLiC \"aBc\" \"xYz\">"];
    NSArray *tokens = @[@[@"DOCTYPE",@"html",@"aBc",@"xYz",@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype public case-sensitivity (2)");
}
        
- (void)test53
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DoCtYpE HtMl SyStEm \"XyZ\">"];
    NSArray *tokens = @[@[@"DOCTYPE",@"html",[NSNull null],@"XyZ",@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype system case-sensitivity (1)");
}
        
- (void)test54
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!dOcTyPe hTmL sYsTeM \"xYz\">"];
    NSArray *tokens = @[@[@"DOCTYPE",@"html",[NSNull null],@"xYz",@YES]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype system case-sensitivity (2)");
}
        
- (void)test55
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc>\x00"];
    NSArray *tokens = @[@"ParseError",@[@"Comment",@"doc"],@"ParseError",@[@"Character",@"\x00"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"U+0000 in lookahead region after non-matching character");
}
        
- (void)test56
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc\x00"];
    NSArray *tokens = @[@"ParseError",@[@"Comment",@"doc�"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"U+0000 in lookahead region");
}
        
- (void)test57
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"Comment",@"doc"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"U+0080 in lookahead region");
}
        
- (void)test58
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc﷑"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"Comment",@"doc﷑"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"U+FDD1 in lookahead region");
}
        
- (void)test59
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc🿿"];
    NSArray *tokens = @[@"ParseError",@"ParseError",@[@"Comment",@"doc🿿"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"U+1FFFF in lookahead region");
}
        
- (void)test60
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r?"];
    NSArray *tokens = @[@[@"Character",@"\n?"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"CR followed by non-LF");
}
        
- (void)test61
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r"];
    NSArray *tokens = @[@[@"Character",@"\n"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"CR at EOF");
}
        
- (void)test62
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\n"];
    NSArray *tokens = @[@[@"Character",@"\n"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"LF at EOF");
}
        
- (void)test63
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r\n"];
    NSArray *tokens = @[@[@"Character",@"\n"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"CR LF");
}
        
- (void)test64
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r\r"];
    NSArray *tokens = @[@[@"Character",@"\n\n"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"CR CR");
}
        
- (void)test65
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\n\n"];
    NSArray *tokens = @[@[@"Character",@"\n\n"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"LF LF");
}
        
- (void)test66
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\n\r"];
    NSArray *tokens = @[@[@"Character",@"\n\n"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"LF CR");
}
        
- (void)test67
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"text\r\r\rtext"];
    NSArray *tokens = @[@[@"Character",@"text\n\n\ntext"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"text CR CR CR text");
}
        
- (void)test68
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html PUBLIK \"AbC\" \"XyZ\">"];
    NSArray *tokens = @[@"ParseError",@[@"DOCTYPE",@"html",[NSNull null],[NSNull null],@NO]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype publik");
}
        
- (void)test69
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html PUBLI"];
    NSArray *tokens = @[@"ParseError",@[@"DOCTYPE",@"html",[NSNull null],[NSNull null],@NO]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype publi");
}
        
- (void)test70
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html SISTEM \"AbC\">"];
    NSArray *tokens = @[@"ParseError",@[@"DOCTYPE",@"html",[NSNull null],[NSNull null],@NO]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype sistem");
}
        
- (void)test71
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html SYS"];
    NSArray *tokens = @[@"ParseError",@[@"DOCTYPE",@"html",[NSNull null],[NSNull null],@NO]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype sys");
}
        
- (void)test72
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html x>text"];
    NSArray *tokens = @[@"ParseError",@[@"DOCTYPE",@"html",[NSNull null],[NSNull null],@NO],@[@"Character",@"text"]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Doctype html x>text");
}
        
- (void)test73
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a=aa`>"];
    NSArray *tokens = @[@"ParseError",@[@"StartTag",@"a",@{@"a":@"aa`"}]];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"Grave accent in unquoted attribute");
}
        
- (void)test74
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in tag name state ");
}
        
- (void)test75
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in tag name state");
}
        
- (void)test76
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a "];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in before attribute name state");
}
        
- (void)test77
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in attribute name state");
}
        
- (void)test78
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a "];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in after attribute name state");
}
        
- (void)test79
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a ="];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in before attribute value state");
}
        
- (void)test80
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a =\"a"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in attribute value (double quoted) state");
}
        
- (void)test81
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a ='a"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in attribute value (single quoted) state");
}
        
- (void)test82
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a =a"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in attribute value (unquoted) state");
}
        
- (void)test83
{
    HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a ='a'"];
    NSArray *tokens = @[@"ParseError"];
    STAssertEqualObjects(tokenizer.allObjects, tokens, @"%@", @"EOF in after attribute value state");
}

@end
