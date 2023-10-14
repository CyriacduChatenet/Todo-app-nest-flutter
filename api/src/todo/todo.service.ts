import { Injectable } from '@nestjs/common';

import { CreateTodoDto } from './dto/create-todo.dto';
import { UpdateTodoDto } from './dto/update-todo.dto';
import { TodoRepository } from './todo.repository';

@Injectable()
export class TodoService {
  constructor(private todoRepository: TodoRepository) {}
  create(createTodoDto: CreateTodoDto) {
    return this.todoRepository.createTodo(createTodoDto);
  }

  findAll() {
    return this.todoRepository.findAllTodos();
  }

  findOne(id: string) {
    return this.todoRepository.findOneTodoById(id);
  }

  update(id: string, updateTodoDto: UpdateTodoDto) {
    return this.todoRepository.updateTodoById(id, updateTodoDto);
  }

  remove(id: string) {
    return this.todoRepository.removeTodoById(id);
  }
}
