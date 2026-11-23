Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=deY/vc/Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=krE2PIVV;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=avDb37zb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=; b=deY/vc/ZV9w6xD
	etBTjzv9kWqMYxGMnx1iDiKfDbyfPEFqa9d4Bpomkm7UsLOP8K7Afux/ZrxEtRQqtc1dgU58/3zJy
	/dav9gJEqnh8Cl2pcB2LdNJ923H62d4GzSGcbFVyGwMIHQumf1weDyvDgwSiJOcZThj9QuyPA/Qbp
	/TEc+z1DviLOCbYNe5CLvUpy60nYzzUrUX28lWpDDfU8cUfSiifVzuLW6MSBPVQCJ3afSp+jZGNh1
	Q9qAAtjEsCgPd9oiIjNKdXON2jNUGhqWT2nlqEkYldHvsR/htplx2JawT4aGO2LOvjmObf0dHyUvJ
	xDsUPzWfkNYvtswr9kIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTC-00000003q21-3qrJ;
	Mon, 23 Nov 2026 14:56:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQp-00000003olW-1rfx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=; b=krE2PIVV2EQYvEx0w0Wd+6CuNy
	4wSy8sI+0s3WsxMtVl+LZotAfN4y5i3e0z63V8+K+rY9TMkXKIyg6GDbmsqELyGjM+tjCzahH42zY
	s+M5ygD/vy0q3Ok2mOo4IBJuL4Yk7nPq6W8mmRksK1ixaXWyK73vsfo2IBGVV2R8MOXQU7MSjzK0q
	bvm9eX64S6Te3015gHmi+JU6L+ROkuY1kwz1IGd4CuhO8hJlf3beNlLRa42TTqIYr6uMsrSitDf2Z
	+A9jNIi2Vrr9Kt7HviHxPJIzhU4Vt3qt731rJwWjtBDUZza3nmMYv6l20/wRD4I6qqAzwsaZntpUQ
	99X5hivA==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQm-00000003G2r-2QdH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso31402705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445647; x=1796050447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
        b=avDb37zbLYuWZwVMAha7CjvFcHjEsLWdEwP4HsAEvix+0GAqYmj5An0+0qKQ1pwc4w
         z0sjShZUzdpOk25TK99CxUIrPny+ep0HhXhmVipOBR7FBxYgatFTzpgTmLOBab87awST
         RMeaBRR1CGvln3wVvO8zRtjjEr83/Z3usb8rICKzaQhypROJa4U1ZtJd9h5JYokZKCzA
         6UI/wYfCpIcBg2ff4kSivd5fAQ5LRA+GEXR5wbkV0OSQCE0XpaxUNXPqsbc2D3fWC/3w
         COYfNYsrPdaM9mp1wYqmwVLOkPz10AV7bm1YGmmzTMBBxLGUjV+JRu2GwVXLO4LmSHMu
         aaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445647; x=1796050447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
        b=rRYnaFjT7oC5+KczkGamU5SJ4BsocZ8rXR0a4s/hwNvQvH8nuYGEitcTXjGyZnZJhP
         uxuQPXCktPrOOIQGUFKxgRl75dwO3rjrypNGzrC3CPK+mxcB7h0scP1cY0RsRIiKf4TX
         lcCfyKdbdo88WDsNy1WsTWrZlxxei6ns1cR0B+sGGpXygdwPMOELbYI/ev/7Fn13Uv69
         ydBJFOn30MJeb0Kzqtgh4NgySjNRlw2JHwXzNyV1fjbZjius6oxHQo+rhq2QqWHwCJ3F
         MvKrUnkX3XJYogLh37ZS8ziH0t/AXkVTrFURUAkJZtzF7fmuuouvixBTAMjMhyTEMi4Y
         mXhA==
X-Forwarded-Encrypted: i=1; AL+hErF4Bg3SEpUXYkkA8FK2VKQw39EUdSwlQQx09gm2zT1xh6OENe4PpNJ7zmyRdQF0vgJTEgF2F3tk1wkNc0qEbTNE@lists.infradead.org
X-Gm-Message-State: APuU4Z8n0riuqp6+1fxnZPWBt+Qk2BVS3q4gg0JJVcwlHW0LSzei7/kt
	zLC3HDB5IKtxBMLdEpwAZRvHim52a0L4fAFQ4NMjp96P86HuqsbFv14R9XkecQud5Ks=
X-Gm-Gg: AZFdTZde0l75PF/R0PQaH96bK26Q2BRwgKnhzezzp8oT0AoaM7EFfZh1mMYd8cr3LaX
	OI9zQmYCN5l0RliOaQ9k1adBT1/NEYzZa7cvMStV/w7LHYM6iCLBlU2t2wFNFOY6VDX3ahYGTCR
	wI6RswFg7k14Pd8TGRcj+66doNHE7wgXQQtgXbGd2QEuMitsJH4bWKLmoWQ5lh+dBgEoBCrCzP3
	VMdGC9DCxlOEUDZdA5fKJH8u1nCELPNRfQMTsBYkdnDPC+TIPlJUphNhrZjkneV1Nyql+/SPD6h
	agKnWN2fbB0myUXHQU61iRwmceRTozJLhPtJoacXjI428v4kccpq2OQl86yDSbYje1tkVWs7RD8
	ocT+K38kfopb/eNxVDadzSd7GvqSzZzN74W4R16p3KnCp4CtbuBNwwvIB2zUddHRmGXBPMpY6Cc
	vYgn3PQGvYSEb64R2OsFuearBFvIDJJavhEfySnnq04b2rjGscSN3dBP5nn2O5m1jhexBCtvORF
	WCwuQJpdA87yCV61QHvMTe05OmI0UsIJQZI8qJB0PPpoVczKFA+j5p6FLxHdR5ejpeyp8VG9lFb
	vVVGHhV90TKlkj+r2QbSMRm6eK4q
X-Received: by 2002:a05:600c:1911:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb8880a584mr244080575e9.13.1795445646859;
        Mon, 23 Nov 2026 06:54:06 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm185598285e9.2.2026.11.23.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:06 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 25/28] dmaengine: bcm2835: Add BCM2712 40-bit DMA support
Date: Mon, 23 Nov 2026 15:57:03 +0100
Message-ID: <20261123145728.29082-26-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145408_485953_C56E8519 
X-CRM114-Status: GOOD (  14.56  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BCM2712 has six DMA channels (6 to 11) with the same programming model
as the BCM2711 40-bit channels.

These channels see both the RAM and the peripherals at their CPU
physical address. The bus they sit on maps them 1:1, so device trees
without dma-ranges are handled by the same fallback as the legacy
channels, i.e. by reverting the ranges of the parent bus.

The remaining channels (0 to 5) use the legacy control block format,
extended with the upper address bits stored in the stride field, and are
not supported for now. The downstream device tree describes them with
the same compatible, in a separate node: such a node is rejected thanks
to the channel mask of the platform data.

Link: https://github.com/raspberrypi/linux/commit/99c26cc709c0e3658c3f8d78cfb856cc20bdd0e3
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index a98ea67d3406..cf435dfb04dc 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1545,8 +1545,38 @@ static const struct bcm2835_dma_cfg bcm2711_data = {
 	.chan_mask = GENMASK(14, 11),
 };
 
+static const struct bcm2835_dma_cfg bcm2712_data = {
+	.cs_reg = BCM2711_DMA40_CS,
+	.cb_reg = BCM2711_DMA40_CB,
+
+	.int_mask = BCM2711_DMA40_INT,
+	.active_mask = BCM2711_DMA40_ACTIVE,
+
+	.dma_mask = DMA_BIT_MASK(40),
+
+	.cb_get_length = bcm2711_dma_cb_get_length,
+	.cb_get_addr = bcm2711_dma_cb_get_addr,
+	.cb_init = bcm2711_dma_cb_init,
+	.cb_set_src = bcm2711_dma_cb_set_src,
+	.cb_set_dst = bcm2711_dma_cb_set_dst,
+	.cb_set_next = bcm2711_dma_cb_set_next,
+	.cb_set_length = bcm2711_dma_cb_set_length,
+	.cb_append_extra = bcm2711_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2711_dma_to_cb_addr,
+
+	.read_addr = bcm2711_dma_read_addr,
+	.cs_flags = bcm2711_dma_cs_flags,
+	.abort = bcm2711_dma_abort_chan,
+
+	/* the parent bus maps the peripherals 1:1 on BCM2712 */
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(11, 6),
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_data },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_data },
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
-- 
2.51.0


