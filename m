Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1827606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S9tW7XHz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9NzU5oD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=; b=S9tW7XHzoqapNG
	Un4joVEoGez2KWlbfl1Qy3t4b0JdE9Z6N9hE/IXIZLJSlbUtrj7asAiD8cCeO90/0bfQA6LT2ygJP
	yriy0gET04VxTEBeQD/TLSIMJwjB/S5kn4CLpb5RTNBzs6pVEmHxNi5Cb2lRNC3wcwCuUHCsAuEoc
	PE3U1bMKUSJDuj7VF3SHBmDY+V1013EpcDThw4TZrNAOnULyFq3MIfkNjkpBaKdBJehu7z664iYzP
	h7RClNTaKSer9410ODwzd4xFE1OBGVBuQPFyrbSraGx4BxtyZCaUTBbvOmlO//xyqO16luXanIZAf
	0Q/hSnC2JyCizEIEutSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZh1-0000000Gc9J-1gLH;
	Sat, 21 Nov 2026 01:15:03 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdP-0000000GZSD-1Dsj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:27 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1154381a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223478; x=1795828278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=B9NzU5oD4kYb2O02X5H2T6jEOWwG3DoovTuZg56EDjnDuH2MSM+wXJfwtJSvyLq5n4
         w/gH6yIPOmWYLL6LgW2AVdUkWKylbC5NQNYovu8nREYVuYh2m8UIQqzwZyHugK+34ZlX
         HNglSntCsC9EQlqd9c944QZxQH7xTo4jGVv+wLWDjwQ38veBzU5E90icEfHPSv7DSlhB
         K6oG7imXrxULN1QwvWCxLQxeYVy+AhFBfc5JLr2cADi36PRKaRApKdiEAtZm+9KBf3Hf
         JyukcuVfRv6Ky57A5qddYoAAzYmSr+n67+/qKm2UOXP/EKUtdFhtXmq0SKcY38rG6D1c
         4UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223478; x=1795828278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=gmnjY9De2PGMbbel5jFuXvcw4lDeBD8ByBd8AYeFHuDraqfywrK7BrvpOTOIpT2x15
         130oyZpCpz2DhcXW8XkfOQDqm8fC1b9+b/Sv0ptgfIt4liOEZTSLFKwI7pnsBIzU9aQ5
         rWaAzQiGVU1viuzdz32dpNg+gQtkaooz3R+BhTjprJp+rxnqHYocw/Xnpd3QQBXMIvPv
         zvEKU8zTPWqBCYiWZbLW4fhsd9b5HMLXNOBjpdTjkx3fRJJVlZRCbtGMMlHhB2QsCEgq
         hcEY7fJNfSLBiWJFTWBt8vhTyKXxo2VmBWdM8hoy5bsO/tlAEwGnmWWE+Kih4zLNqmKp
         MrEQ==
X-Forwarded-Encrypted: i=1; AL+hErF7nlQHF3S6rJeAsN+vEZAVK1ngDjn4GsO+28Rxcj2kylvhgq6BkoNIPq++qGV+2SHkyQI8/fbOqoZuPdoQnvqc@lists.infradead.org
X-Gm-Message-State: APuU4Z/nE9MUxF+TexKopN8Xf1rW+qHcyFyxidCrpbmlKogN6C2uGmuL
	J94YreFh0LoMZZfX9G5cdWvMuPh5Bp9KPD66tXONJq5UWW2SQ/uVJJxq
X-Gm-Gg: AYBFou1JAVByOhRtrbHsiJy1yB25AH6DPn57+pmfbvPMMIq7K95BL2W93a3OL19Cn8i
	4PkbClmaxnPAGte8j5mtcplKcoHqnsFxAt/uMZrG65TvdM5HwSgBmkISYmzOaaJtiupL909YOww
	ZXv3Iilpy+fvtFQLFrIfE1UdMi54U++/cN1g2JB0lM/5Hvy3sE4rinNHZNVCL7u5nLB5Eq/aONA
	ll3WtFzaz6e6dLP2IzeICiUGu6CAnSBdYt5CEgRgOEV+BPc+FBskkhyL4X/e0RBFTurEX+r3yqx
	CWlgcuJG6guuq0Pe05ImsGkYcUT0cXxwPXerxfwdpwdRnPBGWSNfoIAsdHFk60fMGdeNwVfSPp5
	Gl5yxMZEnxtD1hkJ8cBu6wa3bHXAUPwEoUVnQHnB/S2nxM6dnI99U5tQHQLEnDTZQEr9doVJaQz
	zhPmYYDd0BnaKAcbcP9bljnyPcyrXv0SgrZ5Tnu4nw7GDLaO7Em/qYRt8/Z3kD0zoIdNgNA9M+i
	wehtDTO23hDmFJkp0cQHBtApWnjluCbqh9+kfucFPcX6jHmiaho/q+PljfzPyO8X0SaI8NoIrsx
	DVHjHAZ7cJSedBbzvG9AVILZusZ5ABMyUWRa8SKmVEwQm1MaSbXRnVGp5ZXrxJaPh6s9OCBm2Rg
	ZUPsJQGvnG0TNLPpWmVZ4gCu7p3PksqFC/PJBNkAicngy3P7UCIL1naLoQfs3QhMw3OBT6gwRqS
	8+ZTT1Vm63m3A4gE7nb0XLzNU0tVDHxBn4AaOSGcFGokwIMynW3Iyb
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id 5614622812f47-57a0a4079a5mr6188187b6e.25.1795223478418;
        Fri, 20 Nov 2026 17:11:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:39 -0700
Subject: [PATCH v11 16/26] mtd: rawnand: sunxi: limit DMA subpage ECC
 results to the requested range
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-16-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171122_711455_5CF1E5E3 
X-CRM114-Status: GOOD (  18.29  )
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

A read of part of a NAND page can return -EBADMSG even when every ECC
step covering the requested bytes is readable. The DMA path transfers
from the start of the page and accounts for errors in that entire
prefix. An uncorrectable error in an earlier step therefore increments
the failure count that the NAND core checks for this read. Corrections
in earlier steps can likewise inflate the reported bitflip count.

Keep the DMA transfer unchanged, but only process ECC results and
perform raw erased-chunk checks for steps overlapping the request.
Keep hardware slots and user-data register indices relative to the start
of each transferred batch.

Fixes: 2de85e733601 ("mtd: nand: sunxi: Actually use DMA for subpage reads")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7f93ce226f24..5415ac6960b4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1106,6 +1106,7 @@ static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
 	int page;
+	int first_req_step;
 	unsigned int max_bitflips;
 	bool oob_required;
 	bool dma;
@@ -1234,6 +1235,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		if (step < read->first_req_step)
+			continue;
+
 		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1294,7 +1298,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1451,12 +1455,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+					    int oob_required, int page,
+					    int first_req_step, int end_step)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
 		.page = page,
+		.first_req_step = first_req_step,
 		.oob_required = oob_required,
 		.dma = true,
 	};
@@ -1464,8 +1470,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int failed = mtd->ecc_stats.failed;
 	int first_step, batch_steps, ret;
 
-	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
-		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+	/* PAGE_OP transfers a prefix; only the requested steps contribute ECC results. */
+	for (first_step = 0; first_step < end_step; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, end_step);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
 		if (ret)
 			goto err_stats;
@@ -1618,7 +1625,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
@@ -1641,14 +1648,15 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
 	if (ret >= 0)
 		return ret;
 

-- 
2.53.0


