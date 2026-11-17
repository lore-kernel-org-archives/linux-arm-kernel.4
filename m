Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0EB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0BGwAhm4;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CxpAFc/B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PL5s4h5SQvSZar1WQZUnTL/dCj4Kbxvv28QdqmhaHuE=; b=0BGwAhm4UuxUwbCoNG0ks2pTp6
	RbDBcL78E0EFbC2ZRI/vFHJ7v/xP9cDBGpujOAHgo8VIxtYhlFKTA43111JWcIdzhmmNw48RnZiHK
	9qZBexu7YCkIS4q+nEKWUlZIEnLBvOOWE9q0+5I0Qe9eJ134kYGafsTA1SbKstd3OfMj+gTPsCNhL
	qNMnrZIgDrpKbZf25NmGS459qi+LNVdC8dfWfAf+1UXudk47ZMPIPOs4+wcnWJsurlkiZCYZVYcGD
	o+qcw4UJAL57R7ij3NxLsCVcw2uVRKxNK+M2XwotOqCqPmyN/B2YiencVbdgE7Rb9gkbjYFbYJPdc
	bRSD324A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKil-00000006Fem-0wWB;
	Tue, 17 Nov 2026 15:03:43 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKiZ-00000006FZB-0xp7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:03:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3dH5YlfGytMu/ZOnofnYepST5VF9u/hZoDkzjTxtLyolRygDaLnhv2QzosPtW1MbHF5R9SSiyio2zHf/gb5Ao6lPDXTP9RiKInNTsPdJUbq8izBbl4+DB66S6tLSwvhrNgvG4JXH9pFMXexNNqm3tyEQGuBrwPy/QyvHZLKEjXC4rIpgfv0MEib3qcIOnmR1tKreWok6bb7sBjJGRDFE3v40Y4T/aeGgW35F9N+6VwR5XFV/dCUDC7S+le280CGHd+OW4lU/A0DVng15Vnp5dAAiLz9jVtd1M/moJWGj56ynv6WzDQoT/agr8P2v+1t6vx3uzoqkhh+U9mCX/uewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL5s4h5SQvSZar1WQZUnTL/dCj4Kbxvv28QdqmhaHuE=;
 b=MMTHViWVWNIxx7oZXWRfMWVgr8OWfYMmUcegGMQZ4nxKD+MKvvAKHjz1whcJ+6AuM63A1en4kpT4VYtfr2Oqm/AVkBdBoUddyJZJbvvYsWyu6q0rpJTfIX6AkBInjcfDAy4PiB5ZXM5LmZ/0VhHWd0khiI4y2quR4pBSu16TQud7RaOjeVZsmhAj/Y/H7aucM0vdSKgar0NxKVbvO6UNlHpuIvhMfd8doN9Fd1HWuE3Fl2ptVuxodeFZLhInxUFGR+fMSggqqfpdGXIbtLEc4lcz3dkAbR4h8ymlFrY9QKtjzuRrbeYx8Jl20CuYjRiIDQOkLoLdiV9YwiNSjTGn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL5s4h5SQvSZar1WQZUnTL/dCj4Kbxvv28QdqmhaHuE=;
 b=CxpAFc/BFs214k+xs8+qDID/6p++EgDjfnLG8Tw5aCGmPdqaEHHXAxtQDWJc+pJlXVC4ieWKqukbJm1BAQIqppnv5ffnf3FEu7Mboy2It+MJDmuzR2oD2MIZmK8ev9p4hMv5fIPjzl9xL5aFhQPjMlgW44/jfsshE5B0yUhGbLM=
Received: from DS7P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::24) by
 IA0PPF04DCE520E.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:03:15 +0000
Received: from CH01EPF000BE940.namprd02.prod.outlook.com
 (2603:10b6:8:223:cafe::3d) by DS7P220CA0036.outlook.office365.com
 (2603:10b6:8:223::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 15:03:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE940.mail.protection.outlook.com (10.167.244.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:03:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:44 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 09:02:40 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v5 4/4] usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis
Date: Tue, 17 Nov 2026 20:32:18 +0530
Message-ID: <20261117150219.1326693-5-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE940:EE_|IA0PPF04DCE520E:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b9aeee-b55d-43f3-fd40-08df44bbe813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|18002099003|6133799003|22082099003|261009223027099003|3023799007|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: fsrn0arizDWdVqBQYKAegpcwZykEdfkQP/kvVg76AP6aJMt+B1CIfGT6AsVlyOni0c4bwCCyhH7PZb+1KnbZQb9QPIyBwos49GPFHXmDNyyNaXabCe1acbI5ZiOW1zKmy4B5IfGOmvaqFiv+PKBfv7YtcEgYYicLODvwLFFok6bzmzRePZ2odQ9khFyJXrBaLlk+KFH7RTQ+I0rLXElMnwvZOBBJ56fqs4433neqyi/wqk32tf+PK2h8OXE2Ex2x6s0WuNRZ+O/2OmXrSl9GvFAI1g8WcXdyCMJ3zNiUcLibt+HzKSujfutEz/xdYe1vjLztxfd33DKZPhuMM7Mx/d9Z4YuECB0I2+H4gV9qXn63XLxLrzJFAIDaukrhLzslkJZjt9BdXIu+hQP65W8cnHFqbwvDA8IceZK2zSRLV4zZ/jdpc8PRVWCQdTHDxpKdNG90fDbplwS/B8uNMN6Pm0u30Y8ens7skjd7GUq9q2bkQ5lTaN5d++dSGxEtTU7GbgCddg94ix/si1EhHXquHScrbMM+IP5C99tg5Z8hNBfxEEl8Iz6QzF+yJMMQrkSHDCaiUyWV01KXtPpnJIx0mjySVVQPLORc5rtls/I/jy0fK6bLDVFdEvhl0ZE0WFgqIuJmodpAAEaYqr6WEG18KMhIxQGhEEXIeD1qTBYdEhBZTwz6DaqQS2MX2AYCCmgviNp8C8v1eWwL1lg/d+AsJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8TEEJRZ8ZrKu+Kej2DHKNVrxPneBJmC1wzEknzfRScsJwj7scQx+Wfa9wXl7eEB5r+K/nK/N1O4MBm0R2TP3zD2bG9ZJ3h6x/s9o7NGK2FXDAWtnDhNTsGIpUW13/x6EzC5Ro0vd/3KtBhPpTkdtz4OKkuYZEGzKDEvTma5GGiSd4jgyQN2Eu25DhVKVQUilbBTPuNHW7TiJlQvYZxPt7AJZOgKaMCnPpsvMR07sUBPB8/goa8BJIvAoXyeY++wmYqryKeNtvltSyJwTZ3Q5qeL8GgeDft7huCb6R97egH/I6gaerGp7jPdtgV21laVjSuoeaBIj+gu9YBBq2myJSPwS6DNmjIy3aEJqfbnRIeXqykwJsXA1HDGixu6K0p1PatOhKqXRCKb1a8keuSf9n+IF3ZRoL+ZuyRx/NTHGCnRhLJSTeaHtulntoraOQE2c
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:03:15.2496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b9aeee-b55d-43f3-fd40-08df44bbe813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH01EPF000BE940.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF04DCE520E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_070331_337157_672AA3D2 
X-CRM114-Status: GOOD (  23.26  )
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

Introduces support for programming the 18-bit TX deemphasis value that
drives the pipe_TxDeemph signal, as defined in the PIPE4 specification.

The value is supplied by the glue driver through struct dwc3_properties,
which the flat model provides for core properties the glue knows at probe
time, and is programmed into LCSR_TX_DEEMPH during SoC bus configuration.

The configured value is recommended by Synopsys and is intended for
standard (non-compliance) operation. These Gen2 equalization settings
have been validated through both internal and external compliance
testing. By applying this setting, the stability of USB 3.2 enumeration
is improved and now SuperSpeedPlus devices are consistently recognized as
USB 3.2 Gen2 by the MMI USB Host controller.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v5:
- None.

Changes for v4:
- Pass the value through struct dwc3_properties instead of the
  snps,lcsr-tx-deemph software node property; the flat model hands core
  properties to dwc3_core_probe() directly.
- Drop the per-port DWC3_LCSR_TX_DEEMPH(n) macro and the loop over
  num_usb3_ports in favour of a plain offset, as MMI has a single USB3
  port.
- Only program the register on DWC31 and DWC32, where the LCSR space
  exists.
- Add the UNSPECIFIED sentinel to DWC3_DEFAULT_PROPERTIES and spell out
  both sentinels in fsl_ls1028_dwc3 to avoid -Woverride-init.

Changes for v3:
- Define DWC3_LCSR_TX_DEEMPH(n) and multiport handling. Thinh: Please
  review on this offset calculation as MMI USB IP support single usb3
  port.
- Default set the tx_deemph to the DWC3_LCSR_TX_DEEMPH_UNSPECIFIED.

Changes for v2:
- Don't use compatible check for deemphasis programming.
- Rename property "snps,lcsr_tx_deemph" to "snps,lcsr-tx-deemph"
  (hyphens per kernel convention).
- Fix double space in LCSR_TX_DEEMPH register comment.
- Add blank line between register offset define and "Bit fields" section.
---
 drivers/usb/dwc3/core.c              | 12 ++++++++++++
 drivers/usb/dwc3/core.h              |  8 ++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c | 11 ++++++++++-
 drivers/usb/dwc3/dwc3-xilinx.c       |  4 ++++
 drivers/usb/dwc3/glue.h              |  4 ++++
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 372737f4750b..2dce995a51ca 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -642,6 +642,17 @@ static void dwc3_config_soc_bus(struct dwc3 *dwc)
 		reg |= DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
 		dwc3_writel(dwc, DWC3_GSBUSCFG0, reg);
 	}
+
+	/* The LCSR register space only exists on DWC31 and DWC32 cores. */
+	if (dwc->csr_tx_deemph_field_1 != DWC3_LCSR_TX_DEEMPH_UNSPECIFIED &&
+	    (DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32))) {
+		u32 reg;
+
+		reg = dwc3_readl(dwc, DWC3_LCSR_TX_DEEMPH);
+		reg &= ~DWC3_LCSR_TX_DEEMPH_MASK(~0);
+		reg |= DWC3_LCSR_TX_DEEMPH_MASK(dwc->csr_tx_deemph_field_1);
+		dwc3_writel(dwc, DWC3_LCSR_TX_DEEMPH, reg);
+	}
 }
 
 static int dwc3_core_ulpi_init(struct dwc3 *dwc)
@@ -1695,6 +1706,7 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 		dwc->needs_full_reinit = true;
 
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
+	dwc->csr_tx_deemph_field_1 = properties->csr_tx_deemph_field_1;
 
 	if (properties->gsbuscfg0_reqinfo !=
 	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 267c922ca11b..89252ca138eb 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -182,6 +182,8 @@
 
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
+#define DWC3_LCSR_TX_DEEMPH	0xd060
+
 /* Bit fields */
 
 /* Global SoC Bus Configuration INCRx Register 0 */
@@ -199,6 +201,10 @@
 #define DWC3_GSBUSCFG0_REQINFO(n)	(((n) & 0xffff) << 16)
 #define DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED	0xffffffff
 
+/* LCSR_TX_DEEMPH Register: setting TX deemphasis used in normal operation in gen2 */
+#define DWC3_LCSR_TX_DEEMPH_MASK(n)		((n) & 0x3ffff)
+#define DWC3_LCSR_TX_DEEMPH_UNSPECIFIED		0xffffffff
+
 /* Global Debug LSP MUX Select */
 #define DWC3_GDBGLSPMUX_ENDBC		BIT(15)	/* Host only */
 #define DWC3_GDBGLSPMUX_HOSTSELECT(n)	((n) & 0x3fff)
@@ -1196,6 +1202,7 @@ struct dwc3_glue_ops {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @csr_tx_deemph_field_1: stores TX deemphasis used in Gen2 operation.
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
@@ -1448,6 +1455,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	u32			csr_tx_deemph_field_1;
 	u32			wakeup_pending_funcs;
 };
 
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index a53991a46b4c..71f11bc0d652 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -223,7 +223,16 @@ static const struct dwc3_generic_config spacemit_k1_dwc3 = {
 };
 
 static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
-	.properties.gsbuscfg0_reqinfo = 0x2222,
+	/*
+	 * Spell out every unspecified sentinel. A designated initializer
+	 * cannot override a single member of DWC3_DEFAULT_PROPERTIES without
+	 * tripping -Woverride-init, and a partially initialized struct would
+	 * request a value of zero for the members left out.
+	 */
+	.properties = {
+		.gsbuscfg0_reqinfo = 0x2222,
+		.csr_tx_deemph_field_1 = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED,
+	},
 };
 
 static const struct dwc3_generic_config eic7700_dwc3 =  {
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index c68246921a4c..10f70bd119d7 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -45,6 +45,8 @@
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
 
+#define XLNX_MMI_USB_TX_DEEMPH_DEF		0x8c45
+
 struct dwc3_xlnx;
 
 struct dwc3_xlnx_platdata {
@@ -517,6 +519,8 @@ static int dwc3_xlnx_probe_flat(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		probe_data.properties.gsbuscfg0_reqinfo = 0xf0f0;
 
+	probe_data.properties.csr_tx_deemph_field_1 = XLNX_MMI_USB_TX_DEEMPH_DEF;
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)
 		goto err_clk_put;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..8fa7f0f696a8 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -12,16 +12,20 @@
 /**
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
+ * @csr_tx_deemph_field_1: Value to be programmed in the LCSR_TX_DEEMPH
+ *			register, setting the TX deemphasis used in Gen2
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
+	u32 csr_tx_deemph_field_1;
 	unsigned needs_full_reinit:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
 	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,	\
+	.csr_tx_deemph_field_1 = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED,	\
 	})
 
 /**
-- 
2.44.4


