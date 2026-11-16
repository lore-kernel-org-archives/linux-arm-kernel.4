Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oaGQWzjb;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mdSuIhYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QyIT9ea2crCZq4nvMjISfIJ7Ba8t6KJP8PuTr7jMDuA=; b=oaGQWzjbcfRwbtczizFXqiudXC
	oVYQqtw6j0cmc7VcHog7+7XaAE142ilxmZaCfsRWiV7528tzmSum6xmKxhjy9JoK6KkvffA52o9no
	xiWncYDF7gw7EfqlykEp3HUQfInm1DCfkF+ll/1aBluh2DHuBHu9GcVhNsVq3PWxxnKMqCxUzXJ7q
	ZkAyMWpH1wv+DPlOJUqgMB0y0kkLUpZYLwvcXLkIrcuMzU6hXeKy4TZhudIhL5s0/ysobDOuG0nND
	FsaUM3xpuOPZlYV/T5ZW/Ri9tp7e2lMLSbIy7hCXwXiDC6LpCjiwxNdqnu8qBS6u8I37zEMItyPvi
	DQUM8BAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStzz-00000001y81-2Zz2;
	Mon, 16 Nov 2026 10:31:43 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStzw-00000001y4S-2MqO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNswZrqbkBDNDcA0YKF6Y553Nta/NC790U8FzJYbcp5vfS92T30SyOxs+rV5+dwiASorvh5ajFl8aqKX1HVuRpcqMxiAZfUoKytETGaCR8E3X93JZVBGJHKWoNFCA/AeAZNwLT+ix3FVxmjfqcdrkdbSo9GHBh2Xv0DFNiYFKArqbMbA9AeiwE4EYARdQu9FMgom32dEHrxNr2QRgcVFi0xekrKCF4RAeepMSAcJ1d4MLHTSHCpfoW6GCvvl8Lr58wMVXKzNSnvWT01WxgJKRcqETCWHga9Q/TwZDjmFctU1yLs/JYV5kWXC8NTErwhWRNSuZfFyJFrS4BdJagzHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyIT9ea2crCZq4nvMjISfIJ7Ba8t6KJP8PuTr7jMDuA=;
 b=v6/clJw+QkMxjgKM2dngLc+CWiA2cOK8Plcv6/vWxy2WX9a2FPiZeeV5fV8yatgn1Crx5LmiJT2/VnsBO2Tdzr5hkE1QY5G4W8BDECMwjkUYe1d1uPms1Z7uyd8K/i433ighWDxoJ1jAY2jjypTyV25QzCG1Y7VXBCsiNOyKx1XVEhD4yyqPNV8zUcUZUIb3vDQQJb2j4VQwsE4mLN2EwatGBHo8T7WDYmsOSYT7tpIoxljLFaS0ADr8WJFOTyo0nih+F3RAmzkQvVQt+PmAkJp440wlZpspArAS2CPI8mUUgH6t1Lu2k1TwR6eGA8Eoz/0w02i4qUBZ5WnhYKn0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyIT9ea2crCZq4nvMjISfIJ7Ba8t6KJP8PuTr7jMDuA=;
 b=mdSuIhYKvYX7wYr5BihVCGBEK/tKBNRU08uI8u6N5OB3S0yjXJxHATXmOKtKI2cLpVrMPW+lk6hovMNf7xNQc7SGMcSW6cL9doA53Yc0tZ9GlFFq8ArpjwX+toa1NXEnSK/FuHoMkmS+zZ+zzPtno6dS5yQpMZUYrgKbyq1T50Mcuj5edOQYAxhSGjzbjZRSScOl6Cv+19gCZBPioqmMs0Cz51sqMlO5zCwuDqX7Fs37n4/tIVGDmb82BSy5QnRO1gZHJtZxlWmdnvpJ/KeOWg462Y0kzdX4sNv2U5Vso4CeyNMd8jRk959UH2ll74/n2PePdguZvn7w98m/IyApzw==
Received: from AS9PR04CA0092.eurprd04.prod.outlook.com (2603:10a6:20b:50e::6)
 by DB8PR10MB3148.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 10:31:34 +0000
Received: from CPH1EPF0000051C.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e:cafe::59) by AS9PR04CA0092.outlook.office365.com
 (2603:10a6:20b:50e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:31:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051C.mail.protection.outlook.com (10.167.241.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:31:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:32:33 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 11:31:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/3] arm64: dts: st: add gpio-delay for imx335 sensor
 control on stm32mp2x
Date: Mon, 16 Nov 2026 11:31:11 +0100
Message-ID: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/b+moC/yXMQQqDMBCF4avIrB1wEg3iVcRFjaOOECsZK4J49
 6Z1+T14/wXKUVihyS6IfIjKe02gPAM/v9aJUYZkMIVxRGRQ92BN2FDCaW2Fo5zIlr3zJZW1GyA
 dt8hp/kfb7rF++oX9/ivBfX8BIz5+XnYAAAA=
X-Change-ID: 20261112-stm32mp-imx335-fix-e3ec6c41486d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051C:EE_|DB8PR10MB3148:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0a3ecf-a979-4d11-a4ad-08df43ccc908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: yR+Xq2k2KjkaclyJtBx9LUhisq9TxtIWF0OMZtZvRSwIsduR0+R0LraVq63uCEmJdZPvrGEfmCmbDz33jixprZuUTLHaoywILZIj68eg8/gynvs+VrWAgCIJHIgAlytd9lep2nL5lzTcde1ear0zcyZMn+g76lacbrP4fn1dMA2b/AiLhxPc911LM5MF6zZNfmorzGg+NZdP48eBKoaB+v/xgWVmOEfzhr6mVEQn1YIJi3jn8V0e8C9ftj7+1Q6Zn2zx/kWCleZcr9WwA1673FaM9YoZHA4ncm4dBGaAMQxV3JD8gHnjyy+HCkYchSvwbk6dP1z9U/VLYkM8cQvloRQhGaYmTeoNozBV942Tr4Fd0A9w3nfgI5p9VVBp8J3F7EEtxFaT26nzQnH69RxXcCp0sjcQPf9WbuliteTP2T4lvWdDIUjkR8tMdCJwQoboGYWqqWIYCSmnfC2cRrAH+BH4BrrMywZsjtcNQCYq7x02z7Ok73c+r5RX071+jsATlpP6Y+WppgMfAnu5N1qbvYG5Fq9wyaAkiaJFRsBXtJqEkgX9ug3Pp3ZtcqsIbTsfZ+CbzMIKUxBO59Bj7HkH8rWm/IA3Ebsn1wDKDqb2EBlMmwntsfRXLay9siBv8Ep+VXCRs+N9nMWFy+P03Z21SbqOjq/8S3JUoxEwG3TqPr0iKP9fmleDiapGVv+UISJwTrhyYon7U22G6FbcnHo0Cg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a2fmcoFAAEo2yh2wy/BfBmU3glTEfj2BNHA37aoh1tNb3/5NaIJNVy2F0Ayk/PksA1+5LGNdxHIU8M9qNUtbbH01+A+E8xSJapkUNuFYC0XufOofbczabRKlYRbsv2C8KFg27yM8jyAMMlKUylJfUNUThIJmO3R7YuB8NIoViaEFsAjaWwnzeXiQs+/bconpGPnvB45nRS12S1GeADUj586IHg04g0tuSKCHtZPdKbW2rSlcyj6IoEnFoifER6bLSrksAMg1Yfwsl+9qTbyPZvAVnEvy8sydKKJq421uza/VaSsNpS6Tj0rHm4xT08ut/a3ejaUvY9zPze4tIcrbiFjMApU5J6LQtVKetSbY+H3yUdMl1qgx+h34/9/kyMIH3wTuF+rgG84Pv+cOv6kNeiTbdnKZaAR63wVkKIc7IlmktrZQ8PNCuFK0aSxAtSnm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:31:33.4191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0a3ecf-a979-4d11-a4ad-08df43ccc908
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_023140_946856_C7B8D1DB 
X-CRM114-Status: UNSURE (   6.94  )
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

The IMX335 sensor used on stm32mp2x boards has its reset line connected
to an RC, leading to the need for an additional delay when controlling
the sensor.
Add a gpio-delay node for this reset line in order to cop with that.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (3):
      arm64: dts: st: add delay on imx335 reset gpio on stm32mp257f-dk
      arm64: dts: st: add delay on imx335 reset gpio on stm32mp257f-ev1
      arm64: dts: st: add delay on imx335 reset gpio on stm32mp235f-dk

 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 9 ++++++++-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 9 ++++++++-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 9 ++++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 3cebbcae3ae383e63f62cd033a2b14a9140e0eb9
change-id: 20261112-stm32mp-imx335-fix-e3ec6c41486d

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>


