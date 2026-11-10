Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B270606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axATmJdS;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JRc/e/jd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vLFtwTlQiX1kBL79qQ7wRkTkfPyk318x5Lu6zEB3kgA=; b=axATmJdSbsFB2F
	CyU58EUGY4bn+qXJdXSgppsKpIvDLiHXD99GXt4uvXsnrJtzkitIjljdrYifOEABQ6PbzcVct69K8
	SbYeVb7owPiXzeTwYN446cPy6EW6bYd+Nxrz+H4Y+SG1cEsxsFgoGdTas6Ulw0udWC3/noN9LMNjp
	EaJeL6AS1l+7kZb8BKsMa+2CCqrlXSUzym5Zz2LbwtmhfmYBqBMt7EKr6LbjwPapgAvWJx9ES85Ff
	3j0H2UBrK3VhBbzx7roL09eDpVKweZnNt4aGNsHLBte06vTuErA+s6jX/7DWaU5QNX6lriXF2hoy6
	QAMQ1z8/1I684ChZNNOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKK-00000001ygk-3hOs;
	Tue, 10 Nov 2026 00:03:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZK7-00000001yXC-34Oo;
	Tue, 10 Nov 2026 00:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=cEdOypZJGYYFaGv+bcDJnJcN+5GsC8u8XziW0E9RE2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JRc/e/jdcIfjjM1f+KkpbYsyYa1XYE6T+hVZA+b427I5MW5zpE3QkUjzyLv0KAoZ2
	 0UfMzftb/k/xEymi0bxntZMYdcKkl8FbGDvZbl+3R+Oh6yogcZqvHAFzT45Iqbfy5s
	 yNcdWITRKFe5HNspy5Iz5GHJdYlhFcfvJ3Yztpy+MOjPLwx/vQuAtuI3POaYLRXZOr
	 AOpPRfi3Cb7B3yi7he8hGrMZT0kjLJbKHh5CiqgE3OmS5eSn/cI1qaQk+zF18XxL7w
	 F7XmqqWB1+LmzaEI09lq/ffN7AHNhb3BFMdon+kOQaZGSFY1CbYI0lkK38nizQlkro
	 Jrxue8+VACHfQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B8FD17E0F93;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 25435480031; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:48 +0100
Subject: [PATCH v4 3/5] phy: rockchip: inno-usb2: ignore reset_control
 return codes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-3-51acc071634f@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=cEdOypZJGYYFaGv+bcDJnJcN+5GsC8u8XziW0E9RE2s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXyd3npgblOCy1hMnPDzZMmtm1EAGFGs2U
 vxK0Eo4GT7XvokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qasA0P/2xDCVfViHvmZCTfKKXJNPuQeQSq647G2Xoebz4vooT4zyTj1LhuecxWjWTB4IRuiW3
 8rALXp+vrt08CcZX27X1aHZyfeH5CZgLqw3jGx+Y9hhez/P69kTqluPYS0KMFqABGa6NFuiUWEm
 3Sic8E8dHiIIlE1R1RrVwBUeZnRG0/8SUkEbpimJ66IKjeyz+pKV5TwC4Y8OkWqlqyaTUzsdF0l
 0uCf71WjxTeaDQuTVF7Y0aEQ+wXW54z/7/x6pvQX3ay1vkPslrqrRyCtqLQzO9JO1r7/ZO0gfEK
 QH+M5ptNeltjm+3N3VAPZsGHR6to5BSA2TzTTivwn9jImOKUPSa+ybK2AxefUbFuMTNzlnWhrpJ
 vy2RfFl0gBsVXsGOi+P1ZjkBShQuvw6Pxicrdh4H12D9YZxLJKGh6x6nN7/4iKoCXqw34i3zlIS
 ByulXpOyOSPkp7B+hTYibOUOc0AV4XOBSiSXAuP6br27NDDGmewR1yKt8tTllRAAwT7gWC6uilX
 3Fxal3lZyVytpo0HYca4Ttsza2k/eg9OsSBGg9B6cQJ6AC5qWTM9NnomcDV/rbzzT7+vu31Chgg
 4qqUOukUuY2qvtnSkUOK8PPy8TzzeDkdsFfJH92YL8J0c4Dam1UQ4jTx79sPLTM0wPj8Lcg+wMe
 8Yj6OJ250ZEFgwbSL/kQ3IA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160251_955774_E7AE9004 
X-CRM114-Status: GOOD (  11.93  )
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

Asserting or deasserting reset lines for the Rockchip MMIO based reset
controller never fails. Drop error handling for it from the driver to
simplify the logic.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 31 ++++++---------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index a705c4b18bd4..6b3104901695 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -290,23 +290,12 @@ static inline bool property_enabled(struct regmap *base,
 	return tmp != reg->disable;
 }
 
-static int rockchip_usb2phy_reset(struct rockchip_usb2phy *rphy)
+static void rockchip_usb2phy_reset(struct rockchip_usb2phy *rphy)
 {
-	int ret;
-
-	ret = reset_control_assert(rphy->phy_reset);
-	if (ret)
-		return ret;
-
+	reset_control_assert(rphy->phy_reset);
 	udelay(10);
-
-	ret = reset_control_deassert(rphy->phy_reset);
-	if (ret)
-		return ret;
-
+	reset_control_deassert(rphy->phy_reset);
 	usleep_range(100, 200);
-
-	return 0;
 }
 
 static void rockchip_usb2phy_clk_bulk_disable(void *data)
@@ -559,9 +548,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	 * please keep the common_on_n 1'b0 to set these blocks
 	 * remain powered.
 	 */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
+	rockchip_usb2phy_reset(rphy);
 
 	/* waiting for the utmi_clk to become stable */
 	usleep_range(1500, 2000);
@@ -1479,16 +1466,13 @@ static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 
 static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
-	int ret;
 	u32 reg = rphy->phy_cfg->reg;
 
 	/* Deassert SIDDQ to power on analog block */
 	regmap_write(rphy->grf, reg + 0x0010, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
+	rockchip_usb2phy_reset(rphy);
 
 	/* HS DC Voltage Level Adjustment 4'b1001 : +5.89% */
 	regmap_write(rphy->grf, reg + 0x000c, GENMASK(27, 24) | 0x0900);
@@ -1501,7 +1485,6 @@ static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 
 static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
-	int ret;
 	bool usb3otg = false;
 	/*
 	 * utmi_termselect = 1'b1 (en FS terminations)
@@ -1524,9 +1507,7 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	regmap_write(rphy->grf, 0x0008, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
+	rockchip_usb2phy_reset(rphy);
 
 	/* suspend configuration */
 	regmap_write(rphy->grf, 0x000c, GENMASK(20, 16) | suspend_cfg);

-- 
2.53.0


