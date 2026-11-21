Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0CD606A692
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umG/BrCk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csmGGtkC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=; b=umG/BrCkX26dLe
	pDtFjQIG894i+FNrDD4euPQyJQxqN7frewsGapA712Bhlj4H9329s9p5QQmq3nO2mZi0bua8dH/sH
	5S4QeweTRCHI03v0vuyj66MjjRrPYYmRGyDIsF7+b7P75QO9VR0v1JQhE+kat2lLYdHqSdhXa4XqQ
	eRcLEpfy0pfM1NI3yNMYp7qckLjQT4dKIghMtShsVXcrIUfx0lg1qhVNY3zw5pKIxKK5mRoqAThwx
	8DuFaoHtZTPiGWoU76bSMuZRda174kOhAwtN6A850QBYNVIOr0v4d7ezdDPAXYKEyUnr+neg2WAD+
	1h6SOOCHRp7/Ca4qcdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfa-0000000GbHE-2ts3;
	Sat, 21 Nov 2026 01:13:34 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdT-0000000GZWD-1ihC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:29 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4b28d7c729fso1188038b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223482; x=1795828282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=csmGGtkC8xWJX3kieIDCS54zZkawd9H0DUSqfWtKcN8+aDMemWcrgpAQLZqmvuADir
         67q9q6ghhHffsYH1j5ba7j6FWfztBlCoPcWcQJh2A3tbQXaswMZq3lZgagdejrN+cFvY
         J4UdSMv6K7lHeEaRihAvLB+qmy2tAdWuVGeQ/6sH+kJEj78Ct7X8lfbKTJwlRBzlG8QO
         F1TVFSKYXyB5bXNrMAJqeI+g3h5o4bPdhJhHva6NUV7zD5vcdc6WQeKb2mWBDFI2sb2n
         zfrssTmGGTmZEu0Q6IDQbE4C5JnV1UrqWDVUu5qLLG43bcaP/mPFOtZYfPgH1AkxZxi0
         PGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223482; x=1795828282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=acVYyY8e2dJjM3ZqLiYBJ84MIzOGHMSph6FcVotsBE7lTi8zipB8rBYaOLQtnaPuvr
         zmKB9okMSKz4R3es2kpaWYuhK0S6nKbAKxyWzCw7W1cmgn33A9pjI2qEGjp5Orp1qZhy
         3xEwwwh1u21+WOH3NEhUxx7qLaWueAxSDQA34wPMYrGgvhGv13TnbjR4EbPMjhmJ1MkK
         mrfgr5zArS8cRk8Q9W9V+F+m0nqUtYm82w6JqB9h3CetSS86Xdzjv/EixTXKm56cYPal
         WJrRPD5z6DdqLkF+8Ns5ysKjmtTjltGYdoX9sIofwO0ba5PzZnKWlnvk1opDgIHwztUY
         0yQg==
X-Forwarded-Encrypted: i=1; AL+hErGTZCwRhoWWvW6bo5PqyoDfJhkmH5ysxlmlhn97rNxdA5WgtEAQS/mPSPBUwcHBivfx9qLdyRJI9c90PrzAlnbm@lists.infradead.org
X-Gm-Message-State: APuU4Z/0UKQ+DvJ0yamHTz0INQVcxsnAeIq83hBduGtfNDkZQHFswJWf
	Jl5SVX9IvlNXabPKk6YrhdLClBfBdGjegEmCwNHc60CML1M6tJs6rsrs
X-Gm-Gg: AYBFou0iby+en2QFL3GHT2kQjS0LpfGnyvd5aWBaK/uVZGG+6zkNRGv4PZ6Hb8ApDAo
	W8LtA42qPvCXOsAVRxmM2NsshbT1AyE1cm81JhDMarKNtGNO4OL5aN6n1FAm57CShqEWyBteTwA
	1nNZD7PifOVbJgSgS8XIAxo+LWyTYNyJPS4GfhFznuiXbhv/kYjLVjffMzrJjPgOK9dV7pYSKye
	gbMb5ewte17N/5cg565DLkCmbBVuo+gC4ytTYXBW6j2i3LUW7GtMulql9EcLxLRnU/e13Iagumq
	2XdDUkFUMcXokoxvsXZ+xEFrQjPB2Ldy/Zm1yvycvfOWZqtjYEbADvmTo/F1/iC36yI5HmZrn3b
	CN73xB2T3P9X0yz1RoEPL2YzCe3NtdRBqThFHhh8e3Anhj11n+jhouhHmKXQXitcOmcm9h79HWd
	DY0dUknr00wrx/ByztwptIg0Ez4mSBmnbhUj95sZkEB/avcsKI40wXWBiZXtnDA3ErAfSjtlo4B
	wXuTkBQ3bXg7jydRuW6XHmFW2ZuVPlug6Gu5V1RM1Zd9CptHu98M9fsSNuOeOwA/JNl/BWgDp9r
	QbXBf5hb79VFNBQtSASISPy601ziE13+CPR6SmE5PcmTXJLrQ3xwMhe+CPG5N1IGS8xN55tTmy4
	pWy1BLPuGI9yCC0W7JxuAjcK4utGzV7EfC0aZrmh0UiWnkn655sR+yRmRk/NOIEVpUitFtXSV1y
	yaji536yhGnuxC6RBXlBK83X87Vur0lWpWKX6ZvZFgExnmXqKVmzEz
X-Received: by 2002:a05:6808:13c5:b0:573:52b1:bb00 with SMTP id 5614622812f47-57a09910c41mr6373784b6e.39.1795223482353;
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:42 -0700
Subject: [PATCH v11 19/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-19-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171123_516740_25F7F268 
X-CRM114-Status: GOOD (  17.53  )
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

If clk_set_rate() fails during chip selection, the next NAND command
can run with timings calculated for a clock rate that was never set.
The driver also caches the requested rate, so selecting the chip again
does not retry the change.

Return the clock error before programming the timings or updating the
cache. Propagate it through exec_op() and the DMA page writer so
neither starts a command at the wrong rate.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ee68ef9bba33..37cc023db74e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -628,16 +628,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -649,14 +658,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1778,7 +1784,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2519,9 +2527,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0


