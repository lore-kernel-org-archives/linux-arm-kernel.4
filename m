Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5308606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OM0tEScE;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VPGO6wta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y0fnyL7wffLAVv1OHutGX6Ghlq9bs0rDM48l7sf9SQo=; b=OM0tEScEMC5t1H
	vT3mEtSqc1Jp/SjuQrkSgNRX2FgtgXlAYky2ZNwa0Sdfsvh6FAu1DLV0q1dp+yp49ExqVMD9ocBN5
	2ETf97FR08Px+LKFn+n76pnrHptV6DRaj5MYv+KPgfvBv8MHgaFh0kxapSQ7OmHNaOzLVvVSg2eb7
	NKVlzTPwOh0e9FDiADB9VLeIOUbjNMNWrCO8i25lvesCdZRqwGJX/cUtdA8RIrjUFVrjbeqKcJPH+
	ggfamh3V0MOPvGHerEN9f2ub98bu3D8jlz+PyPpGAbnuYOt4E6Z0UqoCyqZzV590p8gJfLnOg23No
	AQ/AFq9FTCSGBuycV3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBEH-00000009e40-0EvB;
	Wed, 25 Nov 2026 11:32:01 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBEE-00000009e32-0sSz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcxa3l6bbDSriSAxc0Tc0eQVTQzeHVvZIL7kpuTxKgM3r8/DRFaUa9IhpG6lIH0apPfGOyZ07aKrhA0ie/gHFvQ1ZivObQhuBd7K7ucSnP4sGYMsGBWqjp3wxO+Yf0q7yN9p2ED2cd9mrqB720vzPa9u0QmzHdvzGruV/KmxQagHlMbaXcxKSanZiSv7Bgpv8V+lSKIQaFD2cRlIMHRnNAskNRVdd5raM/q02Qkt9jt4WbYnqKaeQysb5Wv4jYGohl6X9+FHVWkUer6sCvE8wOepNYYmz1jTA66CL4H9c1QDya06FpEPBwpgQRVneWMMHoqZFv1j902otXv5r1QWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0fnyL7wffLAVv1OHutGX6Ghlq9bs0rDM48l7sf9SQo=;
 b=dc6mDRbEITWOpqaaqkcbm44llTo7uToyyAb6T8SVS6qHn2Kc0aaFH0y0/mjFQb6WD0xtCxCa4Ny3Xco78AkRUZSL9OrTzCCeZifopBHrp7axqgrRfqgmdRFd2TLhyRVLVquFYy7MEnJL2nZpIbSyqhqnocQ/onUS0wjStGnzUoZuzjyTsSo8Wzu4LnALGZ9g1JYePbaQl/AU9J3fy2iwiNDqTAm3p4KJDpu32gSEJ4iNX66zBlZGZ1TbwVCmNTUx/OLfFxYohrVJH8cbQKp0T5PiWdaILF44JZjinHzAwWcmLNGGp0LWkng1GFHY3o5Aduln5lumUdPK8m86sLDpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0fnyL7wffLAVv1OHutGX6Ghlq9bs0rDM48l7sf9SQo=;
 b=VPGO6wtaUj8oA4yil+N61u25ecIwvtMouZo8R4Xeas2TH+7Gdsv8JwWedNitXQT3c5TpBpzXXATNKB/5YHdek01S3QphQ9BHjn0jWQcJFzkSfMjWMG8RDljEx//QyOI8198rYCZr93VOzg6/M/50170nFfQ3hkHWnCJoyJ+Lr6x1K78G5/eWMBPFll2u+Qrv9lLuIOV4l53ONEhCEOG6DQ5kdj8vea39UFNc6zbOm77bZvlCRv8Z5DHDYlbRE0wyl9sXmoTmFGRgbMYE8jdYnGbyB4VhujNGOrubQDPOl2RbhjXngGC75HX8Vs7lceq/tFNlChSUYcRwEGYgpST+Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8194.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:31:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 11:31:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Wed, 25 Nov 2026 19:28:50 +0800
Message-ID: <20261125112851.29323-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261122205136.138173-2-dario.binacchi@amarulasolutions.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7ed137-ad88-4bd3-f2e6-08df4ae7b23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|261009223027099003|18002099003|22082099003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: NqnYhgt389fgLKoVserWg+nxs2XejNvJZdZm0qVJoZjU48VRWFahZl2NTa0L5hbN7OayK7Yj3GKkRC7rUvz+L6JXK88hI5f8dOGuPRGQjP0OCuiif4g7xvgrQrExH5G52k/wGgyj098Nf2pe/DLgWKhLjT7/mlkyvl2qA0m1g+medjGOR9hguPpDLMl45nV2Dj9Dq645uO91i4gLhKboFnLb/mJ0GhUCjtH1Bq1PObJove4iTrdKYghFK6PpaF2WNRtiJkljVCyrO/kxZ4kG8t/HFgUYHwbyzMR7zcx7cyIBalLrKhlQ4EYmXmT/HCqoIpR08/KKR/EDta841jJGFqX/2VaFwa8H9giUAmTZiWTTx0+ibD+I0fvLWDXH9t6yJqUQDwFbpys5qaHYimaTxHRlg8lltYXSbWXMy+pCq7IEk0jJMBLVLqmUkIJjDXgyLiMyK4mxVede6N22l3oFqe+tIeg97gw1oZnQjnH/duJjcz5sOlEWFj0poRTX4j0g38QbbGyF8AuxMlyYG5CP8IfZwxj8YOAvffMe1C+8swwudwQywuMhEWqeylNp06xRwQYZKcPr7kXD6dt9OmkuEdJjAQ49vZBCsCN+slh41upuyhvHOQswmaJppsjt6+XK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(261009223027099003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocZ9n6dGX7T7BOyldh53qrsOFHTe4FrlZDBGWjha3XG0jVogr44ldj1/2VfC?=
 =?us-ascii?Q?Bu5DXcDCfq8P8Tb09T+9iphw9C3nIEiAFZU4DL70c9h2aKeVGtHLK/XfSX1j?=
 =?us-ascii?Q?AdlEbk2bqRUnZu8OSUIaYTKvqIeFJ8b6V8NhzyFytcgDrTWpzcB9zTKzVtPd?=
 =?us-ascii?Q?nfb7N2nz6L9x+h4D3/lI63UEs0DuIAHzb/UkxssDFG9dicayYfGtPR8GcsCJ?=
 =?us-ascii?Q?u6pQWeDVVXEU/ZD++Txv0dVLWCo/lgnSDRsvFl0nK053BhSEJ9P3DEEDgPLb?=
 =?us-ascii?Q?sF6ITqY9SmyMJV2nYSMBfX5kRpGyiZjNqJuVo9qlH2NsnPQcauVt0NHQeLEC?=
 =?us-ascii?Q?pteUG3ybBrV7GnQCbKpuZRG6FKpCnrhmO2j/WjFU8ptO6BinmfyOyVm2Z9lO?=
 =?us-ascii?Q?wsJX4CIPQuPL3zgrlgGLarswhnRAN6a+8Q27AQcVF4EtzcEebIRxAg5CutOv?=
 =?us-ascii?Q?loZym2D65cWw2N8aLPhan2hKmK8he1fxVErmAzW6MZLxR0ZNuhmoVxrQ83fM?=
 =?us-ascii?Q?Qk4mSBQpu0uwJnhQn2STK6Mz7Xprt2s66daXagB9cjilrm/UdDKSMsGkqqkt?=
 =?us-ascii?Q?JktTgc9ry8tf3O+cMAt3fgvvK6rWYxuAf3gXD791MgVrNW3LS6+XAugMSWab?=
 =?us-ascii?Q?AW2O+cqL7YswRQ5YSeHFje5ccMxu5gzS+cmNyXj4e0wZPAt0BFj0mUe5IKAt?=
 =?us-ascii?Q?JpMZ6z/5T7bLTG+iaYlnqKUKYYvybWnKhh+ICnUVNxo4VKUD/R9ADfZkJQ4U?=
 =?us-ascii?Q?lYfcSP0jTqZJ9j4Z+YbfCiG3ZkLaq0hRTXZM3nSP62nrnC+rcrqRXJc5TjyJ?=
 =?us-ascii?Q?9i6GA31OwZM/KX9ec4yiwCl+OvjLZ6XI/psuxZrjvTP90ObwoZuk0jXp6bP2?=
 =?us-ascii?Q?nWVFe7hiZdpeUuP5j2+gUvPq4LVpKKxsz0s5iJ6R2yLyN5Ol+cQY6LYKByV/?=
 =?us-ascii?Q?376YhJd6ImEsiFI7YjY6Y6r62TSQv6D2fF6FXjb5xpGbm1I+XbG0KkiIZ3ws?=
 =?us-ascii?Q?nFuopgoTZ2KeE/1eegFN4FBw72GG/CilJeLR8r5/pqjbGqy8XJ4P90GytBmi?=
 =?us-ascii?Q?ZvH80tV5b4l6Qjag24Qtl+xBBN24vDF6wbZdiEvJxbhRb5AsJ3kZSQXdv53S?=
 =?us-ascii?Q?YNJgIe0g3y5dT32mPfuK5llcOtqD+1KnfpwJpAwfSO2L3EmGvJQxTrGu5aAR?=
 =?us-ascii?Q?b0b83uVsa2XQoEiRr/Zf/RF723JlbLsemqY1xpbj2f6aCtK/kAluAZ/t0caX?=
 =?us-ascii?Q?vNVBE4+6kN0hvWQn04XTWaBxkfP/eBpOezg54o6rSi7EP7A2bNyVaph5d5uj?=
 =?us-ascii?Q?qwKLp1HNic5NibTeV7M7FSmj598A+uQZsxU3h3DX1cPB+n5fb4Q8Y8VBNpf+?=
 =?us-ascii?Q?zLCZ3oV2WqbtghPoGryVfo6gG1Vu3jHsHFiWFK3bbIm8p7oCWfGgWzA6YRpL?=
 =?us-ascii?Q?p92tBfePnfyScSbMh0px7gT8i/QkSD/TFufkPuMI8LDcwUU6sIUOKa1OWMPA?=
 =?us-ascii?Q?02ys+S2u0gjJ3sZQgitftcmg+Q+hNLiwpLVZmVzajKacr5f0dGmPATVr/Khq?=
 =?us-ascii?Q?UVreWCC1ctFTNdi29vM/1FpwySIx3mXonEXA1nGVJyGCi3Y7/0T2euCR6ISW?=
 =?us-ascii?Q?AZ24Be47n+kb9qg1k2rAPM9doswZp8fn5N+vCIS9Zcbj2sOCdYpQb5S9MiDY?=
 =?us-ascii?Q?QAwOC1W99EHL4C2jBEScnUd0oWylXnpLFB/mKOWUxFM0pEIHuXofEQX9B9uD?=
 =?us-ascii?Q?NhPYiAYCBweEkiQuCqfM6wmbb/h98cMpHzYkFE8VAH4hl/p0ycca?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7ed137-ad88-4bd3-f2e6-08df4ae7b23a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:31:50.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhG9GzUUFXf4/AHz1Is1ymtygqhA3QoGtI1TlPjLkQQR2hndVu81ytD4NNGs5oBF/q55mpoK42bRcGdMppq8doOrHLBCsKeSyoJCQuEkAIXAbSWeM3Vvn+Yg+FSbXXCA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_033158_248631_51B8EE72 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.0 (+)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 22 Nov 2026 21:51:10 +0100 Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> If devm_of_platform_populate() fails, the probe returns leaving the
> power notifier registered on the bus power domain, while the memory
> holding it is released. Remove it.
> 
> Fixes: 9cb6d1b39a8f ("soc: imx: imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-227073@kernel.org
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 

Reviewed-by: Peng Fan <peng.fan@nxp.com>

