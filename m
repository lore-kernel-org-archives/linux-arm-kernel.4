Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=je1EQLZx;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=fiem8PEz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s7wb35hbev8duYRmxhQ843Fp4meyGXXQgCBke4k8BOY=; b=je1EQLZxtpfx+Wt8KeK/N3mXhe
	bSn1eHD7DqAU+0RQzsE/6AmwXRB8Y0Rbp1q1auBDgWPdGHK7G+HR3mtOf0tisJNm04BQ5hMrPDQLh
	T8MLxZ0x8WkCsk5Uqb/c37lePt07JE1R8+GHHoVjezfbYOzfDxHm0OQpcXaZf0z0d6kJfzeqLp0t1
	6/nzQvLBf4/BQixs00vy0L3B2yyPejbOs3hMFMLlsvnhEvL4yHqo7hXfJWDJFGbvhD9kvZaD0hCyR
	22iKo1NKvRggEEnTWMtFMX/OuNt7tPgnHFJhIvj0UlozWfdM6rZK0ytLx9CV2X/ZoWIs3swtf3jRG
	ruoyZP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiX-00000002cSU-0vPD;
	Mon, 16 Nov 2026 13:25:53 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwi4-00000002c4j-3a5H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJYOt2IdoCYM85O3xaRM3ayA1t8OARSKrvz5ezkkD0UPPH6mSMwiNKX0FJZBwdyT1AIVlVsgV6XEYQML9zv/SOw5f3+h704GT74HXZ/us4d0SY+9wRgcs6XgP8/u38JebMiG9c/8PS4oLqSVtj3+ydzsmkbVyI5IRjoPUM38MQ+p36TX4/1dRf0uqUW0HRC71gFGz883EF1WnxiLYVvslUsfyTfG2qWBzofJnTMTzbMIVgERNSBe9xvX33MIKqWjxm0cfZv216VOH+eJvSmZju/RBCVy/epP3wjr9S325KA0nT3aOi7Lj+XSPa3aVnwgdyYl2IiYcIWvFGmRtut8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7wb35hbev8duYRmxhQ843Fp4meyGXXQgCBke4k8BOY=;
 b=vmrIFW/OWR+dM09rZJmq6p9Akqfb4qf78MhcuVTb1hg1FIyVl5fyI14J4MX/NFYOFEgftZqC3lORPj+IMwWr8mbcoAUUe0cJhSp9EJCIeC1DhyBbISoYWdgcYEOl7YQk8E+apeMTQo8CdltgKQBZE5ujjNM0MAHxIDjaHnq6AnSUZXFoKSA2zRap3KTATTa8lV6zElcCddFXnzG6+rmerQ16tHbkdryefDXyuPdluVNx2r2e7kmQq5jSZtfNinc5uRxDYc2qF2xERvGaRY8o0v4SizkrzGeZ6p00t4AZkMkRzRtHiQIVvGEhoudye9a/XQuurMMFWOGXmlQTJQYFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7wb35hbev8duYRmxhQ843Fp4meyGXXQgCBke4k8BOY=;
 b=fiem8PEzCyF3QX/43iHBp6sAJcj5qfD9DpfL6AKLK87Aa+4a3C5H079lQ1gwvokJgfuv+kGF/xXPZp/vvNaHqYgppHIMX7HUpZdXkn1MKoH91djlO0dJaf+okfWb4xc9dFK9ggD1F+4nk8zitNsOKlw/ERpsp+4s8aekYqSSLb4naa8cO7iGT+NDzctWasTPVsfesj7DtfaMOXZvbNSYPQGazDuafUpPMR5OCV8R8qH9DyA7Xr45tdnqHP5X7PX9zqwij1gYWtjRRGkJCb65yw0mTfOhFvfxPp23gFh2JxJhd1bExtbjMh+eKgQFP/BAkbasHOygR0MAJFfGoNiSPQ==
Received: from PAZP264CA0107.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::17)
 by PA4PR10MB7940.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:26d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Mon, 16 Nov
 2026 13:25:17 +0000
Received: from MI3PEPF00008558.eurprd05.prod.outlook.com
 (2603:10a6:102:1fb:cafe::21) by PAZP264CA0107.outlook.office365.com
 (2603:10a6:102:1fb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:25:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008558.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:25:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:24 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:23 +0100
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
Subject: [PATCH v4 07/15] dt-bindings: watchdog: st,stm32-iwdg: add access-controllers property
Date: Mon, 16 Nov 2026 14:24:08 +0100
Message-ID: <20261116132416.1184447-8-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008558:EE_|PA4PR10MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 209a85a3-781d-42cf-7853-08df43e50aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|82310400026|1800799024|921020|10067099003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: mS0R89EWcQWdussGzAPsjBG4RXbtpUHpNGmx+k6Uoh6quqacpfjAP5Ruim+ia60T0mbt3hdaS1N8lYI1gf+/dnglUvfth52s5hCWBT7MCPMf20NUkbIn2X+lKeFR84LO9durJkwUXvm3Q1VS8V374r7edcWT+I0nCQEiFO7qYLMR16or7/bIoVFWOdwQ79q+p1oc3Soa20RGTybGBW00KeV50dyMpP0TLZGx7GKIDRzlF8bZ+sgAf+2FsaY60cmZU5Rmsgj1aZ/BqX8RYeXXyIkKiSVNX3w4OQQJKXa42x4P9AW7F+5RuK/B43oYLJIWM627LhJxd0gvFtONqZxd3VVr8cgycNHLrDfRfeHj+2icFvTzCYIKrIMPe5h6TTwnvfaR/ikIOhoUSdmd3LZjDsWfwvmxQxZ0x9BEz7oFy1SK5M+/B2PiqenjRy4JW0EMMAgJjn6uz6NUhKytsI3EHMDCcYlfATwXUCf9EiPuyDjevt/nnUzjtZbdcFi6uwT+IXVz3VD486qzK5PSukmM8ncBx+05vVwUD0acci1UVm0d0yjNlBEAjl6ZpR2jMEzg2xkfeKMR0WFXN9aYiz+w/rQJ4c1lg7oFTjmzSBlqANQ3EylYTXsZR0GwSvpOc6S698xCIivTE/LDlquXLZif1w4VYJlwUs5exObSlIpobG3xTMi4bU0IMtK+ORKGs5PK
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(921020)(10067099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y1gpwwJ7nCVlYs5lEzh6XqBsw0FarEk+lXOK0rp9/fQYJPJ58MEw7OPq2SfyBZRx7kRXDVyH/FqogefprHhEP8Q4TtvCE/I0KsvHwQdV3NbAPi5LG/UdAGLslKY3RBUhQWQwbKpbNJpuDbkbfhEP73cZKfAuK1PHrm9JYCHCuMI3lhvHHhBF4rs5HXQeVd/EoRXrEHQxNhN1Czbgc5RsUylr2N/MVo1LvWrIB88ArSaSTINibKIPgkDVcPGVowockhW9KypTh+wzv9ndwr73pabs8lNdiH1oenjpscxsupp92vhyI9vt65V5eDPmE/pOkgtYyMOZT2uHSgflFaRNQxvdj9wrfN+0WS1rCdXzacud9Sd6fTB3UJ7vzLFYK6o0Hu5Rm6NdJolOnhqMxBM5AltXsAQQRNNlqLXtgolRHaYNa5cyzl2bzOS8V7kA16Zn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:25:12.0499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 209a85a3-781d-42cf-7853-08df43e50aff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008558.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB7940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052527_637724_4AD4C526 
X-CRM114-Status: UNSURE (   7.91  )
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

Add the optional access-controllers property to reference one
domain access controllers protecting the watchdog peripheral.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261106163429.618392-1-antonio.borneo%40foss.st.com?part=5
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
index 86bd39d508500..daf782460bc09 100644
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -42,6 +42,9 @@ properties:
 
   wakeup-source: true
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


