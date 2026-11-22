Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51349606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F3nw2NSB;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OTAiH7yl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MaLZ/5e/yperaGiOGWV6z+zK2FhbvcWBhbuuohCNTlQ=; b=F3nw2NSB3szOXbD80H3SvKZeNT
	poAytvHinYRIl4syo4C4eQOMEypkgU6R7sSajBfPh0hSfQp8UzvmYzbhDXcDgO1t0U4uao8L5wbeY
	HCqpEolaAikAYCenIbz0dh+17w0xNZsPBhdgpYW04VgRibkHel+iHtbWfurR9hgF8GFMLOvMJavuQ
	j5oTvHuWAtBi4eJVxgV1do6F71ze9OXC5hVRybZdgxI+RRaffJYB4uj4MRkckEwcbVzyIbFrYRP1V
	Ib7ZIOPB4SqIoZNWa+KqujEjoNipR4srvsaRzJUmVorhz5lrfL009I19M7XwNm0D1tzY5XRN0iwfJ
	fB8XdC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7lZ-000000019CT-2nOX;
	Sun, 22 Nov 2026 13:38:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7lW-000000019BQ-2jfG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 13:38:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CC914E416E1;
	Sun, 22 Nov 2026 13:37:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86E560512;
	Sun, 22 Nov 2026 13:37:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 834F5102F0DBA;
	Sun, 22 Nov 2026 14:37:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795354673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MaLZ/5e/yperaGiOGWV6z+zK2FhbvcWBhbuuohCNTlQ=;
	b=OTAiH7ylWvXXaSMCBYUk3oXEHf74GJpwwQtyHazm4tDKGVHo10dbTK5TvQus76lRYafMRS
	a2CW0F4Hk+WGDNNPjzGCf4l6fPWDDAEtFP0xHap3JrwoAFKXO2qXBPkqzKZbvOE1IrbilP
	uAbIgAKtSG7MO3IuzvMNePc/WdPBsPVbWnQQ1ikX5WwApjEVd1mdHdlr6cjPfJVhhcUIJX
	xhTbJaP/kmapXYZaS54LbyZXn4/ZuMl1GuNn6puJc8q4WpY8w8taX7DCkMrurdqWbRKxO3
	wtkxjnaw2udj1NFl1H5YUfKfBjDZjaVu2P6HKrBkvJx7xXnUjTOvqiZjjzTLmg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Sun, 22 Nov 2026 14:37:40 +0100
Subject: [PATCH] pmdomain: rockchip: fix warning when deferring probe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261122-rockchip-pm-defer-v1-1-5b41635e3410@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0auEWXfAScCFV5EuTDLRUaph0kpBv
 HtTXb7F/wcUVuECnTlAeZci21pBDwNhGtaRUWI12Ma2RNaibmEJk2TML4ycWHGI3jlHLhE1ULu
 snOR7Pfvn7fLxM4f3fwTn+QP6EtXCdQAAAA==
X-Change-ID: 20261122-rockchip-pm-defer-adb33313f110
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_053758_829570_26486809 
X-CRM114-Status: GOOD (  11.91  )
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

When the PMU probe fails because a clock can't be acquired, the
pm-domains driver raises a warning in kernel logs:

  [...] power-domain: failed to get clk at index 0: -517
  ------------[ cut here ]------------
  WARNING: drivers/clk/clk.c:4831 at __clk_put+0xf8/0x130, CPU#0: swapper/0/1
  Modules linked in:
  CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.5-00004-g552d0d1e09f2 #103 PREEMPT
  Hardware name: FriendlyElec NanoPi Zero2 (DT)
  pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : __clk_put+0xf8/0x130
  lr : clk_put+0x10/0x20
  sp : ffff80008192b750
  x29: ffff80008192b750 x28: ffff80008147aee0 x27: ffff8000813400bc
  x26: 0000000000000000 x25: ffff800080e5d5c0 x24: ffff00000074f280
  x23: ffff00007fbe6bc8 x22: 0000000000000000 x21: 0000000000000000
  x20: ffff0000004f78b0 x19: fffffffffffffdfb x18: 0000000000000006
  x17: 70203a72656c6c6f x16: 72746e6f632d7265 x15: 0720075207450746
  x14: 07450744075f0745 x13: 0720075207450746 x12: ffff8000816ee830
  x11: 0000000000000058 x10: 0000000000000018 x9 : ffff8000816ee830
  x8 : 000000000000005d x7 : 3ffffffffffff000 x6 : ffff800081746830
  x5 : 0000000000017fe8 x4 : 0000000000000000 x3 : ffff0000004f78b0
  x2 : 0000000000000010 x1 : ffff0000004f78c0 x0 : fffffffffffffdfb
  Call trace:
   __clk_put+0xf8/0x130 (P)
   clk_put+0x10/0x20
   clk_bulk_put+0x3c/0x60
   rockchip_pm_add_one_domain+0x298/0x4a0
   rockchip_pm_domain_probe+0xd4/0x310
   platform_probe+0x5c/0xb0
   really_probe+0xc0/0x3e0
   __driver_probe_device+0x164/0x1d0
   driver_probe_device+0xb4/0x120
   __device_attach_driver+0xbc/0x190
   bus_for_each_drv+0x88/0xf0
   __device_attach+0xa0/0x1e0
   device_initial_probe+0x50/0x70
   __bus_probe_device+0x38/0xb0
   bus_probe_device+0x10/0x20
   device_add+0x604/0x850
   of_device_add+0x44/0x60
   of_platform_device_create_pdata+0x94/0x160
   of_platform_bus_create+0x198/0x520
   of_platform_bus_create+0x1f8/0x520
   of_platform_bus_create+0x1f8/0x520
   of_platform_populate+0x58/0x170
   of_platform_default_populate_init+0xe8/0x100
   do_one_initcall+0x60/0x1d0
   kernel_init_freeable+0x204/0x288
   kernel_init+0x2c/0x130
   ret_from_fork+0x10/0x20
  ---[ end trace 0000000000000000 ]---

The warning is due to rockchip_pm_add_one_domain passing pd->num_clks to
clk_bulk_put, but pd->num_clks does not reflect correctly how many
clocks are correctly acquired (it is systematically set to the _known_
number of clocks, before attempting to get them).

Only pass the number of retrieved clocks to clk_bulk_put by setting
pd->num_clks to the number of correctly processed clocks. The value will
be dropped anyway in case of failed probe.

Fixes: d8b384777066 ("pmdomain: rockchip: fix clock leak on domain probe failure")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index e193f978d5f3..adc3bebcd928 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -854,6 +854,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 			dev_err(pmu->dev,
 				"%pOFn: failed to get clk at index %d: %d\n",
 				node, i, error);
+			pd->num_clks = i;
 			goto err_put_clocks;
 		}
 	}

---
base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
change-id: 20261122-rockchip-pm-defer-adb33313f110

Best regards,
--  
Alexis Lothoré <alexis.lothore@bootlin.com>


