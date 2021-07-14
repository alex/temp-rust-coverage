#[pyo3::prelude::pyfunction]
pub fn foo(
    arg0: u8,
    arg1: u8,
    arg2: u8,
    arg3: u8
) -> u8 {
    arg0 + arg1 + arg2 + arg3
}

pub fn bar() -> u32 {
    17
}

#[cfg(test)]
mod tests {
    use super::{foo, bar};

    #[test]
    fn test_foo() {
        let result = foo(1, 2, 3, 4);
        assert_eq!(result, 10);
    }

    #[test]
    fn test_bar() {
        let result = bar();
        assert_eq!(result, 17);
    }
}
