Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA94606A6BE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4y+pJpUO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lp3+RLWc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=; b=4y+pJpUOeb1i/p
	H7MI/wPoARdVcjPGkeedOy5SY0hwVhz6tr/gptG4CR4pqvUKaEcA10RLNpf+W4xrke654XduRLJuN
	bIyZ4FG+cz5/ErjxINvC2qpfbZYEPhBAVMhlgewDFswBfw3sY5G3cgx2Nv9EW52YysqShDrJJaEll
	3RjroR5naGNv2OsUHQQpb15uqfMFUvEMbaJbnsQwrxykVls5R5pjb1z6js4KKYdRHhL7RKLCdOcXd
	z5pQ6i2+XCXvbuu09lX9wCUjdYgFl7JMZKRou9jaCkET3eBu9cD1jbEN3y0X13HFYViZfEcate6Rf
	mB5+HqYxA6kqlWs1S53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdX-0000000GZc4-2uxu;
	Sat, 21 Nov 2026 01:11:27 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd8-0000000GZEY-1XPx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:04 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-833e671ee9fso1454925a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223461; x=1795828261; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
        b=lp3+RLWcPc1zGnYt0wRsTPWtoF05LIQDDb/TtgF8Oryxkokvk6Xq/IortivVsOGNWI
         3QeCTIhZvpnsXVQBsjk9dH1fjIRXMCHyHBb2iLt5P1QiIDNgxK7Thyum01bnxqqpN0gS
         BbJqAXT0YedwmtDfDvomLK47VL1BzLZLIl02ofvndTnD7C8vEKV7ynrMHUsKeMegSl9Y
         jDddoWGAiV01jnOmPHp3MQf0mFK5o4e5RNXfoAwVjJdCwi4Z7pZsWC4alejHrONcmWCa
         aYoL1Ee6w1CCfwZ88OvTNXcN3lCobn1N+N2ODu0icT/ts/dmlzTO93Jd49Gsg3Ii5IoT
         ag+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223461; x=1795828261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
        b=V6XAE9tb3TfQvc9kzzDF8owekDphMInKuOx5JJs5Ivt/AhXsNkQiVJDz7DxvcqJbC+
         psx/LSAVgUZYI+hJMHGckqDmt6qbeXxymi7ZftEWWe5EaM7fyJG10DWtvYrjEW4tPr3Y
         Vg8HU1AH3+hSeaEnBlQ08MFvYnDXIfZN926XNEPKz9qIkrN5qIWrYPuNg9IkRQudy6cC
         06DPNg5nHkyHMfvTBpuTwJV/yevi3CzFdrj0FuIFK4lxVb6YVwSwMKySL/rDVKiZlU8x
         zO6mTLZ5cEdBCFH2r/OnlzeRugExGxsLoyIQvZUgE7ZbIF/SpUJpJoKjUqkiaf3kNrvv
         rCtQ==
X-Forwarded-Encrypted: i=1; AL+hErFNTmAsaxU1j4mszQBBf7cPwC2N5fYTwqNkn5H71UFYZSWZWSqTHEmiBT6VzwcqM/I7/VysXEN2UUOb4ZsPUIME@lists.infradead.org
X-Gm-Message-State: APuU4Z9DdWC1LOg1FKvuRdH51gBpOt20i+ISfKe9hqWoFMszpYFHli6q
	7wjOOUh9jD7lJOpnkZ9mXKitWAXaQt6G3VsoFzXUnTgpFQoXeP5bYuzK
X-Gm-Gg: AYBFou3cScYy5zj4jOzjY3kLoUcILXS2lDHJ/byW+Bhot4Pw2MdxhhwKCBG/Rr36HT9
	4U0C06Keutwv+Gpecao/tkVN0ZHI0/9O3W+67oxXxLtBFIQrfe8QAJjPJvaOMaoub1Faw9n4YtG
	3fAcL+IdBJsErDtrp0fcqHfrqrCYr7QXGH0CVX4xhPIdWdyerodjas4/7kznXjvCDFR+4TjRGSG
	Ninlc9fGTg1boGgDhhio1yx03vdyFKopzTPO5iFLJKUrb+G18sOcpzUoElg4yaRU6h6g9yFJZET
	PilRB2Z9KhRRsUcSup/bpIgBxfdNdwvXfCudfKpytouIse1xEef5HSt9SG405wA9pZcZpFOmzm3
	e59U6ai6CKHBiSlcc4ORjLz4WL9Jq5KpgsFrfP1hxejFSQbUp9GeA/Z8AyTSOmFhMdLE4Tqtpl3
	kPw4ecHHqaORjspz328qn4wriGJKRhgmdknUBEBwR+YUaRn77Rd0IWX/ofqfS2gGuHIxzJrPRrV
	nW6+CICbp4VsTSvoJ3J5PhZORO2Z3rMQvNqthHsGmCBrF5D3HwWepsf4c3IwJPr16iPeTnE520T
	MCccjBhsPpiuWu64iJDNpiqfCDfgd1E+h1YRZGyZWF8vuAyFBToochaHqA/ATMmg1KGXeaR3xiL
	7mrITjJP85bKKoAXC9ffm9VTembUCB2AERUZFbX8borgclPiuBC4wEOFMXsQl458axm59KYOW0h
	Y7kdIN+sGTYgpMlHtpA2euIWK6TE2arfaMoV/lqNIVf6VDSDSwNYUY
X-Received: by 2002:a05:6808:30aa:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-57a0c0a40e2mr5697337b6e.47.1795223461220;
        Fri, 20 Nov 2026 17:11:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:27 -0700
Subject: [PATCH v11 04/26] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-4-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171103_005751_AC10FA54 
X-CRM114-Status: GOOD (  22.33  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On H6/H616, when a PIO read detects a pattern and OOB was requested,
filling the OOB with that pattern can overwrite the next step's bytes.
On the last step the fill can run past the end of the OOB buffer. A
PIO write can likewise fetch more protected bytes than the step owns.

Each PIO transfer uses hardware slot zero. Looking up the protected
length by slot therefore always gives the first step's length, which
can be 32 bytes even when a later step has only 16 bytes or none.

Pass the logical step's user-data length to both helpers. PIO still
addresses hardware slot zero. DMA passes the length for the current
step and still addresses the same user-data registers.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 96 +++++++++++----------------------------
 1 file changed, 26 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8c5aed1fdfb3..ffbe851b87c7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -927,43 +927,19 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -1017,48 +993,25 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1086,11 +1039,9 @@ struct sunxi_nfc_ecc_read {
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1213,10 +1164,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
-	unsigned int user_data_sz;
+	unsigned int reg_index = 0, user_data_sz;
 	int i, ret;
 
-	for (i = 0; i < nsteps; i++) {
+	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
 		int step = first_step + i;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
@@ -1228,7 +1179,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1257,7 +1209,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1437,7 +1389,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1637,6 +1590,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1657,8 +1611,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
+		reg_index += user_data_sz / 4;
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0


