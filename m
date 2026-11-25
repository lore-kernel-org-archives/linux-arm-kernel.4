Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LotHPAv2;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bv3JmOjB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nUFpoOpWA6Trrfntc4VG9LCpLe26kQXkrXx4V0DJjLU=; b=LotHPAv2rJP6ONbtuRp8dZ0SjL
	Ug8JE69Nl/1yuQR0h0NgjxL3lRLhzki4sXcOVcus9A33z3+SWZ+6KGnrywVj+zaXPcAEfOotggvVn
	/2V9ZbDiNrlBjayPn7SDdRuyCv6s1DKG93ZXN/IQNREzne2zDIVqYgsXvGyvGJ3aR0u0GTuY6OosC
	OQfPe80qnZVDdhVQ9atWANH9LqCLd6I+2GCXLiVUwNW7RoluYaSYjBFnBaM6F5isFvfp7ENx63BMJ
	LeT86bgrp/eUmIgyxk0rNB5CPZatJm5IX/+oz/vROTOLyS7bWupos2o5vDc7B1JRD+1nnrMMHayBw
	wYWR4NfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGwx-0000000AlKE-3Gop;
	Wed, 25 Nov 2026 17:38:32 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGwu-0000000AlJJ-19p7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2DJb9VUBa/M6Zb6FVnq5Q6t15DagsLnG1NXBWnhQxbUN/jdl6yPpYyWHYJ2ehjzR1PidXq6f59iL7HNthqCzQtTmAtV9qAgQbbZ7aqjNZkkO2qC6I9bBO47GpYQZFzrY2MBOJGpJsIZFzRovXkcWqzeERoA3SHcQGZCQXhbVpGYaQjrY2FYmVP110kqkNLfhvV/EOPTAM+HAQLc925R6TppWNJ4GhMGC2N2sLFZQiRdppP0WkPhO8MZuRSbqZs26gXJch/XuC7KLx0klbbkj2GLfOulCbQ6WTayZvB4BZDEhh5YV/ecNj5+rhrPiTvKwP2D1edryidXpaX/3ozX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUFpoOpWA6Trrfntc4VG9LCpLe26kQXkrXx4V0DJjLU=;
 b=hG8QVPFlB0FDpt+araf0Fh5fR0Z5R1i94rotNCIvHQYDGXdxYpdzpvedh7JYO2OmfMonBCPkjun3D/bU0G9abzK5eNlGtTB5ooO8VIVmb5TCHtTeEG/GZzgI1gswTgXrTkUgUACBvsWAbLYXUiMHnr64oAImthOIJr61xUelhFPWDgt3vMZAgZPuHmPVJa4K6lc4Aaico0U0Aw27daIJStgSXKWitHpbg1/kRTT+IbyAYZW5bvG4MZIMqveDLSjJt2JgmQZ2WuDGrKLdWiDj/IgZh7R4YNKFD+xpyOfs7BKVZxBiG9gtdEQCXUllSKDDFqeX/esLEWFJJdBQGko26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUFpoOpWA6Trrfntc4VG9LCpLe26kQXkrXx4V0DJjLU=;
 b=bv3JmOjBl21MOP6ThucYIFl2EmRVgWDKIJNJ5jp2RMFac/tfH6ZstZvax8vK47vkYzuf6JlbaHETcVRXGR+93yWMUKG0/cb3Gt2hznhYK3Qi1gO+6Z1WxnWDkT5gwX2thYxTFgff8uA6vYpdIkhQEg+++pwowOMSXtZOC4BW3TmVISAM0ViUwlL3pXuc01XYFtz6wija2WOK3SApNOOa/iFZhggVL7t8Bjmhs7pCYF7/4V2Inq63b6F1Xw0mKbGyyiyRm1xMniAXp5PNiu+NRmBRurdvkh6IQGLVXde+pr/daOyEgvBrmt8bd77ShMjpUkycOpCOv67sDCVc1kbO+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:38:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:38:23 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@gmail.com,
	shengjiu.wang@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/2] arm64: dts: imx8mn: Fix and improve SPDIF1 support
Date: Wed, 25 Nov 2026 12:38:17 -0500
Message-ID: <179562826001.3101519.3568157099214807049.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
References: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPBP307CA0004.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b2d29b-9231-4400-6a61-08df4b1ae73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|22082099003|261009223027099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: sFVLdMg23ucGgxWvViawGUhiEtizKxLA+6HCAH+4NaCKINI10BeRi17R7+tRlprNAuezeQxWgA5kK91JMiIfvD7Xa11axa0jBqLPB/t2TA+OUO2MQbyROpQE9CK1NjnFQ3Lda2N9n7JF+MaDWI/7UQJn+sVYX36FIm9h8JWuN8PiKfK/GwG/vHNcF1G2bxQFF+8+eMPK8EgIbzekaNq5Emh0R5VEZFhY4rkV5gOq7IdMLnsxp25GD7lLuJLqsrlwsroQrIsppSK6/b5RZwWjg4vRWOgqYM94clWT5MZpldJz2R4RYchDKdQdKlOI7B4pK/PquBIilT+2CaZZB26Cnga+ykrxkd89dbKc4RcYOTkrmYMosICIhYYeCclIjhgHU814aKFDCJ30tV4AOkAa5HjUYtIcR7LqJ2TRn2erXu1gooilCi4/M9SRhQ3ToCw0qAIJcQSQ+iusRySe9Gy1Z+nHmagRbb+nUWLKLujASkuitOO2DkpXwf0lMhf/LeYRmpLEbdLvdwv11uK9HgX3mnOJLgDlZHNp0lW9eCiJkyw/oFkVMpK6D3PiPNB2IKiQtD/9NYcUxwccQjAxBqHIQIB/3D4kGOtDV5p7Am1sldL+zGkmZrDkqzwsZJVpt/FQM2SjAHf0XSUJdHktLisSW2q31LXptApofO0cseclnEoRXVaLdXv6RJ/OeWFgrujzDr0afR4sR3GTJGtjl1KLkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(261009223027099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlJSjBFaE9CR25kdWVDNllOM2k2ZmMzZ3JNUUZ0VWpmWEdoaU5lVzByQ0Fr?=
 =?utf-8?B?L29UUWtVNEs1TU1nTFFOdjROVHgxNEpWOG1SeFV2Q080WHVMUm9TRmhpenNL?=
 =?utf-8?B?bEJGUksrcktsVTFQaEkrTmlOUFJpbjE3Wkh4cmsvWXIzdXFITXNxMFJPOGNQ?=
 =?utf-8?B?c3VIMEM4YjFRSGE0OXV1Z3RVTEpKWDBwSDQxMEJ0WFZGN0hxYlUwUHZieGdQ?=
 =?utf-8?B?R2tUdVZSdUl5c1k3UVZNRWtCRUdIU015ZTJoUmlGdGcvYkVOV0hoVUtmbkp5?=
 =?utf-8?B?TW9IdWwwYzVZWXdrTW1vTnhJeVN5K2VSOURXckxsUmdSTDlpTkxHZkVBOGhs?=
 =?utf-8?B?K2UxL3hzUTIyeUd6NnZXU1RlV0tlQlhHdktsMHVWWlRQZTdSMHBDWFk0Yits?=
 =?utf-8?B?YXRWS0FPSU82K3JkcmJTbkFucitjSkRpY0tnMi9TMzRRcGlnbnQ0cDkrdkR6?=
 =?utf-8?B?Wllpd0gyYnlPVk0vZERZTWhHeG9QUGFsZCtZTzRQMzJZUXloMDR4NW1PRUJH?=
 =?utf-8?B?b2pPMDlQS1NHMXN1WjlCcnhVTitXMGF6TTVlYUFCM1NIUWxjZ3Bod2p5LzYw?=
 =?utf-8?B?K2lwNURSZkpUOFZOd3cvQzVLWGVveXJnQ25leFdvUkpMOGdjN200UFM1dGNx?=
 =?utf-8?B?MU01dFhkSXRJdWRIejdiSmU1OURGeEw2cEFBdUxlbWx0MjkyTGNDZjNtdXdO?=
 =?utf-8?B?dXJMSUw5Ri8rSVFBRitJVEZKeFA5NWNOZURwbTlwUFE3cDBPcGdoUFgzQ0Fm?=
 =?utf-8?B?bjhkM1FxUjMvejVsNGZvd1NIU3Y4emZtaEx4MmFuQ3JHQkVtNGc2aTF0WlRT?=
 =?utf-8?B?blhMQ3FQVEtOV1JEbThpVU9SaWc5S1NVMU00ZlgxWFpDbTE1N2JLd2FMVlVk?=
 =?utf-8?B?cUprTm90dnpma1YwejZlZHgyeTZXK0w3VTFocnRBUkkzQkJzb296WWJ3RnNU?=
 =?utf-8?B?Qm4zQTJJNi9HYXBvUnU5dGRCcWpKRDdZSG1qWk1VS1lhR0hvdkdSMGlHZE9x?=
 =?utf-8?B?VWRjQWN3VTdjVVd3cEFxbVo4REJPa1pIaEdzZzNZOXgrNGQyeTBRWVNjbzIx?=
 =?utf-8?B?cDZyNWZ5UWVHUUN5dmx4bHZJK2xMRWpMdWEyemlaMFFwclZRT1ptRE9SeWxx?=
 =?utf-8?B?Z01GRUpsWi9FU0lXWXpUTlRST3pzcVRxalNwaXNQTThCbElEQzNoNGN2aHM3?=
 =?utf-8?B?M25WWVhrWkFGOW5rUk9zallxMzg5aVozKzlQQmhXUzBPL2E5Tkk3NWdUZFhO?=
 =?utf-8?B?anZWejh5S2gvSkdZbzYzSEREZWt5VDZzdEh6NXoxWkRuTWdLS0RUSHNuQWdZ?=
 =?utf-8?B?bTJaUTJPZ1kzcUpiTVNDcnBnT0ZSOWZKUzBYb2NkSXdrWFJoY1c1MUcyUXlQ?=
 =?utf-8?B?dmVxMWQ5c0dBK0FQOFFZY29ZUE5nUWVkV2Q3MkVXWDMzdHR5MnFsOTc0VG83?=
 =?utf-8?B?Ym02WGtWQVVoZ0dnWmFiMkhaU1BvQmM3aXBrSWtCTDl0QzQ1aFEreElKWmE0?=
 =?utf-8?B?ODdqNHQrK25NbHN4eEU0MjNwOVpldHBodmlKSVo1UGNXbXUxL1ZBR1gvTUV3?=
 =?utf-8?B?QURWR1lvMTl0QnFReGFSa3pIVEx6RjF2SmlSRUZRMG9JcXlTaUNqYWNhaE5E?=
 =?utf-8?B?K2FOS2w2Z2hlQmdoSmpUUHQ0S1JUOXBTSUszejVXQUpqeGpGb1dwMzhydGZO?=
 =?utf-8?B?c0pLYzlOOUF3cC81cGlJQUVCMjFZRmp1ZHh3OHBIOGoxMnRkZk5HWHdDRUxQ?=
 =?utf-8?B?S3BrWVg2MlpqSUhSMVJrbkhEZ3FOclNxU0JHRElzbmFHTStMcVphTlNhSDBv?=
 =?utf-8?B?RWVrNDBNOXdQRmFPRDdLd0huRHdiVE9qU1VOYW1ROHY4cmdOK3BGMkZRaDJm?=
 =?utf-8?B?Z24vd1A3LzEycVArNlBPdm5FY3lEZmxwOSt4QWlTUit1R0RVU0tLaWZ5SjBU?=
 =?utf-8?B?NzNnbFRTQ0FMNUVTVFJveTlaTUczcDBkN0wyZnQwUEtTSzhYMDcwY1hCK0Vj?=
 =?utf-8?B?MzZ5ZjB4VStNU0UwejF4dllFRzV6aUtNQWtXYjQ2ZUNHVlEzNTVmNzZFMkRE?=
 =?utf-8?B?WkMvWms0YnoyVXlhT01mL2pCTVBqa3hpeWpybktTVm9sM0w4TEQ3UUFjbUE1?=
 =?utf-8?B?aEcyV1lkUnNhZmdsS095UUVOWFRDRWdVTlFxK2JCQmR3NnNzaU9pb3Z2NGdE?=
 =?utf-8?B?c2J2T1I5djNrZGZnNFB2TGFIU3pSNHNvMG5ubkUzSWhwTTQ4cVcwVVF0dTZQ?=
 =?utf-8?B?L1BrS3NFY21NVzZ1U1RWekdSMXVMblo3bDIrdHBMOGZrWlV3UUQxYm05WmdO?=
 =?utf-8?B?VUFYQmxPZ09TTXJmTU1KenRrV1RzQld1YWdMc3BTaDB0NnFwelBHd1pJNXlu?=
 =?utf-8?Q?Nst6yc0PoVPpcVUo5nOYtuhUKKclPL5r4jzQ3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b2d29b-9231-4400-6a61-08df4b1ae73f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:38:23.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwIyqBbzwFXuu2+gvVJUrG2/9uLcHrLuu4TvrF91zGgvCcCk7FvJd3SfrYKLxYC16VEazuAjDX23je0/ehCaGuIYzkcYIGBS312b1ePlPRj4YZGbXT3M0YR9pT/JT7LI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_093829_034558_83EDD3D9 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 17:03:22 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> This series fixes the SPDIF1 compatible string on i.MX8MN from
> "fsl,imx35-spdif" to "fsl,imx8mm-spdif", and adds the missing pll8k
> and pll11k clock entries on the EVK board to support both 48 kHz and
> 44.1 kHz based audio sample rate families.
>
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8mn: Update SPDIF compatible string to fsl,imx8mm-spdif
      commit: 569003654477ce6b8d3b897cc10505cd915504ed

Adjust indention

[2/2] arm64: dts: imx8mn-evk: Add pll8k and pll11k clocks for SPDIF1
      commit: eaef63758dbf09e23a3e1afa67ea7e01228aaa21

Best regards,
--
Frank Li <Frank.Li@nxp.com>

