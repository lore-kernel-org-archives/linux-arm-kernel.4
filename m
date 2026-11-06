Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DF6606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bAfe8lup;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wm+3IBCF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3Nk7Za3ca4GAeHwrdVH+J3eNPt6hX6VB7j7zR1z711Y=; b=bAfe8lupsOkKXAaBABlmhBeUXj
	SJfSPYRaUrxkTiNW75oZ7faOkehP1dyiysUAvzE/WB85bvinaeLfcxDKYOjwgbIa5XwEfa+SBpU7y
	bR1lig99wBG2jq5wE6iL/PSoEpT1+mouL015A6N8JXblA7Xg3ctvQx//DLI+kyECguftu8Qgx/m8T
	uAQg8tSMnLly6RXkRq7pv9SG7qB4QuzLCmv9Nml1Q/lndZ8iSKiUrR/NZhVw4nqYerWBq10m8rJIn
	1CiBK8MxOtYzTOy7Vt5RF3ejgPRTlYCDqVPYtSIGIGHMPFamCSQzlqaIrmBM3mH4jOMN8HgF/zei0
	NAxRCE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSee-0000000Do4g-3le1;
	Fri, 06 Nov 2026 22:43:28 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSec-0000000Do3t-0Oht
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 22:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hm2kTKJPk/uYSq0Es6hQUkkYRxKQKs/wEiupU01bYVlOcaGn2WFYPBSBguq5qidguShKDR39gOYXff6KUcptn+QvtfYUaxt/6BotsB6+xYF/3nfXtZr5wYAo08+7ia/fnI+wZpizU/ZeSb+m0ZQVgJZxeauUqn0ElrPPlo3/twWK1OhIEW/owekK6gVi4Qs/nRKNSuFjcadIaqp9cxwrAY6blIeLDk2SQdfTpZxhJfm7HsBKnuFLh8Rrh0Im40sLLS2smd3/yvhIeicpLGsDpWAR/P/8e1c7lK6nUtOplemN9vw3Ds/Tn5A6SbV2VmCDXGPXF09gusZJ3MRhlToCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Nk7Za3ca4GAeHwrdVH+J3eNPt6hX6VB7j7zR1z711Y=;
 b=D/8gzVWUS+ivKkDd7NsvA+quNDGrJ8tFraxxxHeVhEhpr+xA6+WhH+owyxwaGHgvO1EdjOYPU+p5e7/ocwDxGntum9aSnM9tVqKxM/M/iCPjraUe7LvOfOXkuFCQoTTET2I3qpdORYAIu7L4JKOCEN9UGlOgJ0L5hI/nsBBDCM+ZiKCuJifbDIVmaBKXBhxVwz4UZlsWtblhK7ayC8u/C8YDvk97iNXPrgAjzCMxMm+PAddQyF1eXV2I1dhFdmZgJNIafkb+0Oomsldg0IlR99j37a9FM0ZTm0SXSU+2Naz8F2yb4GQDeb4KgL4nULPJkM9SbOT7Qd4DfDTQkB3HPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Nk7Za3ca4GAeHwrdVH+J3eNPt6hX6VB7j7zR1z711Y=;
 b=wm+3IBCFGXxIrdaOZb8QNuhdT4g9mKiH1wBVf7oRfJ9EUgVVSx1T0THP6XDjp7U7tCJJyoYqeBTHOVqehQdiC7t3O8yFOB4YCQVyN8uNPjd6fe+ggiaPeMQqOD+hB+kTnmin16Tv7y07T4OakqfxU+pTP3qeQoJEc0NjoGL+mGISpdon1BrbD2V6JIMh303/+4yID/PJdvHigb5+pj0FifrD2d2jFDDjASNaan3bsn0CRpCE5+Wgk+6fL6AVHKPrr5Lyz35eIG/dDkyGAlv4Qk0ihFjXjRWoAeJ7qxKoBO+gn+VBcGzjCkwiHbGhsc3GOJkzyR0ugGRfUZu/AHKkGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 22:43:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 22:43:17 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/3] dmaengine: generalize dmaengine_prep_rio_sg() as
 dmaengine_prep_slave_sg_context()
Date: Fri, 06 Nov 2026 17:43:07 -0500
Message-Id: <20261106-rio_sg-v1-0-bc54b4bd8c95@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtX7moC/yXM3QpAQBCG4VvRHNvaVdbPrUgaazAO0A5Scu8Wh
 0+933eBkGcSKKMLPB0svMwBJo7AjTgPpLgLhkQn1hidKs9LI4NCZ5HyAjNnUgjx6qnn8zuq6t+
 ytxO57V3DfT9iDoikagAAAA==
X-Change-ID: 20261105-rio_sg-ac6ae89a7c15
To: Matt Porter <mporter@kernel.crashing.org>, 
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Simek <michal.simek@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794004992; l=1664;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z5IldGvl4SNykzMoNy266/Hzmw0uFfkZmeSiP5l+QUI=;
 b=sYT+ic/PAHA6BeYuy4YoIyHedRKyLbHWx3Q9Kzfx4WyflUBs23cpnhLMwfQqSC+2KWJzDoQ04
 oa5lhgajQ18Bjba+TCZdfXBXmtXoG3HU4Jm2flJlm9zZZNhPzut4jsq
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10731:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b4a2eb-7230-4ab6-5606-08df3c5759c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|261026140227099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261022105027099003|10067099003|11063799006|261009223027099003|18002099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info: S/nGn124RcE6By2r+hmscmoeXw+KuF2+kj42PTDynT0Q1GWJdPLtgmMKPiE4+FCgJz6EfuMuF2pfw4ImJksCHgNknmHYmFhQgFCsJS+NZQ6Swrf5sz++1FCZaa/NxYBpsWo+tVV2hrlYXz3D3vGwN5Cc/xQ2P8rQiqdme/famJBfFxz7pvyRkiVmAHjyQxPEGZWb4nURe9tYeujzKE0AR7ubgxtihMFZUqwpXs0lRLeUvqGLv093JWzpwEWvo1P6uL7M6g9jvKFby78dwzp5YUS2T1alfPuL0P8Erw9oYdu+jnKI+qe/cNoAG/Z0e4sKw7N2/uL1weX4o53CZ0kExEZRLuJOrVZh05bm7/SV5qA4HJuhxlSVT2ts/IQ0WAsnbSs/WYvGxXb6Htakrq4s0hXp/zhsHUhakI9FojHv3TuUgi9ew7RjwGN1xgX4C+lm8zucJ/rPr7Edd3WCvUO/vVJnv1YNsbM3DJFZ8lGM4ODnojj6LiY+6k2F+de0ryZyhogd8+J72Kq3ePd1ji7sLxeGSMDls7FEG8j6lxlJbX52IfYqJnhS91SVG8g80crc1UjWB86jRKnQhhKwW//CZyA8zdMJa5yImPkWyYtE7SSSr2x5VoUvLjYSFtcTwMWn6/nqpuuKwkwoJ4J/+f8RNTL1o0oXwOPLEzwR1eIusAohNKH6pW5Pn20d6nJzBYSSHEXl/NxoigLutLrcr6cwkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(261026140227099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261022105027099003)(10067099003)(11063799006)(261009223027099003)(18002099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU1JeEhsTFBuYmY5OTJvd294bmpGN0loNDJ2amxWZjVXMjZMYWg5c0prd2Fo?=
 =?utf-8?B?d1R6ME13NTM3dzEvUW45cE9CTDJwYzFMOVBVVzh2ekJOQkFyUVVTbHhZWmpz?=
 =?utf-8?B?cStERWdGNXhwajlQZGxFR2huWjc2WFd0YXdNZVFlM1plc09FUHFHK1pwOUpr?=
 =?utf-8?B?S3BjUEVIZnV3WkJKZ3V5WlUrUUxNUFRJV2srMVBuQ0JFRkNUcVg2a0dFbndl?=
 =?utf-8?B?VjNGQnVBTTUwamg4NHNZVEY2OHh6Zmw0d09mN0JnTlRhbHVRZmJaUmtJaWhN?=
 =?utf-8?B?NFdpb0dkNE9qNURFQm5kdGVUQlpSMFZGMEdNcENaRVRNL2thbml3a0hKWUxx?=
 =?utf-8?B?c2lGMWRnZE82MnR1WXo1N3hFQlFnOU1mOVpUOCtxYkQwdllKaTZIeW90Z2FR?=
 =?utf-8?B?NHJycnc2Vi9Dc3dIV1pqRk9yZ1NiUXEyVWsyVDFjNGlQemM4NElyRnRWemc5?=
 =?utf-8?B?OUlCNDRYVHFtVFZzOWcwdVFnLzd4aWxROFV3eUllRHpRMzhwYTViTEViSWZ2?=
 =?utf-8?B?R214TGNHTWFERzBZQzlOejAzeUNMdlZBeVlJMGhMa0J2MFF2dXFsWk5oZWov?=
 =?utf-8?B?d2VMQWd5ZTBxOWpqOGZHTVhvWnRwM2dnUkN2UjZjVzJnNEtubDI5L2JXdU95?=
 =?utf-8?B?STlNM1ZVRU1WZVM4UWZzM1g2dnZQZUpSTWJqbWc5Y0xMekNtc1dCWWFybWM4?=
 =?utf-8?B?OFdDdTVSTFNidklBMHB5aHdIMzN0VTNFOGVkUHdyYTdaNk5uWHpMM3NLK2Z2?=
 =?utf-8?B?R240UjJhb2E1NTZJY3RES2hBdC82SVFpajVqcERkeWpsSnRmaDE2aS9rWGdk?=
 =?utf-8?B?UEJWTHUxYXdzSURUcHMvbTV4MzdUSUR2cmFacysxZ21oWkhvV21xZmE1U0xm?=
 =?utf-8?B?M2ZiOGQ5Y0RWYUNMcklnK2RYak9BR21RVDgyS21FUForK3lBY1BMQVg3WDc4?=
 =?utf-8?B?b2pkdzA0M0lTVlV6Z2NsVy9UYzNUVm4xVjVhMnRxKzNoM2J1K09OVDFQdWlV?=
 =?utf-8?B?VVlPZDZ2U3pIL05vNkRVSXVMZktuMU1jVlBoL3BvYlBYcUFwUlM5MHBNRHMx?=
 =?utf-8?B?cWdFUGxrNjh0cFhCaDU2eW9xRE1hYXpwMVptZUgxWTQ0NHc2YkJ3R1FtZFdo?=
 =?utf-8?B?YW9nY0lESFAvYlo2VjZtV2hDQW15N29OVC9kSFFMeTUvRU5FNmJNUk1GWUhH?=
 =?utf-8?B?ZU4wTG5GUmc5Q0ZuN290Wi93VWVoOW5kWHZYem5xR3VVRThFclc2bmV6bkJz?=
 =?utf-8?B?OVFCcGxOd2RiRFFaQmtZL3RMd0p2bXpVbVY2ZC9oZ1F1aWJhQS8xRkFhTmVK?=
 =?utf-8?B?bTJWMDBZZnRZQXpSSzdkZTdTMmtnMEc0UUNoQU52ckFlN3cwd2hVQ25FQ2FM?=
 =?utf-8?B?VVpTRk9TNENoUWs2QnROMnludHNNa2RKQWZ3eW8wT3R5YnRvVUF5bkg2QXBL?=
 =?utf-8?B?ZFUzdXBMNnVXTUl2cDczd0svcXZPcE1VQVJIT0t0dnZPZFpaWm5RMEI2emJH?=
 =?utf-8?B?YTdZMlFMNUNsdmF1QWJaWmh2Yk9Sb3RkRVVxNmF2SXR3NkRYczVRN2RaNHU4?=
 =?utf-8?B?eVZERlRSbDFHa2szb3MvWFM2VGUvS1IzaUxoUkVhYklnaEUraC9NWloyTFVS?=
 =?utf-8?B?THlKc200dXBla3FCUzR2YjZFNjFWQzJJVFAzQ0wwa3BhL1M4dGxJWWU1am5X?=
 =?utf-8?B?SmN4UzBBZ3htSEtGRTVtMmR6ZmxmOGgzODRRZVR3ZFdHa21oekJtcC9hamRR?=
 =?utf-8?B?Sjl3R2VlaXhSMFBRcVRVaDdqeldEb3NBR28xOFdxdG1mcnZiNCtESGpLMGFP?=
 =?utf-8?B?ODVlQk4yT094djBKTTVhQUpBOFMybXBxblJQdXdyYk5NdkJPbUluN05rVlha?=
 =?utf-8?B?ampvTFZudVBBV3VRTVNBNU1YY0V4VU5IZGFNd2I0c0p3TmpFVEtrSWk5VG16?=
 =?utf-8?B?Q3hOL1JPSFc4NTNnajBMS1VnYzl0ZjZ5ZGowOHRzcEd4bGxoZ3B4YkY2ekJQ?=
 =?utf-8?B?M0FMZXVPekI3dzM0UEcrdkdFMVIyWEtJNXcrYUxhcTJGMEM1WjJJdTY0bUJ5?=
 =?utf-8?B?NWRvZnY3dFV0Zmw3QmMxWnRFM3JoeU11QWRsL0JtTkQ1N2hzRlp1R3h4TjZM?=
 =?utf-8?B?NHkrcnkrYXlPUUlaMysvZ3VJN2pMWDIwdUtOa0FSZVliYlVLUEZWZ0FTY2dk?=
 =?utf-8?B?RkIwWmJDNkwwcmRzY2xCMk00L1o1OUxNTjh4bisvdzF1ZUpLVGVoV1k2L0t5?=
 =?utf-8?B?MEF4dkU3M3ZVRjE0V1ZaNlFiRTJvUXV0SGMraXVmYXdLVjZnNzE1aGNBYXZm?=
 =?utf-8?B?MHdyRFpLYktYRm5uTWE2T3B5Q05KNEJmV0YrcFcyZ01rL1NpOHZHNnRDVTgz?=
 =?utf-8?Q?irGk5XLXSzVucpxsJWhMgCDx5wy+Uavv66jzo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b4a2eb-7230-4ab6-5606-08df3c5759c6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 22:43:17.6640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYL9g2c4r5XX4J8xUjQTUfDKa8GAmNdvIgTLNVbQ4cY3uLrp+qF4S+iLjAQ2WPSVn5mCdh5ctYWj8AYXQvDNuRgwsBQac0tW1T34iboAmXLwW5LZbWnUQ04XdngsPL/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_144326_171756_3D741885 
X-CRM114-Status: UNSURE (   8.56  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The dmaengine_prep_rio_sg() helper was only available under
CONFIG_RAPIDIO_DMA_ENGINE and used a RapidIO-specific context pointer
type. Several drivers need to pass an opaque context to
device_prep_slave_sg() without depending on RapidIO.

This series renames dmaengine_prep_rio_sg() to
dmaengine_prep_slave_sg_context(), changes the context parameter from
'struct rio_dma_ext *' to 'void *', and removes the
CONFIG_RAPIDIO_DMA_ENGINE guard so the helper is unconditionally
available.

Existing callers (RapidIO and Xilinx AXI Ethernet) and the Spreadtrum
PCM DMA driver are updated to use the new API.

No functional change. Prepare to make struct dma_device private to the DMA
engine.

Because only 3 user, which use context when prep slave_sg. Suggest direct
go through DMA engine tree.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      dmaengine/rio: rename dmaengine_prep_rio_sg() to dmaengine_prep_slave_sg_context()
      net: xilinx: axienet: use dmaengine_prep_slave_sg_context()
      ASoC: sprd: use dmaengine_prep_slave_sg_context() instead of device_prep_slave_sg()

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  7 ++++---
 drivers/rapidio/rio.c                             | 15 ++++++++-------
 include/linux/dmaengine.h                         |  9 +++------
 sound/soc/sprd/sprd-pcm-compress.c                |  6 +++---
 sound/soc/sprd/sprd-pcm-dma.c                     |  6 +++---
 5 files changed, 21 insertions(+), 22 deletions(-)
---
base-commit: 8dc06c1b6e41742c38fb4f35f32ae88b74fd58c8
change-id: 20261105-rio_sg-ac6ae89a7c15

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


