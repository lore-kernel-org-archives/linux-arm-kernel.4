Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7946606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fN4jTTCg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgkixKOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K/YZFKZXcpaNnpqNllDmkoheY5uZsTxU1ZYFN9+w0A4=; b=fN4jTTCgnxT6qgHTYWi1KQM1+U
	PO3Dl881cGiYHM25S7Z2hYBkOhZEWCopfKI1gycDM6J0Q2NMH7GDgmK6+qJXM/yaOFQe8Dj6DvigV
	b5kBTsU/o4xwndaBHURn3DYKYoojEMcjEm42P2xFiDEz92Mx8vgxNoYyuiefV/cRTygF7JjTcJhca
	eboZS1I5L8/AaUTNYjPbINheJWagyxHZzbCQuh/v9rBf7WxwjxbXmYRhp3cHlI2iDYI3VJr9EOU72
	M33PkVXfjkuY/QtKWZRboRL3RbmKC9ve5Xneft61rNeGAHaZ/YGRg+UTvUItLsczGc8EAruLef4dy
	cHWsdcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInT-00000005nNh-0wgf;
	Tue, 17 Nov 2026 13:00:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInJ-00000005nH1-0m3M;
	Tue, 17 Nov 2026 13:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD7F341268;
	Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794920416;
	b=DcvRBZ7DXgK5+XtlhnulbuT3UxaSQEfJPbV2cuwzH1D0ziuW0CIHmTa/rR/A46Wf7HFP
	 Oeeal3Ulxp7isG9smhKm8uGdfOqZo8Daz07RD9hkCiU+kCLjS+SFja4asLn7kBjsTyaJx
	 9koo2VGkD8N0/QXz+3lVh6kiYaiwvbmSmjDZGf7GuPiUGkUWxZ0NNUR2Nrf80JMObSXAc
	 95UBY35QbZHozPSfQ0rHOW2lkfd5p4kr7uK2UOxf01+DOQ6N6DSihQrwxrqnBVq3V00aV
	 4BZICSrj/8l8OVjEFaXixDmdiwmrwFEkPWirJOBU+UtaFmW3sfUiCoG7DqADHcm9dTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794920416;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K/YZFKZXcpaNnpqNllDmkoheY5uZsTxU1ZYFN9+w0A4=;
	b=QvkvH7dqcFX4dOoz8j34W+WkXkYZ8sCVpdnYeuqBYJYqEOo7dNlbaZegCA8e9rIXaGIL
	 5uE2+59MjUkSDf02Wtk/X7RPM42u3/CFZVSvJ+EXp/jJeyjzP7XrXjtdTEpVSej6Tef78
	 dI0ZQbtM4b5JJ6YAdBmFB9cFGtzBJyjWZyL/T3HYzRR44pUVH6lmnqb0cupM8H+ki2DXg
	 DTg5N87rG1d/Kr0/DmQJSa7iB6zW/bdAkvBy5QpDuQrlOm946Kmz3skKaibHChJLMrcxv
	 BGGcaA6b8qNtDBYZkjyqrk3ehPDyGcH3D7RJPEi3yNWtOJy4s9CFCUpEyMpEXVvEJHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0324C1F000C5;
	Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920416;
	bh=K/YZFKZXcpaNnpqNllDmkoheY5uZsTxU1ZYFN9+w0A4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EgkixKOlx1TgvABDjypyAlbT/1XAI3QGQ1De02ltfxoFvF1TaeJ1dE/smM8y50seE
	 oqRgitU+CRLsiW3modmp1Jpku8UcIVwOnvkNI5GZHevVsOTSEj3ML+0DGUuP2N28hZ
	 Qg6CxDvKyDgeT+0qaFKkrg+aQZw9sI48jGNHhPOpE/MAC2BS6xjwyMZFH/KSScpCJs
	 26n0RPwevo4kQuiU3wlI3RNXjjaO3QXfHo1wqllTQhLdHbqvdoJIrNJjp7PdtBy7xP
	 0NBCu3yy+lLAkEFMW0J+Y6PU8bJk2BZf6rXbDgnj9ME+Td+2LiBjRnttwWtVputGeB
	 Mvn2eAhuQncIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EA224A955;
	Tue, 17 Nov 2026 13:00:15 +0000 (UTC)
From: Roadbobek via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Tue, 17 Nov 2026 13:00:42 +0000
Subject: [PATCH 1/2] usb: musb: sunxi: Assert reset before deasserting on
 init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Roadbobek <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920443; l=1415;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=Bzs+Bok/1pte1PfClsczqYfF32Y1BbstMmHy95Q44ZE=;
 b=GOV2+10kg10zXZLyEVlNPyFWyN0C0AkEP8WNKSt6LllGHLiceFrMahB5XGAYKIGjzf9fDi7Hb
 wKyzVEx/4L3ADlOwuALD5iDSg9VA/RdFlZP7/1m9wFIqj+LdxSDSac6
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Roadbobek <admin@roadbobek.com>
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

From: Roadbobek <admin@roadbobek.com>

When a bootloader such as U-Boot (for example with
CONFIG_USB_MUSB_HOST=y) initializes MUSB and boots Linux
without stopping USB first, the controller reset line is
already deasserted at probe time.

In that case reset_control_deassert() in sunxi_musb_init()
is a no-op and stale MUSB register state persists across boot.
On Allwinner A33, MUSB stays wedged in a_wait_bcon with
DevCtl=0x99, Power=0xf0, and a frozen Frame counter even
across hot-unplug and replug.

Assert glue->rst briefly before deasserting it when
SUNXI_MUSB_FL_HAS_RESET is set so MUSB starts cleanly.
Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Signed-off-by: Roadbobek <admin@roadbobek.com>
---
 drivers/usb/musb/sunxi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a17b1c150626..3d16049e53b5 100644
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

-- 
2.53.0



