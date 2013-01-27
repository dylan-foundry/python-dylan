#include "Python.h"

_Bool dylan_PyBool_Check(PyObject * obj)
{
  return PyBool_Check(obj);
}

_Bool dylan_PyBool_IsTrue(PyObject * obj)
{
  return Py_True == obj;
}

_Bool dylan_PyDict_Check(PyObject * obj)
{
  return PyDict_Check(obj);
}

_Bool dylan_PyInt_Check(PyObject * obj)
{
  return PyInt_Check(obj);
}

_Bool dylan_PyList_Check(PyObject * obj)
{
  return PyList_Check(obj);
}

_Bool dylan_PyString_Check(PyObject * obj)
{
  return PyString_Check(obj);
}

_Bool dylan_PyTuple_Check(PyObject * obj)
{
  return PyTuple_Check(obj);
}
