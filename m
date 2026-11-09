Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE41606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QzvS+ZHC;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=hDFpMX/p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lasDUDTx6FUQUH/GLVbxxu7IlHIU0qVp5B5EecGqDfE=; b=QzvS+ZHC8PhbQs
	qnE9HlMuOyCA2YQJxg6e8OWfQdcVvy9wJYRQo5a38t37qVoD74uI/9+37z3Jc8FpaKeMjg7cFG7Ro
	SP5CuNf/jSLQOZ1KgDcyBYmkXWerQPssYpe1lvVdcuzsjiOpIn+M3fwxyEOS1c5Yu7fUQZpMp/ie5
	CGeTFOUYO2Io9JNyhN/PIb1JssJR7zuQdmE3fUf84fTis+KrixevqJKktYYn9kLtwO/sfdv0O0CWa
	cPjLOBxeVDuG15OAhRiP89CHdYTwBlXKsCmhCQnvvCgzJ3qo88/n/KAI7AUNbDfEzNKaO9oP3pPfF
	lM8wdp7szosh8zc3J2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSC8-00000001BuW-2rsr;
	Mon, 09 Nov 2026 16:26:08 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSBv-00000001Bp2-3oax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:26:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WisJzk9Ob2ekaMeDGdd+MPb3dt45umdhkwzHLjilzzilNt9GVvBmP4Wn0s68GbEz7cF+tzk3mcaEpxp1PS0dzFyGPZ/XZtGmRUhLfZZna70DMKZ4iensm81tIn470FjaQMPo9cZz2v/eHryejCDdqM/3oACVDrA/SkIJU0C89qKc6xklx+XoOp4+GzYQe2qDrRSg8ZUfMc02sI9gYlJDxu2K35f9wdpEaibJiZuzUWYmZdTMSqbRvm8uUVYb4WE3eI9WNLLCRoOQb8Av/dZjeVzKbr6SZtrDM3T6VgDt84ECXNFJH1PjLZWbevjwuJ13Ic0Q6XMQMMAI8u8UudpgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lasDUDTx6FUQUH/GLVbxxu7IlHIU0qVp5B5EecGqDfE=;
 b=fKrXHkDeBlUznPLB5JkPSK+yLK105mJozxNUbcxPx08Co9lYkyWEN/cODpCYUKtMQnlZE323ZaEagfYE6Gpb30mmYz8GDIfI7zWWc0mmO0M3AcaGUZBUbWKqErbbeumIbtEfX9zpnBzEjMRpH/WPs19xYXFQma0bfdzxhrqh0cs2/LbsT/ksIb81Php65owYLFfp7xmILtPdhjipOQKwiJTUwxeM3Eium9VDF2kAiFE8BhM6JUrn644iMqnOUgcLm0B8Nz1hLjQqyXV1/ei+urTCcAtfljI1v2GMrKhMX1Tz6m1EKueVQlDTQOHJBWKryUlFqrwZrVpfaBPh7/OSXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lasDUDTx6FUQUH/GLVbxxu7IlHIU0qVp5B5EecGqDfE=;
 b=hDFpMX/pUZwLt7srXyEGUQfBRz4jIRgyDYODcB5NLOHn7OAbSBBhlXnJPDmsMH422zGuE84gReBO4a2557dVaZVp0mBwzknuCye6K4vRymo29cF6NzKxCNCiYUJ3Ntf0G1pMjXonTXiZieT24faS16ch1n4ZrKyYmBbxcmfCKEjOpIAFh8bkaf0tKBKNy9whFYBZckA/F5KngcQwH+atInB9hgwIpHeidVvwAuGYdpxbj00dzoIugELimLN/bp0TvjdFvJcEMDPpHqM5dS+n15DzOT14cGIxlu6zdbTV2kyzbLGFA5P/jJgcejpONGOd8Ax+a8MOofEgGNjNKORXaQ==
Received: from GV3P280CA0010.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::11) by
 GVXPR10MB8842.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.7; Mon, 9 Nov 2026 16:25:50 +0000
Received: from WA1PEPF000099D3.eurprd04.prod.outlook.com
 (2603:10a6:150:b:cafe::2) by GV3P280CA0010.outlook.office365.com
 (2603:10a6:150:b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 16:25:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099D3.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 16:25:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 17:26:29 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 17:25:48 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon, 9 Nov 2026 17:25:05 +0100
Subject: [PATCH 3/4] ARM: dts: stm32: use hex reg for timer2 on
 stm32mp15xx-dhcom-overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-timer-use-hex-unit-addr-v1-3-b4abfa457adb@foss.st.com>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?=
	<goran.radni@gmail.com>, =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D3:EE_|GVXPR10MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 8644f3b9-de54-4e54-67bd-08df3e7e1dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|261009223027099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|11063799006|56012099006|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Kdgcie7xyY2cBfzZ7yNZUKU4ibLqkD4vJzisKnbdvHPsWIhWK42VnqY3IDyAV6T0f9atSHp/dd6e3jf/QckT/PZvP8qwN91Y9t9QscOMPI/whrhn1k8tz7cAlnrl8GXgYUMeVbaCbZixrDgHNkOMblRgi2KK3ZdLg2skkc395H/er5lfNnCOnDrcnpag/Ol2xiZtdsEFvejLmrQ/AhUOxUWL4HWD9UKC8PWxty5ry9XcarceZw6rLd65atSwbTLS8fcFYAGqu8lQi01eYOlcwD28RvauGaSrtTBHRG6CSCiMy+FHht5u1JnzELZFuE+QP5DbFSxePZ/bn0b0OdzX6iiPW4cTPd/tzLxa+edwbznTMmytiOCVcHP+/LUpBNQ9+qKyyTvSsqopCQH5SYBFY2K8SFOeJxTcdWmpCMYQAu8rcfX5eBC7K6fwBElciHP6BEjZ0zr/iSnTh45vM7SxxSoLkMtaljZ2NjPIXtsMXQmsTPnwPJS3Daweda61He6uTDGZT3MRI3cN4RwO4E1Msih5/9jOYRCF05etscGN4UhymsGdy2AMkDOyAMBhXcKX+wEkbSLj4RQo4JMGPsIITK0S7+67toeudxMQSj56o7bJq+BEY/e2E0gZq883vM6vkps+nu3d4qB4CIVpkm7waoeA2gJMPMW9TgZ7ySfl8Dg=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(261009223027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(11063799006)(56012099006)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d8RRbKV0Z2x+mYO778nKuxszzZ+g5p9NhYpvDFkG+DAfpIu4LaXcOjsVkxdw1PXMHyYX0fLPrad/9ZGr2t5GPSoh05L3GWpCYW30Pu7gJ+5FCac6oTPP3a6JCyM6aOXsEIj6nGwzu2rhlF8CEOEKff1V1Xl2JIAXDPeYPiYcwA+mMYZOCpTFi5D0FJl7aCE0bPDjfyowJrKkjECg68uxfVYYMw9ey2ZSGYE8elMEPZ25ZE4FZI/tG1cEtly+976brAVRhXef3x8w/rNaFyH9coFKUzVpNE1qAg6QVveBge8OiwCbiMvKbR14jVcmGlMS0kdy3DTwQ0CTkrGjHey4WU/P3Zv4rtvLla0dnb5Oy061R+SyI8cuPjZx9eTFkAtRkQWcFhiDT92puDWeW4G6LIuZenqwFzumooD7tGpchX1Pu1UfukB0470JJ79qcsqJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:25:49.7717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8644f3b9-de54-4e54-67bd-08df3e7e1dec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8842
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082555_956286_EC301777 
X-CRM114-Status: GOOD (  11.82  )
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

Use hexadecimal format for reg property. This has been raised since
("dt-bindings: Use hex unit address patterns"). The SoC dtsi file has
been updated to adopt hex for unit addresses and reg properties. So
update reg property in stm32mp15xx-dhcom-overlay too.

Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
index 41229ec680cc..e9a58a8ea61e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
@@ -56,7 +56,7 @@ pwm2: pwm {
 	};
 
 	timer@1 {
-		reg = <1>;
+		reg = <0x1>;
 		status = "okay";
 	};
 };

-- 
2.43.0


