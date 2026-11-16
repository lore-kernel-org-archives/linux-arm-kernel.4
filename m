Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E601606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/31h0fp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A4LFkMqq;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=b396JfFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wt5MNALHLz/XVDNpbTvAJkUalf7PhnhyDxnIU6JKbqQ=; b=Y/31h0fp1FK+HXwHaa8XpOZrvF
	dVL9v5LKlRCZGkl6O3TjQd+PcLUFzi4Xd6OTj5jRE9lkhgmQuWEOJTWgopzDQtHV2l0S82crP/ugM
	A9nmiQi0zUewQ7m5u9uhOBPyQ31Vl+waiF9eLY5LgSR3KfTg7DrORa7ENy9TGGfR4uHidVSsZVcS5
	QoqRrsjdbW/TdN/ywQuh9GNFWKIwRQzo19zo+tCwTRoLb2FmZswQ1wFuFWcwdpcZAFma6xqW2Zf8X
	R8n9qkSh5xLT2SFqOaTSArkjSW/xXyy9zwOBQS9P0C3MDJyptSNWs3biK5iDSSHEMLLtm63LMnxXY
	wWSQZkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhz-00000002byR-3mqo;
	Mon, 16 Nov 2026 13:25:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhk-00000002bna-3LeJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 13:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wt5MNALHLz/XVDNpbTvAJkUalf7PhnhyDxnIU6JKbqQ=; b=A4LFkMqq7cv7YFtWnwE01bqWZ/
	CD8CWzwITquBfrB/5V7GNFJkZwlDfVOrCbFIhnFtVXVRS5v8DY5qGvdJv7Rumt+ZQJDUza1etwcmh
	zp15gDWGtbLUUTVkWgYdNI1qo4eJE6JbJ4MWXTei3v9a46ZM62Jy6daPjePcMeJP2cviKFRZQP17S
	sR+PQY3Z04/NvF4/1lI+eP4aNhWG+wlIyzq1sOfV6/dz4qLt+/BEDilbHzVg1cG3K3x0eOkVR9fSb
	1WDFuUvTqNTpMb+Wwm7eZV7zBPq5XtBgMLoW68BreO1SN64ujvhUf+OEulMw3zO5SHAsYmEwQABAA
	nKsLsvcg==;
Received: from mail-francecentralazon11013045.outbound.protection.outlook.com ([40.107.162.45] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhh-0000000DrDr-2qbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:25:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anXZUjlAn4GzfiMnUxFKJhUMXDz7st50y1GmH3GShhzrKZGbqr4KQcAn2UTqkstEVMoTRrSW+7Hj+kjFZfAxPoloMNFmK6FmdZYsbceiruBJoGW30+sPZHSi+soQMLcpDICPBrQMun4CaR27VcG+UKEEt7F2tjuxWXvLWBgyebac+oJv78peVd8EPbt94UW3z0LF10f8Muy9q+5faiULA3iAWTBJYzQcXt5UAIjvTguw/5m6C1c6sgbX4sToe5/LTvYbLyWZ57Soi0Ue0CvV/pEr931+egpP91dDc53ZB6GhBcykpy4CFm02ObFMlpNsMVnmeGsBGZp7idr+/0PQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wt5MNALHLz/XVDNpbTvAJkUalf7PhnhyDxnIU6JKbqQ=;
 b=GgduIJgfxokJpmyNWJwiIZ9hHPVm6L9EIOWEgLHpgm+q8CLP++vNNuLrq5C1MjQzS5W83dhINMMCoyBN5/g/2WpC2uw2obRP1GvQzD18bQqYltrr9ZhgHwW/5bWcNRnn0w6rw6BfU5Dod+VzOcrN3R2yDZylJTG8BwOuQCQXsJPaIPOUkyTHqeb7BstIjkhEZyoiDsFHloIe+MzgN884xQliPyqdlvy0isyQd6T3FYt9/GdKzarokYO8dz/ooaDp4og72qqY/+8i9TAI+gHwIgvQ2TWcHAFVL4dTUklvlCVV7MRNglO+OpmDipYBU4C0Nce/6CpQ0mZ+4J5NeJGT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt5MNALHLz/XVDNpbTvAJkUalf7PhnhyDxnIU6JKbqQ=;
 b=b396JfFgPGghwr4ro2yZBU4ilXLupB/IpedLJf6c47Wbt3R6XcnKbY8fbSYwPBB1xNHIk6A6RmUmN0bxkYN+TRpFFxwtlR+9oXUA1xMqLCkjBWrwI+hTqxtG9kGbOWgI0/yEwiPbnd0497s09r0O+xNX9UHbU48ZmYNz4IcaRavB0oh1tTl0Usl8qx7HoQaPAcIPm8vQhNk43cc481GxFnEr5kk+UnBJhDyYWZjbHicG9yb+DXyldi8p1TakPZtFA44vLzWmuXLAAJlA9BR5ypy424zrZr7bdUkDAXobGfsr/qf/wy3FLM2/1LL2mAsG4ulIqMFXo1Bmm2CSFZxnKQ==
Received: from PA7P264CA0179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::11)
 by PAWPR10MB7176.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 13:24:53 +0000
Received: from MI3PEPF0000855F.eurprd05.prod.outlook.com
 (2603:10a6:102:36f:cafe::25) by PA7P264CA0179.outlook.office365.com
 (2603:10a6:102:36f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:24:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000855F.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:24:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:20 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:19 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 01/15] watchdog: stm32_iwdg: set driver data before requesting interrupt
Date: Mon, 16 Nov 2026 14:24:02 +0100
Message-ID: <20261116132416.1184447-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855F:EE_|PAWPR10MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: f0737d9a-71cc-446b-73aa-08df43e4fe63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|921020|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: nzQGfG6bGYT9sVE3NEw69Ut4uirgVY7XB5N00e4SKxaWj4rc0xT7N3CHkLei/05M5/GlhhtwU/jwHqyQtjde0mAAQ+mv3B4opvQJTnuCujU6TEzWTMCX369btVlx97/hJDaPt1/Mu320g9ryJJ0Db+/FG7s1p6bvrHW1a/d6n6RlM/EUJ00arF4dAvrR+bRNDsYPjESJMAN5HTaNxhnw4hu+1VJ7rnTCAe3AkbXyn2mzT2L/17oTORtpiWGF3j7HBaIv4uASFBlvDtrlQ3TnFgkFxYhUnSqBBcHiuvO5p8ptYkuE5nvPn44DtCcpCn2i17MF41yjYUhTf723b/gvJOz20KaYfjyhEF7KB5dgZvrlCd79cSHw5Eyzvbc/SYVJkfuQ50roRQ4OQqeAqBE/xiw+oRvdXm+HkjNXsVkNymCCkpP2IHm3vYCaR+9Pjxq4ulesMl3CrY//6gdD1WL6YfDcddvFraI979+haQitHbqe83wFq3SNp7Iei5nncHgK51rov1s9d4BB95yB5zM/gljPzbfMIelwx7VDjI7K5XylyOMiHUPAQROJPhP5dhwXYehhRbrJMnmKHp6K4EAp2aN7epjrKRL+JPw7esrfFRy2hDcFrsOXfv5pyoerNTZjjQ/KXJ0NOOiWyOU171rcVi5mTqT8cfbgVfr5YmKXqH5j2YcrPYghHpU8DHgrqMMR
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zcQU8SnmZkH9jX6boYFPYCkvRRzXiHjdDirith/Nk58UuzydU0P47STCEg7lKTugK4Ge3RQhhIBM42T2gB9khFzqlx1lFLGhdtmPqu0M4dWP45qav69GQr52o5cjk3jVns/j6OLiiy6EbYbX86IvmNkS6SOSLhRD7HqHOojkFBkN8UcF3W5SUfMvoipUXS1o+84eOyUVka13KggOINj5GKfKBlFK1JH+czZwjrwnDTvlFeiAzpFnQraWPNi4onQPTnB5UvkDzop65UtAbcSu2bxzY2V/TMcmg7d2pGACag7CSEmAnLOGw9j7qcpgSb4RE5VAESQ9kDhOfJF7vZNTsaPmL47d3cVMYxhUnIpjNuhs65NoeeRBtHyth36w03x0UK2vWasDdwFgTMEBrg1Lao/0UbjeP/+NuksYxV1P8qCFSFOR4RQ6Pqa7Cxr+e2QD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:24:50.8964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0737d9a-71cc-446b-73aa-08df43e4fe63
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000855F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132501_677686_33DBA72E 
X-CRM114-Status: GOOD (  13.24  )
X-Spam-Score: -0.2 (/)
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

The interrupt handler accesses the driver data, which is currently
set after devm_request_irq() returns.

If the watchdog was started by the bootloader and a pretimeout
interrupt is pending, the handler can run before the driver data
is set, resulting in a NULL pointer dereference.

Move the IRQ request after setting the driver data to ensure it
is available when the interrupt handler runs.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261106163429.618392-1-antonio.borneo%40foss.st.com?part=3
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/stm32_iwdg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a8d2db2d3cf8b..2bac4ce5ed3f8 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -346,15 +346,15 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
 				    1000) / wdt->rate;
 
+	watchdog_set_drvdata(wdd, wdt);
+	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
+	watchdog_init_timeout(wdd, 0, dev);
+
 	/* Initialize IRQ, this might override wdd->info, hence it is here. */
 	ret = stm32_iwdg_irq_init(pdev, wdt);
 	if (ret)
 		return ret;
 
-	watchdog_set_drvdata(wdd, wdt);
-	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
-	watchdog_init_timeout(wdd, 0, dev);
-
 	/*
 	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
 	 * (Means U-Boot/bootloaders leaves the watchdog running)
-- 
2.34.1


