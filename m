Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EFB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WH/+Trci;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=RZa4+pOr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GqX8d2KJvRlk7DtfALNlqGbsu5ECq/2ey26FvzAcPow=; b=WH/+TrciDY7L75+kA/VKWMUMlI
	47uwLC3kjWlvE9viU6Vi+Z7cLtYkT+SrhGo6R9Wc3Qyc6hvrpTxZOO6nW7lmF78LM0r6lz0rfTJdp
	nX7aIi6gdCTet1nJLicFyvuiuNZakHg8l7VoFrc0sq5VJeK35/LhP7ibDJlSu8nfqEBN4zNWudIjw
	sMc5qbLeDakefgJYATXGKVYL73D3FedSnLH49pyMV4rI65CiSIr3NepLZ9SZHK/MHtx5Cyd8HWXat
	RBM4lahvNJqwx7eRWdF48A7+0gnJ5lr6v9uqBenKqAMYsjWk+RseEMtTp0VWGrMem9ndLf8ysaxXp
	2sMVOWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhQ-00000002bTt-2iU9;
	Mon, 16 Nov 2026 13:24:44 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhL-00000002bN6-1yqO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:24:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDxV5iyT4vKE4lko4jTaK0LdHZ03xxkkimSK2iGCn5Uaosl7dHjJfGFcIobSjG+nqlzspRk4eHsKMiKnWPb1Iy3wpkCIJP3G/vqe6XDBHUqp0hKkrJFVHLPlJPjv2euzVaw2QSDuz/4i3Wddd4jjivWlgTNUUGSYkKpQcxY6/eS86wkwlZZcW8jmtpKslbdUfWcAdQwqnxBuJyUdogGJThsDc07wi6V6F42YnCbSHyPJiljQIwbrrUasB1HdeupaUgbttkiZTn+GTXj0rMPxoPwLatAwwLauzkTBrZL6XBHn+oPmQOvSte8nC3jAqsfuVa+QIF1JPKb/MItnA3qXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqX8d2KJvRlk7DtfALNlqGbsu5ECq/2ey26FvzAcPow=;
 b=TtEtRE2bUb2q2SgFCrkm07ILzIQZ5lljCXuc4JOZYcAICe42lVRb1L0DAue+dcJe3/DuRWBKF0YN98nVtlrk2S/uB0AmqUWzMPgUnV7UpEdHmXCVPdNkl0y/ZZrZrb68xeWMN7tIyxfSDp4KvfmMwhVh+CpzBp3gU6xS7/V34C8l43qC396NP5Rt6V3+TAwmsRH7OX3uazy4RgQ8ZnrL/1ItONuaEfAf8C59+yAmP6nTdXf8Jqf5+Bx/vj01+E9wSDwbTQvu9JIFcLSGJHwLPNipOd2FD5fmXpDR90gcFFJNcwgHCgOuHdTC4zli1sGhf4KrvOWw9lRlk80vWaZ6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqX8d2KJvRlk7DtfALNlqGbsu5ECq/2ey26FvzAcPow=;
 b=RZa4+pOrJIyNBlP5pK+Q//7Hj0Ktom7mgrkddqq77p9ApeIFoZmMCFCxrB0168KsIbPKrSiZN1fDFHvcH2oMNw2SKze+MpPapVVZM0JWJhiKxYqFKGKSfhr+R6FyVwnafCV6O0Bjken/UxFGj+xW9X15KCtnnToks6H85SyLFdmhSDNGF6k+04evQjxsvPCPAnxqVdBCv612ep20a58r8+3doo6rIwPhmF6wdWro98hg/1mAK7jpjVTZJf9DtSTo28D0HtLy5vZXH+B0uLrirE2eaHL2FPcDzvxC6dAOdSASXfCHMvyZyLKTp+LlC/sYLL3h0IzHAsmnNPYGzFS6nw==
Received: from AS9PR06CA0226.eurprd06.prod.outlook.com (2603:10a6:20b:45e::25)
 by GVXPR10MB8864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 13:24:26 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::8a) by AS9PR06CA0226.outlook.office365.com
 (2603:10a6:20b:45e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:24:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:24:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:04 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:20 +0100
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
Subject: [PATCH v4 02/15] watchdog: stm32_iwdg: serialize accesses to EWCR register
Date: Mon, 16 Nov 2026 14:24:03 +0100
Message-ID: <20261116132416.1184447-3-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|GVXPR10MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 84124f50-79ed-4396-2718-08df43e4efbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|921020|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: +2FGBHx4ROnKC20km2TfaV74K6LLjp73Lwl5W+WjPw0GUV4T+GUikwz88n+8LbxtkxXzv4WNozMqZEMZm9JAYiiLyigKk659IPKjqI66/9v7KuoZIiQz1v36wx0pgmnDW/92uJc5Nm70rqY0IzNBiFIRZswJ5FQodGSLoPcQPk+peKxCdUY99YAMQvbIkPJL0FFvfuiyKrEkzMYRlo7NFQU9JZPwF4EohpGqe252D0uP6iUsjcdP8Jms1IYkxt+jCuelcoe3WKlg8+wRwAZ7WsfYU6T0ILKawe39HkC4/lnqYSVe1JpM2cZQ8mika4j1j/z9F3VARJLMowzBzi4xN8zyz+zUeFvGtdSPMwFv4C40dZ5MZbKPx5aJz+NoYl8j2qwUFeCX6FQNahxJET30ugWLu5SrmBLQNaXea/pvAuJsYpv1q+ZJe8t5Av4iQS70nhIWYIL+I+Y2o5YONIMYA25jp9eUvHNXJvHZgrpzJ0QiSROQrGb/1chm9YC1zDqjFrTFcqMxD4bKf0l146nyKac9bj4xyzoFN58F1q6Jyi/4deRqGg2GYqjWkpWXwoq1OjFUtlGJHVH089rjPR6FTSjy6fE4i5nW3yHD/s2WdS4fze7qnIGA4VsBkIHVhGKn4Onzma7EWmH2ER0zVx6LuT00tU2P5+xnxclBg0Cb1B2R0Z7GZ739MPv108r9+PlOM26XlQmVZkeBbPjGfdOtGGzjIQ1zyMcIM9CVdlOIUKimv+rv3357n5KoSeNLO75r
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2SheLsxw3QcG/09U3tGlHtVAuMhB7Ofu5uriBCTVMPDgwd7uct9EsdIhDyllN+Ji6qVYRypeiDVlhOzjkdOSweliK1XuHdyLjAb5myaYG+S6UufDuTunUeocZL9obNoHtkX0Mvhx5CrSYU8yIMdWXtApzu7U/oVG6wBhIEffBisvX9v0k8gX2ZKycOzdNlTzbFgHtfCKyzu9YB9UoS1hkmpkUqQyI2CX7Pqbm7R98+Folo3XdEMBg4PiiGDHcCET+EhyyYs/+H62nqUsXL3gnERTy5FkJWi2cvv+8XgwROKEdOxwTmK2aRGXdL508bl+75OFWCIwaPCJAAtKNteAi4U46xJ5Ts4KTdDb+npPhIBywfbSrwIuoLXTlcwBnFQv2DysSjc9ENyJsHtGTjnTBlkkNhyFCFPruMdO+2Owp/2vceu86weHCnrgxeYTiCs/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:24:26.2649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84124f50-79ed-4396-2718-08df43e4efbd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052439_547741_AA922704 
X-CRM114-Status: GOOD (  16.77  )
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

On STM32MP1xx platforms, EWCR contains both the pretimeout
interrupt configuration and a write-only bit used to acknowledge
the interrupt.

On SMP systems, the read-modify-write operation in the pretimeout
IRQ handler can race with writes that update the pretimeout
configuration.

Protect these accesses with a spinlock to prevent concurrent
updates.
Don't use the helpers reg_read()/reg_write() in the critical
sections as they rely on relaxed memory access, which are not
ordered against locking.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 2bac4ce5ed3f8..487764b51667c 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
+#include <linux/spinlock.h>
 #include <linux/watchdog.h>
 
 #define DEFAULT_TIMEOUT 10
@@ -82,6 +83,7 @@ struct stm32_iwdg {
 	struct clk		*clk_lsi;
 	struct clk		*clk_pclk;
 	unsigned int		rate;
+	spinlock_t		lock; /* serialize IWDG_EWCR register access */
 };
 
 static inline u32 reg_read(void __iomem *base, u32 reg)
@@ -98,6 +100,7 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
 	u32 tout, ptot, presc, iwdg_rlr, iwdg_ewcr, iwdg_pr, iwdg_sr;
+	unsigned long flags;
 	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
@@ -124,8 +127,11 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	/* set prescaler & reload registers */
 	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
 	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
-	if (wdt->data->has_early_wakeup)
-		reg_write(wdt->regs, IWDG_EWCR, iwdg_ewcr | EWCR_EWIE);
+	if (wdt->data->has_early_wakeup) {
+		spin_lock_irqsave(&wdt->lock, flags);
+		writel(iwdg_ewcr | EWCR_EWIE, wdt->regs + IWDG_EWCR);
+		spin_unlock_irqrestore(&wdt->lock, flags);
+	}
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
@@ -185,11 +191,16 @@ static irqreturn_t stm32_iwdg_isr(int irq, void *wdog_arg)
 {
 	struct watchdog_device *wdd = wdog_arg;
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
+	unsigned long flags;
 	u32 reg;
 
-	reg = reg_read(wdt->regs, IWDG_EWCR);
+	spin_lock_irqsave(&wdt->lock, flags);
+
+	reg = readl(wdt->regs + IWDG_EWCR);
 	reg |= EWCR_EWIC;
-	reg_write(wdt->regs, IWDG_EWCR, reg);
+	writel(reg, wdt->regs + IWDG_EWCR);
+
+	spin_unlock_irqrestore(&wdt->lock, flags);
 
 	watchdog_notify_pretimeout(wdd);
 
@@ -323,6 +334,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	if (!wdt)
 		return -ENOMEM;
 
+	spin_lock_init(&wdt->lock);
+
 	wdt->data = of_device_get_match_data(&pdev->dev);
 	if (!wdt->data)
 		return -ENODEV;
-- 
2.34.1


