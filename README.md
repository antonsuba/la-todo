# la-todo

## Setup
1. Install dependencies `bundle install`
2. Run migrations `rake db:migrate`
3. Activate local server `rails s`

## API
- Create todo list: `POST /todo`\
  Params:
  - **title**

- Create task: `POST /todo/{todo_id}/tasks`\
  Params:
  - **title**
  - content
- Update task: `PUT /todo/{todo_id}/tasks/{task_id}`
- Delete task `DELETE /todo/{todo_id}/tasks/{task_id}`
- Reposition task `POST /todo/{todo_id}/tasks/{task_id}`

  Params (at least one param should be provided): 
  - **prev_id**: ID of task before current task's new position
  - **next_id**: ID of task after current task's new position

  Sample:\
  `[Task 1, Task 2, Task 3, Task 4]` to `[Task 1, Task 3, Task 2, Task 4]`\
  Resulting curl request should be: `/todo/{todo_id}/tasks/{task_id} -d "prev_id=3&next_id=4"`
  
  
## Tests
`rails test` to run todo and tasks tests
