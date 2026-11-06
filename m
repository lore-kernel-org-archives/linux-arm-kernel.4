Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD6606D807
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fMeDbxU0;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=VfUiqprf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C+cyXAf5gYwIvjSgrkGDos72kXYNBp43ml/8QyHo4xg=; b=fMeDbxU0rWudEWXuEA+SCmIv7x
	g2mzD/lHfj6TCDoGUoYEwCy8cRafoES9I8r9QCkO9PfImrFFSRnyKGU3SycZU1q0hvlr5v8QgCQkt
	goVUSfrJhun2F4xCf+TtYlnq1RzGFIYLl2FhYS0OsvdEq2vWyu6SXVtsPqxrgEd5Rtq/0esP1shku
	XC8SlmS8cy+fvW6wOpcilk4pvxDZ0zt0ssffpwkcAHYoATSQ3jqUr5vCOCm9FrfANjkQV5Jz57Kbo
	HkXa9X+rZ+uRD/Kn3P9WtoAMB4ShnSGCejTnrxrU5Kv6YPjxlJkdBq5VJm0VlpLFOS4GKC2iXmNuA
	L3hDejHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtr-0000000D4av-3T9I;
	Fri, 06 Nov 2026 16:34:47 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtm-0000000D4U7-0ndm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAZDIH5tZWOffTuIhem9mYSbCJNoz1kp6UDSnH6vzhZYuRQxH7fVd3LzDPGy53ikJeRhf+W3D/GPZIijTjcG6/xKtL+WBKtwa0TQgE/RF3rAPwfNCZ/fHw0bEl6/61ZnnVJfyHr2LAYaY5Nb5WeevXyrZhos7BWqnlzmuRN1wqgEzwFv4sMMGCuSS8fzaDWTJVkPEqOnyD5YobXTwSdFlkZCKldMeyo77l3Fztk0JDvtMgyhZ2aN8JSGSjQrqMhmct+2kocLAVDgTRPrIVDJFI/zc07KTviPsgkSTehuUz5d3hfC3tiXcQnBNpGBmbM0V7TQKk3oFJPeshfRysweow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+cyXAf5gYwIvjSgrkGDos72kXYNBp43ml/8QyHo4xg=;
 b=wodbKuF1PU2L/Fkcu9759HwKyWxkgfrvYahVCekr2B+SGCRQlOirbmPW01ksr0PpKkHNjC/nWgGQqPCz0V4ja4DNp8uYCoS7CuqqDgQFX+bfvDYA0p0GeN/jDRTj5MDpurk0fUCzVOi7jatroXIZBKZQSx9GPoDtGGdXm6FQHHN6qbMVsIcKP+Ylrg+67c1GNWTw5d+VhZbSdQXjNp+vQAFzNdy+bNZgEjMpm2G8V5CLr14uc6FGEmh/+RlljvHJyqdM5j3/JiXljhOm0cg2v9g8S3GqXDbsujAqhDlMak4m/gfwW1r84yK/+sddQMUDQfC+OSX90Y2t+JFlSmnfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+cyXAf5gYwIvjSgrkGDos72kXYNBp43ml/8QyHo4xg=;
 b=VfUiqprfM4oeS8msoT0/b676T7nA+jE79WEk6WmoFsE5ZcBdPDrabhonpba4hyNL3ttMYvyIvKIXHJX46pGnwRBNe/qi6N/wVLlj3TrrMsQsC3IuQBmRqa0YMlhiizW2nQCJeJcJcxoxDN7XCT+vS5fidS72HkWEBdjSxbO8zNAWRR+2m2arIld73lQt3u7wREGtc/KlQCBRoupIMNk4k+dXRK15yESLyUhuYA6D/hILOXcFktRElqmnkc6BQl3lrhzWb8pgYDpQCrDDu1yNCfHb+VhfSq7ifdr+hTH5c+LVE4Tt86IWkL4My5U3tPowfTnEDcjucjk++wXjTwJxXQ==
Received: from MI3PEPF00004EA4.ITAP293.PROD.OUTLOOK.COM (2603:10a6:298:1::45a)
 by AM7PR10MB3287.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 16:34:35 +0000
Received: from MI3PEPF0000847E.eurprd02.prod.outlook.com (2603:10a6:298:1::65)
 by MI3PEPF00004EA4.outlook.office365.com (2603:10a6:298:1::45a) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.11 via Frontend Transport; Fri, 6 Nov 2026 16:34:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000847E.mail.protection.outlook.com (10.167.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:20 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:33 +0100
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
Subject: [PATCH v3 00/13] Update watchdogs support on STM32MP platforms
Date: Fri, 6 Nov 2026 17:34:16 +0100
Message-ID: <20261106163429.618392-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847E:EE_|AM7PR10MB3287:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee0078c-3e15-4de8-c9bd-08df3c23d776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|261021121427099003|261021123027099003|261009223027099003|261022075727099003|921020|261026121527099003|11063799006|10067099003|56012099006|6133799003|18002099003|261102123227099003|13003099007;
X-Microsoft-Antispam-Message-Info: 3vsNQoZPnWLLc/SY5vULKbKPdtnfhtGuJVQZV6pFWSkcPuV7YtFFUeChqMj7v4/H1pMqPpX1oQydNx8otftAUXt4qMZAv5hO4vSPjXCS4F15bTx4Sh5WrMzzzNBhaiu8PET31cyJ3rUiQASTp+NTpOoNh8hKQ16Vk52OlElWtFzKdLMs7AkftOFk4UVhW4Nlqc7AloGQlr4ZJF2egQgLYJlNexzG+4M42FxBQGB30gHBJTUwD6svptjLOHAr8IifsrNHG0Whyqna95GLDkl6qc6nR7pI+zszZWSohtofqgAKLY65Xejrw/jWH5h+96/N8ITS7IGW2Mf/qfoHtFpLXJOZKySWLZcUcjvi0uf6/QRuW8U0dvjK4akOE1e6SU8XzvxXY1ZgnSx/Th8RDoFSSN5OppiUtly/2r9XEpD1eEP8dlWFX096OOF0uFmSdycr59fUEn66ZHBxkE+i6Lbsz34/7wBB2A0xlmT2QbkoxDE47rJjrR0/UTQnQEQxFKD7HzSCeJvypZ/t0qQv9bPlaW+UCBjLDmIROQSRiSTKcAqiOcFq8ZC3YZA6c805nN+Brxva7luyopHDWdpNNZ8uS5+ozEr3vAmOtnNLXfkBQc1/yu1e8y+XgLVTL/P9r7B1Bjs5WuP7Ruq1HJKZnjlNxnAyXCb06ynyt2lKrMWnIFnGMnYyzibWcBnRyilJ4fObxq3/OXURdkdmtsZrLheZVA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(921020)(261026121527099003)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(261102123227099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4YQiaRDl+r6Z6bCdGY+dcLpsfv0S47B7w0AgMeDFBPekvO+fY4GbVh5qHFFWDF5sRD4FvWioY6OuC2cH3ZXr8nadZjrJ7cmtlwNjYVyqZDmFGClZLVLIJRxuD1ypX+8vFKNBriTQKBnuWX4LhTf6jTgEUEe6r0rTGnOQAfXpeh2uUmshpPMvJBIfBytNTORN6IgK1WlSBv1fGk84PhcMTt2iWiHwsaBBH+V317pdGzeof9rYzkkdpG4tztM8M9GefvtYy9zeR0qVob7dHMsT0AkL1euu29WjYTM/9lxKKE/0HqxDYSOiTzZ7/Sxw/BK1GA6WDUc5JbPYPHVZi3dLSITTJABPXItTHkIHPfhEPbRDBHT6GI4p2gEWHBVGBJZaNzd0xv92VlQyeZN/LFAnmfcszQ8GR8+ZE/8g39yFuOA1zZs0Ii69huF2/2W9hLEc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:34.5666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee0078c-3e15-4de8-c9bd-08df3c23d776
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083442_231934_B987E385 
X-CRM114-Status: GOOD (  13.88  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series allows the stm32_iwdg watchdog driver to determine
whether the watchdog is already running and adds support for
STM32MP2xx devices.

It also completes and rationalizes the configuration of secure and
non-secure watchdogs across STM32MP devices and ST boards.

For STM32MP1xx devices, it enables the ARM SMC watchdog driver in
the machine Kconfig.

Regards,
Antonio


Changes in v3:
- Add support for detecting watchdog running status
- Add pretimeout irq support on STM32MP2xx
- Build ARM SMC watchdog driver on STM32MP1xx
- Use ARM SMC watchdog on platforms that have secure IWDG1 and use the
  native stm32_iwdg driver when the IWDG1 is non-secure
- Add iwdg1 and iwdg2 nodes on STM32MP2xx platforms
- Add the alias in device trees to have the system watchdog allocated
  as watchdog0, independently from the probe order
- Link to v2: https://lore.kernel.org/lkml/20261015154826.1947492-1-antonio.borneo@foss.st.com/

Changes in v2:
- Drop addition of iwdg1 DT node, not needed as OP-TEE keep the watchdog
  secure on all boards;
- Link to v1: https://lore.kernel.org/lkml/20261007151358.1166329-1-antonio.borneo@foss.st.com/

Amelie Delaunay (3):
  ARM: dts: stm32: add iwdg1 node on stm32mp151 SoC
  ARM: dts: stm32: enable iwdg1 on stm32mp15x ST boards
  ARM: dts: stm32: enable arm smc watchdog on stm32mp15x scmi boards

Antonio Borneo (6):
  watchdog: stm32_iwdg: add pretimeout support for iwdg v4.0
  ARM: stm32: enable arm smc watchdog on stm32mp1xx
  ARM: dts: stm32: move arm smc watchdog to stm32mp151 SoC
  ARM: dts: stm32: add watchdog0 alias on ST stm32mp1xx boards
  arm64: dts: st: add iwdg1 and iwdg2 support to stm32mp231
  arm64: dts: st: enable iwdg2 on stm32mp2xx ST boards

Clément Le Goffic (4):
  watchdog: stm32_iwdg: get hardware version during probe
  watchdog: stm32_iwdg: detect whether the watchdog is running
  arm64: dts: st: add iwdg1 and iwdg2 support to stm32mp211
  arm64: dts: st: add iwdg1 and iwdg2 support to stm32mp251

 arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  1 +
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      |  4 +
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 16 ++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts |  9 +++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts |  9 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts |  9 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  6 ++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts |  9 +++
 .../arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi |  7 --
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts      |  1 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  6 ++
 arch/arm/mach-stm32/Kconfig                   |  2 +
 arch/arm64/boot/dts/st/stm32mp211.dtsi        | 20 +++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |  6 ++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 20 +++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     |  6 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 20 +++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     |  8 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  6 ++
 drivers/watchdog/stm32_iwdg.c                 | 73 ++++++++++++++-----
 20 files changed, 211 insertions(+), 27 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1


