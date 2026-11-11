Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D01606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E5YCVRML;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=RkLq3cE8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=; b=E5YCVRMLiYS8Rk
	NBB7gpopjdNc5Wx3pLtSu3P5kEohgtjKCE0th5/0hxVcSpfhgp6wfzE/+GIZsAoBnobL9QMcE5MQi
	f3RrtB0oVnJFXxbst8l0sPyD8iDeIlGYAQfrYDX0jufJIW0Gfm3BWtcVn8sbgSS7T+8BvqKmDw/wY
	9I/cIpCzvf9r6cEr951CuB2QE04hdl5vZM+PaGBw/IgANpU1SvrZyJitGdtgC9PtZ8qb9IWzKxj+j
	3nIRLBustRhKf4KtJleUVkbyK4BCx6JFanQwWc4oPyEi7PL7+WOZtAHPLQprT5YfofIgriJInVhwu
	0jEM/eKCWj/OBlm0Ny5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ZV-00000006A5V-36z6;
	Wed, 11 Nov 2026 09:24:49 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ZP-00000006A0m-3Gp1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYRCMEoiwc98YuBMV+UtRBoZSyt+C67THpU5dNiOCHc4FBdzLD328w0q18dJY422d07HYzQ8LXz+o1YTC9Y883ywiusJldJy1VorjZpVrHN1DLPf8Bpd06c1zoQnyHqWlbX7ZinIdp0GU4XM3DyVLIbINOeO85HMY/0MzNoHgE4jDouZL/i6NovazLOPWQddFR6AX/CkF7GQxb9qWftZXMW+JfdmBrmDzNHmhhuL2SeAyJtqXQTqKZ382odPB0llhOJKHZu3etHkj4GxQAGAQTXSwjmlqFJiXqAgK6LiX+7Wgvmk/UaCXQB831msIZ3HijwtZ4/LqnE6mcnikTuPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
 b=J0+lSZIyWQnYUr9dUBpNKl4T+DnjRnAU2s7O4j0PB+/QR5wgkV6T9+do+UZdu1fEhI1FvJLgnHnGaqcbBjUWdcSf6X4USxAQWhrgqZ6n9vKOvdwyPK2/GQFPbt6GalXcoV551qhfozLMeZr2KbGXB2T8xV1syhSx61XGO/6HO3cgl75E+SQaeTQ4hV7H0UVScDxVEW+93hmsQxElZS+gN2eVbo0hRpm14xdUGhwT83GGhnUMSlh6iEoPao1ajxryfgBQPJwREc3kROkV/ttnUoEZNgqRsFSsrLpivV7HTUK9hEEsWfy3OG/djJ9wOZV6IBkCsp4XaOrqB4KbBYR4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
 b=RkLq3cE8C4u0DuZZrdkiTTuVD7taKex6doGqwnn2OogQd4ubONzuky41rUD3ajl+2lXEZAIz0AoAfCn0bn/M6RAMePbX2yORVKZD5Hd4ZGnwhAkIxcHHRu2UIkVMxssZlL4AUkrEFHSV09VuDVUbkk312snYFqSHmgnewld27Skyd64Vwy6H14R/2zVY+wg3pfG3qhOawIiBCFkXjiSNMhTgzlxOJoPcHXqzTAxi4xru5hxcQgHANXPATFLX9MqGBZO8asrqmHNWPnoHN4/jM05dUBQxRri1C+hCfp1bix8+VC4NRq2JGOap6qowF8WGHYsvMqTQRCkcksplVAe6Ig==
Received: from PAZP264CA0136.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::6)
 by DU2PR10MB7788.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:38 +0000
Received: from MAD0EPF000008C1.eurprd05.prod.outlook.com
 (2603:10a6:102:1f8:cafe::85) by PAZP264CA0136.outlook.office365.com
 (2603:10a6:102:1f8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:24:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:36 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:18 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:15 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:23 +0800
Subject: [PATCH v3 7/8] ARM: dts: imx6ulz: Configure UART2 pins on BSH
 SMM-M2 variants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-add-bsh-smm-m2-v3-7-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=VqQvwx5DjvBuUeR/RiCBffb5oE02cLYBE8zFCfltHNk=;
 b=kA0DAAoW3m9onztYxqoByyZiAGr0NAyh4E1oQUppNccNvPz2SqwDQiJ4/KcHiJCc2mnsYpHL7
 oh1BAAWCgAdFiEEJWBLzRnVUDWWmXsW3m9onztYxqoFAmr0NAwACgkQ3m9onztYxqpRKQEAmxa0
 /E9xhVwXbAIr7KzRmcTJBwztNx25UQuerX9yw+oBAKlHqjTu0vAlWDuVEbZAjEleH9FYgi41X0j
 B38jHBuYE
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C1:EE_|DU2PR10MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe30eb5-ac7d-4b36-3ec9-08df3fd59abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|56012099006|11063799006|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: igbSPM+8Vi+Wa7Iig3GIZlYOysBmgsSQcJb5xv+D/q+oMF/Jh1FMLXPEBZwStILQCq4jdVXii30dD33k99K7nqUEvRlAN3n79j5+yWdxhgk0LJ3MnXkUqHCsuk9r4BdJiMeR3ZqC8IU30xosRcbrvgMZxKsLDwCwhyiiQsDYyV6774OnWCPa3ZiEhb+EbdUqO3qtGFBZnQ1ic/as/aR/Vv2s71ducp5wqCgalwG/7GrD0xfDceeKTKiZ80OpekhZ/dnCRWcM09zG7xZmsbXJ6GUl3JLCCNkDlI1Rugc2rwUe0U6Ia3wXjNp5cEA0XVuUqgOVZExgjE4OgnyRr03P27IsctaSxIJRNXmgS8eQM6q3yHsOkZG6V7vptkfwr3HIBemjM0xk9PKYGBlMRIF5ue/hshXE2KdHNJnTVENnQxxgWToTbAgIBKY5ZuywIcL18HgmNFx4uZKPNQyXAsIBLRK8iQDtds0F7Y9VuBcP4epnKI22rXT1abICpf09R9TGL/KqVTB83iAbNJQOq23DkGaqkB/4SwmaNaZ3wKsSGLHiLG0pb+ahW/BGxJUtvyP+wPItzjBNBz9fd33xtVzxUiAtR/Pi1BocTZPQdY7GdG89n4VsSTgnc132/WjQYSRFsokLwEVP8zMnOpNk46LFq2l82VjGlPkoZdX4yyJzxU1dxe0GLtSxFNbo1bvhledaYHcGpk/H8gk9pGNIjsC/WA==
X-Forefront-Antispam-Report: CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: abfheTN7CJZ3xxtOc3W+uLk6abER0AxBGgCpclmh2jsXD/whJdIsIfzy/brc1jtYO8/3W2uLFHLDLCWmNMSE9q+kJqVyvHJ18wNaHhdzGNhzFjFVeFfwtRAW7i7bNWlLCoYQjFEGRj0XAZHxUcDZpK0GL55UCIb9VrMaPSRxhDuC7VBDWYvgEfPVCIf3wfBNjJII63fwQ5lMedZIqpw9nLmfCp1bRGBfR5yYH20bJY78J9GqcgFI2m0jQCLzSmdWjkpXou08SDb63yrIo+MQVMEEvs0jcaT0ck8QZKLnzEGhPfGgvHi/IyBtPjnCfwRHHxhL/RYr0a3iOK9gxJ3/edG57+QEi5eD7c/O/8uWaqaQC3p2yKpD4Mscm4ReGkbybk+zZB1FVvp5m4AAvX67n7hM+Ud9/ORcTzmWodfTxMLCrq2mmp4+/Xg86eBXcNr0
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:36.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe30eb5-ac7d-4b36-3ec9-08df3fd59abb
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012443_841642_DC2DC701 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Akhil Narayanan <akhil.narayanan@in.bosch.com>

Configure the UART2 RX and TX pin multiplexing for the BSH SMM-M2
variants.

Signed-off-by: Akhil Narayanan <akhil.narayanan@in.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 83df5c696748..27c7b6acc658 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -25,6 +25,8 @@ &snvs_poweroff {
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
@@ -77,4 +79,11 @@ MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
 	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+		>;
+	};
 };

-- 
2.43.0


