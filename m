Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601C606A895
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iFDCoVmk;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=GLz28hvd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tkZgwWwxNLqBGFDVxeC7asC0zt7cBiaPXdrj3+yh4Q0=; b=iFDCoVmkF366c18i9lE0v3nWer
	jbdxA98stG8UiV0I5DVrSGFcWg1BWBfCYpnZqiif0bQJRGfQQZNkcwU1cWgY8TDuMXrMtxTQyPY/c
	O2CZucM0fnzXs/eLdQTZdhq7Q04GbDQONNh6A6/LjZPOdgp3eKX7yOtudeaJQNbWyASnZw65x0ilF
	DgPUejo4e7s3vq/KW+wHjc49K5Pw5iYkTIbf7mPfRtm+ri/dyfaVMIMZ618ENb1WsAbPu53OwmrP1
	tuQEso7W3GP3Eff00VxW4zJSn/5qjC4fCZegEaMEFyAw9bKgLeihwBBfN/MlzD/5MYYqULNckcbdK
	lR7McO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNyL-00000006lXa-07EJ;
	Tue, 17 Nov 2026 18:32:01 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNyI-00000006lVu-2CmA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:32:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTIqKRTQG9LDAbW5OYfa+X9J/Cey/QWtMutE/9EJgVL/ylOAkiYjASQjWF4qXMBzPOWYLqlXwLuFyX43//JIr5JhvaadX6XiAg4Ojeq1/Rsx0GwHYdZ+i7nnMbo7nAynkEijIZYZB7IRg7ua8Lkm+cPTJD5utydVTGuWmh6F9V+fqP1hr8Q4u3draxO5+QtTf+cQvui9SuWX8Hq/onJL7w2Ko4zrexDlgN+4/4Wvz1d+fJ0AxrIJkq9iFJWEDvIgS46ulJOrs1TaL7duBB8+iUNoNyHVR/a672U6rxH4pN85DzfwQ0l8/CCKAEGB7rFLXkGgkuX6hjjoO1VxNvTcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkZgwWwxNLqBGFDVxeC7asC0zt7cBiaPXdrj3+yh4Q0=;
 b=OMNMVeKOwdvvBOrVRXAeF8BXSibn4hRARhKcBwC6bJuwUBLiD1yfaKECEpdMCLzlVgmMEdoYhOy8VXnLRBpeJvURUoa6JBdUj3FHjG10RNTuuhuXhyr6tXirFtAnjuGabQJB7fLn+T2va7s9cpQWrm/tPnvf9S9b6uXWjO8dw0NIh1Ke2Wod99mz1ccLRqPdH6QqM479eW1WdNdSija6Tc9A14QsSHPzE0JgCsIENRucNLvc7ZV9kn3mOywpA3HHzd3a+RSP69YXznuecUBYTcMYO0ZNeYon4ydgb/EbWRCzHpgZEB4TRwofTuMY8sMEzA6wPIBr0Q92TDIKlUPMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkZgwWwxNLqBGFDVxeC7asC0zt7cBiaPXdrj3+yh4Q0=;
 b=GLz28hvdwTvekz+vlQd9JDTobfmYKS2SIMtNW5bfbRpjcqNTlZWKurRdAfUnB+nEY7n3GVh/QoipuvjBjtDHq8NTe8pJUAKleeP7SLU/oJqA5LmHO1p/6i9KNr+L0g7GJJHzIOMKn5svRM/1jcH8dqxj3yK795dWaR/43fU6Wm8nvvpcUJxdOqF2iGVNmHRV0G1PkCBsvxnysscd1GfosNs02pqqq0jcGDDTSuFrAdhnopTQKihclCHraOm6C/xEYDK5cgGd1LDjoBUwHFBx/lPReTyyhRLNu++IZ3CRGPSPvEvW5XnNQXo7g9YE/HkOnPEpm26c8EgDHmKfjDskQw==
Received: from AS9PR05CA0075.eurprd05.prod.outlook.com (2603:10a6:20b:499::35)
 by PA1PR10MB8931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 18:31:51 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:20b:499:cafe::57) by AS9PR05CA0075.outlook.office365.com
 (2603:10a6:20b:499::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 18:31:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 18:31:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 19:32:34 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 19:31:49 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 0/2] Add SCMI regulators description on STM32MP21
Date: Tue, 17 Nov 2026 19:28:44 +0100
Message-ID: <20261117183121.654286-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|PA1PR10MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb3692b-acf6-4f94-8230-08df44d90bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|6133799003|18002099003|261009223027099003|13003099007|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: /lwghVu4RwcTGdFYxOr4ibN+Y8mMydtxXKyCvXV8wsgg6BanYpt6ntTwQEtkyuUMlL++hTRmz2Y2KpfKbZ+t56Y90rO7oromNmD+HnPoUP5+3lOK7Kv7xbJ5dgFrVwKZjMW6jaMnbL91ej7ZQbjzN4ki5CTUACktTtwDgwAPS0gh8uCBhndITz41VKzTtXILpAn4jvp0BLUPY0AfPHYFocYNG7X3tpCaO7jJbGPP09wXZjVft7bKyL3saamjIOf8FW8BM+UK5XMSAUiWGRqZGNBrZi+O7XI+cXR2DHkthxi6CE/Z+50L4UaFnSZSHO2hvWGa2fjMsxxbZvRrUzttWDnUKp2y8wsOGA05lXDEDu5jo+oqnlMZb3qs29NIObSO8NpY5D95wZ4briMYPxJYh2r5BM39hyQqdO4obQj9X4IEXiYLCFiqzUYzjzkG3VPhfhMGfgjtJ4Lt8FfOR7NpTVfJqs3XczzKCC1QuNq1fraNMR5InXujYn7beIxmg3r2Yeo+X1bh+e8aFps+J9/BljcfCLUGYuVyUoGo7a2T4j/MtcKv5ZPIJXFnk003PSmmSAOpRCcL4l/PmFL8dGOIFuFY4vUp23QBEFvwkzQ0HQbki5GT8n1msMF0wmI1eEcsnEF8+RZQYJFpTI9NuyleFA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(261009223027099003)(13003099007)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: efNdZ7BYawIhkSvxeRj2XYeJ/GDAplH4SsbhsD2bsuT+VfkiKRNGH2D1at4w464WIqciYv98xaBUjxf/CzRvHJn/pT0Zz351VcUuE2peW0Y4LHcQBKjTi2dgX8Hw+/yWeIFOF9Tsrvf26RT+9sYLzzEYMEaC3WAYmK5baWWU3+Jb8naUQFFJRmWOJMpU6/C8hjHeS1dGliHGGBaJHwqzGYHdDRdnAq+BqSG0b8OljlsZDSKBcZvYKSv8cibBSP6CV86/spvYfNYvyM6vYk6VjTdcRclPeWjXiYFs8pbWBn9BhQl3EiXWgh2slzD/93D8hDTofNqGdRptYssvGEux3SXyfu3Bbnr/QYuYiWgOIXcigH/4yqI2687XE+eCYymi4wCSjNkRMkUhDEaRWOVLLstH56PpNzVMchMxxu7bv5DU05W5fDF+DhzxBkL5Mt8o
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:31:50.3485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb3692b-acf6-4f94-8230-08df44d90bb0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_103158_798618_47DEAC7B 
X-CRM114-Status: GOOD (  10.89  )
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


Add the description for SCMI regulators provided by OP-TEE firmware.
The file named "stm32mp21-regulator.h" is also used in the OP-TEE
firmware to have the same SCMI voltd identifiers.

V2 of series [1]

[1] Add SCMI regulators description on STM32MP21
    https://patchwork.kernel.org/series/1210600/

[2] [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
    https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid/

Changes in v2:
- Drop the initial patch [2]
  The mapping of which ID controls which physical SoC voltage rail or
  STPMIC1 channel is defined inside OP-TEE SCMI server configuration.
  It is not a part of device tree binding as pointed by Conor Dooley.

Patrick Delaunay (2):
  arm64: dts: st: add SCMI voltage domain regulators for STM32MP211
  arm64: dts: st: add SCMI regulators for stm32mp215f-dk board

 arch/arm64/boot/dts/st/stm32mp21-regulator.h | 48 ++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi       | 27 +++++++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts    | 23 ++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21-regulator.h

---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
branch: master

-- 
2.43.0


