Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C469606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LhA9FTfV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BIUeUPZ7;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UUXYVdVw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=; b=LhA9FTfVgDE1FR
	bnRiFH5K3AHhkV6of5c+oskZGCjL91mXl1CM1a7tHXmO/MZbG7CefeSJjL62JwwJaXG/m5WzZMLQy
	Yo8ebSUpzy4kvdz7RrUM4+pOzpkC0EmZABYUOBkujvjjrOPSNMuicsA0wypUMw/4Jo5bnALnOZoR7
	aRuPSQslyyBUO7rdsWlHwMXQAq/TVbglBuD3A3BsIdzbkIbAB9DaFKf5At694yd6uatpXp8OaaQpu
	7fTUGwG5Rjdwv+Vk0npzh6vZQ7mO2gtsGWl0M57SoHUsLr+/NsYDNPh2zHo45vAYGqKjA40vCE0VB
	cqH9LAbUTrTWqPQXEy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy4-0000000G5Gw-3qJp;
	Fri, 27 Nov 2026 12:22:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvB-0000000G3SF-00aB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=; b=BIUeUPZ7i4JM0Q126dztPu0qMB
	XQ0JUAvAIRER/ki/6Y4LThVzxfEF2qZiaiZ5LbCY+5mJcF8pBVaAKwuCnOKUm2/WAl5D+w8W+f8TY
	uzjCLga6dPe2ghuND3/8DEZfq+RxLmrfqLMmRHY2zjdXf5CCQPPK8JP3o5Uf9/038+AJWA5CppbYj
	Au6uGUjGmhG77kd+FgOasCJk03wDeugfOWzHW9cwCuzO0nwbN+qqUAsDyIAixVtO9q7jMiSXNchG6
	vFL3DolIf8fX3oLj4vC2RUkSdkihdhtLoJy9DmucjaNot5B4YHGOTtgQKoaccJbnfDy/Vgy00zBIS
	fVt9zljQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuv8-00000007gyV-0OMl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75638835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781957; x=1796386757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
        b=UUXYVdVwL6EZ76Rfq/1sBSdy7TGBfQgXdFRKs/URwe/1vZCzOyIN6nd+bUFL22F2fK
         c/7t/wn/yHlahrMdoQ13NjZJpbudMvamQ/zA+N/A5alk7mZUdCAHmbc9eXSpeQpD8HvY
         46xicrHZJV6zNLHLuyXxKO2GQ9Sl7K0edDeubmO5Wqvs2KtMACQIz2V9noIrebsQ1uI7
         /o2pjWPaF51l8+gcDOji0UmNRli73rr20zHO5E99MFPOxecYQT8+gXakusU5Lus+apo1
         V/ZyGeLtBaCof+WInAhutU4mLDqTczGpLIiH6hMvKw40idsWU/RzPgTqmC2qIZv4HJGu
         e6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781957; x=1796386757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
        b=MqT8vXW3Ff31Cs5QXkjxE4k/v5L9FsnJfE/dyh8O1sfc/2OBPN96QvqLcMCtU/GJfU
         dSXb3ORQQcbI/eI/oV5O9nfHzT7qYu5LuLApfqkVKZ+7JkueypT+7qQvdeW+BoC/0c/r
         H7ORm9qvTxO6Icgz86ddffmLTonGuG/Dd+Eu1H42miX2I7PImAebGxokew/UxSp3NtWh
         90qdAsWP+Uf2NY6MRaC3hkZYZZtvaJ8TdJnuvw64s1+4/Ygm6ra/tmmrPguavVUCqiY4
         4UQSKonbOUfefE2i0kGYOTuQK9cfH9xyvqTPW1u2jesvjSASIH8eneR+eKU0gG+/fT8M
         yLiQ==
X-Forwarded-Encrypted: i=1; AL+hErHXad9q8caP83BqWYRzJ4cwNoCoTJqY2ZUasfN6JDKnCqK4hk6l9Wy61mB1mMcbmWdyQORLtXMB6xcqrpDqxcd6@lists.infradead.org
X-Gm-Message-State: APuU4Z+/LScbTyl5OFfPRFZ38KtujXAKFGvPOv4UFXcF2Mrzp9RpnZl7
	L/lHImlEf6bfu5U/cY2nr+FnGWNxcuMyd6T2klypHg+fRymj7OSQHaXXndZj6XNV0XQ=
X-Gm-Gg: AZFdTZchgk6Ri9Krhh/W0B+6SkTQzHv3sCW2bwvPK0lBMgM1YLYLAQewOODhpNqycDe
	s+4sSNITvmt7bLZ8kWLd22zEF8FHKc2ngDJ+vcmdtOe1quCdpSm7JNGabk9Kk7VrQ7g7172wUIt
	Gj6sRdRkB6BKIoXcqaacM8GGuCfVjyXdgDMldl33RXqgYXYRuiLZRfMIG0upmNNmTQuVEiRrrXi
	h6Z4HFqWbQHDKIWpxu5RocclY2XWQ6U8NpfDlb5YsgnlAyIWp/+Dx5Gf4+TYrs4NVMebQC6FvME
	o8kKhYOSdHf9jIVpqBz/QZRqvxO4FaqAK93/Jy3+FV155Kdi0sK18VT7M76vQK7uveVK51OnuOv
	h9x6nAs0YrLb0nu/jO5h5fesJyt0HXyBeNccQn7gzF0nqijhYhoGSuGV2yykTBbCBvnq4SIyupt
	udZaVZQ4l4r8Zck8kn+RTopjNNFuXSWPyIBLDlj2yg23CxJ/1vIJ5paS4PIN8olhfQcnDsZXX+C
	vDDJaKRiujFEcCCcE307n788S9R9rZ8/tuZpzKO3L0O9XOzZI49CB9VCjZHBFKy02jg1nBGW1cw
	2HRLomHVyk0VHf2SKA5HFi+CC3F1
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr522882365e9.26.1795781956697;
        Fri, 27 Nov 2026 04:19:16 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm663488865e9.4.2026.11.27.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:16 -0800 (PST)
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
Subject: [PATCH v4 25/28] dmaengine: bcm2835: Add BCM2712 40-bit DMA support
Date: Fri, 27 Nov 2026 13:22:15 +0100
Message-ID: <20261127122236.4976-26-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121918_035508_984B440C 
X-CRM114-Status: GOOD (  14.54  )
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
index 8fe71de2be0b..99c5e0b9298a 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1546,8 +1546,38 @@ static const struct bcm2835_dma_cfg bcm2711_data = {
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


