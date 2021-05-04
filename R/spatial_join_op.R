#' Spatial join operator
#'
#' R interface for a Sedona spatial join operator
#'
#' @param spatial_rdd Spatial RDD containing geometries to be queried.
#' @param query_window_rdd Spatial RDD containing the query window(s).
#' @param join_type Type of the join query (must be either "contain" or
#'   "intersect").
#'   If `join_type` is "contain", then a geometry from `spatial_rdd` will match
#'   a geometry from the `query_window_rdd` if and only if the former is fully
#'   contained in the latter.
#'   If `join_type` is "intersect", then a geometry from `spatial_rdd` will
#'   match a geometry from the `query_window_rdd` if and only if the former
#'   intersects the latter.
#' @param grid_type Type of spatial partitioning to apply for both `spatial_rdd`
#'   and `query_window_rdd` to facilitate the join query. Currently "quadtree"
#'   and "kdbtree" are supported. If `grid_type` is NULL, then assume both
#'   `spatial_rdd` and `query_window_rdd` are partitioned using the same spatial
#'   partitioner already.
#' @param index_type Controls how `spatial_rdd` and `query_window_rdd` will be
#'   indexed (unless they are indexed already). If "NONE", then no index will be
#'   constructed and matching geometries will be identified in a doubly nested-
#'   loop iterating through all possible pairs of elements from `spatial_rdd`
#'   and `query_window_rdd`, which will be inefficient for large data sets.
#'
#' @name spatial_join_op
#'
NULL

#' Perform a spatial join operation on two Sedona spatial RDDs.
#'
#' Given `spatial_rdd` and `query_window_rdd`, return a pair RDD containing all
#' pairs of geometrical elements (p, q) such that p is an element of
#' `spatial_rdd`, q is an element of `query_window_rdd`, and (p, q) satisfies
#' the spatial relation specified by `join_type`.
#'
#' @inheritParams spatial_join_op
#' @family Sedona spatial join operator
#'
#' @export
sedona_spatial_join <- function(
                                spatial_rdd,
                                query_window_rdd,
                                join_type = c("contain", "intersect"),
                                grid_type = c("quadtree", "kdbtree"),
                                index_type = c("quadtree", "rtree")) {
}

#' Perform a spatial count-by-key operation based on two Sedona spatial RDDs.
#'
#' For each element p from `spatial_rdd`, count the number of unique elements q
#' from `query_window_rdd` such that (p, q) satisfies the spatial relation
#' specified by `join_type`.
#'
#' @inheritParams spatial_join_op
#' @family Sedona spatial join operator
#'
#' @export
sedona_spatial_join_count_by_key <- function(
                                             spatial_rdd,
                                             query_window_rdd,
                                             join_type = c("contain", "intersect"),
                                             grid_type = c("quadtree", "kdbtree"),
                                             index_type = c("quadtree", "rtree")) {
}
