Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC8606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pdBEZ816;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=md+8MrXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4BGP9FiDK2o3CLxzHZ/o5Td/ntUGZkgqnokg4At2AbM=; b=pdBEZ816OifrNhXLNOS0dmpSOE
	K7g0rnMaNT7+RyWhWpihkAuGeCCOEY7nBz8/a18RlPCdNDwkFnaNMSRy6VQ7evjcwUic+ayURdiTS
	KK81+U5eBptaYXyuwboSaMfndHrznlD/35XoDL1UuKyMVYLx7pA5e5SWLHEc79V/onszYjCcknSu6
	3GWhkYybnpp31/Gr8fV+tCZJtI6wjsPtKedjYT2mhxiJLSsZewlPBZt80w6UPK7qCgrwGmkLQ/K0H
	mxyV3+cvXk+cmpjPJ0c6vaBGi//yb22TXoUmiaJnvbtx//Y7mD39QtLd/T0dt5CercutcuvF8vAF+
	IWnsxsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4S9-000000040iC-2Ade;
	Mon, 16 Nov 2026 21:41:29 +0000
Received: from mail-westeuropeazon11020124.outbound.protection.outlook.com ([52.101.69.124] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4S7-000000040ho-1JrZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:41:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWetSSZn7pv/Q12YqCKDv/EXc2+qgNfRwoAF91TBz3JCX152BvPXbuIRZQoYGpQ8eD/8ypUT1J2ZdzMrGuMCmme0SYH4Yn8/S2i8M59cVrwMdOJv+51l46MxLeI01YL8yFfd3od6pFx9Vakey+4MBDioAv6LgtNGyY9yssK/QnzjUGxg3VjCmAIcDpWsSQ19pzTP7B34TQ+wh4d9VdIoYe7rz+DvnF7bWWoq4lRXLFthNT66/BFJxqnsKAx/2aG6e0yRJzsBfGxnM9RP/Y386ZnprHYbfJTU/db67IP19S+iP5lE1f6vOkwpJbZl8kOQJG5iY9EWpLYU9aOSVCqUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BGP9FiDK2o3CLxzHZ/o5Td/ntUGZkgqnokg4At2AbM=;
 b=AuKvMOfiVb0qMmXw3kZWCSeZZDMc1o/pBhR2Cmv48h5ZHpxGKxM4sZR+qaHy00ODnd/Jqj/nLFftlhu6qB3zucZXkXmDnTUdrJ4TNEdJ3vhDW4D85PLExyOLaPN2028BwfFaOfIFDP/RJxYCLJLo066ZQuo2H1nLZO/Y8lVWHjMynG7H0Uhaebqfl8rfOR4Fuhiz1Ugq1YgMad+e9o8qywk0F5RFt3QXYa10YFPJaXv3OHTyEpGaObi3KIU5kVqcXoAp6CY+IVFb0MccnwBw2T38MiLbpG7Zvyh/l+UNvWbNQ/uj85lJkSO9y3hg6JcDaMlcBAKQt1S2WJZ/n1wgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BGP9FiDK2o3CLxzHZ/o5Td/ntUGZkgqnokg4At2AbM=;
 b=md+8MrXHIPB8idxycIFRX0euxUElrWLhuJkz4wbbREZHEO9mWxLWwtm/TuTY3uzAYw7/sB332oD8hr/79FP5c3F/FUN32YNYxG4MZPIhvmJbGGZoe1NGXB/8lyL1yUpNe7jI5OtMdw0JMvLNn51BFgzQIpDen0w+5pXdEWodR5JUpg4D+o1yPFRZR06tt7sxqXvBNZMGd3EFnRsnCG7Wa5tCe1OnK7wTuYMbIhQQAR+vzPbFMG0dBQ+KDX1kwEex8qzSwicV61VY1XRevYObkQai29tnX0nC6roexZSnlFB1HLssURhp/BN4vvhSFifun3GvrFbigrrx3vNocXyySQ==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by PA2P195MB2584.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:425::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 21:41:19 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::14) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 21:41:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 21:41:18 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 22:41:16 +0100
From: Garrett Giordano <ggiordano@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Add gpio-poweroff
Date: Mon, 16 Nov 2026 13:41:06 -0800
Message-ID: <20261116214106.185918-1-ggiordano@phytec.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|PA2P195MB2584:EE_
X-MS-Office365-Filtering-Correlation-Id: 521bb281-bc44-40b1-5dd3-08df442a5931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|18002099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|10067099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: DA1HwrxAiO332j0s4elNG5X43t6e+d80aAaInRBnaAAN9HDsNaVPHhq459ufWEMJeNu+96qVloR4c3bFSGkUoRD3AvvDz8491kBlNoJVQk5n5ystxD+Krf0ro4i17ww8GnZr4X+E7GV4jhywtXJdhbFOWks89ultirkeQlwnqgY0TMJ4harRCSSzKpH0d4+inksCoxcYAdUE44eNWn5K+qEnINe9cQzkK2RkfgucKGq4yJ8x7gVwzH/T5OZ5Qbng/V2YSV/MbPug7jVj5BCDvTYDOAid7PSTO+iVocAfvr7g2y1Za0SsTUCmqGHHoTSZ4jGHtfWZSPxSbiQXjDwwUWyT+DM6V7jyfOPFm4Znh7xp5bvjC1uwZycU0DkybKL1g2rysWu/Us6ybJstQDHtee3+PhOky4eeZyXARZ9t9Cls1F76XRN37pSoA44MtD3ZOIqXLaM3FuwSDOSffBJe7AW9qRKs+43JXNiVDuNWwKowhBZvAb+GVVyHi5duwAQ4vnKPNuc9Nd+HR9wN/CAMAzX7iSttDpG3hl8oOJVqd1zx+KP5l9+CQkIdBQhDlLIfJ2N7Z1hm1961nbgPCLUsnOfhh4W+19xu2Rj27UXke8tMPp2fjljSuwNvWkG+gQQBIOar7mWytCD+ocQ9jU0vRFzW3IkuJekxA86VHQ24yR9BQT/Iy7XfnMi1aKOxo0vYmJjXYTH/Nz8pmCuD4dBDyg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(10067099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TFpcpGE5CXJlpmRdsFAAxHYqVDzXtgijNXf06AYPwpmQNf3UjiQDnrdLV/KfqDkQlSUOijepR7TByaj6RKpu+LyJ3rNFua8giTuBoxJB3warjOADVKYk/YXH8VnBIjXB34Lnvq3XqyJpwI0r015yhfMfIKiamoeJ2OnvLPCxUbml/VIK19E3S9I32QgwG6vVm6dPKCS+weDQ6QtPx2tQGWhZ+Y1rkr74srX7QXkEeyQQ9a8x+etnbYasxNTx8B2FZMxEB0y9d6/GU6rM6HhA6O1KeLWEKIamR4VUjWo/INV9D4+HQjT72iF4pBerSbXEM5FGkfuEiSRbSe8a1SQz9wv4bb6lib/fZsedUNu4Mmc+MMnjuIThIvBOqBv6jQ/rJFajDVP2y9ybKwmlWbM0k/1TLDxHUDwlSgypbLI+artCA/cIi681Y30Bz+caDm9u
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 21:41:18.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 521bb281-bc44-40b1-5dd3-08df442a5931
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_134127_401633_C66B67DD 
X-CRM114-Status: UNSURE (   8.01  )
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

"poweroff" currently only halts the board, and the RTI watchdog resets
it about a minute later.

Use GPIO0_41 (GPMC0_CSn0) to drive PBC_nKILL low, turning off
VCC_5V0_MAIN.

Pushing S9 brings the board back up.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index e4afa8c0a8ca..4663dfdec036 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -164,6 +164,14 @@ led-2 {
 		};
 	};
 
+	poweroff {
+		compatible = "gpio-poweroff";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pbc_kill_pins_default>;
+		/* PBC_nKILL: driving it low turns off VCC_5V0_MAIN */
+		gpios = <&main_gpio0 41 GPIO_ACTIVE_LOW>;
+	};
+
 	vcc_3v3_mmc: regulator-sd {
 		/* TPS22963C */
 		compatible = "regulator-fixed";
@@ -312,6 +320,12 @@ AM64X_IOPAD(0x02a8, PIN_OUTPUT, 0)	/* (E19) USB0_DRVVBUS */
 		>;
 	};
 
+	pbc_kill_pins_default: pbc-kill-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x00a8, PIN_OUTPUT, 7)	/* (R19) GPMC0_CSn0.GPIO0_41 */
+		>;
+	};
+
 	user_leds_pins_default: user-leds-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x003c, PIN_OUTPUT, 7)	/* (T20) GPMC0_AD0.GPIO0_15 */
-- 
2.47.3


