Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EF606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dnxVKSrz;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=e/g1Vv+L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EbPXtlFO9qrxOCa4QWMaZZUwVtFe2LSS43r2h5XmiGg=; b=dnxVKSrz1zPgIwZ6xPzRdxP5nm
	vb525G4oDR99Eq8EGnZur1+hUvgmj/x/eqQ3Xw08mjZsw8dRq00m/6dMe2iRUtT4me52E/ELJejsU
	77olWWMxZkzk+xyaZzCnGrxRw+idI5AUtGvxi81D8DU/5kNuk/+rlchViipAHHsyvjDCkQLbQHfwW
	RETYhdettqKmgBcAnxASmqWSjDuaRKcwoWDjdR67f3Q337kYBDHgdY5mGud3YGEUbVzU25vVhaYoP
	pE8BLUvrHoxceWsLHYr5FKetPEGN6T+g6JqX4RRr6ZGw+X9TygRZQqxS2fyrs0fvqh4N2/KG/fu3m
	dvCqK+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv11-00000002ChL-2Ddv;
	Mon, 16 Nov 2026 11:36:51 +0000
Received: from mail-francecentralazon11013052.outbound.protection.outlook.com ([40.107.162.52] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv0y-00000002Cfj-0RLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:36:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWkQSUqnfcuKFdktFATmn8uDOm9yBguhlQrxaGNRrGSfRHRF/6NRqzO+MTK6u2ZlpVqYWngSsKP2PHQ/ECyRXdrDj+R/8nVVgBGuqXiffAmxZWp14R+IqoW8nuXEqOw9W4Y5K61okwLRYXRVZdgKGd4qSw768bpEQRhsZxFOchnjmzRqyKBb5Uv+0OvS5j+pELq2ASQ+xWNd+NBA8oZHciQWvkNa3yyr6eFPmGuTGQZ3iaeZnxMwvFLsiAqoTWKk6que1MYdKeWf2IIfHA/TASaz7sWS5PdVj3JDWuKoN8tv5rKDSL4kHvcA1xm5UKL1Jgv32f3nrim7E4SJsD7rlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbPXtlFO9qrxOCa4QWMaZZUwVtFe2LSS43r2h5XmiGg=;
 b=jGZN5qPXLBk/LXhmscP7q9IFFQCaVpScifHRX4YkS2QiI50jCOnkPGgop+kbYY81RfBN0IFoL7DVQ54/q6eMUH65T+Z+KDznbX7LR+IqlH+GDbiITwvhyqEh0afeDPNTUk4AIVBF1f9rY8FGwSK9gG41FgrntI1ndrodmfJSjG3QQKPqVBmpqFL+NzvxlOnG+MN7yQFTz3P8Y3r6OF7+DVgEbbrzi1FsJByGRXj2iFyxqCcVmaTGbZASH29PiUTpq9QJZqRIhYUQ4orVElpCF3/DjCoxUDD6ZsToP+LDa5LZU4GaMrQZFZ59jBnn0XeASIY2vcmGpzxB+m1JiSxvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbPXtlFO9qrxOCa4QWMaZZUwVtFe2LSS43r2h5XmiGg=;
 b=e/g1Vv+L9DLsg2WhspyNYLIJC428/ZjxQvvYs1R8HC1hXBhsVSE1fGg7mEMmQ/v7uiPuWiRTbCtn+Hts0LCXLJtMsTlAhn6a0RGKTZ6gaikagiMFYEqNE0FP2A5ykGvIIRTDMIi0sE1DDRvZrvR/8zStQGyWG9cq72xMdMYsclYbauDexBiVInulbkb7IW3nYfbkwHUUzZDqO6BEuNsgmzE5l2ErHYVjBAl4tZwVF03bl8J/J7GmU6wwBy71LRuMYb1zfC3Hvfhsts+SoGg1lmenVizVrWcfs95JYv5C9of4xJ1kU5l2O2JFgylq5LOikdV/suL1vqPtTGChTPNX2w==
Received: from DU2PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:10:234::33)
 by DU0PR10MB6753.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:47a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Mon, 16 Nov
 2026 11:36:39 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::a8) by DU2PR04CA0058.outlook.office365.com
 (2603:10a6:10:234::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 11:36:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:36:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 12:37:22 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 12:36:38 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v2 0/3] arm64: dts: st: add gpio-delay for imx335 sensor
 control on stm32mp2x
Date: Mon, 16 Nov 2026 12:36:00 +0100
Message-ID: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDq+moC/22NQQ6DIBREr2JYF8MHJaar3qNx0eKn0gQxfEpsj
 Hcv2nTX5ZvMzFsZYXRI7FytLGJ25MJUQJ4qZsbb9EDuhsJMCqkBQHJKXkk/c+cXpVpu3cJRodG
 mgabTAyvDOWKJj9Nr/2V63Z9o0v60N0ZHKcT3Yc2w934C/U+QgQsuwLaqk1pYIS42ENWUahM86
 7dt+wCohw/gyAAAAA==
X-Change-ID: 20261112-stm32mp-imx335-fix-e3ec6c41486d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|DU0PR10MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 7748bb90-c0ef-4fe9-5704-08df43d5e0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|13003099007|11063799006|56012099006|10067099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: 38wMXU0QJqMeGo38Eoe7JLV0u3eBdSw1ypQGWzNriy2nM/lmx5TQNTU5A0fQatfx844WsmOetJUe6oV64xtJ3iPpsAcN4ZNjd/1lhPT/PkZTFlkRlr3xuwc5f4Q4wAD5GUksE1zTWFG9/lWjjotKNyIVqjabjC/rLzt7rkQuASj5848aAqiuyJGCHTMF+r+qrX/kqSn+KC5t4/2TRH/Q9U34fdujUHcjgd9KpwM45/gP90V1rQfW6kNL/mES0pvB9sHl6VHdLafwWZhibazX6ZBKOGUUZigiGvh1t7Kty2WuCcI6Zputji4A3GFCAFL6sNNgeilIlczS1pXhXiefKfdn610BP6auRpQu3BKgUCi1Fr/6gq2PM5AGD7i4nVy1sNRbEKExLORInZrfd2kow2XasXAd4HP2efTzNpOZBpbMbhIxYmkBRbvyjV65oa2HUL868T7294XboXP++AwFhX+Lk8R2n8pal8cw+r4WBUPMPlYtRQJm5S3QXBqYXDHVFibk4r4Pqmn5FhAK9XW+YPVN6CXjTRfSfHBM2AQQwU3Urw1AC44AwX24sG5brf1z1mIYiWRmn7F59hfWnQRFpr7NnBHifIBRsvHBKVjRiJtG0msxtWOX+ue9uRj/PVY+mFZz1qaPHBK+LviFQncOxa2NlVmPkGY8gmIqqVKh6uA=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(13003099007)(11063799006)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r7jiijYRy/hVqv6b4P5FKouilK63skwyaxe2ynP9GjYnoZIeL21LiZjj64dE0BKnTPwUBF15odN83vM9hWwv6u6bRRB022feTeimAGFciWhhH1/1oiMMsj9R9HLSBVkl6g1PbEVcUJDcNeUn/15r737EInqXi56ks577Po7H/TeeorAHZs/KuGSKr68TJofhapMh28t0tJohD3XqolQiTLTJ0WTG86Umi32ABe5XQxWj4+W+mlZKQGPMCkG3hrLfWIHbPl/IjE+QaSV4OPd/PlZiqmnigXsaen+t4rclOM29X3n0gfHcjoqZ5uEb9kNKkwNv9WaQRrUbYZBZmbuWIevpz+8Wx3P3DO8ADQLrUNbyt5vcewh00SV2Jo/xyIU87P3hjREd80YfkEACEg0bD6uiCiPglFFuU60iusjKMGewp0g0h9c71UoX+QjVCrjR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:36:38.8710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7748bb90-c0ef-4fe9-5704-08df43d5e0e1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_033648_340678_A336BA69 
X-CRM114-Status: UNSURE (   7.62  )
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
Changes in v2:
- Add Fixes statements in each commits.
- Link to v1: https://patch.msgid.link/20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com

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


