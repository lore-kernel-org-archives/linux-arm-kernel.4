Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntf9t2OJ;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SepjYy6X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AQx41P30RpB5UyfLvCsV2knE3MPPBlmTTuQPtkbGIMc=; b=ntf9t2OJTPrTnxgwkWwiJHErMk
	zGVBOXGJzo6eEA12tiqWC7DKMFAN8Ayl9v1lvY88jV01PkY+lHvA5uZPKEz3/EMj5OgupEqROjM5T
	DUQchK5+CiywSv3MuMxp3jmBIHI7PIZ5dV3ql2e+nx1sZ+/n5gNRVof34NobGHlYHc4BuGPdxdTDr
	5hxyCPCZg6s8DELMPPHPDyk/Pj1EOqCAANJofHqvIyv+KDhoHuxk4cK7IqMiNLN4tZgfsdHnwwaww
	Co/p5KJYcheOhSiAqbr5WjGM/ptTkO7ghWG3OGet+cSEQ+K4MCSfC1Z4OFrTsE1nIC7IgHcVi6rWK
	Tam/ZacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs96-0000000D7f2-2U61;
	Fri, 13 Nov 2026 14:20:52 +0000
Received: from mail-francesouthazon11011006.outbound.protection.outlook.com ([40.107.130.6] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs93-0000000D7b9-3nI7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqvQEd5U0WI21eKN2VFBjNSpnlvNE1qRT6krN+v41K840RY3HAFgG2gHGY1U0jABIWaH17wyEHWlHCUCubqZYi+IWag2qRxZZyf6Pz9Y9EuioItzMJ0hKkMTY7qGsnuPtNFXLPBNm1pAg3wPjXGsqzvHWIirh1deZf9rzL8Q3LgbPm9N+G9xn0kgE6LL5VwWcMNXRfcJWAsklZH+5dFhLu7d/d6gjcNhWXOdZ/IdSRtT4Qca9L6a8SyHT9XFhVQ0GrtuLreFGKvd2MUnGIgeV6MjOMo5EApgcG7ictNa3pDOpW4t8ThCqGui4fFcZUGl3Ue8gTnx6ib6QtiIPTOD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQx41P30RpB5UyfLvCsV2knE3MPPBlmTTuQPtkbGIMc=;
 b=fDzZjvIFusHfyUGFxU+78J5pSaok8UZ93TdDHU/gBxhx3N73VxE83AByBt2aBZ7ojKOJRcw5rjQA8ZaUJRKOAsbMxRWVJrv2irZlsBz65kI3MoYt+BiD/C+JuyG+Vn+BAtHPk+5O1uyPiPo23ia7tDCO7rzEHKLixLbRGfFLz+PlPLkgzmunqn2fMUS98cykNvlhxnWfapt+CWuGSVwtt8T+nD59WyI0Xu5SfzSMu2aaiQmysOeVU2Zun0+BXmDCbc4E2ujtR7eJsfce3iNStPriRp00B/kiTdB++zgYtSoFFG1sksYr+ipS3w42d4BJCWCv7rE2OZV6uQ92T+Q6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQx41P30RpB5UyfLvCsV2knE3MPPBlmTTuQPtkbGIMc=;
 b=SepjYy6Xr6fi0t71TL63cSBHb/HkQ1WMMaN3XfU1ivkqFB33rNJYgSG5jXI35epeJORLreVS/vOzVUCLlp4oi22pqWmauDFzQBVhVgZCJKGB2ip/xnuv/g7qghgsUAwbrCRFhhnM/e4fZ/502R8uGuMl7BxgALqVmsAvwUWhnF2uyCxzuuiTHn/Gr9ENofSWDX8j2GEr+n+DoDxAJAQMLVEN1C3RWfYXitlq/Cs3Qws22NP/cJIilpGrDPJapaO9J4/gw/PIJxKUeed3fgHUfecOacEI1WK4XZ92WfnrGTBDJxCx4bXwZashSmLniAp2CAjbgXRUSLQ+4KkxwMhINw==
Received: from DUZPR01CA0153.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::6) by AS8PR10MB7859.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:633::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Fri, 13 Nov
 2026 14:20:33 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::58) by DUZPR01CA0153.outlook.office365.com
 (2603:10a6:10:4bd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 14:20:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:20:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 15:21:30 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 13 Nov
 2026 15:20:31 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
Date: Fri, 13 Nov 2026 15:10:39 +0100
Message-ID: <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|AS8PR10MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: f59e27da-2886-432e-bc80-08df419146d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261021123027099003|261026121527099003|261026140227099003|261021135927099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: srIohjV3hOEZgV8w7EMzs2LUpKR7wApgVsKiBAmuCuMRbc0hcJ6ZLFZkOn4wF7gwn3QGvQDPVADaiLKlP9xrjs8ws4DPpej6tA86+UrqerJGnoB+wN8dIgourMb3QlGJ/rqWj5Qx2htH4UBui52fpgHBwQ8p0EYFmQ1bmktoG1G/f5qPIDeNAeJRc4t5Zq3ccD6gOt3Fa+vp0fJ6yofSr67wFWhZUw2+RXY0mFji4BDJ/s/nRS3dvyN0pJnuxIgu2kSnB5zLszmqLTt+EKxT7Vojb1Ig4SFrVla7neXzWnf7qRw2yauLv2ug/F9N778azSpAr0CliOEgXeOFEvA6Tfi8lqf7V44+5X7nLxpu55F76JQWBKCPk2JrAW73OvGRBKYdXf7WzzBXK8lEFBzibjZEH1LTJQNEUPcrPcOxsjHJznRUcD2o4g8KEXy6E4OiFOIFf5WFycqestLgHsrH8p3UYvisf3+WTq5J9uyj7JiDx6JCiQ6MGpWPczPmNUJaYzSp6zamK2szHosF0pK/U2iXE/gOyI4Wj2syBhS2iCLgcMXRS7wukttpmXYS59MvTYTxQ0V9/TvTwE9BpON66Rg8od1BZyTJpSwPintZdHgTNgIcXScFh0MdDN3hSO/pCVSjrs+zrIuVmnoBmYIfmuO6gaDtAwh1YRkwYlGxRWw7Cy3G9/LmldzQvYTTtLN1vXcJ4pYhbFCh+UhuNBZPGw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3qZlnAkI6xO2DcIEcCsdmhgvuRLNYxIwc+mDP0MOnej2AW3UWFS2eHLbiDZtVhLkGxo4zrtpOE8e1J2el9EMuEF+XAYrFHnzz7Ie7CD3yY6S4+3dLAk79oSanREnTcRd4F3YLnjQg5VN1iFvfl68xbsqx+TaMwR2za1gp0iCzRR+VE3/d6nu2pnmcJ+wm36mDojJsfuGLcrN3117eL3e0GwE3Fb+axUKBEgs17GbZuT6+lpbEvfj7M2ixcOhi9ZOusiqRjDmV54ZI6kieatyW4r2PZr3kAbaWOyXEov/W7Kae0eQ4tT7KecYukzrcqhYM701t6FjQZ9nky+yDxHf+JpE7sP2IPeF7tgx0tsPyfr14eCpyC1VFHd8DWDeJ2gD5D7bWjFL0lyY6KsBiFxeAOSEeTY3HX77OGR/2QvcIua0S2tCne2nfKGIpPjHrRQw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:20:32.3326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59e27da-2886-432e-bc80-08df419146d8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062050_287284_FE5BBC38 
X-CRM114-Status: GOOD (  11.33  )
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

These bindings will be used for the SCMI voltage domain.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../regulator/st,stm32mp21-regulator.h        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/regulator/st,stm32mp21-regulator.h

diff --git a/include/dt-bindings/regulator/st,stm32mp21-regulator.h b/include/dt-bindings/regulator/st,stm32mp21-regulator.h
new file mode 100644
index 000000000000..fcafcfb6dc54
--- /dev/null
+++ b/include/dt-bindings/regulator/st,stm32mp21-regulator.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H
+#define __DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H
+
+/* SCMI voltage domains identifiers */
+
+/* SOC Internal regulators */
+#define VOLTD_SCMI_VDDIO1		0
+#define VOLTD_SCMI_VDDIO2		1
+#define VOLTD_SCMI_VDDIO3		2
+#define VOLTD_SCMI_ADC			3
+#define VOLTD_SCMI_VREFBUF		4
+
+/* STPMIC regulators (STPMIC25/STM32MP2L/STPMIC1L) */
+#define VOLTD_SCMI_STPMIC_BUCK1		5
+#define VOLTD_SCMI_STPMIC_BUCK2		6
+#define VOLTD_SCMI_STPMIC_BUCK3		7
+#define VOLTD_SCMI_STPMIC_BUCK4		8
+#define VOLTD_SCMI_STPMIC_BUCK5		9
+#define VOLTD_SCMI_STPMIC_BUCK6		10
+#define VOLTD_SCMI_STPMIC_BUCK7		11
+#define VOLTD_SCMI_STPMIC_LDO1		12
+#define VOLTD_SCMI_STPMIC_LDO2		13
+#define VOLTD_SCMI_STPMIC_LDO3		14
+#define VOLTD_SCMI_STPMIC_LDO4		15
+#define VOLTD_SCMI_STPMIC_LDO5		16
+#define VOLTD_SCMI_STPMIC_LDO6		17
+#define VOLTD_SCMI_STPMIC_LDO7		18
+#define VOLTD_SCMI_STPMIC_LDO8		19
+#define VOLTD_SCMI_STPMIC_REFDDR	20
+#define VOLTD_SCMI_STPMIC_GPO1		21
+#define VOLTD_SCMI_STPMIC_GPO2		22
+#define VOLTD_SCMI_STPMIC_GPO3		23
+#define VOLTD_SCMI_STPMIC_GPO4		24
+#define VOLTD_SCMI_STPMIC_GPO5		25
+
+/* External regulators */
+#define VOLTD_SCMI_REGU0		26
+#define VOLTD_SCMI_REGU1		27
+#define VOLTD_SCMI_REGU2		28
+#define VOLTD_SCMI_REGU3		29
+#define VOLTD_SCMI_REGU4		30
+
+#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H */
-- 
2.43.0


