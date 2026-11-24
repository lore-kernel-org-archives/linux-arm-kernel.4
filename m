Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+7LxR2+;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XZmHQMze
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xOFozaMwmo1idqMUiXc1D2U6cKaVfmPBvQCvoagkPaw=; b=d+7LxR2+Idg4vBHBToLbOd+xFk
	SuoYKWioYTxMNBlMTzesgYjeXpw8cYs/Xn0kEG+5amtz97PvMsG9gamFFyYNIRqXdRK4HvzCb6iFn
	ro9wxKxF+xCDeoLpcls8xmAS/PZt/20ksGo9JiN+4KAUpE66R3tdq5astsdEr2E8Hq5OUiQF8D3a3
	xnRlhkftorohjAyL6BxBufyp220YhW9Htc6U4YkiadLL3zVzhfhWdkf+2ZdOMzJINXMaYloNrXm5M
	D3oCZJ7Tml1DHDbxvJQjVQDzP0WryRjQqsr0akmMej+Au0mqPenfcU6yDVTs2BqvFJwoQJhmQzDku
	BEzcoZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqMD-00000006aRd-1YDg;
	Tue, 24 Nov 2026 13:14:49 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqMA-00000006aQP-43qk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:14:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzjfulqIggLf4vO1TFwCzlbqZ1Gio2+h0MzXxOG7f6guBKFXcyMoRUH3PF11xweYFfw+SDC8SAxDTtMiHCovlsOIQ51mEmtC4FkGuNMfujhVKfLnN++E4Dh91zY4G2Mua91jEay6ohV1TYiCfjhl1fkSJ3dKYYB3DJlKxpmO2o/WUF5aehks4NWOrW36P53waVMU/b34XOK1x7fbFSLXd2s3nLFd5+0iKanOPO58Tnaf/mPLuJIkF0Gv2C7jk0K/WThxkfGB3F2sLfPfX8C5crtGvNeh/922czr3tj+Ae/aKurJfIna9nYbNzrgGyws30/mAVBENwbJec46c+GCEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOFozaMwmo1idqMUiXc1D2U6cKaVfmPBvQCvoagkPaw=;
 b=eq3EXyncYX//Ow2eMgH8qkJHO3ttiJWd7RDcLNWAvPL5M6SmxZcTMIINENxO8G56/L2h7LOITJk3DzgVrOhr14Tdtyc6PgQINYe8kbcetr69eb5WpSYVHln1Df22s60y7ShwQI6MSI0AbgwAdsek2P/TlA+QCrQqVJIHTnaeGGhz5SwBqFU18Rbh8EXNDa4DC2b9pgZLfsxvC/6maqLjF/DGd4bma2nIV83Ci57E+SCtlv6ofJ0JSLkfShoqi7cdOfoh5X0hKZ2FrYuyeorhSTZhBjrLkwdCQjf8X1GF99kh3CCVvhKV4mG9Wu1ttBwWz5CA4nFfd5E0Gq6DJ8j++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOFozaMwmo1idqMUiXc1D2U6cKaVfmPBvQCvoagkPaw=;
 b=XZmHQMzeeagFqgiUmT1L4aC1dOtainJ2jV0AM9qeEkZad01A40eMZeVVwhN1wa1wenPdxsmm3Z9LA5HAw5oV7gZu3JkCmTh1KApK0rtF6tBlsApN6M3SlUF2lgCRhEr2usIXi+zBUEurQ+opLhTvXakO+nDBdb6DfEoex0GZmwWYFJy51MOV+zVa4kUXrAqDECFombGbeFauS/iKqesiWyp/c/t8dPT6iL28qag1TDBf8UhIYqbAm9MaEiBZYHR7ErbUljOXrVCOPamYrq+wHow1S80I2XAk1OgvIckQTfris7AZrsKeR1eccUcxYCio8JZTfluJjncJuowYOHMHxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by BR2PR04MB325065.eurprd04.prod.outlook.com (2603:10a6:2c8:7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 13:14:39 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0639.010; Tue, 24 Nov 2026
 13:14:39 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: linux-pci@vger.kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sahil Malhotra <sahil.malhotra@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] PCI: imx6: Fix kernel oops on user-mode external aborts
Date: Tue, 24 Nov 2026 15:14:32 +0200
Message-ID: <20261124131432.695946-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::12) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|BR2PR04MB325065:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abc2366-ff2a-418b-7556-08df4a2ce4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|11063799006|56012099006|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: P5lKTQh7udyduEObFtgvGqfTvI1V/omho2eHbptgj1PN0kgeVkHv9fjmAPZR95VlHXUtG8epLeSmlMOol8AptYo5xoqyJvrszXcrL+/meqKEOb6RHI59U8uE+IcTL4B+G+QexBU1OoaqXr7MLoRoT9oS8VPa0ruee9AbUnweExjQqUgiu9qu+U6BiTIQQt62ibTlO3AWlgoD91x2bVkms3FA9t9ys74o80aWtRKvPg4vpSZMto0oCnkRcZ+ywG185oV5lWoaB0ts9GdxaHPK2GsPMp9T5gvjHNuEOIrG8TNbjnaDPReeHd31MgE8GKQeSferiB9QJ5cGCm5ooNG4WqfHVjYx9WTmxYJzLvW6pOEWN0szsp9BZhRxVpwHy95wgShTRvaXQFMtC/Wh11Ux+ILXGTyBlpMlS+0waRU/l7ctKtPr41TSESMW6JxM/SomFqSli7Sa9HWXbr1a+F348xGr9VUUwtffgtoT5Skf7kzAZNKbN76rf0hHGZSTgSHnN/nJ5NAiwNebH/k0KZUKwMacCPIdFecMUEGpqZ1tCEq5hAml0hcMdiXQkJih0TZJXP8S8jQwVtoVsZWmgtT9Z/zuId9bxjgUBqMiCu0GQS5Naja1uhDks9YtAUkN0Tf5a1bsBetZGKNaVrJd17MqxWhmHrfeXvraE2wmQ+87sHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xwpyi0Js9UTX4uMxoVxLnTUHQZCvUQWOreeU4azQCUFEgl9Vl+CxkhyzOQoG?=
 =?us-ascii?Q?WuD4rTSCrAy7fkuw3KLSjVWuIntZ2bQbFp7zkL/hLAqHn3PnLqC2areRtlzU?=
 =?us-ascii?Q?714K3b6zqllL6WPYfySxcbQur676UFEddLQgI7O2nwrKk4gqjBY/IKA6HPWP?=
 =?us-ascii?Q?Ob8IgdV8V7H/9Puo5DrBVjWbJ4nBrsQ87cgxLbvhzWbzb3/rjoe89hd0PslY?=
 =?us-ascii?Q?ws0y/ENdHI8kpcR7COWzzHLkqebHteP713BGHRrIkLCY6zZPMF1dLbZocxfC?=
 =?us-ascii?Q?NqHeVm3RuG5PljlbKsUO6orBtT2f634+bZApTqrUDNTIrPRT8zADFAWVFS+j?=
 =?us-ascii?Q?C5lZzK+nus80roM6JPUz5lC0lRHp24w8MvAjqzCe0u/RgFERcA80jrlYaw0N?=
 =?us-ascii?Q?ALKItPJgbIMot/LrkjwBGzt1amACcKG76y+eta64lK12LqykgpLktUieAmSP?=
 =?us-ascii?Q?7g7Rq+hhbGf6MJIV6V6DAw+DdJoCrKetUNaC+dgKS0b3h9R3S94Mm1AqraTv?=
 =?us-ascii?Q?NHdrWvM4iv1g8aMuGo80f9JzwCIeWRuPNOZssJK9kqq1lYYuXAaGIvTxNger?=
 =?us-ascii?Q?0pxxgVyYO7T3PBuFRllT3pZE6zw7OLmjOPPPamvM28OFEYzWhjJBn6sSfuAe?=
 =?us-ascii?Q?fhz4blNKPmfsVpEXVNy5jJ9M/O7cP3FHg5b7jNic0kuFLtYN/noGlbP02U48?=
 =?us-ascii?Q?f7Gr+0eeRY2OjwSmwOeKkv2HgWYanWB5/GVQ70Hxk1p/VOlGkRMRbu1Fc+mk?=
 =?us-ascii?Q?DeV/TiLbvj++nLleuGAiAUeF1JiBDuK18EzAs4DRkUnP42SUMjRK+JSuU35t?=
 =?us-ascii?Q?gLpU0oGAOOdNIWlKQIva7BYTf8Di6h9lCo1vnOV1IkQ1bwe4keOhJAakOmru?=
 =?us-ascii?Q?i5LWUenwcfyO1qIMXYR1JeF0onj1XxlcynV0zV8mPbBNNt03KUCQSaT0U+4l?=
 =?us-ascii?Q?XOfCkYfAg4kMyTlddd9pi8Bumw4Qc9TK955nXetBRlGeTsai6I26Rl/GLMHX?=
 =?us-ascii?Q?8UBuGP3ZRUDQ9ix+iGLa+Ir9ETcJhcguQx3+d4dk9cpqzlFMGwa6qOcjrKlK?=
 =?us-ascii?Q?Jx/1DmX+IfvVhS1nqh3sXDKB+sVT6EYZ7pY3/sJ5X1tovq849LUJJtFprOn+?=
 =?us-ascii?Q?RTmwM6ELMK+jTY1ObqxQKjqxQhEIa/v3LAn42h0Th71WXD5RdTOw/x6oMGwJ?=
 =?us-ascii?Q?rgETnd1P4b2JIBzHKTPUWc4F+u/hq76oPiQHK3JRJGrlckUJ4nnXF0Sxctq9?=
 =?us-ascii?Q?fVOOTNgskbzLmEkgrl7FfjPiqogwiBZO+v7E2lxm+IX6lH7a/doQnbNLf+Vh?=
 =?us-ascii?Q?ycLl3RJz5o7Q0vx9m6ck9ws9PfWp8eo9uRcHB/XWNR5Qo6lknpbxJ+pd96PJ?=
 =?us-ascii?Q?hpYUs1CnpSha5nHayP1B3P9Z+b35ngguuHn9/Aj+QutaLbnT0K+6/1ssrYZw?=
 =?us-ascii?Q?BBGl3Vfnk+AwkH3ZTP81+FnMdOwWpkaJIjKUEF+FRNm12cJadwOK9OQUiePk?=
 =?us-ascii?Q?nH/Ia1W7qaOm9clZ5mns0B9SkZQb4DXNIxgioLbttgTv895+zl7054wVrVB6?=
 =?us-ascii?Q?hydBHixgbQEC1xQaw/1H3C+1AA43j9/1YHQaS12ZWyzbSqxkoHtSRQ0B9sG2?=
 =?us-ascii?Q?v0GY1Vd4S/3I1oiifILPpqEDX+go4fzddAH7IHsPr9GuldBhdp33j33KnGwb?=
 =?us-ascii?Q?dG8kiLcvdfRTVdo61VC1rCTpFWhSaAmEbJ+aWsukR5pL8LxiDnstLb0EUmtf?=
 =?us-ascii?Q?zlRqBHCPWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abc2366-ff2a-418b-7556-08df4a2ce4c4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:14:38.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDqy8yfpz7eM51pCK+43XUYNVKcNsbNU4fk4gQy+QMEPpuTU035sF56Pv8Pjhw7C0T8Ufy8PgLfFmAiOyHLJ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB325065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051447_029580_93712EC8 
X-CRM114-Status: GOOD (  17.15  )
X-Spam-Score: -1.1 (-)
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

From: Richard Zhu <hongxing.zhu@nxp.com>

When a user-space process (e.g., memtool) accesses an OP-TEE protected
memory region, the SoC raises an external abort (FSR code 8). The
imx6q_pcie_abort_handler() registered for this fault code attempts to
decode the faulting instruction by directly dereferencing the saved PC:

    unsigned long instr = *(unsigned long *)pc;

However, for user-mode aborts, the PC points to user-space memory. This
unchecked dereference from kernel mode triggers a secondary domain fault,
which is not hooked by any handler. The fault then escalates to an
"Internal error: Oops" and crashes the kernel:

    Unhandled fault: page domain fault (0x01b) at 0x006e3316
    Internal error: : 1b [#1] SMP ARM
    CPU: 0 UID: 0 PID: 1415 Comm: memtool
    PC is at imx6q_pcie_abort_handler+0x4/0x7c
    LR is at do_DataAbort+0x3c/0xb0

The abort handler was designed only for kernel-mode PCIe configuration or
I/O space accesses and never hardened for user-mode faults.

Fix this by:

1. Checking if the abort occurred in user mode and returning early to let
   the normal fault path deliver SIGBUS to the faulting task (as already
   specified in the hook_fault_code() registration).

2. Using get_kernel_nofault() to safely read the instruction for
   kernel-mode aborts, preventing recursive faults if the kernel PC is
   invalid.

This ensures user-mode aborts are handled gracefully without crashing the
kernel, while preserving the existing fixup behavior for legitimate
kernel-mode PCIe access faults.

Fixes: 415b6185c541 ("PCI: imx6: Fix config read timeout handling")
Signed-off-by: Sahil Malhotra <sahil.malhotra@nxp.com>
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 0377d72b54ea6..9a9cc35f6559f 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -669,8 +669,24 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 		unsigned int fsr, struct pt_regs *regs)
 {
 	unsigned long pc = instruction_pointer(regs);
-	unsigned long instr = *(unsigned long *)pc;
-	int reg = (instr >> 12) & 15;
+	unsigned long instr;
+	int reg;
+
+	/*
+	 * This handler is only for kernel-mode PCIe config/IO space accesses.
+	 * User-mode aborts must be handled by the normal fault path, which will
+	 * deliver SIGBUS to the faulting task. Dereferencing a user-mode PC
+	 * from kernel context triggers a secondary fault that escalates to an
+	 * unhandled kernel oops.
+	 */
+	if (user_mode(regs))
+		return 1;
+
+	/* Safely read the faulting instruction to prevent recursive faults */
+	if (get_kernel_nofault(instr, (unsigned long *)pc))
+		return 1;
+
+	reg = (instr >> 12) & 15;
 
 	/*
 	 * If the instruction being executed was a read,
-- 
2.53.0


