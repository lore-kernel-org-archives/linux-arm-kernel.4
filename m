Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKeFhnp+;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cJ9Tg/ZB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4dXbIw/+faDKn44I3XmehhdU3X2u6NuGiCnqaVsQ60Y=; b=HKeFhnp+y8EFeU
	iNCdfIgexZenrcIVXo0bhNhQ12QPfp9pdg5LLLDk+djN2n7qULQuOMm6/imIdsUIm/1pjHgiOa0uQ
	J5LAk+wj0D83+U1/8fMJ7oO0MH6gPhuciYdXKn5YvHIKYWwvV9DtbEvAGuiRlhJAX38mhe+d/V2lK
	mgiyT/AFkZeDNnkKb91+fYyEyTq8npQMdmX+7/ZGL4aYDYbWDuxiofzkFuVNCzhjy8YoqfdUh157p
	CfUPs9hzc/zwSaBj4acrwx6ndHOV7BTTmcr1dROTI8s0Scnnb3+aAcMzXwao6Oiuw6Il8FjKC8QHG
	36zAkzXlkeeF+oDLaqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjgY-00000000iu5-37ma;
	Sun, 15 Nov 2026 23:30:58 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjgW-00000000irL-2Vaw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 23:30:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbbztV28I7306zEVLJhB41YHAND2lZUBtdUcqhZaEXQgNMVWmopPDKcpwCcZIudk4UfD73qA1df/mD1+KIm+yZ6GoLb8PvjcE52RtQlVbM1I5BoSjkdOJnB/xbb0CUs5Ed3Vg03qbhjeksuyO5fTq4Kq5G7VngTAhlQpDYsOkoefaYEDUwyQa9eZKqAu1Wqb34YdGmrDG3P0DRwHgoUre4qmx2QH0GVGyIA2o9vgLvlPRA34t7teap/SKu80+AJfP46seLrt0O9zBcXL93VMvHG/HC1+kgjpzl0KXyjzyzqW8jiytHwWXhZinAZZ9Tws3BXoLPIKiWvXMo4lnxFsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dXbIw/+faDKn44I3XmehhdU3X2u6NuGiCnqaVsQ60Y=;
 b=p6966zvBLSzgVxxYeEcCy8hN2MjEJEm2Ycr7ykiMxD1uWjffhHB2PtAVlpNKGeMRDMss3CsnizW+bXVSN1DyAAL9gFSZhoaYwzLdvDG6rjwV/lTL9zEdQ8LZ5Gy5mMoU3R1wKJaYdOfenaCjmqMDzB67NHTNQvdXOtJYsrcjSFOz4Rd+MVpbQaAOCrtnIsG9aR4dz3c8THnwfcOPoFN1lDZipEWHSZ4WsnLsJKcwcuK/ICkDoghLGUlEyiyWCczgKIr3SxsYhjrJLkpYbfnP6/f3zXA5AB/QxRw/8dA5A+dibMZuiosvE/MC7cy2LzS9TxYbVPu86XMy1D5cwXcrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dXbIw/+faDKn44I3XmehhdU3X2u6NuGiCnqaVsQ60Y=;
 b=cJ9Tg/ZBqoWumzHwurPInXYUqJBKCZFzUH7FoJwMO3lySFS3LTq+vY4M4DX0Ethfz4T1VmyUFvKEm0NtgNYPijb4eYYaovIDew6ZeuMls8Ht8lzG2UQpgQPikICLIurTPttNYlneyXaI7ZucpjsQdHvTvysC+TpCBmnxrOJtbsYBmSDrHtCV2Eh8w6lKGnO6kNWyMbJQwu/+sJ1pIiUCeExZ6b3eM5EYbUudULjTGFSS6Z5+U32eFUL50HLe96x/CX+tnB99dXrXQmynyS+yM2GEH16hzfEO4xdmh457CEULh82hTDDH3LiuN0PUUkexuDmS3HG0RqQAOYpG5XXs8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS0PR12MB8815.namprd12.prod.outlook.com
 (2603:10b6:8:14f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 23:30:44 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Sun, 15 Nov 2026
 23:30:44 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	John Garry <john.garry@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v3 04/13] iommupt/kunit: Do not test INCOHERENT on anything but x86
Date: Sun, 15 Nov 2026 19:30:34 -0400
Message-ID: <4-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
In-Reply-To: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::10) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ac4cce-8931-4c5a-fbea-08df4370785c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: WE+BOWQ/ueN9lG6eaklprQk8QkbKBn9bGsgbZ5hvfoQ+2vIzzoqkQk5ADmspmqYAjFAnBbX9y+Z22tc9GcFRQMBEaytbNYBjkzVpEOPcaJZnnN8vbcHWie3hLfNvHD5NYQa87eqDhVqQWiwhzlAZWgl8MDDU1hyjM7C7H7JfOd10rwqLzjIlfa80KXMDoaeHITeMZ7+yJwoYls6lT0ZWgrx/HT44UKmjJfZHV+ooDtSY4dbmKkwiubTr7ERLsEwjxewyEeEjyjUJEDl2g4UaExWawCN2PVGzvyAVrTIw1axrpFurnukwDQyWsgB2iUq3QaBszBzHvSNEtVe9Jw+pIsH2BZASxo0wyN6o9eANK+mqYt6hsqwKpwo0xhXjlBDyauIuRyKc4Sy3lIJirZFKce1ndG0eyJIVZT5uTtFLjQOV45qQpWgNaULlC37/qfwPSc6XAVdBaKm+wHq274XPSoMWBJSq4ujWQ9HNCyfLiuULmO4RTOHYuZuw5Q081hKVgawDBfemS6QukmZIge/9i+25CYHfUaGUduNPZBrwS9lIrwlh6/8FjaS1wRS0d96mvhm5WZuoz0yvrkCt4gjTs92Invz9MmEi6lrDkKBzfinBQ2Evgue+cIDidlhhPrQMlJniC3MlE5XF0glMe6dotlayStQ3wjghAZ18eZAYWtQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y0xgvaTUag1iOLMaskwinPllsbwDB+B1VB9du5EA+0Ur5olgMcyeudQnCAcQ?=
 =?us-ascii?Q?I3z2DvkbN+QMB3UWga38kN94yiA+Iwqs887cikHDstrQ662nSJIs/efbK+kd?=
 =?us-ascii?Q?/e9AKoa9R1v8U00AsF3kKD8sDAPUFd8Tvlc+prDwE5cDMXX+DJrXwYi6pV9A?=
 =?us-ascii?Q?3HC6S5ldMpwLDmqTXMyDwtInmwj7dddIzBMmMsaH/AaCwYddQpAqAuoA+JC7?=
 =?us-ascii?Q?7C2WTRVVWGl0UggqBCtda6QEZ4vQJQPyKpfH2TYVuBxOY1j/e/LCpVUI4T/X?=
 =?us-ascii?Q?fjIUm0Bhasb/BWMjQvHRW6cswIWcJm8cLIGlPT3ZxUzRM7w5alJbjwao/W7k?=
 =?us-ascii?Q?bJo5O8lZS2zjEjJwZPNO411j5GJNibB0AK9dKFklpcKf32eSjzVn1Ylldpya?=
 =?us-ascii?Q?840VwVGasuUy2Wk2kzh5CYWEs1QJ9nrqqR85fE2WiC4Fw2pb0iWw8L4CUnKY?=
 =?us-ascii?Q?YpeAxv+qcXMS5xB7vezncQrqgq73a33IZi5i0RoGltGOOL/qyz4WwzB91lQP?=
 =?us-ascii?Q?Sxwk7C22Z+Ut4RJa72nSz2aVy7fgYKK7H9/4biZm7e31IbD3AUNcWns7bluG?=
 =?us-ascii?Q?99U2y3+dd9GSww9iO2baS6dwfpXdaFdyUz6SQyiqAQlifcsins8wY9T70rni?=
 =?us-ascii?Q?sxxE18Mpl+YCz2eiiVbBl2utxJjPoXOkxwLUbc+4n9Rp5zvMZJw7OZvGtM5W?=
 =?us-ascii?Q?ZA9BfxKn0iHbdLEIoxNBrd5+cyNcmZEQYezsZqXC+zl8JsEgl4WSNMbj2MKu?=
 =?us-ascii?Q?2E7rr+Dee2bpfzTM+mwVyYcgErTwbupWbwO98B5ouKoGrSfh0y9M1d0VKjVs?=
 =?us-ascii?Q?LZccPC0JUhgksEV9b+Ro1pYgTol2sE+lXu/HyBgvZ8BdMtnDQZ9kl0fhVnSC?=
 =?us-ascii?Q?5e4XFVqj+IuapWgO+DHnXu3Uf7nmr0+CPkSf32tCb8JtmNy+bR7vjuz791IC?=
 =?us-ascii?Q?26jc/qC+xpHt5hNBvUs73l/NrugUGFr+ufZsc8DC2VlbLb5XzpX4+qjdqliz?=
 =?us-ascii?Q?Hu0A07NvNpYhVyAF7SlXKumD4SNjK1mojR05k6GO7Pirao1vvXDQh55TLI1i?=
 =?us-ascii?Q?UlOjAuCSAsGBy0X/ipDycT0A91v9fUT/u0U4VGSeKULa8oHkbtMI8+UW8llX?=
 =?us-ascii?Q?SCR5AFqMtur4T8H5x77cv14av3jw0+ZPnxZ6xC84oN1iF74ayrWpk0v5YRnI?=
 =?us-ascii?Q?e33ekBfasYnPy38PVthNF1hEphdv0RE2eak62rM/LwEzhDFE7cVT2EMHQNf9?=
 =?us-ascii?Q?vBWQdpe49WWkytVRFKiL87IrpC/RwHbgj9PAlKP95KfgYMNfmxv/d5VjgehH?=
 =?us-ascii?Q?A3AgfWFp35NdhV6mGBeRiMhQD0wTVKni9VBXf+17h9hI+6sGyVVInsk3zL5h?=
 =?us-ascii?Q?6e0UT2kKD817R/zSpCMlogGfwy/EP11a3VkOydepk63UypNdKpeFEXfsEUA7?=
 =?us-ascii?Q?DEIZjHDR6K5h4KTHQAAQqdHUmcUkfGRKgxp8nVpkavPcDT35ElByaJM3Vj63?=
 =?us-ascii?Q?Q9HW+VsVAdJp5x4HksPdpeW/3BDjz/8RzkSnyK0AeCJR56rkEWK2eWAv+sjQ?=
 =?us-ascii?Q?6T0IwFHEEXbxMARiPwvjQuYmfS+7OJxg4peEfxZWShV41W14xZ82xSSLGNpG?=
 =?us-ascii?Q?ilibiTN2ew9jJiDzDjTTe4uneleiXhRwfXamz1IoOQM1pR0dWak0scZefKMv?=
 =?us-ascii?Q?dGvBe0nL+aAj3GQC9azXGW5pOEANXBtznOS3Bw7iwE+1MNTa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ac4cce-8931-4c5a-fbea-08df4370785c
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 23:30:44.5704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMU3BV9/p/e/Zra3Gr1OmzZMljPUaJCcF8cEjMVfVjkP3eKHKLsj3pqEGZOmBieZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_153056_643992_5FE16647 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The use of the dma API on other arches inside iommu-pages can blow up with
the fake struct device that kunit creates and result in crashes. x86 uses
a direct arch cache flush function so doesn't have any restriction.

Reported-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/generic_pt/kunit_iommu.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/generic_pt/kunit_iommu.h b/drivers/iommu/generic_pt/kunit_iommu.h
index 22c9e4c4dd97cd..79d7f9c8e7868f 100644
--- a/drivers/iommu/generic_pt/kunit_iommu.h
+++ b/drivers/iommu/generic_pt/kunit_iommu.h
@@ -16,6 +16,19 @@
 int pt_iommu_init(struct pt_iommu_table *fmt_table,
 		  const struct pt_iommu_table_cfg *cfg, gfp_t gfp);
 
+/*
+ * iommu_pages_flush_incoherent() uses clflush directly on x86 but falls back to
+ * dma_sync_single_for_device() elsewhere, which needs a real DMA device. The
+ * kunit's dummy_dev is a kunit_device_register() stub and cannot service the
+ * DMA API, so skip this feature in kunit on non-x86.
+ */
+#if IS_ENABLED(CONFIG_X86)
+#define KUNIT_PT_SUPPORTED_FEATURES PT_SUPPORTED_FEATURES
+#else
+#define KUNIT_PT_SUPPORTED_FEATURES \
+	(PT_SUPPORTED_FEATURES & ~BIT(PT_FEAT_DMA_INCOHERENT))
+#endif
+
 /* The format can provide a list of configurations it would like to test */
 #ifdef kunit_fmt_cfgs
 static const void *kunit_pt_gen_params_cfg(struct kunit *test, const void *prev,
@@ -125,10 +138,10 @@ static int pt_kunit_priv_init(struct kunit *test, struct kunit_iommu_priv *priv)
 	 * The format can set a list of features that the kunit_fmt_cfgs
 	 * controls, other features are default to on.
 	 */
-	priv->cfg.common.features |= PT_SUPPORTED_FEATURES &
+	priv->cfg.common.features |= KUNIT_PT_SUPPORTED_FEATURES &
 				     (~KUNIT_FMT_FEATURES);
 #else
-	priv->cfg.common.features = PT_SUPPORTED_FEATURES;
+	priv->cfg.common.features = KUNIT_PT_SUPPORTED_FEATURES;
 #endif
 
 	/* Defaults, for the kunit */
-- 
2.43.0


