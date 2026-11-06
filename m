Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAB606D808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dcdO0SRg;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VEjYXEMy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nVLYRgUGSvhbBlPZbbSFWtM9nrTZqhbIpC40fGrd50I=; b=dcdO0SRgkri3fX
	qYxXms4HpokGZyqezHjlH8RcvCBlrVlzBVlwV+vAYzBNt8WUzhzmZVo21BU65u29ByMZf/86rt5AZ
	1yvPygPQt91CKX3S7A8bvtof/+gyb+amNhG0Twkmeuomw5e40zqqxqf8E5plxjMaRl/19pcKnMjBg
	s0rNa9Kvu9GgUk5zoPr4QrubBKGkuhmzi3r2SDcs/O0UUL+zsnDOO8gpNE2i1WuCfYz6XadM+t7Sg
	p66aoAuALHQ2bWUTa3AtWpvxjCsaCA9usZxcyV7VXsh3Z65t85PPpTQuFv976kobIF9ktPpW/3RYJ
	0KkDzITGHz+Kzyd55Psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtr-0000000D4Zx-1rOw;
	Fri, 06 Nov 2026 16:34:47 +0000
Received: from mail-westeuropeazon11011068.outbound.protection.outlook.com ([52.101.70.68] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtm-0000000D4UC-2LKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6NAzZBgo8Q/85c9JdtUBHrWgWoUvN4dyoZLiahm9odViSHo2Tk4a8KIOw3uuuxaKUK4x1c//4lBAxprTo6J3r8OOvYfamXKaO8MV+V0X693xC2YykdAJqA3UD2wXc7jJohSaqU4Lar+z4gVORh/5DZHBCQUw0v7IVviM3WROHlm07430SAfb9skJtbci5V1v/6+jZVpf+RUopdetGkWbLtka29UPWt9YVzGUwmpCvUFTY/ANzSZ9U5lJcvHhz8cOSBPgMozv6pGiWwWsfgJI3DARu1mm9n+V+1CuOTkPqSL1rp5AxayOL8wDZQP70QVGbqJxMZAV6MX1rVF0Bkj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVLYRgUGSvhbBlPZbbSFWtM9nrTZqhbIpC40fGrd50I=;
 b=cerLUzEob3WINsei69x+1eZ3kNdarZllJUzsqirvsLxYKOZmf2pDAaoP77q18Zy/sK5AZPaXirD6YnB4zWGDrdtku4tL/NybdW6TgUgdU5RMLpggZewTIl/BBODPPzrxBIcRmtKbOIQt5W6BOyYFsSuBvSM0GzqoiqPgyRTccjHVH2RAaRavpwXLTWVORYWpUxrG9LSsvibwkck6im/5sX9WQ+k/W5E3VoRby3V/sPqkgbghxsutsE5UH4Raqjnmixq605s+JfU4luMG7Hb73HHyx1jE0te53rZ9ShMXGx/kgUJlvDYYXqn7sRsYUROAEIQfkmSa/opmelZs3Ep30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVLYRgUGSvhbBlPZbbSFWtM9nrTZqhbIpC40fGrd50I=;
 b=VEjYXEMy/bm9FK+tlSkoLB+0dEtu3l5JgmXmsTPgeiJV5/Kfw/ckhEA6fuVsuQfScEXF0/oWhYjXocYlX0nS9i3zHgfueOuejTu8BjxOzo3MH8uUwEEQfxQFwFVOEGXsHVpLlM8SMfHnZDt+yITmMdmVTALgKXfMAQrx4ptqBNcq8dX/VHRo1DPU8pX1GTc/BSb5c94DS6N5uKqjl2zABeAfiTH5qz0VRIOpzqn7dMjp4wBI8oDXv47Dr56FordLn5JDeFXf+8sfaTYuF1S7bivUN0uSp800eTKHhr1dkTt/mAoyvZUC8oWF+pBWW/QQhtqikm9QD78ojeoWZdv6YA==
Received: from VI4PEPF00000146.AUTP296.PROD.OUTLOOK.COM (2603:10a6:808:1::890)
 by BR2PR10MB992286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:2c8:17::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 16:34:35 +0000
Received: from MI3PEPF00008482.eurprd02.prod.outlook.com (2603:10a6:298:1::69)
 by VI4PEPF00000146.outlook.office365.com (2603:10a6:808:1::890) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.11 via Frontend Transport; Fri, 6 Nov 2026 16:34:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008482.mail.protection.outlook.com (10.167.240.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:21 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:35 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v3 02/13] watchdog: stm32_iwdg: detect whether the watchdog is running
Date: Fri, 6 Nov 2026 17:34:18 +0100
Message-ID: <20261106163429.618392-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106163429.618392-1-antonio.borneo@foss.st.com>
References: <20261106163429.618392-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008482:EE_|BR2PR10MB992286:EE_
X-MS-Office365-Filtering-Correlation-Id: b38780d9-3559-4d16-6a12-08df3c23d816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|22082099003|18002099003|10067099003|921020|11063799006|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261022115727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: y4X2d3SP/YrvQQq47L9dG304WHjQjCw9GAP8rpw5QD3yD48sBnNmdNhDB4J4SWlXy5l6fYKhHvbAx1/pob3wSI0pPql+Q9KJ+wxdEXWLYeNlrd71MMU7U5pTRBFkIz1P2iy+CBCs8LC1fxk57ortkgGlIetpIT9jcyNCtOo1+c2m3EceYImbjpPX66tqTqN2e5pl/3g9pm6B57Igaa4cKRe0aO9qCcp99RsQtkQAXwAxEhC8MHQqe/bnGQvE0L/Mk/P0BAH3SxxM/Zie+PD1H4nT1Hr04oPd/4BpLoxGjRWYfOxVBWSEGhE0lPKVXA3re7OLx+GRye4Ly4NgjKaOI7T75oF5WgBSY5jtyUNMh9duyV4V85GglCiu0gMNS4G25Is/O55W7ZbTtVxQsjyO7EhF3sYTWDLQ0zDF6D9SQhuNtjDpewxnmMbNK+ySI7Ihy/nBBFuygBxCbpT6T1ok14QSm5X+wf+GLJDq8DCVjBG9myPguUkewx260VYkwJtQaBkei+Ad1ylqiePtbjmCYWePgEaQKYO14eZZY3DIu53Zu8V9bYcOdb0oPj+XjL5BYVNaH1uYjarwMQZWafN7nNBwAnYO2xucmOAdIoHdacQ7LTdh6YZ37163ozQ92cXPxoe/UcQC7YuIisjRMaed3JGzUcM7ifHV7+JeulDN0HYz19EV0quYAK714I/t5LiWWKVP8beax4e0N+KEiavSt0rNEHIBhiva/xOjUqBOMhGsYr2sHt4U7NIDpgcngVdq
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(921020)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261022115727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tx5lRcijuiiKoSraXr3/aBOiUWtHCOOXdlXnvKFL1WNfCEQFISzvp7frNr7tiloqUGuwGJ9QR42P9Wxqp72QHImIY1lSOStnUOzK96Z7tX887Z97Yg3Ds9F7cToZDjNIo5qu87GtQIMFXczjnOQ38l5KKnT7yptD0/6W3pUbkEivEsK/rdWWi/Jl2V975Uzxc4F8C3FdkEJ4swYnyu9lSrk1U2u/h+tifUg6e6w4oaZO6KP9rBLOc7hiLIce+G3dUMe2EkHTX646KtiUc3WNBGNfHspz+iUQ4POeW6ymLcf3yy0c4v/3B+xGeGWQ8YVNMI/xR0gr8Tvmv+qjCu06Mo5U5XTgIMtmdcVU6w/mIUagZd2IlODmsDU09QkstbWaef4oooWEuK7K+FdgD/NkJyfim+i+9Rm7EAfURNqAeJQ5QWeC3ELCVMXT61++E9KX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:35.6380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38780d9-3559-4d16-6a12-08df3c23d816
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR10MB992286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083442_623873_8B75D2CA 
X-CRM114-Status: GOOD (  19.74  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

On STM32MP13x and STM32MP2xx platforms, the ONF bit in the IWDG
status register indicates whether the watchdog is running. This
feature was introduced with IWDG hardware version 3.1 and is not
available on older versions, such as the one used on STM32MP15x.

On older hardware versions, determine the watchdog state by
writing the current reload value back to the reload register,
then checking the RVU (Reload Value Update) bit in the status
register. The update completes only if the watchdog is already
running.

Use this state information to service only watchdogs that were
started by earlier boot stages.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/stm32_iwdg.c | 45 +++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 30b4cbf20afa9..ce3e1f96ef50a 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -49,6 +49,7 @@
 /* IWDG_SR register bit mask */
 #define SR_PVU	BIT(0) /* Watchdog prescaler value update */
 #define SR_RVU	BIT(1) /* Watchdog counter reload value update */
+#define SR_ONF	BIT(8) /* Watchdog enable status bit */
 
 #define EWCR_EWIT	GENMASK(11, 0) /* Watchdog counter window value */
 #define EWCR_EWIC	BIT(14) /* Watchdog early interrupt acknowledge */
@@ -57,6 +58,9 @@
 /* IWDG_VERR register mask */
 #define VERR_MASK	GENMASK(7, 0)
 
+/* IWDG Compatibility */
+#define ONF_MIN_VER	0x31
+
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
@@ -250,6 +254,31 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	return 0;
 }
 
+static bool stm32_iwdg_is_running(struct stm32_iwdg *wdt)
+{
+	bool running;
+	u32 rlr, sr;
+	int ret;
+
+	if (wdt->hw_version >= ONF_MIN_VER)
+		return (reg_read(wdt->regs, IWDG_SR) & SR_ONF) != 0;
+
+	/*
+	 * Workaround for old versions without IWDG_SR_ONF bit:
+	 * - write in IWDG_RLR_OFFSET
+	 * - wait for sync
+	 * - if sync succeeds, then iwdg is running
+	 */
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
+	rlr = reg_read(wdt->regs, IWDG_RLR);
+	reg_write(wdt->regs, IWDG_RLR, rlr);
+	ret = readl_poll_timeout(wdt->regs + IWDG_SR, sr, !(sr & SR_RVU), SLEEP_US, TIMEOUT_US);
+	running = ret ? false : true;
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_DWA);
+
+	return running;
+}
+
 static const struct watchdog_info stm32_iwdg_info = {
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_MAGICCLOSE |
@@ -362,23 +391,9 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
 
-	/*
-	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
-	 * (Means U-Boot/bootloaders leaves the watchdog running)
-	 * When we get here we should make a decision to prevent
-	 * any side effects before user space daemon will take care of it.
-	 * The best option, taking into consideration that there is no
-	 * way to read values back from hardware, is to enforce watchdog
-	 * being run with deterministic values.
-	 */
-	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
-		ret = stm32_iwdg_start(wdd);
-		if (ret)
-			return ret;
-
+	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED) && stm32_iwdg_is_running(wdt))
 		/* Make sure the watchdog is serviced */
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
-	}
 
 	ret = devm_watchdog_register_device(dev, wdd);
 	if (ret)
-- 
2.34.1


