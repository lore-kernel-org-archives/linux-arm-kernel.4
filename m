Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6849606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IjDcgXei;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfxcXzgb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=; b=IjDcgXeibZp9P+6S5YVBx8fzME
	dtHZsM0GRlEf33ECr91mSQ3c4oA4mysvWJl4HxE3zLWKiNMV4j9EQyG+wa1NmMKZn7WLjZKe6XOv1
	YNwss6KgIr6z/AG/jJrA/KE4xHeDHcy529lcWA45Pw1cdVvu67yy5Oj7xAOqLjinR8VDcTyXpGcOl
	Enot36OT1LKs2b1+hTX3dvuC8DXJfVv+f75mT6bmCVYsv/FnFqGQvi7v+3bYDwy62+4xulnoBgIiF
	JcUVrawgd0reZ0+u50o+9LgAhREJZL9YUn787ybWCfwqq9EKbbxF8HGOYaEtlhhkyyHO9BzG/4Y+R
	OtNed0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNyp-00000002PCP-3F6a;
	Mon, 23 Nov 2026 06:56:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNxV-00000002P5z-1wn0;
	Mon, 23 Nov 2026 06:55:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED78541861;
	Mon, 23 Nov 2026 06:55:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795416923;
	b=g5XUfvCJXcU8N07BcglDCRvV0o1tgi2i3ylZo/S8QVLxMh2f0prQL0iU3S8FnG0BXDsG
	 HEfDIYnNzlIiaM+T4q41rv1kGiXzArGKw/vtE+egZXCqnLKeN9/d5DbSZWmfiXWQgHs+n
	 DQhUlDFYJaUaynKg8Knd6Qh9FPCOZKiWJps4welDXJ/YGoJ+NOE7hQAeCVbfnZoQyVdHT
	 pQ9ORGscpXP9IDos4vfPWL5sRZHxblStg7Zle5slL1LZyLJJFO0Evn7UVEnA8XU+qNASn
	 9fPnDbLd2l3HGQLqxgkqswq0VrS6JQqHdKar3Ru/wNmfvmcHKxOc/vai/dHY///9Uhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795416923;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	b=eeHwvRdMNP8GEK4U6WpU15fy+0dcIx9T+hhan2Jug0vTInYHvEChakPBOO5MK9hDxPqY
	 +bCUykjatqsyi4mxgF4tULg8ZZZg0C56c8zbKRd46gnw1FL6zN+rrueZ0qHv+nYqFCB6a
	 e60L99tMB304JK0IKFcJbcr0keVgNhGs0cCk3vpyvd86UviMHrq/SPYd27GtupjdDjRgp
	 t888d+WjeYGjvFQq/fClsQUUDvTdzsMEZW6GEGZJQckbsMBtOabs6GZvwqe0+HEXU+cW1
	 UgNa69j2x/9wWpaictLINoxXgVg9DUOvLfR5s66Lv/uH/wQdxpg4agf85BhpYtt7gpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93CD21F000CA;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416923;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AfxcXzgbpb6e0SGhqPrQjr3XGaxmiAnWZ991b6yN6wc+IWFWwI+1rEwbUsGJ4KNg2
	 FtSFrjPsPI/fvoEzNTR+6Xmt+Fl0q7/+zYyDAbYomIhJmWHFpIQJ6jRtx0iyXNJT5k
	 VFGaZrsouV6m7+L/8Swt0WbMke5Mc2w49njDuEsoACEaqceo6moFMtAlhiUa7mf46e
	 w5zAQ+gFWUWaqmNOSjcWq/ub1rCiVJNOhIkdfuXSbjPcGZ4aKBtEY+GKgcN0CPIfvB
	 +JUS8b6ppiOxqNsD4cHgzJYaH4ReVLcB8ipB2eqyciPYDcu1q/xHdsozaiujDUe+o0
	 FiEgCGoYNRqFQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1CBAD4C3A6;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Mon, 23 Nov 2026 06:54:08 +0000
Subject: [PATCH v2 2/3] phy: sun4i-usb: Assert PHY resets in
 sun4i_usb_phy_probe()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-usb-sunxi-reset-fix-v2-2-4e51d3a64964@roadbobek.com>
References: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
In-Reply-To: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795416949; l=2483;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=LiuKo9Ttgw8d9A6ryR0X7JCOtqPXd1JaEy/qalojwDQ=;
 b=4snw45SeWS1PIYm2o3Nk760eHMEsEip6mSYpLIf2vwaZCQS2LzedxtnTIUXgPuRkPzG3OhHWd
 l1/KHUDf6tnCvfWaf0ax6iOs134d4XMOkIXArhpCOWh3YJAMzdJtMD2
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: admin@roadbobek.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>

When a bootloader initializes USB before booting Linux without first
tearing down the controller, phy->reset may already be deasserted when
Linux probes the USB PHY driver.

Because reset_control_deassert() alone is a no-op on an already
deasserted reset line, stale USB PHY state can persist across the
bootloader-to-kernel handoff. Asserting phy->reset inside
sun4i_usb_phy_init(), however, could disrupt active PHYs on SoCs with
needs_phy2_siddq (such as the Allwinner H616), where PHY0, PHY1, and
PHY3 depend on PHY2 remaining out of reset once enabled.

Request exclusive reset controls via devm_reset_control_get_exclusive()
and assert all PHY resets in sun4i_usb_phy_probe() before registering
the PHY provider so every PHY starts from a clean reset state before
any consumer calls sun4i_usb_phy_init().

Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Fixes: ba4bdc9e1dc0 ("PHY: sunxi: Add driver for sunxi usb phy")
Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index f26eed0db17e..a62558124d2d 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -787,7 +787,7 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 			continue;
 
 		snprintf(name, sizeof(name), "usb%d_reset", i);
-		phy->reset = devm_reset_control_get(dev, name);
+		phy->reset = devm_reset_control_get_exclusive(dev, name);
 		if (IS_ERR(phy->reset)) {
 			if (PTR_ERR(phy->reset) == -ENOENT)
 				break;
@@ -855,6 +855,25 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 	}
 	data->num_phys = i;
 
+	/*
+	 * Assert reset on each PHY before they get deasserted in
+	 * sun4i_usb_phy_init(), in case the bootloader left them active.
+	 */
+	for (i = 0; i < data->num_phys; i++) {
+		struct sun4i_usb_phy *phy = data->phys + i;
+
+		if (data->cfg->missing_phys & BIT(i))
+			continue;
+
+		ret = reset_control_assert(phy->reset);
+		if (ret) {
+			dev_err(dev, "Err asserting reset on PHY: %d\n", ret);
+			return ret;
+		}
+	}
+
+	usleep_range(10, 20); /* hold PHY in reset briefly */
+
 	data->id_det_irq = gpiod_to_irq(data->id_det_gpio);
 	if (data->id_det_irq > 0) {
 		ret = devm_request_irq(dev, data->id_det_irq,

-- 
2.53.0



