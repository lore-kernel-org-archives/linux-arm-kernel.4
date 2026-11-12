Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85C606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2TyLj1vX;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=IYXjIa3O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YGGoHU9dAOYShEGvkU6XZ0apYU57vGD6UOS9pNC23i0=; b=2TyLj1vX2ZEadM
	wDAZT58/hafh/n5HQJm5BhGaFy5FBfrz6JA4ThkvIskIU3cQ9Cfmt/6RSweSr3NLZaw1IeUUu9ZNw
	wdGGHSxLsFzZIxhQmc4bgyrIr5816QE2WPjvc/AKDXiijXAbIiliRyDBg+3pjNoNWzlmDOd2BZKoH
	kWvI/S9tA+3U+nS9KH+NqGCrVbE0HWSz2TtMNyZi7IX1+GbkIspfRPH56dprw+xjgjSVfisqeFY+j
	abYOIeD/tTIu5oJfhrjs4eYco5VmMIIdAeNkYwpIpbY9weolMuol6QD4ccZjW+cvAdC08Mjj9Ou6O
	WoyOiqYxXVfHEZKv9TGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpI-00000009e6e-1xM5;
	Thu, 12 Nov 2026 11:18:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSpE-00000009e3H-2JvO;
	Thu, 12 Nov 2026 11:18:41 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE72033D;
	Thu, 12 Nov 2026 12:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482175;
	bh=OsOQIJiVax+Tbfla0Bdcfl3qYG8+xVaw1F8Q9ccnoLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IYXjIa3Oi+ji3VSlmuRALBBsvJXeGMidFeO2e2QG/YuzGotRoogtbxnG7fsMm8rM/
	 JSFaRisrBgLhe/Zrq9d1E33zeJuFbSx31bYgcsd+VCUk4ij0K4oqc/bjEGDbD8P3Pk
	 /yr7yFtqQpRlJUG/Xo7ONira9amC5zKKRxHeLt3M=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:00 +0530
Subject: [PATCH v5 02/11] platform/raspberrypi: vchiq: Store audio device
 in driver management struct
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-2-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=OsOQIJiVax+Tbfla0Bdcfl3qYG8+xVaw1F8Q9ccnoLo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB1PgDWWJJQr5w0diuN4G+eVvYuNkQXYxZ+5
 lcllLXzJyqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgdQAKCRBD3pH5JJpx
 RZ7dD/9otiVv+jaxm6xZFK5V3TQ9979pvEkpYFOoD+40G3amFhrpPrSUFXX0gloXGms0MIABdpL
 /3tdXrMk/nqRjvFypAe/xpGm8n9ymx4GYKfKkoQYYvQXRhRLM1WgRQj96wWcLiaL/wUVxxKn4E4
 r4nrg6nzPaZTbEkSrIyRK3iR90haMOdCeN17cFDkufn7G7Uw2kqh+zW1yLsUuM3FeoYuPon0Dbq
 gow1QRBubqx+eekJR1TFDLgZQg8M74gYhFllAxcsu+nuEj+S3DjFDcphlRFclYHLbYG0WKo+GCR
 y6oCEX2xQLDNuAGZJvHIHV7qWuPjl0Cx7TqJaHu7YdOE902a5TPeIMS6487Rm23OxPrCAZ7bZ0f
 jREaalcT/RlVIS10har2BcI25Jxb5udIlFDcKfXrOABb+QA0XWTBNI9QILqbrJTj+m/J8zWKBbT
 duoHpwO7xkhwcL9aYIQEZLV0WvZ882qj6RObTetpAFBhsFsTpe+RWNax4agWvJ3osUeg8hpNVBW
 Q3gG7rCpwnoW+FURckL5kiPT6TY2cfuh/YANfjyb88+SHS1K+AjALVJsLH7iW+XsR1ZZz3nPRtT
 FbhhBzFnm5YgrhD/mM66LrG5QLN1dOHAM959MWGZGYLAwSBDx704hHACp5NSL5YZ5lvNzqaI95Q
 1B6ZSkfEcLU5zvQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_031840_757689_CE64CD8B 
X-CRM114-Status: GOOD (  16.19  )
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

The VCHIQ firmware devices are not discoverable, so they must be tracked
manually by the driver. Previously, the bcm2835 audio device was stored
in a static global pointer.

Move the audio device pointer into struct vchiq_drv_mgmt instead, so it
is properly associated with the driver instance and lifecycle. This
avoids global state and makes device registration and removal follow the
platform device more cleanly.

No functional change intended.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 11 ++---------
 include/linux/raspberrypi/vchiq_arm.h                    |  8 ++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d5a25033a261 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -57,13 +57,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-/*
- * The devices implemented in the VCHIQ firmware are not discoverable,
- * so we need to maintain a list of them in order to register them with
- * the interface.
- */
-static struct vchiq_device *bcm2835_audio;
-
 static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
 };
@@ -1420,7 +1413,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init(&mgmt->state);
 
-	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 
 	return 0;
 }
@@ -1429,7 +1422,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
-	vchiq_device_unregister(bcm2835_audio);
+	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index e32b02f99024..541b4efd64d9 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/atomic.h>
+#include "vchiq_bus.h"
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
@@ -54,6 +55,13 @@ struct vchiq_drv_mgmt {
 	void __iomem *regs;
 
 	struct vchiq_state state;
+
+	/*
+	 * The devices implemented in the VCHIQ firmware are not discoverable,
+	 * so we need to maintain a list of them in order to register them with
+	 * the interface.
+	 */
+	struct vchiq_device *audio_dev;
 };
 
 struct user_service {

-- 
2.56.0


