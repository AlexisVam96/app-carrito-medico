package com.controlador;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.config.FechaHora;
import com.modelo.Carrito;
import com.modelo.Cliente;
import com.modelo.Compra;
import com.modelo.Detalle;
import com.modelo.Pago;
import com.modelo.Producto;
import com.modelo.Venta;
import com.modeloDao.ClienteDao;
import com.modeloDao.CompraDao;
import com.modeloDao.PagoDao;
import com.modeloDao.ProductoDao;
import com.modeloDao.VentaDao;


/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	List<Detalle> detalles=new ArrayList<Detalle>();
	
	Compra compra=new Compra();
	CompraDao comDao=new CompraDao();
	List<Compra> compras=new ArrayList<>();
    
	Cliente cliente=new Cliente();
	ClienteDao clienteDao=new ClienteDao();
	
	Pago pago=new Pago();
	Pago pago1=new Pago();
	PagoDao pagodao=new PagoDao();
	
	ProductoDao pdao=new ProductoDao();
	Producto p=new Producto();
	List<Producto> productos=new ArrayList<>();
	
	Cliente cl=new Cliente();
	ClienteDao cdao=new ClienteDao();
	
	List<Carrito> listaCarrito=new ArrayList<>();
	
	Venta v=new Venta();
	VentaDao vdao=new VentaDao();
	List<Venta> ventas=new ArrayList<>();
	
	int id_pago;
    double totalPagar=0.0;
    int cantidad=1;
    int idp;
    Carrito car;
    int pos;
    int r;
	/**
     *
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String menu=request.getParameter("menu");
		String accion=request.getParameter("accion");
		productos=pdao.listar();
		ventas = vdao.listarVentas();
					
		if(menu.equals("Producto")) {
			switch (accion) {
				case "Listar":
					productos=pdao.listar();
					request.setAttribute("productos", productos);
					break;
				case "Agregar":
					ArrayList<String> lista = new ArrayList<>();
	                try {
	                    FileItemFactory file = new DiskFileItemFactory();
	                    ServletFileUpload fileUpload = new ServletFileUpload(file);
	                    List<FileItem> items = fileUpload.parseRequest(request);
	                    for (int i = 0; i < items.size(); i++) {
	                        FileItem fileItem = (FileItem) items.get(i);
	                        if (!fileItem.isFormField()) {
	                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
	                            fileItem.write(f);
	                            p.setFoto("http://localhost/img/"+fileItem.getName());
	                        } else {
	                            lista.add(fileItem.getString());
	                        }
	                    }
	                    p.setNombre(lista.get(0));
	                    p.setDescripcion(lista.get(1));
	                    p.setPrecio(Double.parseDouble(lista.get(2)));
	                    p.setStock(Integer.parseInt(lista.get(3)));
	                    pdao.agregar(p);
	                } catch (Exception e) {
	                }
					
					request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
					break;
				case "Editar":
					idp=Integer.parseInt(request.getParameter("id"));
					Producto pro=pdao.listarId(idp);
					request.setAttribute("producto", pro);
					request.getRequestDispatcher("Controlador?menu=ActualizarProducto&accion=Listar").forward(request, response);
					break;
				case "Actualizar":
					ArrayList<String> lista1 = new ArrayList<>();
	                try {
	                    FileItemFactory file = new DiskFileItemFactory();
	                    ServletFileUpload fileUpload = new ServletFileUpload(file);
	                    List<FileItem> items = fileUpload.parseRequest(request);
	                    for (int i = 0; i < items.size(); i++) {
	                        FileItem fileItem = (FileItem) items.get(i);
	                        if (!fileItem.isFormField()) {
	                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
	                            fileItem.write(f);
	                            p.setFoto("http://localhost/img/"+fileItem.getName());
	                        } else {
	                            lista1.add(fileItem.getString());
	                        }
	                    }
	                    p.setNombre(lista1.get(0));
	                    p.setDescripcion(lista1.get(1));
	                    p.setPrecio(Double.parseDouble(lista1.get(2)));
	                    p.setStock(Integer.parseInt(lista1.get(3)));
	                    p.setId(idp);
	                    pdao.actualizar(p);
	                } catch (Exception e) {
	                }
	                
					request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
					break;
				case "Eliminar":
					idp=Integer.parseInt(request.getParameter("id"));
					pdao.eliminar(idp);
					request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
					break;
				default:
					throw new AssertionError();
			}
			request.getRequestDispatcher("producto.jsp").include(request, response);
		}
		
		if(menu.equals("ActualizarProducto")) {
			switch (accion) {
				case "Listar":
					productos=pdao.listar();
					request.setAttribute("productos", productos);
					break;
				case "Actualizar":
					ArrayList<String> lista1 = new ArrayList<>();
	                try {
	                    FileItemFactory file = new DiskFileItemFactory();
	                    ServletFileUpload fileUpload = new ServletFileUpload(file);
	                    List<FileItem> items = fileUpload.parseRequest(request);
	                    for (int i = 0; i < items.size(); i++) {
	                        FileItem fileItem = (FileItem) items.get(i);
	                        if (!fileItem.isFormField()) {
	                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
	                            fileItem.write(f);
	                            p.setFoto("http://localhost/img/"+fileItem.getName());
	                        } else {
	                            lista1.add(fileItem.getString());
	                        }
	                    }
	                    p.setNombre(lista1.get(0));
	                    p.setDescripcion(lista1.get(1));
	                    p.setPrecio(Double.parseDouble(lista1.get(2)));
	                    p.setStock(Integer.parseInt(lista1.get(3)));
	                    p.setId(idp);
	                    pdao.actualizar(p);
	                } catch (Exception e) {
	                }
	                
					request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
					break;
				default:
					break;
				}
			request.getRequestDispatcher("actualizarProducto.jsp").include(request, response);
		}
		
		HttpSession session = request.getSession();
		
		if(menu.equals("home")) {
			switch(accion) {
				case "Login":
					String user=request.getParameter("txtCorreo");
					String pass=request.getParameter("txtPass");
					cliente=clienteDao.validar(user, pass);
					if(cliente.getCorreo()!=null) {
						session.setAttribute("cliente", cliente);
						try {
							session.getAttribute("cliente").toString();
							request.getRequestDispatcher("Controlador?menu=home&accion=Listar").forward(request, response);
						} catch (Exception e) {
								// TODO: handle exception
							System.out.println("Error al iniciar session");
						}
					}else {
						request.getRequestDispatcher("Controlador?menu=home&accion=Salir").forward(request, response);
					}	
					break;
					
				case "Salir":
						cliente = new Cliente();
						session.setAttribute("cliente", cliente);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					break;
					
				case "Compras":
					compras=comDao.listar_compras_id(cliente.getId());
					request.setAttribute("compras", compras);
					request.setAttribute("cliente", cliente);
					request.getRequestDispatcher("compras.jsp").forward(request, response);
				break;
				case "Detalle":
					double totalPago=0;
					int idd = Integer.parseInt(request.getParameter("id"));
					detalles = comDao.listar_detalle_id(idd);
					for(int i=0; i<detalles.size(); i++) {
						totalPago += detalles.get(i).getSubtotal();
					}
					request.setAttribute("totalPago", totalPago);
					request.setAttribute("detalles", detalles);
					request.setAttribute("cliente", cliente);
					request.getRequestDispatcher("detalle.jsp").forward(request, response);
					
				break;
				case "Listar":
					productos=pdao.listar();
					//request.setAttribute("cont", listaCarrito.size());
					request.setAttribute("productos", productos);
					//request.getRequestDispatcher("index.jsp").include(request, response);
					break;
				case "Comprar":
					totalPagar=0.0;
					pos=0;
					cantidad=1;
					idp=Integer.parseInt(request.getParameter("id"));
					p=pdao.listarId(idp);
					if (listaCarrito.size()>0) {
						for(int i=0;i<listaCarrito.size();i++) {
							if(idp==listaCarrito.get(i).getIdProducto()) {
								pos=i;
							}
						}
						if(idp==listaCarrito.get(pos).getIdProducto()) {
							cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
							double subtotal=listaCarrito.get(pos).getPrecioCompra()*cantidad;
							listaCarrito.get(pos).setCantidad(cantidad);
							listaCarrito.get(pos).setSubTotal(subtotal);
							
						}else {
							car=new Carrito();
							car.setIdProducto(p.getId());
							car.setNombres(p.getNombre());
							car.setImagen(p.getFoto());
							car.setDescripcion(p.getDescripcion());
							car.setPrecioCompra(p.getPrecio());
							car.setCantidad(cantidad);
							car.setSubTotal(cantidad*p.getPrecio());
							listaCarrito.add(car);
						}
						
					}else {
						car=new Carrito();
						car.setIdProducto(p.getId());
						car.setNombres(p.getNombre());
						car.setImagen(p.getFoto());
						car.setDescripcion(p.getDescripcion());
						car.setPrecioCompra(p.getPrecio());
						car.setCantidad(cantidad);
						car.setSubTotal(cantidad*p.getPrecio());
						listaCarrito.add(car);
						}
					for(int i=0;i<listaCarrito.size();i++) {
						totalPagar+=listaCarrito.get(i).getSubTotal();
					}
					//request.setAttribute("cliente", cliente);
					request.setAttribute("totalPagar", totalPagar);
					request.setAttribute("carrito", listaCarrito);
					request.setAttribute("contador", listaCarrito.size());
					request.getRequestDispatcher("Controlador?menu=home&accion=Carrito").forward(request, response);
					break;
				case "AgregarCarrito":
					pos=0;
					cantidad=1;
					idp=Integer.parseInt(request.getParameter("id"));
					p=pdao.listarId(idp);
					if (listaCarrito.size()>0) {
						for(int i=0;i<listaCarrito.size();i++) {
							if(idp==listaCarrito.get(i).getIdProducto()) {
								pos=i;
							}
						}
						if(idp==listaCarrito.get(pos).getIdProducto()) {
							cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
							double subtotal=listaCarrito.get(pos).getPrecioCompra()*cantidad;
							listaCarrito.get(pos).setCantidad(cantidad);
							listaCarrito.get(pos).setSubTotal(subtotal);
						}else {
							car=new Carrito();
							car.setIdProducto(p.getId());
							car.setNombres(p.getNombre());
							car.setImagen(p.getFoto());
							car.setDescripcion(p.getDescripcion());
							car.setPrecioCompra(p.getPrecio());
							car.setCantidad(cantidad);
							car.setSubTotal(cantidad*p.getPrecio());
							listaCarrito.add(car);
						}
					}else {
						car=new Carrito();
						car.setIdProducto(p.getId());
						car.setNombres(p.getNombre());
						car.setImagen(p.getFoto());
						car.setDescripcion(p.getDescripcion());
						car.setPrecioCompra(p.getPrecio());
						car.setCantidad(cantidad);
						car.setSubTotal(cantidad*p.getPrecio());
						listaCarrito.add(car);
					}
					request.setAttribute("contador", listaCarrito.size());
					request.getRequestDispatcher("Controlador?menu=home&accion=Listar").forward(request, response);
					break;
				case "Delete":
					int idproducto=Integer.parseInt(request.getParameter("idp"));
					for(int i=0; i<listaCarrito.size();i++) {
						if(listaCarrito.get(i).getIdProducto()==idproducto) {
							listaCarrito.remove(i);
						}
					}
					request.getRequestDispatcher("Controlador?menu=home&accion=Comprar").forward(request, response);
					break;
				case "ActualizarCantidad":
					int idpro=Integer.parseInt(request.getParameter("idp"));
					int cant=Integer.parseInt(request.getParameter("Cantidad"));
					for(int i=0 ; i < listaCarrito.size() ; i++) {
						if(listaCarrito.get(i).getIdProducto()==idpro) {
							listaCarrito.get(i).setCantidad(cant);
							double st=listaCarrito.get(i).getPrecioCompra()*cant;
							listaCarrito.get(i).setSubTotal(st);
						}
					}
					//request.getRequestDispatcher("Controlador?menu=home&accion=Carrito").forward(request, response);
					break;
				case "Carrito":
					totalPagar=0.0;
					request.setAttribute("carrito", listaCarrito);
					
					for(int i=0;i<listaCarrito.size();i++) {
						totalPagar+=listaCarrito.get(i).getSubTotal();
					}
					request.setAttribute("cliente", cliente);
					request.setAttribute("totalPagar", totalPagar);
					request.getRequestDispatcher("carrito.jsp").forward(request, response);
					break;
				case "Nuevo":
					listaCarrito=new ArrayList<Carrito>();
					request.getRequestDispatcher("Controlador?menu=home&accion=Listar").forward(request, response);
					break;
				case "Pagar":
					String nombres=request.getParameter("txtNombres");
					String tarjeta= request.getParameter("txtTarjeta");
					String codigo=request.getParameter("txtCodigo");
					pago.setTarjeta(tarjeta);
					pago.setCod_seguridad(codigo);
					pago.setMonto(totalPagar);
					pagodao.agregar(pago);
					pago1=pagodao.listarXtarjeta(pago.getTarjeta());
					request.getRequestDispatcher("Controlador?menu=home&accion=Carrito").forward(request, response);
					break;
				case "Registrar":
					String nom=request.getParameter("txtNombres");
					String dni=request.getParameter("txtDni");
					String direccion=request.getParameter("txtDireccion");
					String correo=request.getParameter("txtEmail");
					String password=request.getParameter("txtPassword");
					Cliente cl=new Cliente();
					cl.setNombre(nom);
					cl.setPassword(password);
					cl.setCorreo(correo);
					cl.setDireccion(direccion);
					cl.setDni(dni);
					clienteDao.agregar(cl);
					request.getRequestDispatcher("Controlador?menu=home&accion=Listar").forward(request, response);
					break;
				case "GenerarCompra":
					for (int i = 0; i < listaCarrito.size(); i++) {
						Producto pr=new Producto();
						int cantidad=listaCarrito.get(i).getCantidad();
						int idproduct=listaCarrito.get(i).getIdProducto();
						ProductoDao prdao=new ProductoDao();
						pr=prdao.listarId(idproduct);
						int sac=pr.getStock()-cantidad;
						prdao.actualizarstock(idproduct, sac);
					}
					
					//Cliente cliente=new Cliente();
					//cliente.setId(1);
					CompraDao dao=new CompraDao();
					Compra compra=new Compra(cliente.getId(),pago1.getId(), FechaHora.fechaHoraBD(), totalPagar, "Cancelado", listaCarrito);
					int res=dao.GenerarCompra(compra);
					if (res!=0&&totalPagar>0) {
						request.getRequestDispatcher("mensaje.jsp").forward(request, response);
					}else {
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}
					break;
				default:
					throw new AssertionError();
			
			}
			
				request.getRequestDispatcher("index.jsp").include(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

}
