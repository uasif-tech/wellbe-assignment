import tinymce from 'tinymce/tinymce';
import 'tinymce/themes/silver/theme';
import 'tinymce/plugins/table';
import 'tinymce/plugins/lists';
import 'tinymce/icons/default/icons'

function tinyMce() {
    tinymce.init({
        selector: 'textarea.tinymce',
        plugins: [
            'table',
            'lists'
        ]
    });
}

export {tinyMce};
