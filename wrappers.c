#include "Python.h"

_Bool dylan_PyDict_Check(PyObject * obj)
{
  return PyDict_Check(obj);
}

_Bool dylan_PyInt_Check(PyObject * obj)
{
  return PyInt_Check(obj);
}

_Bool dylan_PyString_Check(PyObject * obj)
{
  return PyString_Check(obj);
}
