Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB4606A692
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X7wDy+ro;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNQy0iXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=; b=X7wDy+roTFOTef
	rRs2OZJbbmbhFC0JzY+KeM6clYmk8kImgDRiu5NU//Hi9E0eqyRIAPMyhzzhIY1eMXrjTPWqrEFg3
	9C3NFEkJmQKPjR+Kx83Hs1HbicnPNqWyBMZipa7oBFqs9iuKIBdW89tu4ajsx4n7iWwHQ5cu0J16w
	QPLw/GA86LX5unHMQmzTkcH4j/u2DzrPok1xaTlk/YEjkNNzZVmVYmbtOF5yJ0Ot5G7VXfvY3BAYN
	nCamwbx4HEDLnXcC/U82O85u/R1FErCcu6uzs1EvsbmHQ855Uq1gE9VVZrgbG5NAqRtxwYPmzZwPE
	UqwPTdhE+CF5NqvPYOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZh5-0000000GcCj-0Xhr;
	Sat, 21 Nov 2026 01:15:07 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdU-0000000GZXl-1p81
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:31 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-43bf9548df4so1487189fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223484; x=1795828284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=YNQy0iXSAxejI7Pz/mC4+eXrQ5dv1asTBOSlzhXYcaz7ObR+7Uz0gXtM7JKS86YR3b
         oW1Jj9597FLUvk2VJ5eHqqdSHsre4ANMgvYcEj613AsIZR+9Vg5c8MRm/b92vN+E3ZLH
         CWJT/LOEbzYvuHEvsngg/q8E1/cGVqeN87O34trRZQ5t8YSgHYQUx05XX2fG9aTW1U49
         6wF0TfYEy6Pj+s8+sI3tder1NdbGvJY2Boue7LXclG4J1ioISmOaWRAEAd7E57IuTSfk
         7HWNWIYlrBuwIqUaadyTJiBFdh9a1iZ+bDKoeftKwD13ZTh9d3vr18FUlqhGn3zraToN
         eD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223484; x=1795828284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=KkH+oi11TUUUl7itUbMe6xz+Qcgo2u74jY+S+dmVPjOP+NSzc4N2maoxHwCZMrw0gm
         3UrCeQCg3A9Dd9pjt7fg8na03wCtEn5RNuuNmYP43n5LdxjHknp9Z2HExAKTFV4uMnF/
         tjib3/secocVwarxVfEX1btw4rPQxNPUeKLCr26KL2pIr64TW6VZ0Ny1agD1qewLqQSi
         f93h9v0KiBZJ2U7QYVfA3yxzd36euZSwKNt2Tr8QXxXvzHcQBpquePLISxTmzt+2e9wE
         48WxIcHqmmTuuqrWKTPk0KzLpWpfr7G5vpMjG8H//NY7T2RamtU35acB+Ap0cxKE/aZv
         TCDg==
X-Forwarded-Encrypted: i=1; AL+hErHHlK6/W5VXHMhF6hnRAFKzefRljwMD0Es1LDkluoaCfHSWjYoQN1cOebNe58i6RiSp0miOA2z6PCanYCD4nPSE@lists.infradead.org
X-Gm-Message-State: APuU4Z9AJRJlgf5j6JZiamuNUjxvhxSnLCMkgJw5dld0BNrMRpXBCb83
	LbIWnrj8kzdn6OP65RsUYnTLJujeR34nMp4pdeLd35v5DOA2htOsCZf3
X-Gm-Gg: AYBFou0ZH0y9q8S7db5YEIQVKnpmUmGEwCC/PSy3//y08fBiVLKd2Cue5TdA5rNFIFV
	O+r9VaokjhFITWaW4eHXkkyPm1dZSzS3A4Q1zY31tcXBv+3677inZ1u6BNcLiNDz0RxIFkQGCdl
	DR4L8lETb0MliP3iFl8WQqiXC+229ApfGKtMV3XhALonvkugc1VBmhca1U9mKuY47UgkWy8PQlP
	aV2mGdaxp76FkF4yuGqUEW4djVZ+/M/GhcB2Otd27qr9d2PdNXiu2kkZwmR3ycnM5QGydj1Q8Bv
	q7N7OTzMXMSrbS/nJenf9Mew/QvTxksfYQtN71pdI3vCV8+bU6WmBw8O/5z1GyuXGQiNKnEA5Yh
	3tMrECdPZ4yfRtXKqIgLWr0bJCBMW2twL3U81vqX03MKRIy5FF4b8re0arZ+I5HqD6sj03cjLgm
	xTTScnWR4IaOuT8kBbrNLT8bKRn0Fup17A56BXlc73GAfIZswck/rC3RoLMuB2MB1hg1PZtWVHe
	p1kYlTW3drcmu1CpYkNlausrodZf5BKAKKgkPPUwjQSvPcMOi0cG/Zymdx4KheU15jyViX07LhI
	HzCSjip6lrREdq8nppBswn7VT4ll7ks93LYjg7Kv3ZA5v0irI1EbPgyb87EOPaClOCk2rgG4LRe
	BmOqF71vXukbIShfuKb90QXhy7CykjivHFyNGrUVI7x4HWj3m1XAvIbDQ0f6Qt+Bn8gF178o5Bm
	dtjTu6c5x1uE3tv+ytpfQZeiABDa7Bpi7vWL0BhNFo2GMEFip6asP8
X-Received: by 2002:a05:6808:4fdf:b0:571:b166:3d77 with SMTP id 5614622812f47-57a0af33b0amr6477590b6e.27.1795223483689;
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:43 -0700
Subject: [PATCH v11 20/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-20-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171126_269146_CCB1A468 
X-CRM114-Status: GOOD (  14.68  )
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

On H616 a page operation can report success after reading or writing
only part of a large unprotected OOB tail. The controller has 8 KiB of
SRAM, but its normal-command byte count has only ten bits, with zero
encoding 1024 bytes. The buffer helpers use the SRAM size as their
limit and advance by the requested length, even when the controller
transfers fewer bytes.

The operation parser already splits data transfers at 1024 bytes, but
the extra-OOB helpers call the buffer helpers directly. Share the
parser's byte-count limit with the buffer helpers and keep each chunk
within the controller's SRAM. Larger buffers are transferred in
successive commands; controllers with 1 KiB of SRAM keep their
existing chunk size.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37cc023db74e..4478189bf920 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -89,6 +89,9 @@
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
+/* Maximum byte count for a normal data-transfer command. */
+#define NFC_MAX_BYTE_COUNT	1024
+
 /* define bit use in NFC_CTL */
 #define NFC_EN			BIT(0)
 #define NFC_RESET		BIT(1)
@@ -667,7 +670,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2498,11 +2501,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 );
@@ -2512,11 +2515,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),

-- 
2.53.0


