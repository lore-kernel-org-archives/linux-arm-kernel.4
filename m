Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77C606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NFctW1++;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7Gm4b6M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t/PywoMm6l1Gfhj2HKLXgo1apHGTq2Bh+BPaoER8O/o=; b=NFctW1++Uw69MaeFve0QiX7kGS
	UfnExiUFK9ZgoMqyE1WoXF6grO3vKSre++X5legvAeCwcJ/LyMdiXyW7vTouE3aeSgRIPkqlAccgI
	Jf6bqtRN7AyGI13wU76Kljz5bPCTDS/+FO5ExA6VHPyzOfzwxfaKQQMaZY8fhhBwS36Xp8Xq/qMFm
	7gyAzCXpDV27SpDDLu3NglbpDMm48M9DJCcnAOiKDgfXBPmRahjijP1jj8moDe+oBjtAx1fRc+9qn
	ARiuFU2j+Nc93IKHAPNovS4GNAIU3aKWYUCNQlq+IgMGFf8JHQYuw8uNbeh5sZERxAg/oc0rlP4nW
	HU36uzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQMv-00000009C7y-1KEO;
	Thu, 12 Nov 2026 08:41:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQHk-000000099lH-3URt;
	Thu, 12 Nov 2026 08:35:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FDA240195;
	Thu, 12 Nov 2026 08:35:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472556;
	b=to9ZEQpDr5uprJ/Cu6WH/VQBnGi5MJ8t53/MD2SOkJvpgx7GkzMriOoQDLDYEmfkpqCb
	 zeBjV/X1GLkd2EtYmSLhMovq9wre3yoX+zBVcxw814qY5/2a/HZr+1BYB8WxvUoiGhMhz
	 7bUv6Vo2ScDlIcRgJcrBogjsNNrbjkBjMXLn3+04oU5HJPpadv1b6K+Lklh/iyCqTdfU+
	 cRV/BCotq8yHqB8IaEJGQJIZcPMQR7g+4rdJGgFkwpNTPXNTdJGJsxbEAFt/goGmJjUR5
	 1it0laOBiRJBaOUYvkhyE4btRYYzSTIdLqyiDPfu9ytjdsSYwRdTzW07YSxIQ+bb4AA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472556;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t/PywoMm6l1Gfhj2HKLXgo1apHGTq2Bh+BPaoER8O/o=;
	b=EPlHUtBtznnpNKEwLNKiuvQniEYa4aXTb1+tae/Fr8C2iXSNaJcgRA+2Gv9PWnhFuHJV
	 8GVdQPszuCLHRB0RE0PfvJLfTy2hDsebDbyhaIsUA1qHJ8srXBg1qNjD3IhdpPplE64ct
	 QwjR4hop6twONuDgi7JG00lmSSZj/JC8Ri38C9CWj8cLKB9C+RP9V7ASqMG/30Hi6nAoN
	 V+ostrmWuq/l/jgJXPfW9W7RrJ0nZSQdVIlipDA4I0jGw1Kw+zFM15Dinang5mAtERmab
	 OJiZqyvmvI4X+EB3JLB6q3izJuIt1sijPZ4v1ZNZIiPmCz01uYfpuwWd4qov0YpTKQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C89221F00A07;
	Thu, 12 Nov 2026 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472556;
	bh=t/PywoMm6l1Gfhj2HKLXgo1apHGTq2Bh+BPaoER8O/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y7Gm4b6MqR4fcFGaKW6n+R0y+gdxKrY9KDfvUHGWB4JS5QLvBNchTPtCcghNjhjMm
	 cE6LdsXhFu8zUgbknv8ZI/p9mfMDdaYHAsR3wjfSxno1vQRGaCqoKlwScUzQMzhRa7
	 o24hxVU/1uefYbaWiHCB+4i5uJJMgTpwS+B0wav/CDW2Q2zLmFPEizciaDdzosdYc5
	 iyx6f4dYjeiA775ndE5q6SSORYg/k47APj6aggvVkKrRHUauLhT7TmrmfllpenwG1N
	 KnUl9OHyithIclDI0njtQ0WXj8dEq1bzuYwUtJjdkt04tCaWleORARYVdDXONxU8h1
	 XfQpLYn+CEuvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 53423493BA;
	Thu, 12 Nov 2026 08:35:55 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:35:56 +0000
Subject: [PATCH RFC 2/2] usb: dwc3: rockchip: Keep the host bus across
 suspend-to-idle on RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-dwc3-s2idle-optin-v1-2-842e3f8413d0@gmail.com>
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Joonhoe Kim <26rote@gmail.com>, Vladyslav Tymoshchuk <tvlad744@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472554; l=1952;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=4m0AQqWpGKPZoBJEUVc5orPxlJLCumo8flIRD0Jhzsg=;
 b=1Rei5oJ+08YlofUig3fWgdtvOgiGxs4NW+SWHbbWBF2YWA5RUY2o/c/uuwbP54D2cn4Agdcu9
 3QSGOtXzFlTAWSd5UjP6SG8QkQzPfFOfk5MYpaFOdFQP6HgWvwdCMYE
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

On RK3588 nothing powers the USB3 controllers down in suspend-to-idle:
this glue has no system sleep work of its own, the controllers are
either in PD_USB, which has GENPD_FLAG_ACTIVE_WAKEUP and so stays on for
a device on the awake path, or (USB3OTG2) in no power domain at all.
Tearing the core down there only ends the power sessions of the
suspended devices: on an Orange Pi 5 a SanDisk Extreme drive and a card
reader behind a USB3 hub are disconnected and enumerated again after
every resume, which kills a filesystem mounted on them.

Set keep_host_bus_in_s2idle for RK3588, so the core keeps the suspended
bus in suspend-to-idle. RK3576 is left as it is: its second controller
is in PD_PHP, which is switched off in suspend-to-idle.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 65d17536af14..c96b2ac1a62d 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -4,6 +4,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/rockchip-usbdp.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include "glue.h"
 #include "io.h"
 
@@ -153,6 +154,15 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
 	probe_data.res = res;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
 
+	/*
+	 * On RK3588 nothing powers the controllers down in suspend-to-idle:
+	 * this glue does not touch them, and they are either in PD_USB, which
+	 * stays on for a device on the awake path, or in no power domain.
+	 * (On RK3576 the second controller is in PD_PHP, which does not.)
+	 */
+	if (device_is_compatible(&pdev->dev, "rockchip,rk3588-dwc3"))
+		probe_data.properties.keep_host_bus_in_s2idle = true;
+
 	return dwc3_core_probe(&probe_data);
 }
 

-- 
2.55.0



