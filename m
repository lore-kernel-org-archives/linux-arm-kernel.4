Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855AE606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tF7LDcfq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jx51Qqh+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=; b=tF7LDcfqrJ6+OH
	eFwP06J/UuQojU5dqWGZzOubflnPvPqEMRfbV3aoaZGZRciMXLg5g8Pl7RdmH/2xtJSme1LeWuxbV
	08Lc0DxqX8hL99LsHk/AEcNgFr2xtY5cxOZKQd3lKhiv47sJ+1WXe5A4KfLJ6zzCIn970F/8elyLo
	guikX6M6cE3mx9d6m/nBOMRXzEq462xBz94Ra3+pd1ui40B5CSv71eRW5/g9WInrNRfuODi4N4Btp
	V4dYHvGxMA+SYeGbGfzODb3nNZ9l9TD/4MbjfEVCYWkvsgAfKIEdTH0ZinFhe/1ShnNSN3L0qPaGA
	hxa0O0UysTHRyBTFak9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFX-0000000ChMQ-1UoS;
	Fri, 13 Nov 2026 12:19:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFE-0000000ChAp-3cSI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=; b=jx51Qqh+aq14RetVH4v5bZLkpM
	juf8q31slj/HVSx7h0aH5OxSIrByU/hRJI1CF4tu//aytNcK1JauhuS/hSy/KNbs/weWsUiHuVhth
	PV5InJBMVrtW/iLWfq7/N7XGPoLJ3dEVdfFEybjw8tUuGJ8jmfgZBfycnraI2+H80cjpHk+NPqcru
	n+gpsL+pHaoik/sZY7Eq13wIvRXoJ569FywolJKsGPYoWlLWvdlpiQBp9iE6O3vUvXzO5NTVdsdxT
	0jRJ405KS+ChnNg13Nod5NlTdpzqQUUqgCh0HvJb6nPtp+yrg92rLpiP7CN7Cx7R/sqfAjKdzCWIT
	sDjZTzIw==;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF8-0000000BEJP-4BL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:03 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16325375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572337; x=1795177137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=;
        b=W4F8D9/2lIdjBpoiz3iPIdchHe6I+OWpDRVSwr4RV3VaXGQe2+QXUe1DHsZTbUOLBr
         +pIIPLFjV8uWsZMNwq3uLRh9buhiX+YMsZo6Bmvd/zUgWr2RP17uIXosmi3khJRJqZHR
         gVJXP23DzJ5mZuEHqR5SV79xM3HLevQgG3kikk2DWEI5FgmdTccYMxF7zTwGXRYSttcv
         jB+CCxpFz0vWrid/F9fDkJJ+VVRrG/Zb04vb9vc0HYfMTthwJOkR+T2k4QFQO25zxVAw
         5yCNlsIuOBimpHUBga+m09ZV4eK7b8vw3lhu9urCVT1lzwYFKBU4QizJDbxwknLBRfTV
         oX9Q==
X-Forwarded-Encrypted: i=1; AL+hErEUKygllVaX08jYrq+z5x1WMon2THMQVO841ZZqwOTpDhpIRaqpdb29FYoyeeL1jGkD21sv2t3VPWccFr44Oq3l@lists.infradead.org
X-Gm-Message-State: APuU4Z9WkdgPa62TMZURmiLcDMJnT0SYRmEC2gZVRXmNB9q/3nhOxfO5
	lpiqDZtNsxgzi/NMGPwomWpwB2Vtd6JY8kEUPNJPXTkscLcUZbJSjGBa
X-Gm-Gg: AYBFou06DhknIRlcatq5p4t1lTg3IfA1nuM+Xc2iVg9hNFR/01KbwwZbnaJgk1qIbHQ
	BV0wd28GJBGruCgrPrjfC1txO8qZgZpCtB9g4huehmgZ0ZjWWzptd6U4Uy9jp+BV81omu/gxTI0
	uYASRQv+5VriWb8SviVcHV8ZfH9uOoRT5d5RnhSXMvry5oZRFLBr7Sk8JqV6ntp+unNNFOFF8/d
	tNAKKCv/Gbx+26AQzFj18SvXmfkWC4QFbVrrF3hvQghtOHA0nQGbgp1d3ry/Mzq4RLdbHFk+k/f
	YH6MzMT2Ls8627Ihqwd2n7rxNsjiD0uuemoRorO55JrJ2kyrlansfVfwL3tN2lft18jiQ8DMtJ9
	hXwLDaptRnRlLC38y4W6Z1y6/cWLFadPfHWBvFDdxNa7a084/oAIgt7sFAj9aWCiYkax+dBYigu
	Y+gBYPPRlJgQditSTLwb9DVPuZDBZRxzwlj3rLFg6zk4Jqt3Rl5fyj0LZ5C7Yrpx+lMlbj9lmZu
	5SFzsjinx0+YEwqt0LQZZCaYei9RLGHMy2zCd6aYiw3Fgu/WlqwqZvqixO7cWncrWZ5X2cfhVKl
	kCnOIhlVWhWxpRdK8/m8Jzd9Vm9usxpOdn0WipKEQRLCUWlS11i6QXqxgH3Zm+mge/na38nP/4Z
	Ly2C0Y2LRHZZJZTXZ2E/QWj89
X-Received: by 2002:a05:6000:29ce:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-49c70ed9029mr3869206f8f.9.1794572337361;
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Fri, 13 Nov 2026 12:18:49 +0000
Message-ID: <20261113121852.334604-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121858_982829_967705AF 
X-CRM114-Status: GOOD (  19.29  )
X-Spam-Score: 1.1 (+)
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

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays as it is.

No T7 board uses this glue yet, so the T7 gets a path of its own that
follows the generic rules: the receive delay line is fine tuning in
200ps steps, and the transmit side, a quarter-period phase step, offers
none, so the transmit property is refused.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index ad30730db57f..d8c23b280b59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -338,6 +339,41 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock on top of what
+ * phy-mode describes. Its TX clock has no fine tuning, the only step is
+ * a quarter of the clock period, so the TX property is refused, and so
+ * are the vendor properties of the older SoCs.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 cfg_rxclk_dly = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps") ||
+	    of_property_present(np, "amlogic,tx-delay-ns") ||
+	    of_property_present(np, "amlogic,rx-delay-ns"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "only rx-internal-delay-ps is supported, the PHY adds the RGMII delays\n");
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
+	return 0;
+}
+
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
 	int ret;
@@ -452,7 +488,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,21 +511,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson_t7_init_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
 };
-- 
2.56.1


