Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D50F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGINFzmY;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=aZzlmmTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LUws8lXCCGM09vIpNQlZrRYUhT+HqT4ptKRv1Dr8cMg=; b=tGINFzmYUzusAZ
	R9NR6TkgjsupNnZdm1J+mtark8t3azzrqaGT+fXy0Nwylaoze9y/XPR5tiaHQakdsCMtkj5HG6YEb
	yMAVHWGR5M/rSMcIwG1IAtCGmDgSVx44ax8NcACqdIJ2TJKFTWTZ4AjCIr0tiNstGCiECeNqGSBSm
	6GrMgQr4lrjeP4ndU6ibaqPHDj2Sa4g3ppkFJgBLljxr+5RXQ5Jy8SRR6s5myxdFcFxICiD//xILG
	DkYCQKI/64+mpbU4uZQVDoTgsLgHovBiHfJ4zhQyU6qNMBGuv9P2qAZqJ5f6Sd+QIwkW2MjvezbBF
	KFv8X7U+7MfWg9mXveVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOP-0000000CL75-0ptp;
	Fri, 13 Nov 2026 10:20:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoO8-0000000CKxk-34Dh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794565209; x=1826101209;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0ppGaxYzHhTZMYLmZQhGZ4gh2uWFyqmCABcMwC7v9t8=;
  b=aZzlmmTRTY4ik3nfgey8MvB4Nk7cdUlf7a4R/kXgJezyvjyZuf15cT9M
   lYYAvRwzfC9MBcswtpAD7ahfBDC+b+LFglk+Y2E9NItKMybhSlj3bUemU
   hhjlX08wMj/3jkI+2yotd10Qg+WL7mFeJdo9CbDXb5levs1+72130XkqJ
   kYM8iBJ2rWm8ZK5zlDBzmaHGNT4qnjZRc1JFlDW00G5o3pFbIfiO5N/mb
   HWroMqx5UKlzwe7SOIyVnfLNUDVtP8EnOvo6Ij00iRBVRC0HNJfrK77pQ
   xcWLMh3XAySTfBrkUlS3JCStcZ5m7zYaxRtEV74O8cbP5TX7On6AI3n61
   Q==;
X-CSE-ConnectionGUID: WfAZ6DLcQXe5zG6XNnaJUg==
X-CSE-MsgGUID: 5QQM5uEsSvu7pMKFBEJ5vQ==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="66461927"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:20:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 13 Nov 2026 03:20:07 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 03:20:05 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 13 Nov 2026 11:19:41 +0100
Subject: [PATCH net-next 2/4] net: sparx5/lan969x: enable the switch core
 after clock setup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261113-lan969x-core-skew-v1-2-b9b02b863d38@microchip.com>
References: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
In-Reply-To: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022014_437036_909AA94A 
X-CRM114-Status: GOOD (  14.76  )
X-Spam-Score: -4.4 (----)
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

sparx5_init_switchcore() ends by setting HSCH_RESET_CFG.CORE_ENA, so the
switch core and queue system are already running when
sparx5_init_coreclock() configures the core clock afterwards. That is
fine for the dividers it sets on sparx5, but a later patch makes it also
program the lan969x core PLL, which should be done before the queue
system is enabled.

Move the CORE_ENA write to mchp_sparx5_probe(), right after
sparx5_init_coreclock(), so the core is enabled once its clock is set
up.

CORE_ENA also tells sparx5_init_switchcore() that the switch memories
are already initialized. The switch is only reset once, when the reset
controller probes, so after an unbind and bind CORE_ENA is still set
and the core clock is configured with the queue system running.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 68c80c63f9087..93a7cb89493c4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -471,9 +471,6 @@ static int sparx5_init_switchcore(struct sparx5 *sparx5)
 	spx5_wr(ANA_AC_STAT_RESET_RESET_SET(1), sparx5, ANA_AC_STAT_RESET);
 	spx5_wr(ASM_STAT_CFG_STAT_CNT_CLR_SHOT_SET(1), sparx5, ASM_STAT_CFG);
 
-	/* Enable switch-core and queue system */
-	spx5_wr(HSCH_RESET_CFG_CORE_ENA_SET(1), sparx5, HSCH_RESET_CFG);
-
 	return 0;
 }
 
@@ -928,6 +925,9 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_config;
 	}
 
+	/* Enable switch-core and queue system */
+	spx5_wr(HSCH_RESET_CFG_CORE_ENA_SET(1), sparx5, HSCH_RESET_CFG);
+
 	for (idx = 0; idx < sparx5->port_count; ++idx) {
 		config = &configs[idx];
 		if (!config->node)

-- 
2.34.1


