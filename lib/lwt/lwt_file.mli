(* Js_of_ocaml library
 * http://www.ocsigen.org/js_of_ocaml/
 * Copyright (C) 2011 Pierre Chambart
 * Laboratoire PPS - CNRS Université Paris Diderot
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*)
(** Lwt interface to the File API
  @see <https://developer.mozilla.org/en-US/docs/Web/API/File> the documentation of the API. *)

open Js
open Dom
open File

val readAsBinaryString : #blob t -> js_string t Lwt.t
val readAsText : #blob t -> js_string t Lwt.t
val readAsText_withEncoding  : #blob t -> js_string t -> js_string t Lwt.t
val readAsDataURL : #blob t -> js_string t Lwt.t