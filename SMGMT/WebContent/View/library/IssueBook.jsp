<%@page import="com.servletStore.library.model.IssueBookPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.servletStore.library.model.BookCatPOJO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.servletStore.library.model.BookCatImpl"%>
<%@page import="com.servletStore.library.model.BookDAO"%>
<%@page import="com.servletStore.library.model.AddBookImpl"%>
<%@page import="com.servletStore.library.model.AddBookDAO"%>
<%@page import="com.servletStore.library.model.AddBookPOJO"%>
<%@page import="java.util.List"%>
<%@page import=" utility.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Validations | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/SMGMT/config/img/xlogo1.ico.pagespeed.ic.ONh6qx31g4.html"/>
    <!-- global styles-->
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_jquery-validation-engine,_css,_validationEngine.jquery.css+vendors,_datepicker,_css,_bootstrap-datepicker.min.css+vendors,_datepicker,_css"/>
    <link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_select2,_css,_select2.min.css+css,_pages,_dataTables.bootstrap.css+css,_pages,_tables.css.pagespeed.cc._6lRWz19bZ.css"/>
<link type="text/css" rel="stylesheet" href="/SMGMT/config/css,_components.css+css,_custom.css+vendors,_inputlimiter,_css,_jquery.inputlimiter.css+vendors,_bootstrap-colorpicker,_css,_bootstrap-colorpicker.min.css+vendors,_jquery-tagsinput,_c"/>
   
    <!-- end of global styles-->
   
</head>
<body>
<div class="preloader" style=" position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 100000;
  backface-visibility: hidden;
  background: #ffffff;">
    <div class="preloader_img" style="width: 200px;
  height: 200px;
  position: absolute;
  left: 48%;
  top: 48%;
  background-position: center;
  z-index: 999999">
        <img src="/SMGMT/config/img/loader.gif.pagespeed.ce.pu_lpoGKrw.gif" style=" width: 40px;" alt="loading...">
    </div>
</div>
    <div id="wrap">
        <div id="top">
            <!-- .navbar -->
            	<jsp:include page="/View/common/header.jsp"></jsp:include>
            <!-- /.navbar -->
        </div>
        <!-- /#top -->
        
        
        <div class="wrapper">
        	 <!-- /.left navbar -->
                <jsp:include page="/View/common/left-navbar.jsp"></jsp:include>
             <!-- /.left navbar -->
             
             
            <!-- /#left -->
            <div id="content" class="bg-container">
                <header class="head">
                    <div class="main-bar">
                        <div class="row no-gutters">
                            <div class="col-sm-5 col-lg-6">
                                <h4 class="nav_top_align">
                                    <i class="fa fa-pencil"></i>
                                    	Issue Book Details
                                </h4>
                            </div>
                            <div class="col-sm-7 col-lg-6">
                                <ol class="breadcrumb float-right nav_breadcrumb_top_align">
                                    <li class="breadcrumb-item">
                                        <a href="index1.html">
                                            <i class="fa fa-home" data-pack="default" data-tags=""></i>
                                            Dashboard
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#">Library</a>
                                    </li>
                                    <li class="active breadcrumb-item">Issue Books</li>
                                </ol>
                               </div>
                            </div>
                        </div>
                   </header>
                
             <!-- start your code from here  -->  
                  <div class="outer">
                    <div class="inner bg-container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                  		  Book Issue
                                    </div>
                                    <div class="card-block" id="tab">
	                                     <ul class="nav nav-tabs m-t-35">
			                                <li class="nav-item">
			                                    <a class="nav-link active" href="#bookList" data-toggle="tab">Issue Book</a>
			                                </li>
			                                <li class="nav-item" id="themify_icon">
			                                    <a class="nav-link" href="#issuedList" data-toggle="tab">Issued List</a>
			                                </li>
			                                <li class="nav-item" id="themify_icon">
			                                    <a class="nav-link" href="#bookReturn" data-toggle="tab">Book Return</a>
			                                </li>
			                             </ul>
					                  <div class="tab-content">
					          <!-- First Tab-------------- -->
				                          <div class="tab-pane active" id="bookList">
				                              <div class="row">
				                              <% SysDate date=new SysDate();
				                              %>
				                                  <div class="col-12">
				                                       <div class="col-lg-8 m-t-20">
				                                          <form action="/SMGMT/Library" class="form-horizontal  login_validator" id="form_block_validator">
		                                     			<div class="form-group row">
		                                     				<div class="col-lg-8">
		                        <!-- Search Book from here     ------- -->
		                                               	<input type="text" list="browseBook" autocomplete="off" onkeyup="getbookdetails(this.value)" class="form-control" id="searchtext"  name="searchBook" placeholder="Search Books by BookId/BookName/AuthorName">
			                                                <datalist id="browseBook">
			                                                </datalist>
			                                                </div>
		                                                 </div> 
		                                                	<div class="form-group row">	
		                                                	<div class="col-lg-8 ">
		                                                   	  <label for="required2" class="col-form-label">User Type *</label>
										                       <div class="controls">
												                 <input type="radio" value="Student" style="margin-left: 1%;" name="userType" id="userType" onclick="studentDetails('stud')" checked="checked"> Student
												                 <input type="radio" value="Teacher" style="margin-left: 1%;" name="userType" id="userType" onclick="teacherDetails('teacher')" > Teacher
												               </div>
												             </div>
			                                      	 	</div>
		                                         <!-- Search stud from here     ----- -->
		                                          	   <div class="form-group row" id="stud" style="display: block">
		                                          	      <div class="col-lg-8">
		                                                	<input type="text" list="browseStud" autocomplete="off" onkeyup="getstuddetails(this.value)" class="form-control" id="searchStud"  name="searchStud" placeholder="Search Student by Id/Name">
			                                                <datalist id="browseStud">
			                                                </datalist>
		                                                 </div> 
		                                              </div>
		                                             
		                                             
		                                          <div class="form-group row" id="teacher" style="display:none;">
		                                          	     <div class="col-lg-8">
		                                                	<input type="text" list="browseStud" autocomplete="off" onkeyup="getstuddetails(this.value)" class="form-control" id="searchStud"  name="searchStud" placeholder="Search by Id/Name">
			                                                <datalist id="browseStud">
			                                                </datalist>
		                                                 </div> 
		                                              </div>
		                                          	<div class="form-group row">
		                                          	   <div class="col-lg-8">
		                                                    <label class="col-form-label">Book Issue Date *</label>
		                                                    <input type="text" id="date" class="form-control form_val_popup_dp3" name="issueDate" value="<%=date.todayDate() %>" placeholder="YYYY-MM-DD"/>
		                                                </div>
		                                              </div>
		                                               <div class="form-group row">
		                                                <div class="col-lg-8">
		                                                    <label class="col-form-label">Book Due Date *</label>
		                                                    <input type="text" id="date" class="form-control form_val_popup_dp3" name="dueDate" placeholder="YYYY-MM-DD"/>
		                                                </div>
		                                                </div>
		                                                 
		                                              
		                                                  <div class="form-actions form-group row">
			                                            	<input type="submit" id="btnSubmit" value="Save Book" name="issuebook" class="btn btn-primary">
			                                         	 </div>
		                                          	 </form>
				                              </div>
				                            </div>
				                          </div>
				                           <!-- Book Table -->  
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                               Issued Books List
                            </div>
                           
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                            	<th class="sorting_asc wid-10" tabindex="0" rowspan="1" colspan="1">Issue Id</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">User Type</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">User Name</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Book NO</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Book Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Issue Date</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Return Date</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Due Date</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                       		 	<%
                                       		 		AddBookDAO dao=new AddBookImpl();
                                       		 		request.setAttribute("display_book", dao.getIssueBookDetails());
                                       		 		int bookCount=0;
                                       		 	%>
													<c:forEach items="${display_book}" var="d">
													  <tr role="row" class="even">
														<td><%=(++bookCount) %></td>
														<td><c:out value="${d.userType}"></c:out></td>
														<td><c:out value="${d.userName}"></c:out></td>
														<td><c:out value="${d.bookId}"></c:out></td>
														<td><c:out value="${d.bookName}"></c:out></td>
														<td><c:out value="${d.issueDate}"></c:out></td>
														<td><c:out value="${d.dueDate}"></c:out></td>
														<td><c:out value="${d.returnDate}"></c:out></td>
													<%-- 	 <td>
                                            			<a class="edit" data-placement="top" title="Edit" href="#update" data-toggle="modal" onclick="loadDoc(${d.getBookNo()})"><i class="fa fa-pencil text-warning"></i></a>&nbsp; &nbsp;
                                            			<a class="delete hidden-xs hidden-sm" data-toggle="tooltip" data-placement="top" title="Delete" href="/SMGMT/Library?bookNo=${d.getBookNo()}"><i class="fa fa-trash text-danger"></i></a>
                                            			</td>  --%>
                                            		</tr>
												  </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                       	 </div>
                       </div><!-- /.inner -->
                    </div><!-- /outer -->   
				                        </div>
				                     	 
				                     	 <!-- Second Tab --> 
				                     	   <div class="tab-pane" id="issuedList">
				                               <div class="row">
				                                   <div class="col-12">
				                                     <div class="col-lg-8 m-t-20">
				                                      
				          <!-- Book Table -->  
            <div class="outer">
                    <div class="inner bg-container">
                        <div class="card">
                            <div class="card-header bg-white">
                                        <i class="fa fa-file-text-o"></i>
                                  		  Issue Book List
                                    </div>
                            <div class="card-block m-t-35" id="user_body">
                                <div class="table-toolbar">
                                    
                                    <div class="btn-group float-right users_grid_tools">
                                        <div class="tools"></div>
                                    </div>
                                </div>
                                
                                
                       <div class="row">
                        <!-- .col-lg-12 -->
                        <div class="col-xl-12">
                            <div class="card m-t-35">
                                <div class="card-header bg-white">
                                 
                                </div>
                                <div class="card-block" id="dateRangePickerBlock">
                                    <div class="row">
                                      
                                        <div class="col-lg-6 input_field_sections">
                                           
                                            <form>
                                                <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                                    <input type="text" class="form-control" id="reportrange" onchange="getExpData(this.value)" placeholder="dd/mm/yyyy-dd/mm/yyyy">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                   
                                </div>
                                <!-- /.block -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                  
                   
                                        <table class="table  table-striped table-bordered table-hover dataTable no-footer" id="editable_table" role="grid">
                                            <thead>
                                            <tr role="row">
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Sr.No</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">User Type</th>
                                            	<th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">User Name</th>
                                                <th class="sorting_asc wid-20" tabindex="0" rowspan="1" colspan="1">Book NO</th>
                                                <th class="sorting wid-25" tabindex="0" rowspan="1" colspan="1">Book Name</th>
                                                <th class="sorting wid-10" tabindex="0" rowspan="1" colspan="1">Issue Date</th>
                                                <th class="sorting wid-20" tabindex="0" rowspan="1" colspan="1">Due Date</th>
                                            </tr>
                                            </thead>
                                            <tbody id="displayDate">
                                       		 	<%
                                       		 		AddBookDAO dao1=new AddBookImpl();
                                       		 	request.setAttribute("display_book", dao.getIssueBookDetails());
                                       		 		int bookCount1=0;
                                       		 	%>
													<c:forEach items="${display_book}" var="d">
													  <tr role="row" class="even">
														<td><%=(++bookCount1) %></td>
														<td><c:out value="${d.userType}"></c:out></td>
														<td><c:out value="${d.userName}"></c:out></td>
														<td><c:out value="${d.bookNo}"></c:out></td>
														<td><c:out value="${d.bookName}"></c:out></td>
														<td><c:out value="${d.issueDate}"></c:out></td>
														<td><c:out value="${d.dueDate}"></c:out></td>
														 
                                            		</tr>
												  </c:forEach>
                                            </tbody>
                                        </table>
                                   
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                       	 </div>
                       </div><!-- /.inner -->
                    </div><!-- /outer -->   
				                        </div>
				                                     </div>
				                                  </div>
				                               </div>
				                               <!-- Third Tab -->
				                                             <div class="tab-pane" id="bookReturn">
				                              <div class="row">
				                              <% //SysDate date1=new SysDate();
				                              
				                              %>
				                                  <div class="col-12">
				                                       <div class="col-lg-8 m-t-20">
				                                          <form action="/SMGMT/Library" class="form-horizontal  login_validator" id="form_block_validator">
		                                     			<div class="form-group row">
		                                     				<div class="col-lg-8">
		                                     <!-- Search Book from here     ------- -->
		                                               	<input type="text" list="browseBook" autocomplete="off" onkeyup="getbookdetails(this.value)" class="form-control" id="searchId"  name="searchBook" placeholder="Search Books by BookNo/BookName/AuthorName">
			                                                <datalist id="browseBook">
			                                                </datalist>
			                                                </div>
			                                                <a href="#" onclick="getBookInfo('bookInfo')" class="btn btn-info" value="Search" id="btn">Search</a>
		                                                 </div> 
		                                                 <div id="bookInfo" Style="display: none">
		                                                 <div class="form-group row">
		                                                 <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Book No *</label>
                                               	    <input type="text" id="bNo" name="bookName" class="form-control" required>
                                                </div>
		                                                 	<div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Book Name *</label>
                                               	    <input type="text" id="bName" name="bookName" class="form-control" required>
                                                </div>
                                             
                                                 
                                             	 <div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Author Name *</label>
                                                	 <input type="text" id="authrName" name="authorName" class="form-control" required>
                                                </div></div>
                                                <div class="form-group row">
                                           		<div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Publisher Name *</label>
                                               	    <input type="text" id="pubName" name="pubName" class="form-control" required>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Edition *</label>
                                                	 <input type="text"  id="edition" name="edition" class="form-control" required>
                                                </div>
                                                <div class="col-lg-4 ">
                                                    <label for="required2" class="col-form-label">Price *</label>
                                               	    <input type="text" id="price" name="price" class="form-control" required>
                                                </div></div>
                                                <div class="form-group row">
                                            	<div class="col-lg-4">
                                                    <label for="required2" class="col-form-label">Cupboard No *</label>
                                                	 <input type="text" id="cupbNo" name="cupbno" class="form-control">
                                                </div>
                                                <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Quantity *</label>
                                                	 <input type="text" id="quan" name="quan" class="form-control" required>
                                                </div>
		                                                 </div>
		                                                	</div>
		                                         
		                                         <div class="form-group row">	
		                                                	<div class="col-lg-8 ">
		                                                   	  <label for="required2" class="col-form-label">Renew/Return *</label>
										                       <div class="controls">
												                 <input type="radio" value="RETURN" style="margin-left: 1%;" name="select" id="selectRt" onclick="returnBook('returnBk')"> Return
												                 <input type="radio" value="RENEW" style="margin-left: 1%;" name="select" id="selectRn" onclick="renewBook('renew')" > Renewal
												               </div>
												             </div>
			                                      	 	</div>
		                                              <!-- Search stud from here     ----- -->
		                                          	   <div class="form-group row" id="returnBk" style="display: none">
		                                                   <div class="col-lg-4">
                                                  		    <label class="col-form-label">Return Date *</label>
                                                	 		<input type="text" class="form-control form_val_popup_dp3" id="returnDate" name="date_inline" placeholder="YYYY-MM-DD"/>
                                               			 </div>
                                           		 <div class="col-lg-4">
                                                     <label for="required2" class="col-form-label">Fine Amont </label>
                                                	 <input type="text"  id="fineAmount" name="fineAmount" class="form-control">
                                                </div>
                                                </div>
                                                
                                                 <div class="form-group row" id="renew" style="display: none">
		                                                   <div class="col-lg-4">
                                                  		    <label class="col-form-label">Due Date *</label>
                                                	 		<input type="text" class="form-control form_val_popup_dp3" id="dueDate" name="date_inline" placeholder="YYYY-MM-DD"/>
                                               			 </div>
                                         
                                                </div>
                                                  	 </form>
				                              </div>
				                            </div>
				                          </div>
				 
				                        </div>
				                           </div>
				                       </div>
				                   </div>
				                 </div>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.inner -->
                </div> <!-- /.outer -->
            
            
                <!-- Modal -->
                <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <form>
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span class="float-right" aria-hidden="true">&times;</span>
                                </button>
                                <div class="input-group search_bar_small">
                                    <input type="text" class="form-control" placeholder="Search..." name="search">
                                    <span class="input-group-btn">
							        <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
							      </span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
           
            
            
            </div> <!-- /#content -->
        </div>
        
       <!--wrapper-->
       
        
        
</div>
<!-- /#wrap -->
<!-- 
	<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation-engine/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/jquery-validation/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
	<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
    <script type="text/javascript" src="/SMGMT/config/js/pages/form_validation.js"></script>
	<script type="text/javascript" src="js/components.js.pagespeed.jm.vxV3GQYFro.js"></script>
	<script type="text/javascript" src="js/custom.js.pagespeed.jm.CN8Ow3CJOG.js"></script>

    <script type="text/javascript" src="/SMGMT/config/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script>
    <script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script>
     -->
     
     <!-- global scripts-->
<script type="text/javascript" src="/SMGMT/config/js/components.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/custom.js"></script>
<!-- end of global scripts-->
<!-- plugin scripts -->
<script type="text/javascript" src="/SMGMT/config/vendors/jquery.uniform/js/jquery.uniform.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputlimiter/js/jquery.inputlimiter.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jquery-tagsinput/js/jquery.tagsinput.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pluginjs/jquery.validVal.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/inputmask/js/jquery.inputmask.bundle.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/moment/js/moment.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/daterangepicker/js/daterangepicker.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/autosize/js/jquery.autosize.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/jasny-bootstrap/js/inputmask.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/datetimepicker/js/DateTimePicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/j_timepicker/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="/SMGMT/config/vendors/clockpicker/js/jquery-clockpicker.min.js"></script>
<!--end of plugin scripts-->
<script type="text/javascript" src="/SMGMT/config/js/form.js"></script>
<script type="text/javascript" src="/SMGMT/config/js/pages/datetime_piker.js"></script>
<script src="/SMGMT/config/vendors/datatables/js/jquery.dataTables.min.js+dataTables.bootstrap.min.js.pagespeed.jc.HRNT0WoBU9.js"></script>
<script src="/SMGMT/config/vendors/datatables/js/dataTables.responsive.min.js+dataTables.buttons.min.js+buttons.colVis.min.js+buttons.html5.min.js+buttons.bootstrap.min.js+buttons.print.min.js.pagespeed.jc.TdR_"></script>
    
<!-- end plugin scripts -->
<!--Page level scripts-->
    
    <script>eval(mod_pagespeed_g_o5ieHdNa);</script>
    <script>eval(mod_pagespeed_UzcyJ5ysoL);</script>
    <script>eval(mod_pagespeed_sB4kJD0xfI);</script>
    <script>eval(mod_pagespeed_aYQJk4iDci);</script>
    <script>eval(mod_pagespeed_wVkzf2s7YZ);</script>
    <script>eval(mod_pagespeed_Ij0pRaH8BP);</script>
    <script>eval(mod_pagespeed_wfmKXYO4Nj);</script>
    <script>eval(mod_pagespeed_EYzby3B1$L);</script>

    <script type="text/javascript" src="/SMGMT/config/js/pages/users.js"></script>

</body>
<script type="text/javascript">


function getbookdetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demoData = this.responseText;
	     var str=demoData.split(",");
	     for(var i=0; i<str.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+str[i]+"\"> </option>";
	    	 
	    	 }
			document.getElementById("browseBook").innerHTML = text;		 
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?detailId="+id, true);
	  xhttp.send();
	
}
function getstuddetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demo = this.responseText;
	     var stud=demo.split(",");
	     for(var i=0; i<stud.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+stud[i]+"\"> </option>";
	    	 }
	     //alert(text);
			document.getElementById("browseStud").innerHTML = text;		 
	      
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?studDetails="+id, true);
	  xhttp.send();
	
}
function getteacherDetails(id){
//	alert(id);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     var demo = this.responseText;
	     var stud=demo.split(",");
	     for(var i=0; i<stud.length; i++)
	    	 {
	    	 var text=text+"<option value=\""+stud[i]+"\"> </option>";
	    	 }
	     //alert(text);
			document.getElementById("browseStud").innerHTML = text;		 
	      
	     
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?studDetails="+id, true);
	  xhttp.send();
	
}

/* <!-- Display Student Block        -------- --> */
function studentDetails(stud)
{
	var x = document.getElementById("stud");
	if(document.getElementById("userType").value=="Student")
		{
			x.style.display = "block";
		}
	else
		{
		document.getElementById("stud").style.display = "none";
		}
}

function teacherDetails(teacher)
{
	var x = document.getElementById("teacher");
	if(document.getElementById("userType").value=="Teacher")
		{
			x.style.display = "block";
		}
	else
		{
		document.getElementById("teacher").style.display = "none";
		}
}

function getExpData(val)
{
//	alert(val); 
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var demoStr = this.responseText.split(",");
	    	if(demoStr==""){
				document.getElementById("displayDate").innerHTML="<tr><td colspan=''>No Records Found!</td></tr>"}
			else
				{
				var count=1;
				var wholeData="";
					for(var i=0;i<demoStr.length-2;i=i+6){
						wholeData+="<tr>"+
						"<td style='text-align: center'>"+count+"</td>"+
						"<td style='text-align: center'>"+demoStr[i]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+1]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+2]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+3]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+4]+"</td>"+
						"<td style='text-align: center'>"+demoStr[i+5]+"</td>"+
						"<tr>"
						count++;
					}
					document.getElementById("displayDate").innerHTML=wholeData;
				}
	    }
	  };
	  xhttp.open("POST", "/SMGMT/Library?getTableData="+val, true);
	  xhttp.send();
}
	
	
	function getBookInfo(bookInfo){
		 //alert(bookInfo);
		var bInfo=document.getElementById("bookInfo").style.display="block";
		/* if(bInfo.style.display !== "none" )
			{
			bInfo.style.display="none" ;
			}
		else{
			bInfo.style.display= "block";
		} */
			 
		id=document.getElementById("searchId").value;
		//alert(id);
		 var bookD=id.split("-");
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		     var demo = this.responseText;
		    // alert(demo);
		     var stud=demo.split(",");
		    /*  for(var i=0; i<stud.length; i++)
		    	 {
		    	 var text=text+"<option value=\""+stud[i]+"\"> </option>";
		    	 } */
		     //alert(text);
				//document.getElementById("browseStud").innerHTML = text;	
				document.getElementById("bNo").value=stud[0];
				document.getElementById("bName").value=stud[1];
				document.getElementById("authrName").value=stud[2];
				document.getElementById("pubName").value=stud[3];
				document.getElementById("edition").value=stud[4];
				document.getElementById("price").value=stud[5];
				document.getElementById("cupbNo").value=stud[6];
				document.getElementById("quan").value=stud[7];
		    }
		  };
	//	  alert(bookD[0]);
		  xhttp.open("POST", "/SMGMT/Library?bookdetail="+bookD[0].trim(), true);
		  xhttp.send();
		
	}

	function returnBook(returnBk)
	{
		/* var returnBook = document.getElementById("id");
		var renew = document.getElementById("id1");
		if(returnBook==null)
			{
			document.getElementById("returnDate").required=false;
			document.getElementById("fineAmount").required=false;
			document.getElementById("dueDate").required=false;
			
			returnBook.style.display="none";
			renew.style.display="none";
			}
		else if(returnBook != null && renew != null)
			{
			returnBook.style.display="block";
			document.getElementById("returnDate").required=true;
			document.getElementById("fineAmount").required=true;
						
			}
		else{
			renew.style.display="block";
			document.getElementById("dueDate").required=true;
			
			
		} */
		 var returnBook = document.getElementById("returnBk");
		 if(document.getElementById("selectRt").value=="RETURN")
			{
				returnBook.style.display = "block";
			}
		else 
			{
				document.getElementById("returnBk").style.display="none";
			} 
	}
	function renewBook(renew)
	{
	 var renewBook = document.getElementById("renew");
	 if(document.getElementById("selectRn").value=="RENEW")
		{
		 renewBook.style.display = "block";
		}
	else 
		{
		document.getElementById("renew").style.display="none";
		} 
}
	
	
</script>



</html>