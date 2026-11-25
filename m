Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41467606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KUdDAyDE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QH0myo3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HrCSAafO6dus44BBGnZLXcb5WHS+G7vh5ACplTtTnV8=; b=KUdDAyDEO9OwiSy+fTPXchi2i4
	oBKh3lv8mCSCWrUT9IOMpYS7KmRERDPu9LJcLtjEvc+MQ4I/4AMGqBQkUtWGTOq4cbMbYUxdl+N/b
	rrhb4IMTa85K8/9gG9z8Y3jk4SBGiIkY2DimYHUfoP9xMthQmfN8dvuVQXM9XJG8ECcXWlQ6NKE+D
	cQdE3wFd82L5Wjc3U4Pa8I1bhnge1I+8BgOSRdRlzoHFR2oBIWvHWcIjFFU1XyjUPdriC4jOfwIw9
	qEEW5rLy1pG4w1PoQZkx1wdNp6bYtQLIV7vgQRtLPuIPJorhHS8X/qUJF3Gsp37o4iiYPAy/FZQUa
	CqPLnXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDi9-0000000A6rh-3V2h;
	Wed, 25 Nov 2026 14:11:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDi0-0000000A6p0-1VLH;
	Wed, 25 Nov 2026 14:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 20B4442277;
	Wed, 25 Nov 2026 14:10:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795615851;
	b=yHeFakI4lNrUJRN8REC3u7PJy26KtHvSBgVFYCj+iTeSJi226sZgXJNUDi8+A0RAScOK
	 cBI216Ot8WjXfA1st/bMT1vLL/v/KCTMuxVKrmnpUiaMv0UPc15Q2iZer3d3pyQ1oHSMp
	 N/B4OwW3PSTqZosggOJDulkKxCOY01kMyo9KwXY7bhyBv6QVzZKqriyjKNCG50AK9W025
	 H6+2BqeUv9WenCFXCq8NOKeG3VRbWbZcefW/IDHJ8JAYUainLMCcHORPt6kpfl8CVeSJn
	 QN++PGqahd+tiBCAT7Jk70/Kc0LmdVTzxHloSRiz1PVuDRt8OIbWTaO8kRTPhFsPXOQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795615851;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HrCSAafO6dus44BBGnZLXcb5WHS+G7vh5ACplTtTnV8=;
	b=eB2Pn3DPDzrdwL7w021rgpaKgT95BrF0W02JphUhmsl7PTYAPpYRD7mWgFAXMQCN+GpZ
	 h0h/odynrs0G6SFMnp8zbnmKYq8VySs6H+zFc2kJPSm5kFGPAaaI3HXZvT3FsRvdKskPm
	 0pZt9PT5+Ze8jZYEJCrno5wavtPo6vVtrQ2J+BBZsw2+HYfOAFI0YVHe8lbyeQn+SLwiL
	 h6aO+cNw0EMKLyADsM/G1RrNDFglYyytwrQ5upBUYpQIJvI5askyWGhrZzMOKWGfVNtW9
	 hQS6ENW6L4zLcj6o1CSpK1p2CMpVz+2N31cGOzCstd22X+LlGfcvHJd0oivV3PYsSKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 662D11F000C0;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615851;
	bh=HrCSAafO6dus44BBGnZLXcb5WHS+G7vh5ACplTtTnV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QH0myo3bZSSQj1cXqvUZ8J8ylhPDMIVKCUJtetKvjAWVqbvuPywxv473vLZ8XSqvX
	 kz7+ZxG2aA2yaqhuiNqpQz8ZpBiLRkS+Doi/7lgx9WNSpT32os8dbE4bn6KdJ92TSM
	 oafdnE0SHgMS3Ze0vrIEsFxu6b/Bit/biQwDFpOIVaHxnWOJcaYGQbP6bNCnY3UPv3
	 /AU5H/0UGlRHI3dhmNS7Q7cZ9MWZ2rN4j4vluRMxEkhJ4yUDEbiBMuazpl8wslBtNh
	 JwyEqU6NI5iIp+jpAaflP6B8oUH+T468pptJI2s8RLDX2Ds1Tp2+SQxDIQtZeh1PbN
	 I1BwyBVdZNwkA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DEB554CEE5;
	Wed, 25 Nov 2026 14:10:38 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Wed, 25 Nov 2026 14:11:16 +0000
Subject: [PATCH v3 1/3] usb: musb: sunxi: Assert reset before deasserting
 on init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-usb-sunxi-reset-fix-v3-1-855c43694f78@roadbobek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795615875; l=2056;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=BfwiIA8DPFLjrKHd+uc0+ny4D9EEZZGuYRY4n5xJgys=;
 b=23OZSHKC/W9VS4tNc4oVQXriibYqOwlrtmBlzKCQHLQ/x2sQ6/ARLPId4WgXLFn4PWU0NiqXa
 5AUkEvvqT2QCSgpIPYT27psuM5pCH2Y2sIDDMELQopLyf0TSXjDJ+8T
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

When a bootloader such as U-Boot (for example with
CONFIG_USB_MUSB_HOST=y) initializes MUSB and boots Linux without
stopping USB first, the controller reset line is already deasserted at
probe time.

In that case reset_control_deassert() in sunxi_musb_init() is a no-op
and stale MUSB register state persists across boot. On Allwinner A33,
MUSB stays wedged in a_wait_bcon with DevCtl=0x99, Power=0xf0, and a
frozen Frame counter even across hot-unplug and replug.

Request exclusive reset control via devm_reset_control_get_exclusive()
and assert glue->rst briefly before deasserting it when
SUNXI_MUSB_FL_HAS_RESET is set so MUSB starts cleanly.

Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Fixes: 132e23775779 ("usb: musb: sunxi: Add support for musb controller in A31 SoC")
Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
 drivers/usb/musb/sunxi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a17b1c150626..8201b3ac1748 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/extcon.h>
 #include <linux/io.h>
@@ -239,6 +240,10 @@ static int sunxi_musb_init(struct musb *musb)
 		goto error_sram_release;
 
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
+		ret = reset_control_assert(glue->rst);
+		if (ret)
+			goto error_clk_disable;
+		usleep_range(10, 20);
 		ret = reset_control_deassert(glue->rst);
 		if (ret)
 			goto error_clk_disable;
@@ -745,7 +750,7 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	}
 
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
-		glue->rst = devm_reset_control_get(&pdev->dev, NULL);
+		glue->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(glue->rst))
 			return dev_err_probe(&pdev->dev, PTR_ERR(glue->rst),
 					     "Error getting reset\n");

-- 
2.53.0



