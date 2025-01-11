from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://barbaraleimig:aluno123@cluster0.uhy6h.mongodb.net/markX?retryWrites=true&w=majority&appName=Cluster0')
db = client['markX']

@keyword('Remover tarefa do banco de dados')
def remove_task_by_name(task_name):
    collections = db['tasks']
    collections.delete_many({'text': task_name})
    print('Removendo a tarefa ' + task_name)