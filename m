Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58033606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stDUW0iF;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Y2XnYP4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cAFJj8dj4fkxLjDokyHftq68b053Xdzi0Nqa8ddH0EU=; b=stDUW0iFMOA0LG
	IiRLLKR4YvXPJ+hw4cx9MgVEhFwAN1+325P5ZQ77HVfWKzSUDWBIolNgG0ujucrdmUPPp1T2xXabQ
	4Tu/NyPEsJUufxfq0VVOn9Hnz58WxKWYx4xDkiHGxSD+qpKIRKf8iGHiailcb05pZTadvBmLvW4nj
	D3OuSKOt3ltaMz7JXT/lkX9Q+FnEM5OWP76gFxEw+zdsEAyMRVNL24e/2J4VtlzN6LTGzZpg5EMFH
	zm4lPzJV+ptM3A6D/QlV40O6/N8rtzz4xhbOm+HHhHiLMC8zIyEop9n5Gt21ldTB8OawC2xR7TylT
	PHPp0eYluKPnfn2Y2FVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLz4-0000000CqJQ-49pz;
	Fri, 06 Nov 2026 15:36:07 +0000
Received: from mail-francesouthazon11011016.outbound.protection.outlook.com ([40.107.130.16] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLyz-0000000CqEM-2JVA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGpxrRtV+Uu0/GNHxRvEqxGXyAV7oNUKsVM4Bor+PE7koorLTMrOLT2n7oiyI/Kf9pE3mJzjAFSRwR5oZ23MUKbpbdriQxC9eaaVCRmGhnfp74iOj2mp+gsW+zjEaluSNRj+IRS2Iwpn/32S4sTcp/DjK7q6loNRRNufENFKoosgH09fSRwV3Dd8H+TYZi2kPINpXscVzLPDHQWjtRrdKd+Wa1RzHAWa+skLMsrpqhvYkUtDg6Y2CNmE948ZxgoDKFL8Dlv9tpEeRJ4qT4GfKoGRx7BSo0haL1XgMHCnDDv1TWk4jAmwRJ2G85f1CaCL0Xe0uf11wctGbrMzy7mH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAFJj8dj4fkxLjDokyHftq68b053Xdzi0Nqa8ddH0EU=;
 b=TXr+e5mmQ+f+4uxkIheLYiBctlTB2ttQRGNd9gfGpJ63as9DpXhnVvfYtacFjZ5FEvOhDx3PQKB3TzO7NEUW2vdRopx6Rsa2Q87pz3V1t7/wFXZZszzksAVSIWFtY8+ph9ZsDqM2yahssnkTzSiXr4+8ZqfIlttex08dmJRHbB8eHMLdTqpmms6nmWnPsaJmUEgH4mMxAbRJATQJNqXF7z8C5iMNmJYHdUXrgItvKErHMBpN7fPSTIuUMFyiDpecnAWXcZAjMlwKD+kemsJNMEnk40VUG5KhpqT1wesmIeWawLMlWOrsgKrGeED+Saexf826nEyADQo+Xn1CCrin/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAFJj8dj4fkxLjDokyHftq68b053Xdzi0Nqa8ddH0EU=;
 b=Y2XnYP4Ha3i1XNbjMHGUCHy9NouoM6Brs0RiaW0z1BiACjCOWvRR0mA0AGqC+Rn9UO7YpgaBelGV2Yp0xMbD8DS210LHLmnHzH2jkvFoC/tozmcKlIfk5ieVnFM9LeSYoa+oodv+FcNgPYKui5/7NUeFYnb0S4iOUD0LHvBhZIrpiq2V3ceyDn4umOqO3FhGuNA7pDhDcbJXuA/3UUQlkY7UZVOv0Pl83Xvasks5eczoHgyeR1nECeaTgig0fDiXkGvZnqKYV/zxJjYUqxM7wFV6y/NvY5keozeKuaRDJq4B/Nf/6Y1VNjxu2jEkPrrad/cLkMLMM8M9WakAIhASGQ==
Received: from PAZP264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:122::7)
 by DU0PR10MB6931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:416::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:55 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:102:122:cafe::61) by PAZP264CA0020.outlook.office365.com
 (2603:10a6:102:122::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:25 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:54 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:37 +0100
Subject: [PATCH v3 8/8] dt-bindings: stm32: use reference manual names for
 ETR and STM bus clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v3-8-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=2111;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=Pl+ebgHzWLJCS7orqKlES0wzOu+BmanxxWyCyk4owPw=;
 b=utqIMbEnZmQPQpZT7bpK4YDOvwic64/sKHwuo2CNFeUTEAZGVsAH9oKbFSaKoq/TWdEdVu3If
 lTNAYMvlAYFBXGiUe+RMQDzNeBuXuigEuFnUeZUNqpJLvW3ttW4uNgz
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|DU0PR10MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 271185f1-caa7-4e59-a184-08df3c1ba598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261102123227099003|261009223027099003|261021123027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: zDmO4dwY9P/ARjjaswtoN7M+zGIgaXZeOglXfIHhL2rILkpwC9GoiBBPGGEwjowF0c7HVCmbBRC1oQyb2nBNuZ6qR849MZSIlsaeM2QhLjTcRGAocvsFXrEHMdkQj+kMG0O62IBdShjt3LWKKZ4C6n2PRSKT1/HnSW0a48qbTGG80fhz3uxAbExVGOA4yk1ZKCJpLOm6ilauK9Q9GtLvha7bdo2NbuMj4M1eQdlhnZU3eNyvu/i5c9LwOmXZL64g8KVcj1QLFdoChpxtrLNoaabhjdv3jvSOIP/QHCPZXI045ldAZr0fdJ8YbZeJLnp+xTmbUuGrweIvwLKzXGqYQ/gYRurU3Si1OGMdnsn2j1tZ45fiOv/6PoL4WPTiI36nNtUWLgVsfAkhFGhBTFWKny5O+bXjjd5pPFf5ZgLqlI7OjwIWbPH23dFGiiHRmrs4pd380OCdySJssA3xkSwYUrVdLC/Fq0thz7nC9F8SVjMzYPwLuRyZyT55A3AVuM3hPRjw+mbQ9Q1T4tAk4T/MgYilahz5ab8IbNiG2AaVFsbPvHNuoY1XcS5Y+eyuPN25iJuYiyCILYEwxF9Pl94Y58S+bUnDVcxVSS8eNG+yfff+D0vfQzu6Kiae/V/YNv6J3mrGDhOweOVT9r4ZIL7RiniZEq4vICpm5W2os5CPX+fehSqE5Kp/LsbEU6Iun1Jc8Hz1KdHT3za4S4RaafKvfg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261021123027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K0GVd4poNC5LNoh5wBkP5yj+336V4LrNTGeGtLIxJZLDKuY+s8cyKcRzwbV98kKRt3cztvsAuBtjBjwUuzpSTqXsPk7jqxSJJ1hLEZeoFXYLmatqfJmCrB4iNfCLD2bJwwdq2QLcH+kKE0pjCRTo/dNoyoV5F83W8E1vgAJ12tEzHjNL6d/DoBC5cnrhXycuiidEXn8QN7u+exq/nw0lb9Sz0gVRtf7Ra0C7i6r3TqucJwTC8GMrSz3HdmeMaRjXzdYyIbpKW0H/L+Z7RsKWNB7mD7/f/qYL9vjrYQom7ueAEwCkraHZeQbAhxOf0DkCkHVvBN3esaQ1t/tCudAsSz2y7sKuJ8iPmyhmvWLUI7/X47/Vb4SXTGIhbbqIfRNk9qXXIXAtoAbP7zqSGCX8vU5/NCBDTJFNsnMRM2jqp+WPGaJARDNpVbTwn/SvGrhy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:54.9604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 271185f1-caa7-4e59-a184-08df3c1ba598
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073601_616336_A61E92A2 
X-CRM114-Status: GOOD (  10.22  )
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

The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
ETR is already CK_BUS_ETR, these names are confusing. They also differ
from the reference manual and from the STM32MP21 binding, which uses
CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.

Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
values, and keep the old names as deprecated aliases so that the
existing users are not affected.

No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 166b4fa1ac2e..c05a4995e0cb 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -109,7 +109,7 @@
 /* LOW SPEED MCU CLOCK */
 #define CK_ICN_LS_MCU		88
 
-#define CK_BUS_STM500		89
+#define CK_BUS_STM		89
 #define CK_BUS_FMC		90
 #define CK_BUS_GPU		91
 #define CK_BUS_ETH1		92
@@ -481,7 +481,7 @@
 #define CK_SCMI_TIMG2		83
 #define CK_SCMI_BKPSRAM		84
 #define CK_SCMI_BSEC		85
-#define CK_SCMI_ETR		87
+#define CK_SCMI_BUS_ETR		87
 #define CK_SCMI_FMC		88
 #define CK_SCMI_GPIOA		89
 #define CK_SCMI_GPIOB		90
@@ -516,7 +516,7 @@
 #define CK_SCMI_SYSDBG		119
 #define CK_SCMI_SYSATB		120
 #define CK_SCMI_TSDBG		121
-#define CK_SCMI_STM500		122
+#define CK_SCMI_BUS_STM		122
 #define CK_SCMI_KER_STM		123
 #define CK_SCMI_KER_ETR		124
 #define CK_SCMI_HSI_KER_ON	125
@@ -527,4 +527,9 @@
 #define CK_SCMI_LPDMA_AM	130
 #define CK_SCMI_RTC_AM		131
 
+/* Deprecated identifiers, kept for backward compatibility */
+#define CK_BUS_STM500		CK_BUS_STM
+#define CK_SCMI_ETR		CK_SCMI_BUS_ETR
+#define CK_SCMI_STM500		CK_SCMI_BUS_STM
+
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0


