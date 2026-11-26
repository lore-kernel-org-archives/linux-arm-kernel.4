Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C599606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aXfSugG1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olkwWJOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=; b=aXfSugG1VdFMcp
	1JF2juqC7PPhiiutpmRrMYZq8rMYT9GkvwHnqgLIsJnEJIu6UWSBui1pW0J/tdzsaW8tlLvEGKuBJ
	4x1mY8EqFkoNuhA76hRyR0pNrjJe3ssRPq/T+9MIRK/Pa9NP/9TgXWQRXIy1gS6a+WIvRbPCXIJu/
	ydpBsZO+C90ifJpKcTAPn28yFn6FuZSo94x6mdU7xPGen1p8eAfoBqf8sPd+/k5fu8D2ruwZLHRvw
	iU9n5RgutcYhTShJx0IQJXlMOHg/9o6DButqghdHR+s0OBFVrhPLCFZr5MR77nhNHH8J1zK8zwNiz
	cG/9+595HU44y115B2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeET-0000000EB6w-3PN1;
	Thu, 26 Nov 2026 18:30:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeED-0000000EB1T-1X8S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:29:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so94558315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 10:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717791; x=1796322591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
        b=olkwWJOlxP5GFANg81o8g9ZyVPzctg0a5zx7NBW/GYqwoLHV34+3thTBnBfHdKcmgM
         Cr5DcwuXJS+qEq13KcSSRTjQ1YY+bDKi9FC749HOkkhCn5sqADpNeQ8JhzYA7I05JID6
         9qfJZ71/BMPe9aCm/2zSYjICnpPyTNeqSsMaZ4KMYHid6kdfJaUD5cT8zXpzmX+vAq1f
         b6vnvKM8VqaTwwrKM9cTsmLwALbsoX4hilG889b9xz7arQ9/M3gX5V16HJiKpGP81nR1
         B2mNPe4Vd2jJHW0Gn/3JHLVB9rhvpBEAUift9HYn5t1TqVHs1KONH3dFef6+0uGszhgE
         UGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717791; x=1796322591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
        b=eOeZm/leUKy136Scos0jax8L3A71I046/w3dEWVi6azEHUJbMT/QtucT0EhpJgHccc
         6Wv6D8XBOlgfsAy3u0en+KCziwgGIeWISwhxMZuAq+bPiWJJ/CCPLKe/P697KkoRhUI9
         a/qAZdcOBchdrCGxgfSt4B5cfMPemgIPe7vTDpYdKmStSIwA+N407J+3kDL36OplXlEV
         J7qUFxlG8AYYDJk7/O2gf+ng26QmGGZIQS1QY1rKfoiAIlrazVxSkPesdNrOxUehb+mR
         I/Gel6X4EWF2bHPfYqnbDGbXCbDH4BJ7sXgBufNuPosun+AyImBM8CAfXLnZkG1esj9y
         yMxQ==
X-Forwarded-Encrypted: i=1; AL+hErHgU5p5C6Vr9Lxq9ctf690hrpGBzzyma3QDKCLwcltq+q/4shwOyDhVKShGSwGgpWFg1IxtEWtP8gDkGnwtquUF@lists.infradead.org
X-Gm-Message-State: APuU4Z9KoRNVxpRI3j6zDR5C9zylPh9dGe1SzqrOPqHVg7Qc1ekFLQGI
	PBrKyrpRpz3MtxHoweNMdVfO/Wuj1IjaG+eVaazbpEZLR+WJJmhExGGN
X-Gm-Gg: AZFdTZcNU3lEjHQHwG8LihZGBIw4c25yTaYe43Soc8UzJGE8fW+VubxVbOPd6Z6e/un
	J9+Avknobuh8VvI4mILtq1xIQ++vLwahll8YplFCZYnqnlmlks7ajDdmdnrKJ4+l5/lrf1f0Swf
	2Ykot/RADL1zTIfWcPehmvc73Yj09LE+pA0r2EG+FKSBM9xg6HVwc7N2eVfSGlTlR1ZvZnvK2w5
	15MufQM65WznzKN/H5eNuIl3ywlYrT7ElJH3lbC9kOR2VeUCDpwD/DWx2v4EdmFxXqIRMd0OmuA
	AjT9hY1Gvac2A+fUrIh62AyVDvPajYqxMB9Fhbycpa6htWRP4slztvjsQkbyFsWiju2Eemeu21c
	yKSKcBLTAy8JU6EYLNe3nZdL1vOte7HwE8C8zuIWtergCYaXpCcf36WgrXusmqGyWhJ/7Q6K2eh
	wUl8XLOZt6Uw7Wqrk5Oj5+M4hbY2dwByFi0AVgsoiviojsC3n+PReU9VyF7mAXVt6X4944Tjdzg
	qmp8nxC2EQCIt9v18/e46VDnjjZLTqTG/UdRqxdFFJ8VohLqFP3ibOo9qGLRegTCTsE1BPPAewK
	AQxsHnYvCeuLk9p2nb3Apqt95lZ+brNh+eg8PydqpKk5dSRxnljzMQl3DqiRYL/6aSg2bhzz/az
	zk62H35sPyW7XNq+AhnqMpM27TGpnK01wqAGbxHKrMHRezpGDzjc6ii7kMra1gLwaKbMfplSDis
	kv22hwS7XR2PO9k5TkSRvAD80LjehcHyOcaj43gcebjJOud1qmIBJEk/KpPa1r9OxIrG5CfBJ1k
	S7cM4j8ytIkbo3e5ozZiQb0m60zJZK7HKHm31SqUw==
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr376407895e9.4.1795717791236;
        Thu, 26 Nov 2026 10:29:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] mmc: sunxi: Build IDMA descriptors from mapped SG list
Date: Thu, 26 Nov 2026 19:29:43 +0100
Message-ID: <20261126182944.3136900-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102953_449372_75B7771E 
X-CRM114-Status: GOOD (  21.21  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dma_map_sg() may merge scatterlist entries and returns the number of
resulting DMA segments. The DMA API requires using only that many
segments, with sg_dma_address() and sg_dma_len() (see
Documentation/core-api/dma-api.rst).

The driver instead builds one descriptor per original entry and uses
its CPU side length. Build the descriptors from the mapped segments
instead, and split segments longer than one descriptor can handle.
This can't overflow the descriptor table, as each original entry fits
into a single descriptor.

Also check the alignment of the mapped segments, and unmap the
scatterlist when it is misaligned instead of leaking the mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 91 +++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index c53d47576864..b862df26e192 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -356,36 +356,49 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
 }
 
 static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
-				    struct mmc_data *data)
+				     struct mmc_data *data, int nents)
 {
 	struct sunxi_idma_des *pdes = (struct sunxi_idma_des *)host->sg_cpu;
 	dma_addr_t next_desc = host->sg_dma;
-	int i, max_len = (1 << host->cfg->idma_des_size_bits);
-
-	for (i = 0; i < data->sg_len; i++) {
-		pdes[i].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
-					     SDXC_IDMAC_DES0_OWN |
-					     SDXC_IDMAC_DES0_DIC);
-
-		if (data->sg[i].length == max_len)
-			pdes[i].buf_size = 0; /* 0 == max_len */
-		else
-			pdes[i].buf_size = cpu_to_le32(data->sg[i].length);
-
-		next_desc += sizeof(struct sunxi_idma_des);
-		pdes[i].buf_addr_ptr1 =
-			cpu_to_le32(sg_dma_address(&data->sg[i]) >>
-				    host->cfg->idma_des_shift);
-		pdes[i].buf_addr_ptr2 =
-			cpu_to_le32(next_desc >>
-				    host->cfg->idma_des_shift);
+	unsigned int max_len = 1 << host->cfg->idma_des_size_bits;
+	unsigned int i, d = 0;
+	struct scatterlist *sg;
+
+	/* dma_map_sg() may merge entries beyond the descriptor size. */
+	for_each_sg(data->sg, sg, nents, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+		unsigned int len = sg_dma_len(sg);
+
+		while (len) {
+			unsigned int chunk = min(len, max_len);
+
+			pdes[d].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
+						     SDXC_IDMAC_DES0_OWN |
+						     SDXC_IDMAC_DES0_DIC);
+
+			if (chunk == max_len)
+				pdes[d].buf_size = 0; /* 0 == max_len */
+			else
+				pdes[d].buf_size = cpu_to_le32(chunk);
+
+			next_desc += sizeof(struct sunxi_idma_des);
+			pdes[d].buf_addr_ptr1 =
+				cpu_to_le32(addr >> host->cfg->idma_des_shift);
+			pdes[d].buf_addr_ptr2 =
+				cpu_to_le32(next_desc >>
+					    host->cfg->idma_des_shift);
+
+			addr += chunk;
+			len -= chunk;
+			d++;
+		}
 	}
 
 	pdes[0].config |= cpu_to_le32(SDXC_IDMAC_DES0_FD);
-	pdes[i - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
+	pdes[d - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
 					  SDXC_IDMAC_DES0_ER);
-	pdes[i - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
-	pdes[i - 1].buf_addr_ptr2 = 0;
+	pdes[d - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
+	pdes[d - 1].buf_addr_ptr2 = 0;
 
 	/*
 	 * Avoid the io-store starting the idmac hitting io-mem before the
@@ -397,7 +410,7 @@ static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
 static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 			     struct mmc_data *data)
 {
-	u32 i, dma_len;
+	int i, dma_len;
 	struct scatterlist *sg;
 
 	dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
@@ -407,24 +420,28 @@ static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 		return -ENOMEM;
 	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i) {
-		if (sg->offset & 3 || sg->length & 3) {
+	for_each_sg(data->sg, sg, dma_len, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (addr & 3 || sg_dma_len(sg) & 3) {
 			dev_err(mmc_dev(host->mmc),
-				"unaligned scatterlist: os %x length %d\n",
-				sg->offset, sg->length);
+				"unaligned DMA segment: address %pad length %u\n",
+				&addr, sg_dma_len(sg));
+			dma_unmap_sg(mmc_dev(host->mmc), data->sg,
+				     data->sg_len, mmc_get_dma_dir(data));
 			return -EINVAL;
 		}
 	}
 
-	return 0;
+	return dma_len;
 }
 
 static void sunxi_mmc_start_dma(struct sunxi_mmc_host *host,
-				struct mmc_data *data)
+				struct mmc_data *data, int nents)
 {
 	u32 rval;
 
-	sunxi_mmc_init_idma_des(host, data);
+	sunxi_mmc_init_idma_des(host, data, nents);
 
 	rval = mmc_readl(host, REG_GCTRL);
 	rval |= SDXC_DMA_ENABLE_BIT;
@@ -1016,7 +1033,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	u32 imask = SDXC_INTERRUPT_ERROR_BIT;
 	u32 cmd_val = SDXC_START | (cmd->opcode & 0x3f);
 	bool wait_dma = host->wait_dma;
-	int ret;
+	int nents = 0;
 
 	/* Check for set_ios errors (should never happen) */
 	if (host->ferror) {
@@ -1026,11 +1043,11 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	if (data) {
-		ret = sunxi_mmc_map_dma(host, data);
-		if (ret < 0) {
+		nents = sunxi_mmc_map_dma(host, data);
+		if (nents < 0) {
 			dev_err(mmc_dev(mmc), "map DMA failed\n");
-			cmd->error = ret;
-			data->error = ret;
+			cmd->error = nents;
+			data->error = nents;
 			mmc_request_done(mmc, mrq);
 			return;
 		}
@@ -1091,7 +1108,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (data) {
 		mmc_writel(host, REG_BLKSZ, data->blksz);
 		mmc_writel(host, REG_BCNTR, data->blksz * data->blocks);
-		sunxi_mmc_start_dma(host, data);
+		sunxi_mmc_start_dma(host, data, nents);
 	}
 
 	host->mrq = mrq;
-- 
2.43.0


