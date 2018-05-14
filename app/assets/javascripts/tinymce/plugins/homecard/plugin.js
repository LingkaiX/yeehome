tinymce.PluginManager.add("homecard", function(editor, url) {
  // Add a button that opens a window
  editor.addButton("homecard", {
    //text: "My button",
    icon: "anchor",
    onclick: function() {
      // Open window
      editor.windowManager.open({
        title: "Insert an itemcard",
        body: [{ type: "textbox", name: "title", label: "Title" }],
        onsubmit: function(e) {
          // Insert content when the window form is submitted
          editor.insertContent("Title: " + e.data.title);
        }
      });
    }
  });

  return {
    getMetadata: function() {
      return {
        name: "Example plugin",
        url: "https://www.tinymce.com/docs/advanced/creating-a-plugin/"
      };
    }
  };
});
