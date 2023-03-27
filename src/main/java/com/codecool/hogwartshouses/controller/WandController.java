package com.codecool.hogwartshouses.controller;

import com.codecool.hogwartshouses.model.Wand;
import com.codecool.hogwartshouses.service.WandService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class WandController {
    private WandService wandService;

    public WandController(WandService wandService) {
        this.wandService = wandService;
    }

    @GetMapping("/wands")
    public List<Wand> getWands(){
        return wandService.getWands();
    }

    @GetMapping("/wands/{id}")
    public Wand getWandById(@PathVariable Long id){
        return wandService.getWandById(id);
    }
}