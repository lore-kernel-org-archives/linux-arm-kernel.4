Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A45606A697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FM2NJ43B;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNcCgFPz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=; b=FM2NJ43Bvm34wMgo4w+zCp0YFM
	EA0U9BqsE23oLzzSnUtfd8/bLZf1bjhXm7LWxQd3NOmoKnTZt41+sqcq8rqDhzmbL7Z3x5nEcez11
	jFXQcuG0RLrGzU33b0JEzhS51qHo+Ek8eRaf0Ok9piCkGjjtT3s2L5Y/qF1dkW2UXXEiXoLOF1Ns0
	Y3fAoGM6IEuSuRaNIMSLl4Okapt1eSoiyJT138zMFIcnfP2+t/r03SXODVLVeVrbMAbSnBTUvQmVK
	mUe11r9aHAF3uRsoKdQjCX1mqOYNThrrhHh8dHECrc3fGwrR/H52+J47xewni7R1e/6fvNHbgcIjD
	GBly4Ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDhw-0000000A6nZ-0W5r;
	Wed, 25 Nov 2026 14:10:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDhu-0000000A6nQ-2K9a;
	Wed, 25 Nov 2026 14:10:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17B8440F20;
	Wed, 25 Nov 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795615845;
	b=ovabdTNEScIkk9nO0e7c9WT0G7tF885IaInM1eOk2XIHQBxBxUNM6cyiqR8FAXXxFWAa
	 JQzRInL3XlwRXPY+BnjQEib4OdShtm4h5blnwhkhRE7NDwZnP/ggKCiuW/LhNtT49Nxqb
	 bQMYu3lHqUlYX3CRWrHAE95ZAnmkc6O/95m1XQr76agwOZEsXM42/Mb+bi7/XHnM+XLLh
	 ySyWyvLv/5Qd2FUoE3gPVt9GCLwFF97JbSTYNqhV4N1AYCia/DtDqMz2CCH1Gf0mEaD9c
	 /KtUu9sutxssngn8dp5z+y5YMhoUaZ8cm6HhoJznObpAsyCOIkbExQQ4qHQnwcdRpJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795615845;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	b=ibuYuNDKI8QYBtRvSlIyGhT3Gg+E8/c9QadaaPoVfx0w5XuX4f5QnWjQdnR8e8Z/LsSN
	 Pk0lYfCIh91tyY8INSCaA8XmMdb+z0b/F7tPqCPFa0wy7UW635cunxLawPrSUGELHGfnY
	 NeTpH2+1sgwehVjF3vZeUdzAQa1n1jrW1hJlhNaVpiXZ5lg5jc+9406tkX+fl04lRaMBI
	 8iUrEp+mOwaz8ygAGOm+WsLwVIC1AeRXP9f0OUluM/6KrjHn4Yw89meyvFE+qHVmtSN2W
	 r+/2wJRfaAEPMmbaQSoAM078+ANOrQNft+wPpt8pQhIQkC9avvXM1ZRYk57AoixKmhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB1F1F000D3;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615845;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HNcCgFPzY/Nx1ao5oUePXnanKkk1CrtqbNpHoJEUNJyNXDZYvPpvdP97XOOj3O178
	 2HUK/4G927S4M7XM+kW8Zms/fwt8MU5qThU6LJB6i+5F22g8RcSgdHzRcbAsuoDZXg
	 V7mq6GEiNN3pWet1EyBIMErV4vp4CGqpLa7IJAHfUBBR9lDePccnsYjKieQfpGz5GG
	 KmPkBwsCfSKQI/6SxpLKTFYsKRf+iaiPjcCG8IATZytO2CiU9wZCEvevX1ccHd4yls
	 PA+vH8CPTUdLv4Lnfzll/4Y+A2u0Y969oV0NsTfb/wCd7ccLpWq32hOhswMZd0Gz67
	 GV76MtHmElYEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 273A64CEF6;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Wed, 25 Nov 2026 14:11:18 +0000
Subject: [PATCH v3 3/3] phy: sun4i-usb: Fix phy2->clk2 reference imbalance
 in sun4i_usb_phy_init()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-usb-sunxi-reset-fix-v3-3-855c43694f78@roadbobek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795615875; l=1149;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=2/RvSPv9KdaGKCqwuU1CPvhUhe3Y2XomCyvU8DfERlY=;
 b=ocSYCrrc2L52i1L2hwM5KG3OM5fNqH5g0u+XCJpMlDYYjs1MWgFkLcSL+tZk2dIREQyt3b38K
 R0KCT0jsMv6D9UODCAba35OcD7RBvf2T3rSRlUr1Iyo9SyN+TmIbMh9
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

In sun4i_usb_phy_init(), the needs_phy2_siddq path enables phy2->clk2
to access the REG_HCI_PHY_CTL PMU register for PHY2, but then disables
phy->clk2 instead of phy2->clk2.

This leaks a prepare/enable reference on phy2->clk2 while prematurely
disabling phy->clk2, causing a clock disable/unprepare underflow when
sun4i_usb_phy_exit() later runs.

Disable and unprepare phy2->clk2 instead of phy->clk2.

Fixes: b45c6d80325b ("phy: sun4i-usb: Introduce port2 SIDDQ quirk")
Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index a62558124d2d..6e35eb77c879 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
 		}
 
-		clk_disable_unprepare(phy->clk2);
+		clk_disable_unprepare(phy2->clk2);
 	}
 
 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {

-- 
2.53.0



