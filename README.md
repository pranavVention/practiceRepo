# Python Package Creatin - Beginner's guide

This readme explains how to create python package from a python module.

What python module looks like
------------------------------

Python module is a directory with `__init__.py` file in it. The `__init__.py` file can be empty or can contain some code. The code in `__init__.py` is executed when the module is imported.

example:
    
    ```
    parent_folder/
        my_module/
            __init__.py
            my_module.py
    ```



How to create python package using poetry
----------------------------

1. Install poetry using 
    ```bash
    pip install poetry
    ```

2. Navigate to the directory containing the module (`parent_folder`).

3. Run 
    ```bash
    poetry init
    ``` 
This will create `pyproject.toml` file in the `parent_folder`.

4. Create `README.md` file in the same directory as `pyproject.toml` file.

5. Build the package by running
    ```bash
    poetry build
    ```
    This will create `dist` directory containing the package.






How to use the package
----------------------

1. Install the package using

    ```bash
    pip install <path_to_package>/dist/<package_name>-<version>.tar.gz
    ```
2. Use the package.



