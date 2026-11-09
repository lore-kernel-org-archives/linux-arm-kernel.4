Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE5B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5KT2022;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XnqlTlES
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=En7vb0S5km5GJnk/P0b4DD+EHYGjR3uCY6/GG62654k=; b=I5KT2022oGBE6RCtAFB9Johk4U
	SKe0phanQJgmER7acGftfVYdBb5EL2D0NQj09DmGlV3OajFuG8Z2VoiH3qYKaMc0jU18DjqwoVggo
	2A6xGcVnFA9bwa9p5jj2rGXWtnkVgTAz7ZpwOtKAvuV7w64mi/rSSELf9iwD8FQRPyaHOxUNK4Xcc
	75+2pAz3ULpuuoGUCb17luDsKYDJWM9YwaIlP5tpSoqOLOikaN9N//PszNpKy1KN5j33oymfbSeA9
	/RJfzYiT7aZa1hozn/bmBnI62QE5rOdbhIaL/LTxExb/q7dpYayZi9XAM/OjUFJmp09GEhvH8XWFz
	nNuqwCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEwR-0000000H70b-1hwi;
	Mon, 09 Nov 2026 02:17:03 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEwO-0000000H70A-3Je4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohx9V8JS7mVrD/kslCENt9sPnFGckVDIhJxhutor4HVTgLfeKOcnMs65a+Bg7FzJbQ2hBsRv2ZH0vYe3mkNdya3biRdw9hYbvlZqT8uk1aS3lE5TdjlfVgQ9lDxsQcNXNI9nJjvS0xTpzgjpzGW51Dn9dN4YQATmYpbZyxrxnSpjq8RYCuUORZIZHO7bjK4k5gV9KTCUBq57x1URvccUt0bMBGSDe+Fc0KpthNYmq9dBAty1wuIr/5Vbss+eH+kO8SghCgUyCSjvYlHXxLGcMiQ6vl2X2QqhQHj3ta0+JB1itJCGTLyHklfpDMtxybyGn26dR0iq/q9xNHscIFov/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=En7vb0S5km5GJnk/P0b4DD+EHYGjR3uCY6/GG62654k=;
 b=n8v31oxXof571FhSo7do9J4Xo77RR7cU6pI75K4PwbHcfe7dB4dOOi68ZzeV33fdKHTJjUcQBNm5gKGnowg/3t+Lw9pucNe+e+m0UvWQs5DjSrMtfYmZmUcpDPfzYOopwyO1j5IsVk0mlek4Cb++BW86GIEnbuW1YTkCaQIyM98rn2YAgDY6qYUXBx2pxxO5dHrpoR4CnKOf28zZJ81mKW/mpq75O6rzsmlkGZIZi+s05unms0v3jwIBUzuTb0vGZnjr2nqmsrCaVOXS2i71c6k/5Olw6mWowlaDf/wjGZoD8BFtVCRiyuJSBJWVqn/xIufvUPat6kxK63s0lxWgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En7vb0S5km5GJnk/P0b4DD+EHYGjR3uCY6/GG62654k=;
 b=XnqlTlESsHtC8juOP9ZkuGmZ02ozY5QKAczLsSKm/E9I0Quc8nRCFhco3KHmQPen6XAIKaJ6j68DJ5/MtsFU2djdmdYSR7Nj3GLWIFwDiKcQfmaaY0JjT0D0potIHNu74XqTucBVblbUXqTtC3F0FUhucKHx/aSpMPOR1+GJaFYbKBzbRImr/Vr+Utz+7TPi1274JDyh5Rnf5TbyUibZQb3hrRw+Vgi6vVX7ShRIt3ZqUZfd8PNirg3b9MZciWanTNp8we1bLQWAciyH/+QuONoUvgRs44OoQV291OUhRNqyfkbEk2ZztdP1+ykgCu09xuZ4zjW52sHffgY8ZYJ0og==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by GVXPR04MB12343.eurprd04.prod.outlook.com (2603:10a6:150:2c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 02:16:55 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 02:16:55 +0000
From: hongxing.zhu@oss.nxp.com
To: frank.li@oss.nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2] PCI: imx6: Enable L1SS support when supports_clkreq is true
Date: Mon,  9 Nov 2026 10:21:39 +0800
Message-Id: <20261109022139.3226052-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|GVXPR04MB12343:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5c1da9-0813-4490-91ee-08df3e078610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261021121427099003|261022075727099003|261009223027099003|261102123227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: DK7ptXIdF8zMvryG0odICP3BhuJjLe31mt3LwBrsxCZSsoYO0KftNKEptBZCeYXibEpKD2ahJ7ObAMMjREckusVTQMc/fOjm7NYrm5e3eqLLlg1ZAs1q6q2fcoV2J7d/towco9ZluHH0u8EvU12CJMGTcYd2fLh+vaHPShRW+rZ2sfHsg83vuBC2T76JJEWo38j/o2SdtyY9El3MFHWr2w/b+YUeynYPPMq6dwNt48YWJrwNyrAQzaBykLwB29PCSt6HWCdO2iA1U5FelBtBwBpqn5coj68cdFEX2mBAXb/QVxJYejoyJbslrIJGurOR1zbwqF/jpqQLz9Ez2Jsf3WLsvPoOmZhZTESmGfZCLrHP+FSVZyKsFV++mbdE/3XpaIKmjNMP2JiY87q4TugjL2wF2iqqDvb4DA4J1HPhOQjkxTHQzZ50kgzEd5rb2/ieK7gFsk1yllG2Qdyg1YOws98QEkl1fO02nmZ9WyPlIyD9KPiRThU4/jUkv4ymrU2UggyfeLVUq7L5IX1Tnw4heulHl46ZhKP3I55rwwhC7XNy0Y20P+Drh8SIKYu7z+6gyZOk+iiank4m6Cy3OufBLJamEnxFLD6OS9ueQgKG/01iFSgud/mCL71Y+FPU83egVaHSeYgw9Aam0/6SK99s/Le8K3fjYkzH9UETOzLL7RH4EECRTOHDneV/vyolN6yZIxgnvilNDI3xMu3XUnidOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HGwFnd72k/L7MMi85CgOWcJW0MhbbvtKr/DAB+NWStpkUceeWPy4CVeSgDR+?=
 =?us-ascii?Q?emcjKjFYRwFF3yvwG69c9/TaDXIf/oDLqg4UsvdPUMKLXhwTa9PztqqYsQfN?=
 =?us-ascii?Q?nqyzbBUFpa3VH/sZCA72eICOmGz15jleebr19DxRZUqfV1OYiuTZuzir3Owc?=
 =?us-ascii?Q?G1qbcjc6+oagImBPu5eUWE+3X2LPumacLj/GDIlkV7GMpsDWKCKMKaOPphGT?=
 =?us-ascii?Q?Q8wGu4uba4y8CS+47FdR2HOgwpEux1GdneJiZzlWapx7Eui04rjiak30jhIR?=
 =?us-ascii?Q?6FQSkP5LCaq0P5MOCjjiax+Nho3cF0l7xzK6r33mfaptdm4A284BZQXImyhd?=
 =?us-ascii?Q?liPdy75YjwgDYJtUui9oa1fFGHCv0P3ah/QWhs3wmDxZW17nAMu+g4aefTV5?=
 =?us-ascii?Q?5WUZOUA54kDvYx7c3/SHoXBKO6SOUoLctaG8+2uT/YGz/6+Rn/Ld9rq6oNKL?=
 =?us-ascii?Q?1fItMbIhYzxHacUHZFyC3XJ/O0cuePxLvrWf6TnYvvUrF42pOZMC+e6yKes7?=
 =?us-ascii?Q?R+KRwsDujOec0eIkG2mlzKqvJ1QKhsWc2Idh8uANMFFQK50OG6AgPwkb9iUz?=
 =?us-ascii?Q?FPEnHWUrqNpLfGT6jPFZ1ZIWzXVJJR51k55SPKx7q82DjFMULqBVOJvRwba7?=
 =?us-ascii?Q?vXzqH7G0ePxwYwZATSx65OuAnubBkAaEDhyyCiAiRnAgv+ljoprnCph9GKzW?=
 =?us-ascii?Q?pfBNtEfBtYK+pJhSpxMJ2aSEnpL3GHQUZizpaVI9AQ9uRcC39pamk6WpAsY0?=
 =?us-ascii?Q?pMP7IdTbhLDF/I2+jFN0y/A9hvm4L4yq4l5svdf/jLEFkekh1wWssiXbPaNG?=
 =?us-ascii?Q?Oi4Yoqojm/4OPzirF0YTYEwK043lUY6xxvCH5BGUUs90v78ohmLkYVEMcKe3?=
 =?us-ascii?Q?H1ukZkFnSjLAL7eMyp7JK9abwn8BaD/zlL5kCgBtv4uStTVA2SZ+yRT/ILLv?=
 =?us-ascii?Q?zbiMkZXUXmRFmAOp4PNY0dbXRlcT+UUbb2JvaJ94lTq98l/LZs9Ee1zlgnA8?=
 =?us-ascii?Q?dMIHLZ+2uYFrkl9jeGlHNiebbe78qGQejVPuO74KpvfLeak6suOe8lI02pCA?=
 =?us-ascii?Q?kP8Owd0tAM9omY5srlhNTkjKcOKxlGDR70A+9duNdjUEFeSWiOBHoeHj4VLd?=
 =?us-ascii?Q?v3FCDXm04F+Kg0LYtBj6dJhbmXZgah92up7Foup6Tuw4b+5SzbnXvTA4Z+vb?=
 =?us-ascii?Q?zu9BPRKb4gtrhdkYjeRBHN+nh7rUgnneECRf96yKV/btiVH+yp73Zsw62Sp4?=
 =?us-ascii?Q?AuOiHaewG1JsVAtyk6/mu2KeLmUPAL4vNH0IOsQWTPGWkAiPX0mpF4KKls5d?=
 =?us-ascii?Q?ltAFtSDlTGIyU6sn91kN6kjrWY4LGOm12yF2H03p1jMgJLtVsYBmHuJG8+y+?=
 =?us-ascii?Q?HI9Qo6/7pVSXHO43L92g6c5VPntBxerw7l0NofiZhskCUA7aVcSUUlKXAq0/?=
 =?us-ascii?Q?zAKRYkZpcTdA/8kTB5xQLPZDHBe4AVhlYnQTL75DgAYp1bMEiPXgPvtZOU9H?=
 =?us-ascii?Q?O6oGT5LY3nmTMorMDyJEVXz5r19ObUD9ijs/HVvLjrD1JZV+xyWzJINFko78?=
 =?us-ascii?Q?goUk9UelhxFBgwCt2RFjv41vSqvWYtVD/3NHH+JwEHeaDUDh/HPVXKa1hmSd?=
 =?us-ascii?Q?woMY+WTezunvRwACpfkBiiJh8F8p1LzN0p8RFVx6MTvFehC7umhwZFuBJ2y1?=
 =?us-ascii?Q?kt8miVeXqKaK91c1z0S8W2eUpvmdIxoPtuY152fL7Iizzrjibt99APlZ1HtQ?=
 =?us-ascii?Q?Wle6vYc84b86E3eyqHfShG0uBfNgAlEMkec0/7VRs/PJ8vGJT7EJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5c1da9-0813-4490-91ee-08df3e078610
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:16:54.9640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfN853sGxI2X1jhrAVj1iUxEOiWI8JyGg0C+uxMrs02NlhLY/UJFpxIubxetLMWtWACQyYTP1AKoMHWmrO/L3mEX8bzVXoc7BJezI1JsKqKwyYo885EQGuMPY+0bJfOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12343
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_181700_841933_91F9757C 
X-CRM114-Status: GOOD (  11.55  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Richard Zhu <hongxing.zhu@nxp.com>

Enable L1SS for the i.MX6 PCIe controller when the `supports_clkreq` flag
is set. This ensures that the PCIe endpoint can enter low-power states
efficiently when the link is not in use.

The commit a00bba406b5a ("PCI: dwc: Advertise L1 PM Substates only if
driver requests it") clears L1SS capabilities by default. However, the
i.MX PCIe controller supports L1SS as indicated by the settings in the L1SS
capabilities register. By setting `dw_pcie.l1ss_support` to true when
`supports_clkreq` is true, enable proper utilization of L1SS for i.MX6 PCIe
configurations.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
Updated the commit message to provide an explanation of why enabling L1SS
support is necessary for the i.MX6 PCIe controller when the supports_clkreq
flag is set.
---
 drivers/pci/controller/dwc/pci-imx6.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 83fbd998551d0..4eee02e135656 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1501,6 +1501,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 
 	imx_setup_phy_mpll(imx_pcie);
 
+	if (imx_pcie->supports_clkreq)
+		pci->l1ss_support = true;
+
 	return 0;
 
 err_phy_off:
-- 
2.34.1


