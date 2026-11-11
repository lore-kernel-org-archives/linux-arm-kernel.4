Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B9A60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1/4q9Stw;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=SbG8aVcI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=; b=1/4q9Stwx3Ob7g
	0XN8K0CHq1JH56lcHfxdn0NTabMmVWtQvaknP6pQzkTcw2Lk+0/rU2GxMhRgzYPS2GLwL5E786FZ0
	7snibo/f3AFV5I3rkiLg/+eYVfFjjxMhsa3AAVLCc2KpYhIqqKCv9eAyt9iXSnsrpLnDU2By7tXcC
	0QY1/pMi31ohBT3mCGLPkaZp/kEubha5/5NbDGR+PU78bVh2WUx3kD7e5B4AD816PUigI5l0IVs45
	gmGyL9/hQF8MNh7jPcAS3/Xj8Z+aoCU5fP3HI0lURTuCdAeNlfRwMrXWIoIvTGBTmoByHkWksUUFi
	rxSJFMkpzy5TrNRzdLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Z8-000000069p7-02vq;
	Wed, 11 Nov 2026 09:24:26 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Z3-000000069ln-3JMl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:24:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt8Qd7Ho0XJtBKFzWLN/UPwHo2h+4/6f7p+wTv7uEXGaxaU10GENM+ScqaBzrGoTWjn05kCB6S++xa2zhVX3qPWSaMKbYZiqKCCBTiu1GuxwOY8W5Q9BXe3H6C9nYKxB1WRgdmLh8hJje27DFPISGfUaMDz4lMwfFO8eAAFXotqLr28IP9LCrwR/7BLt4oNZVCHGTuJ0ShAfe2TaPTySrkNy8ybiRdTdG7Hto4KydmfHmRiKcbVdMI49bgJVzcnEeZV4DZfWLdCdiho2GPxlybGLMEXwPgSB+mu6DsXLFf5xlpJMuwBiBAzbFj7vhNNylUcnN0+U/zrAuak+GfM4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=IptAwp/fQoXyLr+dqcgnbcjxPvO26xAQtOCX6sl4rg8geUZxhHKH0LwC9k9O1wJ8ZzwuVOgkJO+1YR2ZtJ/v/ce7L0/WQsfSP64tf2CCLF3IMSPl4v5rjhepm0SlEhSflLE70y80Fd3MeC8zoa4OCrWPYBsm81PKhg17cKkj6IXAj6LcSMIN2tJtjuHTO9bb9U02+a2EjSFhE4l/07XJubX+oQo4D9noKxSMwa1XAeQqhxKUV2Ntvc1uFNPaj66U9Psl+2ztmY/Cp7ky27IHj+eUUMX/YIQZC4hsVaaM9ZyPxCmhDyH5BfhalUVfnNGufC6k3JClJotZlEiDzuRzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=SbG8aVcINN9j2yOt/TlhmS22uzHzoODrOTNp4x2VzITaoXiHG0ZlNOeImT+t33dIYDkD4Gv72vwvrlahtH3t92HTR6bPRKIC8wX1bmL7xZMtlDAzbWXLJv2k1f3BtmyuPl5omrCixcdeOmatK6a+N0KHg3nCYbc7Qmz430QgEOQGNfc/5EKQ1DKvMu+HqcPksGvk/0IGh6N+IXrzND+n4nlOlYA0F19sVnJWpFH1Hj2sP751cb9iKaayt2uZDcNworxZM6MfSyb6YcCSqdJBrOUDEiDNt9MFZqolhQc5e7vieKq+qDjqQ91Uq2fWAAL79uSpJ8eDeWS81S5maDXjzg==
Received: from DUZPR01CA0269.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::18) by DB9PR10MB5550.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:309::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:15 +0000
Received: from MAD0EPF000008AF.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::21) by DUZPR01CA0269.outlook.office365.com
 (2603:10a6:10:4b9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:24:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008AF.mail.protection.outlook.com (10.167.241.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:14 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:23:59 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:23:55 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:18 +0800
Subject: [PATCH v3 2/8] ARM: dts: imx: Use minimum NAND ECC strength on BSH
 boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-add-bsh-smm-m2-v3-2-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Michael Trimarchi
	<michael@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=0ihmRnmTOHFsqdOKT49ZxDiS9tkt8/vKUkVB5qVqZjQ=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPA0Ftns33X0pNaG988Ynyd+frn9Wd6mx7pxRz+zL
 TvC1Lyvv6OUhUGMi0FWTJFFNcH7rOTVANNpM6vh5rAygQxh4OIUgIlI5DIyvPg7L0ZlhYB9Grv6
 wYNht5emrj9hHlJ47HTL05Xhi2ObIxj+uz3q2bG/5edv3hucWYHcMTEXrcXf/BArvHjMeN5rjZf
 nWQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AF:EE_|DB9PR10MB5550:EE_
X-MS-Office365-Filtering-Correlation-Id: a4051633-c0f3-4f47-3fb0-08df3fd58dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|36860700016|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 01V00MuuL3I7IoNTPE+kB0jN+z5M+iqEbsS2IJ87cRIOx9VpobtqnO9KHsOj7Su0YO6lr+87rQy6EFT6w95zirRNlJYuqFYOWOJqQRbjunTRaH+vbxawaIaPbUUMcAvudiKWej6xk+CIpttvlIWfUG6/jW4vjU1hLBeX/f2emA6n+y6r60i3KS4C7ISYk5GZQqhJ98A6hf+6zehNdca4Yqnt9MIg2n3tzpL4PvCQNtpY19MfCyBdjbUZvYRGfez2Gh2j/Z81ADEcbHlOapWcJhdCmgNofceqKITSj2Ew1I/Cajinag9Tvx4zFzdYZepLYif/jQYJfyZhNOHsfNhiqivIKnNLoZ7VEdOSSHtglFTVgVTkWQWoBh2owjuLtMknRc/bPIC+CjfQhctBzBZ3RU5PdPzSHNyQlsNIYfWANUjIW0iCt+TkmZOPyWdnrFFl9JGx5n1YLvwUsihyKrKcoPL3zXYha81cwiSH+kiQHkFhZcapqV0RZBbW/jpfEsak10pVTtpwCZsHvNdyHpp0wnlVvjzZZjSCZj8rqEA18CNoUnrLRhYJsj++lF114prKN+J/+jciHcLCKXxPduWPxH9l6gC3+VVrhl12lUHNaAzc6jx5DW+QsAgwHAeyFiKMz7WbCxqFrkNs9VUJzDEZc5B073j3KIPbm2PRkQXzKiEwUSuS4ygE/n1XB2LgK9iWi99uGvhkbdEJjXUNYvkHyg==
X-Forefront-Antispam-Report: CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(36860700016)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HiLMgMoU+fF1bjMNlGM9lTJoj1S/wcwtmfrlwKnFDv60jzG9x3T2KYHjVatxzF3qcXC8iQaRL5SiqRXdFE+N5WYR0ivphGccmmxZFUdVV64qe04tABi0psL7eFBTiQKyRaswInTi4pL6AkcArPVDv6bNJQo+TcHIulSvlA4u+ZlEl605evHptVPzCdVRErra1ooqLMRiLjgM54SK3vvabs386TuZ+Gin8B66wr8TQOzIWAw/Lmr+JjNuyrzAFw6owyxAwcEV/hQk0qXqXn7JzxRhGuItvjbgfEH9n2u5On+UcKfmL4k/nmhorp+qtpK6T6/FPqZ8hdhJN0Roc8oIKz/QPZpsqWxz51Or/ped/XaoxLluO29L1+uCemi2Z6wm1sGtay4GPRz3ELyZhW7uRLPrW4V0N7lDWBmqIJYVUA6iCb/80B1q+cgUdmt1y7uC
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:14.7517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4051633-c0f3-4f47-3fb0-08df3fd58dbe
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012421_917975_74671132 
X-CRM114-Status: GOOD (  10.56  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Configure the GPMI NAND controllers on the BSH SMM-M2 and SMM-S2
to use the minimum ECC strength required by the NAND flash.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts    | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 2d9f495660c9..aac211a9f9eb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -26,6 +26,7 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
+	fsl,use-minimum-ecc;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
index 11a1ba5bfdb7..df11f81ac50c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
@@ -21,6 +21,7 @@ memory@40000000 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	fsl,use-minimum-ecc;
 	status = "okay";
 };
 

-- 
2.43.0


