// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract ToldSo {
    struct Post {
        string title;
        string body;
        uint256 timestamp;
    }

    mapping(address => Post[]) private authorToPosts;

    function createPost(string memory title,string memory body) public {
        Post memory post = Post(title, body, block.timestamp);
        authorToPosts[msg.sender].push(post);
    }

    function getPostByAuthor(address author) external view 
        returns(Post[] memory){
            return authorToPosts[author];
        }
}