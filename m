Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8C606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JB6h/AXM;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GhHCXmZ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VLMaLOIGDpPWQhOl5QwmJfkFKKpinmsBvnfF9mF6n28=; b=JB6h/AXM7t5SyY
	3BMo3atKT4WFq03SYV1Y6xnEqylyt2NNt8gMslyvR26gVa6i0sRe9lUDpN26QTav7YRjrI2uAIFK3
	jXdIY54lXGRgNfM9QRtmqyQQ4pTGiw88m+7X3F0a5uCHJKdgwiyKmJAu8e/uI9B+ZQUh7TB+/jJNF
	WH6ZuYldnD+vH73Kupyxz0O+PSlbadVgoVVJv56nXmyKZpynEWH2Xl/UDbDPLkNC18Q78fBbooSOY
	BwYOgrbCPifr92myeOU7P4emmy3850k9sRPF+W7+FwDTk+OAMnBVwRgUSqdRfaSNFGvIECg4hSu4K
	DsjHxrFvDZv1CAqXGeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVk-00000004eR4-0XNq;
	Tue, 10 Nov 2026 17:19:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVW-00000004eBd-33Jv;
	Tue, 10 Nov 2026 17:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=lzg3ATuvIQKGevYeKwotKHhiIinJaL2gVdL5rndNdYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GhHCXmZ+96ZZkJ/OUmhfyeyvp+Kh10NmIa7UY99OBzXJQjzlWEDlOlCd0bB9qROvy
	 CNnSzQDPCaW/o3bqQi475V8+Jevf10BZv4XXeug0EqnjvRaDMmwTwuS9vyi0OyFgQw
	 IDJDpchVWI8z39MbGeQceV6+OTJiwMCqNX4IdP82GHm8THtbumgpezAgY+wN0qBZcO
	 iP1sEhJo46TW6hIck+5xeFRhJZ/4pQLeZnxxFnICb3Kr4aPSCl2U0dKf51hJWf3jmo
	 yV3X4PAy4GLTi4SElg4Gr3yo9SCPtN5Ie4eWUl0FwzeKfQ7bCJwel7CQhygh3Hwa9R
	 sokhdASiveWZA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 58AD517E0FA5;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0FF5F480035; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:17 +0100
Subject: [PATCH v5 4/6] phy: rockchip: inno-usb2: use devm for 480m clock
 registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-4-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lzg3ATuvIQKGevYeKwotKHhiIinJaL2gVdL5rndNdYM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUip7f7ctZiukiWR+RZ2QIzTftpUrmC1eu
 1q9ljFi2JaGuYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qa0ycP/jIOrs1Iv0UMuuf8xFvcKaergyfdQwPhNvjcZ6nJ9o5B5hsA81H4VnBl41gibw6nqx2
 1RuIEy/8AMxTYSATKgdj5Im1hqFClK9ae5mIsyKvlaoGnQrPZUeBBVh4Y3qoY8vzr0sQlh01VcN
 K9RyaCUhJnJSwX2qjjDubMW/aQ95zgC6YUFTv0b4ffwcYwcUg0zfEJzdpWxzR7RxAKHeXS+AxD7
 pfXe3wh03e/r/Omxwe/SleL8Y8kOa8HIiLNCqh++bAEvCnxuCphOLtDROF+5W1vXqRqBl5oYb2P
 oKXbNLCK+IJ5esBGpjHD//IzsDbNiZCpXiIpTXbQckNNhXWoLC8Swe7yQq+LldydH+Zb/i/ttgH
 cLhGOn/ohKDqhDzfQDRP35qlONW2/TRC8sp8oKf+mk4Wyoc0Qd4p4SP5PRASIvylNdwSehqTdgb
 iIx3UEHmi0ocNQFJZdgbkaQiOUMK2If90B2LovmM58iepLFMa5j/TZYAa3NBMe7B3R0VYbvxsJm
 DPpravvYU5jnbyHZ1diAWpCpLzoOixzNKH8MIbol54Ez2V+atIwOG+SzthktQQZIz95euJ+Ep4p
 /oUFrLTYlrdW21jOuhc/jK12wp5TZ22AXfU0fd9w/rIORd7adKsI93vxuafdlc+m18qYZ9jEw7f
 pRfh0xgtVFV0yGGr0evgy3g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_091942_963352_D332AE38 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the open coded device managed resource handling for the
480MHz output clock by using the modern helpers provided by the
common clock framework. This also switches from the deprecated
APIs to the HW clock API as a side effect.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 32 ++++++++-------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 6b3104901695..4c0feb6b20ad 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -374,14 +374,6 @@ static const struct clk_ops rockchip_usb2phy_clkout_ops = {
 	.recalc_rate = rockchip_usb2phy_clk480m_recalc_rate,
 };
 
-static void rockchip_usb2phy_clk480m_unregister(void *data)
-{
-	struct rockchip_usb2phy *rphy = data;
-
-	of_clk_del_provider(rphy->dev->of_node);
-	clk_unregister(rphy->clk480m);
-}
-
 static int
 rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 {
@@ -389,8 +381,8 @@ rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 	struct clk_init_data init = {};
 	struct clk *refclk = NULL;
 	const char *clk_name;
+	int ret;
 	int i;
-	int ret = 0;
 
 	init.flags = 0;
 	init.name = "clk_usbphy_480m";
@@ -418,22 +410,16 @@ rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 	rphy->clk480m_hw.init = &init;
 
 	/* register the clock */
-	rphy->clk480m = clk_register(rphy->dev, &rphy->clk480m_hw);
-	if (IS_ERR(rphy->clk480m)) {
-		ret = PTR_ERR(rphy->clk480m);
-		goto err_ret;
-	}
-
-	ret = of_clk_add_provider(node, of_clk_src_simple_get, rphy->clk480m);
-	if (ret < 0)
-		goto err_clk_provider;
+	ret = devm_clk_hw_register(rphy->dev, &rphy->clk480m_hw);
+	if (ret)
+		return ret;
 
-	return devm_add_action_or_reset(rphy->dev, rockchip_usb2phy_clk480m_unregister, rphy);
+	/* acquire a clk reference for internal power_on()/power_off() use */
+	rphy->clk480m = devm_clk_hw_get_clk(rphy->dev, &rphy->clk480m_hw, NULL);
+	if (IS_ERR(rphy->clk480m))
+		return PTR_ERR(rphy->clk480m);
 
-err_clk_provider:
-	clk_unregister(rphy->clk480m);
-err_ret:
-	return ret;
+	return devm_of_clk_add_hw_provider(rphy->dev, of_clk_hw_simple_get, &rphy->clk480m_hw);
 }
 
 static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)

-- 
2.53.0


