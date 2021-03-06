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
(assert  (not(leq LOW  (Ctrl domain))))    ; assign ST_IDLE = 0 @./i2c_master_byte_ctrl.v:123
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; assign ST_START = 1 @./i2c_master_byte_ctrl.v:124
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; assign ST_READ = 2 @./i2c_master_byte_ctrl.v:125
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; assign ST_WRITE = 4 @./i2c_master_byte_ctrl.v:126
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; assign ST_ACK = 8 @./i2c_master_byte_ctrl.v:127
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; assign ST_STOP = 16 @./i2c_master_byte_ctrl.v:128
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter clk in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter rst in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter nReset in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  LOW)))    ; Instantiate parameter domain in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter ena in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter clk_cnt in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter cmd in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter cmd_ack in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter busy in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter al in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; Instantiate parameter din in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Data domain)  (Ctrl domain))))    ; Instantiate parameter dout in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter scl_i in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter scl_o in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter scl_oen in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter sda_i in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter sda_o in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; Instantiate parameter sda_oen in module i2c_master_bit_ctrl @./i2c_master_byte_ctrl.v:153
(check-sat)
(pop)


(push)
(assert  (not(leq (join (join (join (Ctrl domain) (Ctrl domain)) (Ctrl domain)) (Ctrl domain))  (Ctrl domain))))    ; assign go = (((read)|(write))|(stop))&(~(cmd_ack)) @./i2c_master_byte_ctrl.v:175
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Data domain))))    ; assign dout = sr @./i2c_master_byte_ctrl.v:178
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; assign cnt_done = ~(|(dcnt)) @./i2c_master_byte_ctrl.v:202
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; sr <= 0 @./i2c_master_byte_ctrl.v:183
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; sr <= 0 @./i2c_master_byte_ctrl.v:185
(check-sat)
(pop)


(push)
(assert  (not(leq (join (Data domain) (Ctrl domain))  (Ctrl domain))))    ; sr <= din @./i2c_master_byte_ctrl.v:187
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; sr <= {sr[6:0], core_rxd} @./i2c_master_byte_ctrl.v:189
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; dcnt <= 0 @./i2c_master_byte_ctrl.v:194
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; dcnt <= 0 @./i2c_master_byte_ctrl.v:196
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; dcnt <= 7 @./i2c_master_byte_ctrl.v:198
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; dcnt <= (dcnt)-(1) @./i2c_master_byte_ctrl.v:200
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; core_cmd <= 0 @./i2c_master_byte_ctrl.v:211
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; core_txd <= 0 @./i2c_master_byte_ctrl.v:212
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; shift <= 0 @./i2c_master_byte_ctrl.v:213
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; ld <= 0 @./i2c_master_byte_ctrl.v:214
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; cmd_ack <= 0 @./i2c_master_byte_ctrl.v:215
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_IDLE @./i2c_master_byte_ctrl.v:216
(check-sat)
(pop)


(push)
(assert  (not(leq LOW  (Ctrl domain))))    ; ack_out <= 0 @./i2c_master_byte_ctrl.v:217
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 0 @./i2c_master_byte_ctrl.v:221
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_txd <= 0 @./i2c_master_byte_ctrl.v:222
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; shift <= 0 @./i2c_master_byte_ctrl.v:223
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; ld <= 0 @./i2c_master_byte_ctrl.v:224
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; cmd_ack <= 0 @./i2c_master_byte_ctrl.v:225
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_IDLE @./i2c_master_byte_ctrl.v:226
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; ack_out <= 0 @./i2c_master_byte_ctrl.v:227
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_txd <= sr[7] @./i2c_master_byte_ctrl.v:232
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; shift <= 0 @./i2c_master_byte_ctrl.v:233
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; ld <= 0 @./i2c_master_byte_ctrl.v:234
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; cmd_ack <= 0 @./i2c_master_byte_ctrl.v:235
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_START @./i2c_master_byte_ctrl.v:243
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 1 @./i2c_master_byte_ctrl.v:244
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_READ @./i2c_master_byte_ctrl.v:248
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 8 @./i2c_master_byte_ctrl.v:249
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_WRITE @./i2c_master_byte_ctrl.v:253
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 4 @./i2c_master_byte_ctrl.v:254
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_STOP @./i2c_master_byte_ctrl.v:258
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 2 @./i2c_master_byte_ctrl.v:259
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; ld <= 1 @./i2c_master_byte_ctrl.v:262
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_READ @./i2c_master_byte_ctrl.v:270
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 8 @./i2c_master_byte_ctrl.v:271
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_WRITE @./i2c_master_byte_ctrl.v:275
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 4 @./i2c_master_byte_ctrl.v:276
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; ld <= 1 @./i2c_master_byte_ctrl.v:279
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_ACK @./i2c_master_byte_ctrl.v:286
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 8 @./i2c_master_byte_ctrl.v:287
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_WRITE @./i2c_master_byte_ctrl.v:291
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 4 @./i2c_master_byte_ctrl.v:292
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; shift <= 1 @./i2c_master_byte_ctrl.v:293
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_ACK @./i2c_master_byte_ctrl.v:301
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 4 @./i2c_master_byte_ctrl.v:302
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_READ @./i2c_master_byte_ctrl.v:306
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 8 @./i2c_master_byte_ctrl.v:307
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; shift <= 1 @./i2c_master_byte_ctrl.v:310
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_txd <= ack_in @./i2c_master_byte_ctrl.v:311
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_STOP @./i2c_master_byte_ctrl.v:319
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 2 @./i2c_master_byte_ctrl.v:320
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_IDLE @./i2c_master_byte_ctrl.v:324
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 0 @./i2c_master_byte_ctrl.v:325
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; cmd_ack <= 1 @./i2c_master_byte_ctrl.v:328
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; ack_out <= core_rxd @./i2c_master_byte_ctrl.v:332
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_txd <= 1 @./i2c_master_byte_ctrl.v:334
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_txd <= ack_in @./i2c_master_byte_ctrl.v:337
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; c_state <= ST_IDLE @./i2c_master_byte_ctrl.v:342
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; core_cmd <= 0 @./i2c_master_byte_ctrl.v:343
(check-sat)
(pop)


(push)
(assert  (not(leq (Ctrl domain)  (Ctrl domain))))    ; cmd_ack <= 1 @./i2c_master_byte_ctrl.v:346
(check-sat)
(pop)

