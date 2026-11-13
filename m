Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976BE606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLrz10PZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rcy3jaCW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=; b=HLrz10PZt+nGo6
	RLCkHUV4GkYOKTrmr6Yf7zQBynVYytXB3SY2HWPmeGLUzZg/Gy0dTLiOD1fN+b6ZgPRzdduTGHfNN
	PB0E3VDFD7a8++8dQGJ3L51NciQhzQNIZV0wmgdWQvt3ZD+t5GH65XNaMbfpEhqmm/pP6rX7AyI5V
	x+Y8dqGQlt8Os6630FY0tyJbOhwkP8R4g7DR42iaxYTFrv4l/t/UnsNHM+fkEwoyBpHiWz4b9GYAw
	/nwlBWhZkqfy1J63VjYzsRuESOdnhEytJrdmsyHlrU2Dgqwve1WBI3mZKOf18s3gNd/NtzVWBK4DW
	MUYiOorjoqYXGtrOioKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFc-0000000ChPg-3u5V;
	Fri, 13 Nov 2026 12:19:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFI-0000000ChDQ-2D0t
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=; b=rcy3jaCWVvS4WAZEHcuPtYKQeU
	vUU2AZJFGhh6Q45MgQPZGPlZr5rjPS00JxG9QtQtzzwyl9vC/0OqumX37M5j0OP0MnTy75+0b4gzO
	7Y/qNhUmJdY7QQTR120UtndO+jsm0zpQtzA2Dqq1gMkDTM8Ew6bmCynQ7jQOyb55OGDv3k+uC0W8b
	ERPT2FwHNVjZQHWKqP8jCqb6Z/S8vlU/Tr5LbOuSOObhZxup+k+KVemfarypJy5LWuRyU9lkQe1DO
	PC21WnnaeYd/gLRUHIrcpV/0rXhnjpmx/SmIwEyvhlXPuO5eQKrYF5iwDPKPL1m0nLa6OtWuMrPHQ
	H3lFbzhQ==;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF7-00000000mHG-3WOV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:07 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so10835755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572336; x=1795177136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=;
        b=BZjGioeV058MTlbvknwMBRVbMoPbYUzcUgqjH6mvQgwlNoNk06SHX/6+1G6BJ/VkVa
         dKaxJbCFL40mpoOGsuR2MM7Frhdpxr3ZsAmJ5k+JEX5qYdtVh/PQWGOfmkD0sFUGdtww
         2N90+o36fbISYzNRYu1NyORHUqKgaucm8tK5asB+pYQ5hnbBCxwvoFyqM7t9bxv++2Tb
         vEEtDsAWo8cYAt0C7Bf8dYmiVCuabicY3ptfpBWqsLTUMdj4SRULXT5FfRL9my2l2ywV
         Zpeekfx/gBfrgOlKCSLP/d+Rx8uGDYspjqBFr2YNJtch81DGaodwGmedEIhDd0LEPuDj
         jj9w==
X-Forwarded-Encrypted: i=1; AL+hErGPvsB5dt54z7DqOByeipO26Z1ediK/nDCbcLK3h7zuQ7XtaOhWLP2FsI+/DBeczB/xu4QHcty/iBFsdRVVqz6D@lists.infradead.org
X-Gm-Message-State: APuU4Z9njQ833aTyxoTWlF4jR/uCNQb1DfkBRED0M2qivQld8anmYl4m
	xlEQRLGb9Nj2exRnXA+SVu1S5dTve9nDfUouurN2dcWWMTtZlX2QZLRH
X-Gm-Gg: AYBFou2Y7F+ojSfwbQyxextJchlpR3SAypTZD8vd6zLdO4IjR4BQQnXTx4D13i++SX5
	OrDMjoBu4imN44KujA9uMHsUu6KulEYtPtg8Y5G8/qOzHVjTQ464h8OP47ll7sNyqqm7zmKgVuu
	t0UtQsspxr2DbfEZwM6mrdsiA4v+vawvyUmitynlHe3XnIl4WAK3Kni5jVwWUo0wwrxtg7bCSSk
	h5d96MnJfJYCNbNm2iuRWvZSmLFz1xZxhkbLm6z2c8vfNRAAB7KBLgux+K8k81c3pW8t1uJ7ArQ
	iYb9MdkqEcB80Ued184xddOVhcxgH9ZEplzudTIsTlf1KGe9oseoYyqRKTECpK2T1m0dxtZapzP
	qJGYsiFxL/aCMF40z9Vlt17Ct/H5XbrK0WP/3OafgQtPxw8TBm3Mfe/WNeahWQWb1JGe8RdhJaE
	36pbDwP2lRVmw6zesjfHwsK9CiABFVeryGp73CpOZ6zFyo4KyK4zCQNfErl+VRWNTe9IjmaGMlO
	V66tK5IfApajRq/x41oHNdXLqFyGuDwPAp8yN/hcqLtr05+tE5XZVw9JigeN8RU91gPU7q4AVn4
	Z/CMUfap7yZcNQ+mHnJW0gzabzi+I00zTKk5BpmMBSB64zWvBgN8y/79WNHObptkh9FtwXJCL6V
	EHNaous4OUODlh0/UILmYCCFe
X-Received: by 2002:a7b:cc16:0:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4bb4e2fc5eamr105768935e9.16.1794572336252;
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Fri, 13 Nov 2026 12:18:48 +0000
Message-ID: <20261113121852.334604-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121857_920138_BD1F1695 
X-CRM114-Status: GOOD (  14.80  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 2ad70f0dc4a3..ad30730db57f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.1


