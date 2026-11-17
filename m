Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF9606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f5sBxVjQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fXfRWtDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=D+ILkG4wXbd8ldPQ9WAnmbHHAWHtJfFJtaeyi08GqYA=; b=f5sBxVjQLuEtmDBUkRJ8iU7e3n
	y81IWCr7nuDbjYLbDfhC07hGfxKNFDdzLCDAU4QehoFhoD0n2lOcPP6hpocTw/ilyCzEFyyJGV/Xz
	gUTo2cD0EiY+DJI63oZXahBU3KppCBduGt0m9XhFcsUG2nezkowJZAiR6ENb8nG0ezLFEYOGuAqqO
	fJ8nQDKRfLpDWXJcEqJmeO/jjbbaMu3ZT4E+37bdcPGOFa/7GR7YXGmp3tO2lkrXyhEyw5+Otwebk
	JhNUz/SG40aI3Dv1NO8HsILtovGpHmz/8WJ6tAzH9UuCmHWZ194hxgl08HZ1TgMfgSvX/NyJhIjHn
	wfzC3LWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOX-00000004kbx-38ze;
	Tue, 17 Nov 2026 07:14:21 +0000
Received: from out-47.mta0.migadu.com ([2001:41d0:1004:224b::2f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDOV-00000004kbF-0YsE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:14:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mvsYp9GPf/gfnr4IAxsW1KudKK0j8pKaTP5yb2G8/28=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899655; v=1; x=1795504455;
 b=fXfRWtDLvbzoQXsSG/Yd7042rKZRUWKAGHCNG4JZdeKBzSUGXDUAOZttpOP/a01h2TcER84d
 fxHIpdxoNCyoXpEG4G01uDcMAoV1BFwh2Npb3xNLbMq+zk/H/edXROSmEq2+gRhGBehg6ieeEa2
 McafwWVnASNVwV14OZow/Ps0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0e4be3b1e41aa911;
	Tue, 17 Nov 2026 07:14:15 +0000
X-Mizu-Trace-ID: 0e4be3b1e41aa911
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/8] irqchip/imx-intmux: Fix and modernize resource
 management
Date: Tue, 17 Nov 2026 15:14:04 +0800
Message-Id: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3czcCt3MvJLc0gpd86TUpJTkJItkI4MkJaCGgqLUtMwKsGHRsbW
 1AJJeQHxcAAAA
X-Change-ID: 20261116-imx-intmux-7bebdcb8c20b
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_231419_383300_AFF5546C 
X-CRM114-Status: UNSURE (   8.62  )
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

When I worked on guard_chained_irq patch, sashiko reported pre-exist
issues in imx-intmux driver. So I gave a look on this driver and found
more that need to be addressed.

The first two patches fix the error and removal paths. Probe failures
leaked IRQ domains and mappings and left the already-installed chained
handlers pointing into driver data that was about to be freed, while the
remove path never released the child or parent IRQ mappings.

The next three patches tighten the device-tree input handling: propagate
all errors from platform_irq_count() instead of carrying a negative
channel count into devm_kzalloc_flex(), reject a zero channel count,
stop WARNing on malformed interrupt specifiers that can come from
user-supplied DT, and mark the multiplexed interrupts as level-triggered
to match handle_level_irq() and the type advertised by xlate().

The last three patches convert the IPG clock, the per-channel IRQ
domains and runtime PM to their device-managed variants. This removes
the manual probe/remove/error-path teardown while preserving the
existing runtime suspend/resume behavior, including gating the clock
after probe.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (8):
      irqchip/imx-intmux: Fix probe error path
      irqchip/imx-intmux: Dispose IRQ mappings on remove
      irqchip/imx-intmux: Handle platform_irq_count() errors
      irqchip/imx-intmux: Don't WARN on malformed interrupt specifiers
      irqchip/imx-intmux: Mark input interrupts as level-triggered
      irqchip/imx-intmux: Use devm_clk_get_enabled()
      irqchip/imx-intmux: Use devm_irq_domain_create_linear()
      irqchip/imx-intmux: Use devm_pm_runtime_set_active_enabled()

 drivers/irqchip/irq-imx-intmux.c | 57 ++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 26 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-imx-intmux-7bebdcb8c20b

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


