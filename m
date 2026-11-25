Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF0606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wvOtqLFR;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TeFRChdT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ME98pSrLrTgg0bMYbtaVsPhWG1zei41KLUWYybKStZM=; b=wvOtqLFRj+rgvz
	nCzDoWM3opYtBm1dvRsfC9yxJNj/idNum2Rhsj2vqQgKPJ455egAbJjrCZxsbQnHz1xG+dhfZ8Mem
	4K36yLrYK5UzFTUm0q26hF3UlJet8PjI4jkJpZT7PEIRewjRAt+UIL1ef1hrsxptO4DyIcNMm+gqq
	Gz7RysKAEvvszsNPG5fcWmW/8dIGuo/0DVUIquLlfA55gKvwNfUc/oWVqkHKXuc5+bP0aTAKU0nCF
	IUdLpoLZseX/C0sNL3Dja3hfLNkuqx62N6307C5o1NW/fxmK55LYcDNVf7ZFD+CLMQouF1LldrQEN
	v9/dDU7W8gSveOXSv8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCAv-00000009qZi-31F9;
	Wed, 25 Nov 2026 12:32:37 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCAq-00000009qYr-1v4t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJdRRgIN+UIMZvF3eg0otSbrmmvZa0Yh1sAidZC2iKjI5H1lyzDt/lNTF+YLzXyF5BPN45frOJKCoh3rOrSStyBEb+odYj2HGABVIxkNwk7bFK58OmeVfsdTXxS8W3EuOYuwME1IekDPgFX5S5J/8WwE0USEgKUonaNlJ8YoaZFm4A8BLMq2e7JJzW0jWY/cH/jjdxfLDRmSt9xwyaW590qolykgCzMM7POuMAoe8rQPWdQQ/1jpeSrg+cYII2UFhBCtrYC8F9Gss/kxAQwgZUTR3VV3ZbMRFSWSL3RHw4FPeFuSGXmwsKs00BX2ESLvws17nuQSkoxsmbHOcoK1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME98pSrLrTgg0bMYbtaVsPhWG1zei41KLUWYybKStZM=;
 b=Sx43OizKv0PoPfjsLZWcTrW4CczGUrEwGpFUgi6KCMope9ftU5w58ifEsVuzfiqAJ121YfaHUhuC0R2dB8ttj1z3fspQyTgLU5X3h+RPvEEV40vyMiwjC6+f/CDtD9VKAwM+6TGJa/mT+pI3NBlv/yfawy1HthwS/WR1wajr3hiD+vPHPTorhNiSMzPeK7Icrr9bRKrgyXO5mFW8xiOzPVmpgM9gZhGg5nkKromvQvwwtkYZa/W4XwWRjd+S/Ebl0RxkQNw9fmmAwXlwu8uMVvp17oOdUgiEbyKRUkH23Qa8/aq46+Ox+12RSD0YkotV3Gg49c0jPW2pkt4Mo13e4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME98pSrLrTgg0bMYbtaVsPhWG1zei41KLUWYybKStZM=;
 b=TeFRChdTgQZa99jLnWGFf/0pqYFw5devOIos2B9GP46VnAOPGDU7AaT8kta2x5jprrVkiB0T+YOd9BtL2QktXqpf+b1fxDR5IrWwJ1Wk8UFCSo5BDAUzDUHqIumH6ugpHhcudbCYqA9yc8EMn8bEH9f7bm+CZEMKZ882q/wlPOSanIF9t0OaF5+doEZ37mmGUxme66xdHZYGRIVQvnuSl6qHNrE4d7ncBFoFupjBmR7YtwbY6OzYYJ7EdqoSa5dNWSFSTrwyNJbM8Nc8F10EKbkQqjD5DdFf9laZCeDv2qv91FKL0Esf2pe8VrbFidw36LqmHTV3g/sve3RhNGw4Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 12:32:28 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0639.010; Wed, 25 Nov 2026
 12:32:28 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Christian Eggers <ceggers@arri.de>,
	stable@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH v2] nvmem: imx-ocotp-scu: assign nvmem_cell_info::raw_len
Date: Wed, 25 Nov 2026 14:32:22 +0200
Message-ID: <20261125123222.839732-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125072736.769516-1-stefan.ghetu@nxp.com>
References: <20261125072736.769516-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::14) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 414314b0-1139-4f2c-b1ef-08df4af02ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|261009223027099003|22082099003|18002099003|261022075727099003|261026121527099003|261102123227099003|261021121427099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: N1Q9uPKgSNeeF+S+s+zhNIkyR0HCUXrV2aTsNqKRvpu35flrQ0BwV9RbSycDRbizZiyEHFvHta7t4Lvyn85mLw1TgsnF28i9oIPru2OYstVTna+bl1Fi+iySbqHjlB7aq6Kjtzv3+YGGudzZ1Ye+wyJWThmndz8WqzFYYkEtEjUDCXO98D6RPH9KEbmmATF+Ddfz2IR3QI7B0CZ1itukBQsVfb9t0MOB6dT5WXDUf3rHD9NS9TxYoSc3FneEtt71kslYP/zkh6OiSXLxyGrA8lgkoVX9wd8hXtrad128KTSVQT0FHxnnzgNLStZ/l/Ct/LXfcmSDXX+8vb8nxDBeZSLSn6h9ESpt/iTvnh7aNohNO/Nx+AbSV5/scg7WbfaME5CxAaj+2lTcuOzQcx2C04s2rw/tFU8bq19Wl6WfQqRFdOeupPhF83eonME5q0VuMNkRfdiMgCKcWeb2umA2Ukf8GWBhiPv7dq7WaOh4tMq9FiUsJeEwOjBu7SjT4TaIJZl+nNfrjAmz92PrZRFfJI8gZm2LPN1cXil4oFF70KjcrXoDaT+0kXlK562FNOehP6rHn2t30kXuw5Z4Fps5xy/qFDOsNiAdlEOsConO7V3D26AQMnvk73dYy422uch8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(261009223027099003)(22082099003)(18002099003)(261022075727099003)(261026121527099003)(261102123227099003)(261021121427099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MaO4vQ+SvrgMGW0BCV+3qVlyHJU7A3YDvpjQ7VeAhkcqjjo2OJ6bNWL5Rian?=
 =?us-ascii?Q?kTaivGPl5NUWM/9HsutQIAE4suxqx7xmIPnmMiqnkEmQtTLRm9FXBhaC1OOb?=
 =?us-ascii?Q?+qftUo088QruuVt29pGLvMn9HKW3ydNOllNPquD9Ig3j5vnitPZ4oRGfrzik?=
 =?us-ascii?Q?1aYESQlUP0SENQJR3F/oM/ZzmLgSqp0d3nmV7LyL/whykOdYw0hkQv02EF1Y?=
 =?us-ascii?Q?uXfcCm+g/krB8MkzwlMM2NTqDU8xCZ/kKhULCfF5lszvpSRQBLwEQkvneKW6?=
 =?us-ascii?Q?36Qu6r7nQe6X/6zq5fPvfRBsyiREEUPBBCjTYjkFXFleue6qdtcTjp/knYXY?=
 =?us-ascii?Q?MA/75z78LU8cOodLsAp0Gh0ZUWGgIdgGz7Jw4MpseR2WmpaocaBM8Pclh7VX?=
 =?us-ascii?Q?GnDNu7opTvFWpqzUEqxzlG3CSWgMEviAGJHynu7BWG10yrmCFSDRs2sJke9n?=
 =?us-ascii?Q?WtjGXrbcc9RPl4R3VqSpNfRGLaVDmqoz8Kxu5JpECyQOCmUMkDefH+V2LV4c?=
 =?us-ascii?Q?LHD+guw7stMmTrwMYBtkBpnRmCXVp1UZJlEpuWWHvjygj/jmLhdDyBVLHlNK?=
 =?us-ascii?Q?5ZO4jdEe/x1yzA1GvYiklvMwD6mwlJ+aUXsM7dNds4/IQi2G9GmWp7SHbQLB?=
 =?us-ascii?Q?sPG8OD8BrkidH8fM1bQpos6rZ1DSaJNpdG//rP48i09A0YRNXCcujtwFj0IX?=
 =?us-ascii?Q?zG+ubL9p3RBIuq0HJB0Fsc2VUuLSVi0022NZZeWZi1LszRCra7bdivjhAiXi?=
 =?us-ascii?Q?I76We4qRfSbcvVjm6npxCJsk/FVWo1APXGlfj6+TCxtZ6E5wU867ccSlhXoU?=
 =?us-ascii?Q?FDnPUJ6MopUioaNZ9gnmJ1aLXS3qXDer8l2zTS9z1a8hwcCQu4TB8afgLWeb?=
 =?us-ascii?Q?3IadE3Lduxf/ZhkYC3KAo6b987vmMx/gm93LzcJ3xRTIs/9Ld1srXVNe9s9t?=
 =?us-ascii?Q?+M2qpP+4MxIWfw3/vxlTlCwSiPnBgOgW9VE//XnChP10DBygoS9577PR9jNg?=
 =?us-ascii?Q?hlHHAvUe9JABUKLlR0BwDF2gxryEKiwFF8awRENj6inV0LlRfljFqcXaPY4g?=
 =?us-ascii?Q?u7bn9OhRztMUQ+aQyEyASS4BDMYrUTkXwe0wVwj6m2qWTPjA1SxML22hWdID?=
 =?us-ascii?Q?C0fdMIAPsCSDPU3Z+cvxJv5ppyd1SuF7qVaKI5KiZ5uajpfhmyvGS45bKcTU?=
 =?us-ascii?Q?f1NhGyoK4ssZyGWk+LwnauiY6Z+wi7TaCRvU84ExwnRTgHEcaUx2cbm9z402?=
 =?us-ascii?Q?HLYVR05XSUpPhPe3z3zi7h0n9aAaZMwuwq9FlfneVXB5j4NozVUWvlswavMC?=
 =?us-ascii?Q?FoTtgG6UF4hLfzhkVZkLVvzQLwhOvst8W5fK1W5yC3/3CsCXinPAbSKAOjzg?=
 =?us-ascii?Q?5S8vduc87xSgE2LkXlBDfpEEymfunU7NY6suoNvgvYSo7E8v+8yTsEpZ3Utg?=
 =?us-ascii?Q?viMao1C5ha8C+Up/YyY1ayre+jYQ9SMuoqg7T9UGG4q+CCpLcvB+qDXG8UOl?=
 =?us-ascii?Q?Kj0UAp3L/6ZktCL1dOUKLCibUi9sh1zsikb6Y78YM82S2kxzP5qyWPWzWXns?=
 =?us-ascii?Q?yb7mUn/LS5UZJv0dwGQKkVZzue9vwZCViUy5elpedTlDhZQJGYD5bHfFqpiC?=
 =?us-ascii?Q?WcREc4xnMEEnas9ElyVV0OPukrKs/NPITYLz0XgBVJFml33/5jzCNnQMsZVb?=
 =?us-ascii?Q?JiRm/KmNR7DnH/hL9AvxcvdelR5VIgd1srrYrcpGgMPcwPZQxFr6sPke+CXv?=
 =?us-ascii?Q?4xrcIxgABQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414314b0-1139-4f2c-b1ef-08df4af02ac5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:32:28.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kskWgaoHG5qTxuFb8EcdNuwZy4xumD6ORtfriJ9CaYgyCsYbHJky0sG4Xs/LXRjmQmoliM9aioK8FsNYnWBDXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043233_641056_63F3ABDB 
X-CRM114-Status: GOOD (  13.38  )
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

Avoid getting error messages at startup like the following on i.MX8QXP,
i.MX8QM and i.MX8DXL, printed once for each MAC address cell:

nvmem imx-scu-ocotp0: cell mac raw len 6 unaligned to nvmem word size 4

The same was already done for imx-ocotp and imx-ocotp-ele by commit
48b5163c9575 ("nvmem: imx: assign nvmem_cell_info::raw_len"), but the
SCU based driver was not covered.

This shouldn't cause any functional change as this alignment would
otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Cc: stable@vger.kernel.org
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org, as requested by Srinivas Kandagatla.

v1: https://lore.kernel.org/all/20261125072736.769516-1-stefan.ghetu@nxp.com/

 drivers/nvmem/imx-ocotp-scu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
index 20312fba22d23..80f78bcf3841e 100644
--- a/drivers/nvmem/imx-ocotp-scu.c
+++ b/drivers/nvmem/imx-ocotp-scu.c
@@ -218,6 +218,12 @@ static int imx_scu_ocotp_write(void *context, unsigned int offset,
 	return res.a0;
 }
 
+static void imx_scu_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					     struct nvmem_cell_info *cell)
+{
+	cell->raw_len = round_up(cell->bytes, 4);
+}
+
 static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 	.name = "imx-scu-ocotp",
 	.add_legacy_fixed_of_cells = true,
@@ -227,6 +233,7 @@ static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 	.owner = THIS_MODULE,
 	.reg_read = imx_scu_ocotp_read,
 	.reg_write = imx_scu_ocotp_write,
+	.fixup_dt_cell_info = imx_scu_ocotp_fixup_dt_cell_info,
 };
 
 static const struct of_device_id imx_scu_ocotp_dt_ids[] = {
-- 
2.43.0


