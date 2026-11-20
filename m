Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24877606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwvXg6vX;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=aoGZMJLd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=exfjPLmiPr/gH2qdpIB7g+QBoVPsjOIjS8DPBZRkz+M=; b=cwvXg6vXOoQ/D4BXv8cCtlaDPH
	IFBpsjjWfOyuaWb1EgvKDUmiSa9Cqnmnt9NcpIS+4nfKrcWi3fNm5fYyJFF+8WCOy8EG9MO5mAd3e
	M3uEPpfWx6z3gaelQopXN9NQd/PQo/HTMNc89/Ht387iInJlJZ4idACojOnCdh0VPypjJIKpxR7K5
	mbRpZVYV6rxkOdWCJAu+X1tSdvwpuWl43JS/ZPUXgF0yVfR5oNFbHryN1Hq2p39B4ZVrWmtbzXzl0
	wGfwFpMKkRtDcjyhhQpcvm90vQIzC8rdafygFAhJ2QUpG8GGaRCO8iSV73wlANFB2o9VFWBdkVX2T
	++fgo/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSWt-0000000FjEi-2mH9;
	Fri, 20 Nov 2026 17:36:07 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSWM-0000000FjAD-2X97
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:35:41 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0ac0;
	Sat, 21 Nov 2026 01:35:31 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: at91: Fix potential use-after-free on manual unbind
Date: Sat, 21 Nov 2026 01:35:29 +0800
Message-ID: <20261120173530.3924083-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa0717f403a1kunmb9744555238baa
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRhDVkgaGRgeSB9OHUMfTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=aoGZMJLdSHFbZhvNm6OwuS5+U286Sszstb3D07Cxh48kh6OX+6FGYzDtIy9ohgDC4O1u3MYpGsG+GUk6Y52pfDOn1GeECo/Ravcpjpi/Nw+4KSMPfEzNg889ESo5J+k/HH7kKyx3BLPzpacTJoBljOXLIQad6Jldu3OcSHsiPSk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=exfjPLmiPr/gH2qdpIB7g+QBoVPsjOIjS8DPBZRkz+M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_093536_722913_21D6F931 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

The built-in GPIO and pinctrl drivers share GPIO ranges and global bank
pointers but provide no teardown for those relationships. Manually
unbinding a GPIO bank frees its private data while pinctrl still holds
its embedded range, which is accessed during pinctrl cleanup.

Suppress the bind attributes for these non-removable SoC controllers
so userspace cannot trigger this unsupported teardown.

This issue was found by our static analysis tool under development.

Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/pinctrl/pinctrl-at91.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 0a57ed51d4c9..81b58a7a44be 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1911,6 +1911,7 @@ static DEFINE_NOIRQ_DEV_PM_OPS(at91_gpio_pm_ops, at91_gpio_suspend, at91_gpio_re
 static struct platform_driver at91_gpio_driver = {
 	.driver = {
 		.name = "gpio-at91",
+		.suppress_bind_attrs = true,
 		.of_match_table = at91_gpio_of_match,
 		.pm = pm_sleep_ptr(&at91_gpio_pm_ops),
 	},
@@ -1920,6 +1921,7 @@ static struct platform_driver at91_gpio_driver = {
 static struct platform_driver at91_pinctrl_driver = {
 	.driver = {
 		.name = "pinctrl-at91",
+		.suppress_bind_attrs = true,
 		.of_match_table = at91_pinctrl_of_match,
 	},
 	.probe = at91_pinctrl_probe,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

