Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB0A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nEkNUCM2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0LNfi1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V9g41AZBQFHbOuAM+06YZ0QtqPzmAZRcOA80iSLCawU=; b=nEkNUCM2g3lPB07NqZBlGTVF8V
	1GHVCUWe1pxqzfD//63cr0hAkSqZyhVqppVm95Ck3wln/oQhFqKIvtmRbBIvUUjsOTXZH0POg7DRh
	5U7sZEHl62vxyfb6G1ZQWQOjnc0+NMD16EcYJoRBSnmGCfjsvQLJaTaI3L3wJ1a+ZxiDA1/3UzVHm
	ui0mZFZ9FEUS4wZDZs7Ug7ri1gqxx5FH7ApWrklBgN8HMJ2cMXRWZVsdi1kREM9yNl1Qq28+jgxfM
	5ptQ20zLEjyoj5MFnolCkUiWNBypYW6qIAfRXCJCKEMwm5T+2gAoLwJ4UC9mTWoYlV9lCJ2L5g2wq
	l3x24HOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNxR-00000002P57-2qrV;
	Mon, 23 Nov 2026 06:55:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNxQ-00000002P4x-2np4;
	Mon, 23 Nov 2026 06:55:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D32FD60051;
	Mon, 23 Nov 2026 06:55:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795416919;
	b=A3IDQad2YTcwfy7VnrxxtEwt0XCzQdisAeu7p2jgwr7QbMWO4gX3EP1Dd93sXL6s4wAY
	 1XvHw5JIJ7PEzLMcw6n6hp8CMWXu/vR04THTJPB4kSJLWhZWM6nkGbqzRXkcttQ4sBX/4
	 XKqQq3p8SjUusilgEFheU3LNRp6x2SFwCCl8vqQf4EEUtoOXw3VXUpcQ50IO0zz+bK9Pv
	 h9BM9gL9hjFveqs6c3/llsy5hwapHB62iGYRMUh5yOSHT6eLy+12hqJxm7TSIL5aZynaf
	 aUIqbckyT3bVdknKJMDHtDQDBDhep6Me9T/fPDula+ru4/ikExzY7UBkBX7im8bF7xA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795416919;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V9g41AZBQFHbOuAM+06YZ0QtqPzmAZRcOA80iSLCawU=;
	b=icd8tf6NOC3eciAbQZz9ioxfDTC/ArMjJnb2y1/l4EktwVunNCIYee9N45F7GmCRR3eo
	 2doTODcqzsoJVn/znSnzU1TU5PghvjMgUe4MRmbnkIzcSXygeRJAKm4ujvQl4zSKXDQ+F
	 vYsST0uODSWdaEb6FdnZJwQOUykirYQKL/4U1hVvVGSaMcuMEx51AH4kX3fN5dlBzkxbz
	 jIqW+CyKZKmjgYk0V1kXpk9xMNY5F5GfhddFhIKAPhth62K2zPYSBSu5PXDZ+VstN5Is7
	 ImqCskco5cRJanNCAVpMVKSeebxrImzaOWVdIrAHfnOPZelzmCi51mMhggm2uVpHysw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DBFA1F000C6;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416919;
	bh=V9g41AZBQFHbOuAM+06YZ0QtqPzmAZRcOA80iSLCawU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j0LNfi1+FOuOEq76N21MIcQCYbVfqcQZfKZT9tp9qD6KeLSN6koXzYTNPAY6+MihY
	 MzvIeiCue2LfawPLQJi8fvm+U+J+H/mBwlJXgShP7JHL1cNBmhh0EFGXarZzCWfsqx
	 eUXqWDqFvaIZcrYEwsefcd9jXhDSxK8hlYhoKkR60uabyu9nLk0OjIwmAcJsH+xJwq
	 IC07BLtWVcplD4Imv7EVRC/hX53g9Qm9VO4xtBzqFYc1/We2T4sznGEt0GhDjFrSFh
	 Kw2I6tzgZkY6OJrY0O0P+hMXoHomiP1agaPUuQC23HMBXh4Ih8Tf33SdC4FyHAm+cj
	 M/9L3wt0hI7NQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 016AD4C39F;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Mon, 23 Nov 2026 06:54:07 +0000
Subject: [PATCH v2 1/3] usb: musb: sunxi: Assert reset before deasserting
 on init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-usb-sunxi-reset-fix-v2-1-4e51d3a64964@roadbobek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795416949; l=2005;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=4U8ofcJ5CaE3LjdH1VHfvFhhqtxQkjH9SyoARmkLRfM=;
 b=fsb4YhStcZrL24l9lIdisnCkVahY3Uch2BAXtPeUtkG0+AyVTcJv286JSJ3tnvBbfEerDKshU
 U8beRALeh26CoXmaqZtmU2Yv1jNwVek4mRLcGTpA7vS38jcbYYHzssS
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
 drivers/usb/musb/sunxi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a17b1c150626..5f63d519237b 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/extcon.h>
 #include <linux/io.h>
@@ -239,6 +240,8 @@ static int sunxi_musb_init(struct musb *musb)
 		goto error_sram_release;
 
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
+		reset_control_assert(glue->rst);
+		usleep_range(10, 20);
 		ret = reset_control_deassert(glue->rst);
 		if (ret)
 			goto error_clk_disable;
@@ -745,7 +748,7 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	}
 
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
-		glue->rst = devm_reset_control_get(&pdev->dev, NULL);
+		glue->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(glue->rst))
 			return dev_err_probe(&pdev->dev, PTR_ERR(glue->rst),
 					     "Error getting reset\n");

-- 
2.53.0



