## Routes

- `/register` - users can sign up
- `/login` - registered users can log in
- `/` - all blogs
- `/blog/:id`
- `/addPost`
- `/updatePost`
- `/deletePost`

## Database

users:
    - user_id
    - user_name
    - user_email
    - user_password

blog:
    - blog_id
    - blog_title
    - blog_content
    - timestamp
    - user_id
