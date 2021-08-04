
document.addEventListener('turbolinks:load', function () {

    document.querySelector('#task_assignment_task_id').addEventListener('change',function(event){
        let new_value = parseInt(event.target.value)
        let new_options = task_items.filter(function (item){
            return item.id === new_value
        })
        let new_items = new_options[0].task_items
        let options_str= ""
        new_items.forEach(function (item){
            options_str = options_str + `<option value=${item.id}>${item.title}</option>`
        })
        document.getElementById('task_assignment_task_item_ids').innerHTML = options_str;
    });
});
