#[proc_macro_attribute]
pub fn pyfunction(attr: proc_macro::TokenStream, input: proc_macro::TokenStream) -> proc_macro::TokenStream {
    let ast = syn::parse_macro_input!(input as syn::ItemFn);
    quote::quote!(
        #ast
    ).into()
}
