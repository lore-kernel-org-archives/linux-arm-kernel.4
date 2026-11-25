Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F3606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1r6ERxcU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/HeVJrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=; b=1r6ERxcU//y/QCCa1K3rlburvz
	LrPIHNu0NWZ/M8I9flxOvhJy8PUwCXQKo4zhxqWGfylHKUHiRBPW6SVczVoNIXv2b10Yna3p4AFjo
	u2UTMb+ZPLHKP0SZpavevU+EmgTNE19MLWfUJsf/DsVA4KwNX+e8f1DjoYrysw8T2/L50HYObj8Tw
	j97fyJzkSKt92oO2HTCpkX2YT9zPOQ0EjTwk/fUvakWCAXj6SkpgAamfsVjvjaGWSejjT05uiZAxt
	BvUEq9sre4crmmyvg5zHms8NCuZ+1tXCx3tCvkbpoxxnxhLQqmCUa/H3ELt26RQePuQG/pbNFvqx6
	XKZxzXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDi6-0000000A6q1-13rV;
	Wed, 25 Nov 2026 14:10:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDhz-0000000A6oG-2eFN;
	Wed, 25 Nov 2026 14:10:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED2DA416E1;
	Wed, 25 Nov 2026 14:10:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795615850;
	b=z06EhIYggADBFDHRgBqJESL1s92/XyezL2C3Fus5rb9M/M3vQGveM6/Zq/gcIip3NJiE
	 aXX4j05PxCAuGWPTFSFBkBgE8gVsTtUE0VUUIKOhXn2pjAUiBD853TjaCuHAJlk9DS6yV
	 rF6j72ZSYcJ8Hh1Y2LZUtV/N6cOrP/tiM3a2NRtn/tMUbN+NYj9YP+DmkthTU0ZUZYkpM
	 7CHA5rdkqYjUcAyUbTvZ681KaRCkE08DSpwKc/2PHHOwMczWOHyvecEBooaaWmPJwjnD7
	 2Db9qD+Jxom4tFUNrwL/0TLm2s4HOyvdovTMoAJ+0QjWcSNMfev/bEdq7SuDmknqTCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795615850;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	b=05r/q+jnCLvpBXfwTeaxvqGWbafQvWSg5R+Wivde6Sxm6rRPGtHP8o302TMdrmJ7jjSt
	 xHoue/b3NfJYpeETxDWTxYJ+Yeer/5LYdmgLyPYTUs6qC07api+n5lgeNLCgcZzhQBMSb
	 uhIfKx27pDWTIntSr7H1TUAmlrw1izLG9jcXoQ0noHjbUAmglbuZXPpoGcoD4pbiGk3x8
	 TufPEsvvg1R5mxhuFGKT5EuQH513JDbC3D1fC7GfA+UEL5JCBkPr6xa6lBbNKQw7zbw34
	 l1VVX0WN8dj6IdYWT5qvkgxYHbkPeJc8jwDjaIs198ofbdzR3x6TtkMGOACQ4+zylTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FFF11F000D2;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615850;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=e/HeVJrVbGYOa8GXSL2oElmRUvH2EGgbODlGAjkZPQHvaY/shUS/z8v61L9z3u4Kb
	 I+DrR9FiBB7AIqnbS1VWYRlswmPv1Vx4C69uhnW/AwMA9nUEtHpGYe1djLJe3TBNr5
	 NCMJF5avLWbiuzePJWtjFrvDChoSfUAoCkKPgl/C/X8Y2PhU2dC4VEvi6vrSVviUjd
	 WANRmIK8cwYfmYJFz8AkK8LDUSGvUwK11oDsoL2h2NeAhSKBfleM4w4xGDg61FhW+x
	 +AtsMIMlS56n0nfZ5KCDwP/9H6PbrM3cw/+T7H8jwMKZczegNN9TXXtEkAjIEx4wR4
	 h9d2/n0WgFY4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09A024CEF2;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Wed, 25 Nov 2026 14:11:17 +0000
Subject: [PATCH v3 2/3] phy: sun4i-usb: Assert PHY resets in
 sun4i_usb_phy_probe()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-usb-sunxi-reset-fix-v3-2-855c43694f78@roadbobek.com>
References: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
In-Reply-To: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Felipe Balbi <balbi@ti.com>, 
 Hans de Goede <hansg@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795615875; l=2483;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=LiuKo9Ttgw8d9A6ryR0X7JCOtqPXd1JaEy/qalojwDQ=;
 b=gdEBaetcH0wgmM9Sf/Iy0fQmkG9aFmKrFH8hzHGPJvYstHT9vdotV/WmZmDZXHsPQyO+VUjLs
 /aOifbZsNShA5xRtDXcjfQurRB898fS4x7u45ic1jEpBfylzmN36f7A
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



