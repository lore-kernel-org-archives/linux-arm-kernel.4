Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB38606A6AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2PibUuu+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CJlZeXV4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ij0mCMTs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=; b=2PibUuu+xxf17h
	iyKrM2H0EK1NPx1BygxPg1VTmjDpu62e3m/mXaSgkS/npQi1IxcJPjl0034cYiIQ4KhT4O/aMAdD4
	GTJ9+brulh44eIVsEG2MCoeo14WL6PjOcrVN+5ISbyKnVgGcNIKBpvbdsrEH9nCNA28wx3NOH6VaI
	UizoSuh3ZAMD/uo/Ap9DkhP5COyJtgDAYnt/WSQloC0SCsyIL9gbRHZ7GrHJb5JoLz+s2DCgtVwOi
	T0cM1XUqLF17JZq5Yeq2nFLwecxoNuLYK64gQzib6wGmFaOYGHx7tW7eJ5QdM/qu/Et+kxRQuqKHD
	UytLCZgJ3adQtO9Q3/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZh6-0000000GcEx-18ge;
	Sat, 21 Nov 2026 01:15:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZe5-0000000Ga2O-3hsW
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 21 Nov 2026 01:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=; b=CJlZeXV4QZPyZ17umo2TpwmuTW
	fxGgJwD+JiRVm9O3SfZTc6eG9yOqGu2HrBgxxTTgHC6YChajdVAcycGdVJaWaf74Ne75KEKX6Y/Jp
	+0miTKYYbWK+2MBZ75366zYpm/OE/VqLnXS1tw+4CRbbcmsQz1yqZLK1sRFws8WqYRE+UGygoiRDM
	foG2lIOBtN0Mmbbo48wzWgkaugfmu+EMRVjQh7S24nCHhDqBuRuJLZGCWd4PT6DOBTzHlVkVnEaAM
	ZcNSFaIf3pysE5BdzZemGL+dSG4UPXMC4lz6O7FxqOCHwyfuww8YxqwyUhnZcEHiWSjp3VpkYhyUM
	pIHlzBWg==;
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdi-00000001MSM-35A5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:43 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-57728d859e9so756087b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223492; x=1795828292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
        b=Ij0mCMTsQvF+uaJFo+1Z/plfs7VFWdWLnk1dMGq34PRKeBiR5QYZBjNfWpmKkISbsQ
         59lVNCXZrlGvHFXC44ukULLvuXF1vLv5MtLX4JPpw5vrGz7izVGVisgZG1W5aH+q+xbR
         +j2JgddCzV/iZXAhXy7SBwfNG0JdjfmUrPBczut12PoxRqm971fwq6mZPCNWRD/wSVlr
         0KJhSTfT3avXZq42PVCCb0ibZKS5sBYkAy3+e+ieawNcEgvzOzmzv8CO6l0nq2ZaCjqb
         DIHdBYofVmdWKCqTPMEFxGx2h/Gkj+NKDTd+Hb5niBhwkDGBau+QONSVFL1T68GINolU
         8QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223492; x=1795828292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
        b=e7AIwetEslFMeciOV7M580AJbgAlN5EwgMEyf2hGMEzSZe88Mo0vvHkENexPZF7r3l
         OZq+s5tWvePUbxsI927B1AnPG5vR03kuAVZ3Z65dFrrJwdtTq2fBPtVLxTH/CBXwKS9v
         PX+maMcJhjCRs6EGBk2pfKPLf+ez8jMRgmOVmvgfNX7iRYAC3GYhC1DxhkU7P48JEKCS
         kW87ps2ogCd3K3QjORe99IwdiL/6LjKOgkw6G7IP8xIGn5ZzztR94v5I28W87E4Y1gyQ
         G7G7G9KHmwBJmqtt16zUtoR1pOpv3cBa+Z526Uo3xUCpgYowOUYFniSe3Iu5PYZsEzDb
         qRYg==
X-Forwarded-Encrypted: i=1; AL+hErFADh3WYBnaNoEV4KnXAcLa5sJ0Ps/ElQCvV6SiGqbnPpDidtatVcMWlX6LpqyavVRkycqZLC+UPypwyMSryTr9@lists.infradead.org
X-Gm-Message-State: APuU4Z/uWkXZssZATVcIDkWwwebr8hLisKSAjteSgkfHIfjKhpkkI4wM
	CYJ1PryvM4pmDEpX47kDVBj/K/owkIL121lsApyPRsNACdbyLiSf6gbh
X-Gm-Gg: AYBFou3i1Hkv3OkILUoh7rlV3/pOYsImFb4Wf5BfU4vgmahmOSBwIpsO18vKpotRhUI
	Ye32beLCBbL4mfqdUtscAyKhgS16VW4I9QZS68peH0Q6CP/5B5nrm9gDZUkeUUR64NMyojfC8H3
	FGuV/OTlJfNMASrMbAgNFYSVa5NNFrwy1zvwkraln5eJc6UpYt8hCMfwFnSF9UW+WQXqWz7el4L
	0vV5axoA82T8YTb6kDPMq/OI8FGTYakqTsdxgFdThXoSkaCKn2z1u4Y4EeToj5eQrWBz6DV9ygg
	bzNtdYOpBDYgJ09zUQegDYu4gL8rvtdkYAKbrmOSbA7bRB+tatxaVyQo+pL+suAJhJg3dg5r+qL
	FP9UODXOZ7Ro+0PPjSJFCWhhMeVwjrz4jMfx0NVpukDxX2kbNMakjKYqx0cnSlSkQvH89RstSCg
	Kqp2hmqAEX3TCUWDI1/rVXUPNS0lNPKFukzkN1+tpSaSx0u8ezT6FqUwrjFklPPJs8lLHR/Sld6
	vogJP49qlopFw4hlzISWXnRbxiSN1Xh99qQs7u8obbJE0StztW08IemdYrfZgnJDhGeIdz4ZpXG
	syPi5uFPa2KYZSmGBtm37RJY365zrkHNv+BaOhTcQ4PVqisTvUER4jAvTZYk2b2PzmquAIqO4jv
	30JsRTJXPOis4ljLst/vHqzal/N1RJVE/OgBC1WiUyxNEAq5E0VgXpPRA83ol0g9nHzAntbOqcB
	PAbE7yCzucHdI7TB1iIwev5PexRfkZhojhzc9yS24kOxXQaWA3dFnj
X-Received: by 2002:a05:6808:508f:b0:576:1161:cfeb with SMTP id 5614622812f47-57a0d4ed405mr6123275b6e.66.1795223492380;
        Fri, 20 Nov 2026 17:11:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:49 -0700
Subject: [PATCH v11 26/26] mtd: rawnand: sunxi: reduce user-data length
 register accesses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-26-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261121_011141_800187_669186F6 
X-CRM114-Status: GOOD (  21.54  )
X-Spam-Score: 0.1 (/)
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Each code counts four-byte words; zero means no user data.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Use the same encoder for PIO. Each step writes the first packed word
with only slot zero set, so page setup only needs to clear the other
words. This also clears stale DMA slots before PIO uses the registers.
The lengths and on-flash layout do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 59 ++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37f01801cf48..31f995a1f5d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1061,10 +1061,7 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
-/*
- * On H6/H6 the user_data length has to be set in specific registers
- * before writing.
- */
+/* The first PIO step overwrites the first packed word; clear the rest. */
 static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 {
 	int loop_step = NFC_REG_USER_DATA_LEN_CAPACITY;
@@ -1073,7 +1070,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (int i = 0; i < nfc->caps->max_ecc_steps; i += loop_step)
+	for (int i = loop_step; i < nfc->caps->max_ecc_steps; i += loop_step)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
@@ -1088,10 +1085,8 @@ static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 	return len / USER_DATA_SZ;
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
 {
-	u32 val;
 	int code;
 
 	/* not all SoCs have this register */
@@ -1102,11 +1097,35 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 	if (code < 0)
 		return;
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses only slot zero. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1474,7 +1493,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1503,7 +1522,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1524,10 +1543,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1645,7 +1661,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1900,7 +1916,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1908,7 +1924,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0


