Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732460A2621
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDcSF9to;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=NQX00uXP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=; b=kDcSF9toN6RUYC
	Ik4rcSsqhhNsPAoyPLQxshQtHK4+AyKKsdJ6eaz0VNw1r4NQuxR3/QVgtNe6Od1GisO0oG7dW31/E
	6A752EmuLEF4inop4u7Vf+847w0pg4BDME1T38dkbeJtoOP5koqYy/9+PFS6ZqV7NFri2QQsIMv8w
	hFGDbTqC9FBwLE25bW//3cnxVROistApRMMNfXYrssZa4ActxRjtl2p7fqYUeaR0gBn6rCCQ3tyut
	e4sWutGWM9pCVTuN6kF01wAa/tr0vseRivqqyRLrrdno98RQ+cqhzUJ37BZhmgDBtIjno+cZZ8FaE
	X3CtR6a6plrc87XxPO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Zt-00000006AMA-0HTX;
	Wed, 11 Nov 2026 09:25:13 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Zp-00000006AJk-3GZi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:25:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAk4wr3icA9jH51zriFQ1FP0QyEMXceEhmUjzMEk+2rDZtg/aOgmFRtMDvzUOtaXdVvT33WjTs5zBuIhQfXktZ9ex4pQPGbJDNTljO2Ex/nA+HxPa9nSXGOV1JajRH95k68CbclTdrKZOIT+mdorOY2E0klr4vN2szwfih9gvwlTtNTTIWjmJUlpqwccG4MW6GyKPcctprJbaJ2y0iusVVb4R4s3xUFlhX4B3181DqEcweo3GReuchge0nWMx31uOPCd8pTPT5wK7KqYQFIITiMdxeXU0rVJGQ/2/OkAVtvcIZ75t/9so56NLs7XwybtXxPNHO/0SuSMsw4oHi8iWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=p0xyn/t+60Zp1ROiOgwjVEfro64thcMF69b4gDcMgy8fAeQZJZM1rrYRU3jl1LWy5NDwkoT/wfVtJT1REgCYNNMZdldvEwrT8AOsI793wCB9snMclrPrwrJ+16bH28ni1MDRmX5R174Y2KaLAjZSkj0tGh4hEO5Zi23KUdo/vjBBdX8Vwx0GD319YH9imaYzlfx7JN8JSTwC56dmKibUflC64zhXxeRcmr2FIBvivNfC4dn0KZ1UDCaQJC9aE7vbO5GaiQIqvDNi6xIh1gxLXX/uxPcpzjuSd/i0tQtyrph993sx8PBmhGCz+zLQHNbHdX5gw15lV5gsiaseqO78UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=NQX00uXPE8lXIqhYi4YHJaIMFRns8QAhafzPwK6MAi7Jc9Q+tLvI388AdPVC9OC4+7wETjobJP1fPhxGJ/IRIW8Swc2HbZpst/c60/akYVCZh/Df1WRpg6/gAbLzzM14WkOoziqJtebaPnkp92njOn7h9ZRLGNgDzVBQWoAAzzVLK5YqRbCE9PtjBYiiHKreCyH/OeGdivOOWWgUzcPHEjlTc3VIZ+nxaY+uchH/g/g9kALnvxG2afTmRIBog4KOs+yaMsdyl6U1hFB6wzZrdQQbB+UWiyEPytN9634Y/2jbhpsr+xJKuyEaYfc7uVmqiN5Eua9Y/AIeyWzxcGOTvw==
Received: from DUZPR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::19) by DB9PR10MB6692.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3d0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Wed, 11 Nov
 2026 09:25:05 +0000
Received: from MAD0EPF000008A9.eurprd04.prod.outlook.com
 (2603:10a6:10:3c3:cafe::5f) by DUZPR01CA0011.outlook.office365.com
 (2603:10a6:10:3c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 09:25:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008A9.mail.protection.outlook.com (10.167.241.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:25:05 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:22 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:19 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:24 +0800
Subject: [PATCH v3 8/8] ARM: dts: imx: Enable USB OTG mode on BSH SMM-M2
 and SMM-S2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-add-bsh-smm-m2-v3-8-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=jP5A1kOtmjK+1Yg+TFdVnTV0mqPxM5FRhNJ1ZQGu19s=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPDo3K3LbG24ujHrsza3vev/bp6G1YvXrTV7abs/a
 veR4y/WdpSyMIhxMciKKbKoJniflbwaYDptZjXcHFYmkCEMXJwCMJG9xowM298vCmts1llXYPzX
 sVImfNt5s/734Uc641KFPn772bjgNSPDeSXJR3xps7zPrj7IxZxue2SzPavohNkz32X5hntlTtz
 ODAA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A9:EE_|DB9PR10MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95eab4-ad4c-4100-8b05-08df3fd5ac09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: BbmFyBKcp7RW5r1JXhDjLhUbBFtzKLkAnY2LzBJaPiI25aBIAeCpTBSjr4KxPkrm/l+N+Adjdqf0wJ67nmuMHT1Grf+Dv3bGLGweS+rX2ffFLGi8+0SUYgU7JY+zPRmEqos+LKQNBHD8A8HfqUmbvCafQaCil2ludxBgDNUeubRkggd2Ik4WiJ9P/KbWSEz3728QgcMDHzt7nczzqhIdD56MF3MiycD5IaGyuuWhgBVCZ9pCECw6VFdIDMh+TPXWzCY/PqHJbNok42coGL42kqSprstDXBj5mc3Xdfe/cyIv2+5GcojeR5VRWUO7z/H1wI2jwpEoQITynvvq8kdh3xdoaL19q5EVUOhwKzM4Cm8QcS25ec4Xr7MGMpNI64xOSJ8jWrg77dgr9ooy/A2xNTEKxeTYR2m4wYjYudhQ2opSim3qnK9aYcgKg3tXD+PDWQ5zzPgvaJsRpq7RdDJevvVOD3QFL8f4w8vQV4OpDaUUVFv98bhD/yGAMaxOuzj47C2/sFJKA+ziXkXTPj510zhmPfOlg8h/W+79faHWVB3ITywal0q9uWi21vazw6aIZNpYqUFsXzLYag/P4qgi5rFupNZFPpNjoyBgyUSnorXhACYMIcojY3x0uApwWFvYBZ0Ad1kkjOZQdsngUN/PUmmNINAiGGnE16sHaH+5pX1HoVUXx9KtGFCXTVt3R8x5zKeWL4uyIQVeLCdEPnTOIw==
X-Forefront-Antispam-Report: CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BWd5uvy7xbDgf6/f6gG3/64tniQmj1eRsp8veZuM2DU0P4tt71F/8EaTUEGAHrDsbk+3Wa6rlXGwUFzds1ZNc8SffWuVaINBnWKcqlAtgY14uojqnjMRsDZ634g8dn8r3MuxcUNmnr0RcDwKrxOVW2iQNDA0fU6sU1EOgqRJ/ha+DKVkId/tmDiWQlfKxwVGK7cM8MIMTwP5phlsfSgfuqcSD+jb73ihTMvFEdOwyZkS2qFzKV4dGc3MEvODFwh8AywOqoDfx+7WfI0DWMyYRYnpKWR+lUw/7XG6NfB2cDvg8HJaKYu3z3UTIkBSZspET+D4hRV5ZQhcmQy//+R6GqtAKaFpYDOdMZzqZga9ys7vZsbUIO+CX2BV1d1EYmbyZH2v2Ho0qU9gxC4mxJq3CuQszvKqoMeQpWhz8C/W15QKrJAF6fAOQgi58K6+zE3d
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:25:05.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95eab4-ad4c-4100-8b05-08df3fd5ac09
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008A9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012509_824279_37981B18 
X-CRM114-Status: GOOD (  11.88  )
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

From: Florian Ager <florian.ager@bshg.com>

Configure USB OTG1 in OTG mode instead of peripheral-only mode
on the BSH SMM-M2 and SMM-S2 board variants.

Remove the SRP, HNP and ADP disable properties from the SMM-M2
configuration.

Signed-off-by: Florian Ager <florian.ager@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi    | 5 +----
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 27c7b6acc658..96f084b6ade4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -37,10 +37,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	dr_mode = "otg";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..7a121459f95c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -248,7 +248,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
 	disable-over-current;
 	status = "okay";
 };

-- 
2.43.0


