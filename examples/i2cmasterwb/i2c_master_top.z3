; this part encodes a partial order on labels
(declare-sort Label)
(declare-fun leq (Label Label) Bool)
(declare-fun join (Label Label) Label)
(declare-fun meet (Label Label) Label)
(assert (forall ((x Label)) (leq x x)))
(assert (forall ((x Label) (y Label) (z Label)) (implies (and (leq x y) (leq y z)) (leq x z))))
(assert (forall ((x Label) (y Label)) (implies (and (leq x y) (leq y x)) (= x y))))

; axioms for join
(assert (forall ((x Label) (y Label) (z Label)) (implies (leq (join x y) z) (and (leq x z) (leq y z)))))
(assert (forall ((x Label) (y Label) (z Label)) (implies (and (leq x z) (leq y z)) (leq (join x y) z))))
(assert (forall ((x Label) (y Label)) (and (leq x (join x y)) (leq y (join x y)))))
(assert (forall ((x Label) (y Label)) (= (join x y) (join y x))))

; axioms for meet
(assert (forall ((x Label) (y Label) (z Label)) (implies (leq x (meet y z)) (and (leq x y) (leq x z)))))
(assert (forall ((x Label) (y Label) (z Label)) (implies (and (leq x y) (leq x z)) (leq x (meet y z)))))
(assert (forall ((x Label) (y Label)) (and (leq (meet x y) x) (leq (meet x y) y))))
(assert (forall ((x Label) (y Label)) (= (meet x y) (meet y x))))

; lattice elements
(declare-fun LOW () Label)
(declare-fun HIGH () Label)
(declare-fun D1 () Label)
(declare-fun D2 () Label)

; lattice structure
(assert (forall ((x Label)) (leq LOW x)))
(assert (forall ((x Label)) (leq x HIGH)))
(assert (not (= HIGH LOW))) ; the lattice cannot clapse

; new lattice elements L1 and L2
;(declare-fun L1 () Label)
;(declare-fun L2 () Label)

; lattice structure
;(assert (leq L1 L2))

; variables to be solved
(declare-fun domain () Int)
(assert (<= 0  domain))
(assert (<= domain 1))

; function that maps 0 to LOW; 1 to HIGH
(declare-fun LH (Int) Label)
(assert (= (LH 0) LOW))
(assert (= (LH 1) HIGH))
; Domain(0)=L1, Domain(1)=L2
;(declare-fun Domain (Int) Label)
;(assert (= (Domain 0) L1))
;(assert (= (Domain 1) L2))

; function for data signals
(declare-fun Data (Int) Label)
(assert (= (Data 0) D1))
(assert (= (Data 1) D2))
(assert (= (Data 2) LOW))
(assert (= (Data 3) HIGH))

; function for control signals
(declare-fun Ctrl (Int) Label)
(assert (= (Ctrl 0) D1))
(assert (= (Ctrl 1) D2))
(assert (= (Ctrl 2) LOW))
(assert (= (Ctrl 3) HIGH))

; assertions to be verified

(push)
(assert  (not(leq LOW  LOW)))    ; assign ARST_LVL = 0 @i2c_master_top.v:115
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; assign rst_i = (arst_i)^(ARST_LVL) @i2c_master_top.v:117
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; assign wb_wacc = (wb_we_i)&(wb_ack_o) @i2c_master_top.v:155
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign sta = cr[7] @i2c_master_top.v:158
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign sto = cr[6] @i2c_master_top.v:159
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign rd = cr[5] @i2c_master_top.v:160
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign wr = cr[4] @i2c_master_top.v:161
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign ack = cr[3] @i2c_master_top.v:162
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign iack = cr[0] @i2c_master_top.v:163
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign core_en = ctr[7] @i2c_master_top.v:234
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; assign ien = ctr[6] @i2c_master_top.v:235
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter clk in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter rst in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter nReset in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter domain in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter ena in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; Instantiate parameter clk_cnt in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter start in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter stop in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter read in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter write in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter ack_in in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Data domain))))    ; Instantiate parameter din in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter cmd_ack in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter ack_out in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Data domain))))    ; Instantiate parameter dout in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter i2c_busy in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter i2c_al in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter scl_i in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter scl_o in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter scl_oen in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter sda_i in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter sda_o in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter sda_oen in module i2c_master_byte_ctrl @i2c_master_top.v:238
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; assign sr[7] = rxack @i2c_master_top.v:298
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; assign sr[6] = i2c_busy @i2c_master_top.v:299
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; assign sr[5] = al @i2c_master_top.v:300
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; assign sr[4:2] = 0 @i2c_master_top.v:301
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; assign sr[1] = tip @i2c_master_top.v:302
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; assign sr[0] = irq_flag @i2c_master_top.v:303
(check-sat)
(pop)


(push)
(assert  (not(leq (join (join (Ctrl domain) (Ctrl domain)) (Ctrl domain))  (Ctrl domain))))    ; wb_ack_o <= ((wb_cyc_i)&(wb_stb_i))&(~(wb_ack_o)) @i2c_master_top.v:171
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= prer[7:0] @i2c_master_top.v:177
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= prer[15:8] @i2c_master_top.v:178
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= ctr @i2c_master_top.v:179
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= rxr @i2c_master_top.v:180
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= sr @i2c_master_top.v:181
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= txr @i2c_master_top.v:182
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; wb_dat_o <= cr @i2c_master_top.v:183
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; wb_dat_o <= 0 @i2c_master_top.v:184
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; prer <= 65535 @i2c_master_top.v:192
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; ctr <= 0 @i2c_master_top.v:193
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; txr <= 0 @i2c_master_top.v:194
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; prer <= 65535 @i2c_master_top.v:198
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; ctr <= 0 @i2c_master_top.v:199
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; txr <= 0 @i2c_master_top.v:200
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; prer[7:0] <= wb_dat_i @i2c_master_top.v:205
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; prer[15:8] <= wb_dat_i @i2c_master_top.v:206
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; ctr <= wb_dat_i @i2c_master_top.v:207
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; txr <= wb_dat_i @i2c_master_top.v:208
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; cr <= 0 @i2c_master_top.v:215
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Data domain))))    ; cr <= 0 @i2c_master_top.v:217
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Data domain))))    ; cr <= wb_dat_i @i2c_master_top.v:221
(check-sat)
(pop)


(push)
(assert  (not(leq (join (join (Ctrl domain) (Ctrl domain)) (Ctrl domain))  (Data domain))))    ; cr[7:4] <= 0 @i2c_master_top.v:226
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; cr[2:1] <= 0 @i2c_master_top.v:228
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; cr[0] <= 0 @i2c_master_top.v:229
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; al <= 0 @i2c_master_top.v:268
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; rxack <= 0 @i2c_master_top.v:269
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; tip <= 0 @i2c_master_top.v:270
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; irq_flag <= 0 @i2c_master_top.v:271
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; al <= 0 @i2c_master_top.v:275
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; rxack <= 0 @i2c_master_top.v:276
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; tip <= 0 @i2c_master_top.v:277
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; irq_flag <= 0 @i2c_master_top.v:278
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Ctrl domain) (join (Ctrl domain) (Ctrl domain)))  (Ctrl domain))))    ; al <= (i2c_al)|((al)&(~(sta))) @i2c_master_top.v:282
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; rxack <= irxack @i2c_master_top.v:283
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; tip <= (rd)|(wr) @i2c_master_top.v:284
(check-sat)
(pop)


(push)
(assert  (not(leq (join (join (join (Ctrl domain) (Ctrl domain)) (Ctrl domain)) (Ctrl domain))  (Ctrl domain))))    ; irq_flag <= (((done)|(i2c_al))|(irq_flag))&(~(iack)) @i2c_master_top.v:285
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; wb_inta_o <= 0 @i2c_master_top.v:291
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; wb_inta_o <= 0 @i2c_master_top.v:293
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; wb_inta_o <= and (irq_flag) (ien) @i2c_master_top.v:295
(check-sat)
(pop)

