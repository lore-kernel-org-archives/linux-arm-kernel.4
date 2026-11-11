Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D860A2612
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XiA0UtY+;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=cD7JcQRx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2S/YtjVVEsGRdu6rYaaarAIOJPZUMytfLuBBXeg28J0=; b=XiA0UtY+qmihuC
	1BwIsnzSOGxAWHC55rMiECsceLpUSjzGGieuZ/19X91kSEJ9+dVs8I4u1ZMUniu+r6AuMy+QSiKHG
	M8DErcuE4I2aXZXA3pClSliGfOLWco1aqTAZuW7V8HCiGlo//xlQeHnaQiCwrLm1E8fLhyHjbOZtl
	Xow4+qMo7fIYNBkDS/WPp1U3lLyoe5Svh40tTh845xmNG+1Qw0GCV61vPTWf9HgPk9X7smxL4XO6K
	A7dhgjrZ2Wode/Oknb/t9AsI+wqGAXsBL1pLYx9jfL6GnHIaMdXZQO3tFAnVqzL3MTISHuTF6T3h4
	E7U6ubEUq1KBITjPBPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ZD-000000069se-0TmZ;
	Wed, 11 Nov 2026 09:24:31 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Z8-000000069ok-3pf7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOvza+/dgGdhVuKscaFjMKdqvrl+Ts46c0ec0kuiKMeXvn1ylRMMRoSmqzM15vA3X5sWqUGnOP3A4SFyruBlIDsx1Z49cOsfWMduUcBqTrJGGxc1yhaZf7wyo/2cAYYEMt1Xwchgo/JrirYj/rv4+T8CyFelLn6Jv164eSKUvbN5XJ7Me08ovAYUz83VSlba74N+vJGWlKGZqx49EG/rt+uikNMPixOLCXj688lSrdUAPIjZA0hfo00jbHu0Nt4W+IBgEY+g4J7NHqzrB/p3KIQA52yrTeo1jBuJVPemubtzNhc0DB4xZU07b2Ad4wGuBNMt4VnJrgqJaE4toLs1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S/YtjVVEsGRdu6rYaaarAIOJPZUMytfLuBBXeg28J0=;
 b=Lz60BZsx2cXh1Lwz5NI2LpqE2iQ0EYDJo6UBodpeVDhajhMNARj7JJ5Bg5H5yoJyAoJyVINUYbo32apyDFH4+HA4siU74BOR7Ij3TvEy9lh43BOpL+yQJXeVaSrZVrnGYZXOph5zsEB726dUxYN/XV40ivCYCzpRfxpFFFYCdwigT9t9AhnljyvJ63VeKF/xNuoMVsxjcqYlXicCjfvGwjGF8N+LV9iiyOcAxgP8fzBZeZyWomROdx8adAqTGA8LEijAlYSYpFbIivcTnDhrfGjGgQlvZEMvoeWzjw57eSSFD7KDCW0yoWhSiXumFvQeu6ZYcui57XUtvHv6D+CFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2S/YtjVVEsGRdu6rYaaarAIOJPZUMytfLuBBXeg28J0=;
 b=cD7JcQRxOF6OPO3BxtpYxiy8um3KsQEfPHBH4knijqkD9E0STD1AOlWblkkYAkAFLe3YCp6Tr+bGaAVHOmrWQE0a/2HeHYYF5rTZTgACRYvBd8BuJaDL9QxSxmZ/cj+fkUuOoCmejU/bB9tW6kxAqBLtE6nq2oQ4S3baizqgY/mW83AU795XnX5b4I8nUp/vuWKLn7wVx6BOjcmYI6ttGxwmummAReN0APsdWrco/uHBZdJaiFUF4kMDYRLchqqG4cQ8opAkcFZg0OaLyiUAkPJDrx/qg+Isof5f+UuIVh5S1DdgW5e+cB+fv9C2EvigolWalG+UUr61RAumccPWbQ==
Received: from DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) by AM7PR10MB3686.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:13f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:21 +0000
Received: from MAD0EPF000008AF.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::1a) by DUZPR01CA0260.outlook.office365.com
 (2603:10a6:10:4b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:24:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008AF.mail.protection.outlook.com (10.167.241.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:20 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:03 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:23:59 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:19 +0800
Subject: [PATCH v3 3/8] ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and
 Bluetooth pin settings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-add-bsh-smm-m2-v3-3-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Leonhard Hesse <leonhard.hesse@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=mhODL50P+x6xFMVD7SeKxIWE+YHC7j4RVJOkPkYKJFY=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPB8DN7uV6f9RTfg/5ld4l6b1567Vr1vqYbfVjHG/
 /9tbm237ChlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCJGJxl+sy0XmCTQU+EUFjS3
 fOUEDqctTzZ9+m+0s3LGQe0F3e6FPxkZGvcmdNV++FnB4rribt9Fp/rVvS9en7rFuDbgko6Z/DV
 2ZgA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AF:EE_|AM7PR10MB3686:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fd0782-385e-4964-a20a-08df3fd59150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|7416014|82310400026|11063799006|261009223027099003|56012099006|261022075727099003|261021121427099003|261026140227099003|261022105027099003|261028144727099003|261102123227099003|261021123027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: zS7FsV0aRBdomdXWEtxEYP+rx8dRtXGC+tSXdQQRRcd9Wdjlw2ERc9B5k8rnH7SeyUkfmuB95Zj7ZarhJAd+Cb4gRvQRPHHNQC+sBC5nUAq+kGe0iPBXoUUHeTZE6L1ggW75FKR8UAtpkp+Gg1dVFoS/7EQdlc2HH14kg1op9goDjsmeIQmwnWIc4FKT6GTsvPZXFUdU9s3J1EsK37mmJ+Px0LBwJ0SC99CMCYfjJeHPYUe2H5WQ8IcKfEuEvq3OnFaLdgz1mo9o30OPKr12ZV+PgF6clAC0WAM9BT146NJelSo6OUXHCfz5y7sX+LWWHHQ80EmKJV/ublwWK19jqu2qhYcDcy78Rh502NXJQT7vs3hqjs142LKQZOS3MFZYQV2ldB5h8peH/kuHE46WZbE/AGUSAIZjNjVbdM9LX2nCiuu97gyg6H0IuukVDx0oEHKJ9En3CnnlrempPFYvqmzSxEDKovGkMacNx+z3wBcUm0J1K0zx9/VUFH7DydMIxFeshXkesofxPGSxCMm60w85eAUTbmM0OTd/nzo/ax7zAhGe8nfEWR36t/iV7qK5KU0G2znviVC+HKohJcXsXkFDeWQHe6quD2b5hTp61Gugb4fGZcCixLIpqO9Je1m5XHV0j+n0FY2Nb7KtSqwnbehiJv1rFX33VmDcohSCMtNMFdGyaAXBHZtCKRN5b+o5JuE/ycf9wPyZvuGEAGhDzw==
X-Forefront-Antispam-Report: CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(7416014)(82310400026)(11063799006)(261009223027099003)(56012099006)(261022075727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003)(261102123227099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rYZCXWEW9aJqwVRq4zZWgZR/zWjrZLc8Td1r99J6QLMLfLKRkBzYCZ1HZH5Cf8uFQVrfZSUD9sVJbNhiWOtTvkHvpQfvtFCQAFAfClmp9ntQP1hiVPmcFm7b57591Pau8V8zFKoUoTK0QqO0pFbn7LGX891qj9lewUgmvFoOerAk9IVAkc7qhvbNusyp4KHfXG/KE/bDy7F3Q2Ge7mhtM+c/8eXc/xL5MwftHSnEtPyFqwMOKoc+rU+MLPK3WajMwf1fyhhAi+PaqN+RTLXpVXyfhNhqmb7sra43fC8FWrq3V/0IBxzyWw2rg2616bOhizmBI7S98h4k72ENu/rgB6vQNv2GZOlXs09WLTxOAx9Sb4UDwtEmHGbziZyD71JCgUznDJcWZW9VIDb/AeJwbJ5RRmKE8ikfw+NpKwxVtLxQxun5aLJilm5LPzDIieFb
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:20.7388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fd0782-385e-4964-a20a-08df3fd59150
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3686
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012427_054246_62B1D800 
X-CRM114-Status: GOOD (  11.19  )
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

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Adjust the pad control settings of the Wi-Fi and Bluetooth REG_ON
GPIOs for board-level EMC optimization.

Reduce the output drive strength of both signals and lower the
output speed setting of WL_REG_ON. The slew rate remains unchanged.

Update BT_REG_ON from 0x79 to 0x100b1 and WL_REG_ON from 0x79 to
0x3029.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index aac211a9f9eb..dabe17222f13 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -125,7 +125,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
 			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
 			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
 		>;
@@ -146,7 +146,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */

-- 
2.43.0


