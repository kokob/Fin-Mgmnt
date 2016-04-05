package com.aconex.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aconex.model.Pcontract;

public interface ContractRepository extends JpaRepository<Pcontract, Long> {

}
