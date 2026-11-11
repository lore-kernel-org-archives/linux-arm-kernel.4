Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797A606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y5C/TvTS;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MTP3fi0j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ybLOGaA1nN6cBj/Hon0/pxOTuN9BCR4YiCDi/L8J89I=; b=Y5C/TvTSvEt739
	n0mExyN6mejcOBhLJhph0lz7Up4alNWJfh9s6V/IJaVYUhDZj+LwTl+oPlvQqtO9IPxxPG1Er2Yus
	uTOf5xPw+ZKhs3vAepyzLwZXy8WTg4QELQxV5ea/Xm0V0EnyjkmrhU9lmW9wJlT5YmBA7UwundGSH
	DnGA68pI50LROPxVSQsCjq/X7FdLE4RhILCfZppL+M092c41QVYOqpOTFezwpzm8YCjFo0YDl/DBd
	9xxlopLOyyIlJRjMS2j0/U8GUsk2E3+41DMyW4TnB515mSECpzIFRAsbHGSuFKCAB/UiaxeziLFLh
	vIvkSj9BGxGSwvBp4cCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBBE-00000007Bs4-3waa;
	Wed, 11 Nov 2026 16:28:12 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBBC-00000007Brj-46g4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quq8FPWuH13EVK+mE1tiQZFQmd8JlMdMdQ36thteUKleGnaGF/SlJ/jcB4OekHRyHyGfFhXPVmQgvH7dm3gWIvCbe4RDZuAp/Bh0bhYAMYLLdK/Nz0AYiX3uH+GbXKE5S7twL/SfTQyw8Gypog28kbMACI2tJIGRT/32tdZ6EQGd1caX5/r4lOEZEcxroz6C40TRBzhboFYcFSQAIfuPP8m8Z8C6y76Wz292VYocDQtvlIYAfisgVBaSlu9O4L79YYJdiKBtIOnCcBtkQC/xk4/ft+PbNun9GkjF8fhsElnsXOZonfAg6L5q49OwHz7w6xJy7MDRk+A4YsGHrr0SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybLOGaA1nN6cBj/Hon0/pxOTuN9BCR4YiCDi/L8J89I=;
 b=tC/osCaIoavxbXyzzOduPqgGXnVoZz1f5up/0xgBvT9E2Z0CCrN62DFU0v2WSOYeZcM4N/gYtAIea3pUHxIEYxRC7BjXOKbhhJkY/EO8y+Ad/CfdZZp6G/Qx1cZKL2zzcNkFb5GEdAzZZ7DHrPD52XMoPE7kU9iyQGsnTF5nq0H7jUd8cxhNWmlWlaW+BeDQ4DAczdrSDMk2VVsxU0Jm6tZKUeapNfBLa8Fg7ilLEXjwfr2Izi7c/z8xvJIcDsT6rkwXIusPHdXs+32sYkWZdrWZNmd3bwFd6m9Q2OxFUefOwK+3dt7l3tPp6asuS1UCfRo7tAu/XLecc5EoqkFEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybLOGaA1nN6cBj/Hon0/pxOTuN9BCR4YiCDi/L8J89I=;
 b=MTP3fi0j7Rq9MM7imje2YQTXEF3kJ9dpfNUjgKArnqF27kIMEeNNH9FVypLZcwJ27NRud8T0txWzL9SZpPQq222kJ5yxl+dpHHZSccxkKp77lv8WZNVpjGIyGDuDIgM38VNZV1p6ObwVtNYURC83kOYZQBqdO9FhQU5megAogL2gk1vKB9azgLCB9Jm5T6Q4uvWn3f/dN9T1MMkh+dNLvPkyfItej2K+CYCTxjDPlkWlh4ughwqS4Sn+XpAamD2euLzYlgjv+Z9Ab1DLU+NLpAErgDY7CDA7RPrq5XBbY+vwAq73TguRXcWeZtSw/3BuNkwTrWHHizcxYu0tv0eVxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB519196.eurprd04.prod.outlook.com (2603:10a6:150:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:28:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 16:28:01 +0000
Date: Wed, 11 Nov 2026 11:27:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <avSXh92mu8jd2kMG@lizhi-Precision-Tower-5810>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
 <CAL_JsqJYx1TJA7aWUi=XR20Bn7ZqFZWG6jVT2b0+ZLe9RWoZMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJYx1TJA7aWUi=XR20Bn7ZqFZWG6jVT2b0+ZLe9RWoZMQ@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0134.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB519196:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e8cea4-95e1-4951-6090-08df4010c140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|261009223027099003|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: tvfEu0gUjXLvNAiMj9ICxBx2729GKBgKi7UnRVmhAmKRVKz52tVa0NpSqejjShEK+vHFEE44BRpMdw3kFA82ezczYNUcSpkYDFiOjnr6ppRkL54NGL0VU3PN9ri8OjYrAr7runVtk+Q9NLiwOB25uuG2xg2vwvgjEXZoHg//TYK2o0hIMTW6Md7mfp5jjYAapnL6jw3U6I6NV4IiQVQpROUIt3YwOj2fTLelobGCToKOBKWWFMA8uactHwteOOUiMiteFcYTHNPYVJhG2c3CSI/O7NS15FHB6V/VIWQkAYGKaOe/IytWoIgZaqcvn38J8LWIBHyWzkJU1HFH/ji43tHKmfeUXVu7Fj7E9E5kOtfTU8ZfPO0KuOz0foo5eH7VZqi2nAV1DWL1XR4wvmnEW1QaXkW4Mg2r7JnZ15HQTEyzHkpDL+gtS91Cblh/wtoEtas2uMu3exa4cOFuxmbHSopmpQSSI4xWIGmkUyV91m6BVbOp6ERC63rTvRUt8mRceIlx5kmNdXo0ZXegnTn/BkRDWXa8DvZAZnrojpt9BTEYihNuiXr160TA6OGgiSewFzAhxQ3LFu2ujwjp7GSa0nN5JHIDIugUbPUpVLd3EThBApW8ydz67D3pnKpMpLknJr0ZwKS/2aScCUst23mQM7zhQUjBXfLgE31EQi2z0gg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZ6TWYzbXlGWmxQY3A2VHM2NTNQYi9WM1VjRnU0aVlpbmw2MDBuRVJiRnBz?=
 =?utf-8?B?M3QrcmpUamdDMnFSQVd0d09OL2IyR0dLWnZrTDgvTGtzb2xvelhBRXpJRnVI?=
 =?utf-8?B?V2ZTUmlONjAweStncjNiaEtLaHFHZnY5MkNhZ0FUSGNUMnh1RDZLS3dzemtQ?=
 =?utf-8?B?dkdSaDd0NDlyNUdLc2VwVFVpNnlPRVprVXEyZnJkcGQ5SWJsa1hscnRLNk9O?=
 =?utf-8?B?V0s2NENHU3BqSjdIMXhqQXBaN0M1V0ROaFd0WTU5eURDNVVqczRVaUpCQmMx?=
 =?utf-8?B?aUlMMnNDSjQ1eFlSMHFsWllWSEovN3NJdEQrWU5iMHZtek0yYjdRb05tSWdY?=
 =?utf-8?B?Nk4xV00ycFZOUzdId0oyaTNqdlNDOEpoc0RSV3pFRFhNTHh0a0RLOUJNWFBN?=
 =?utf-8?B?RUV2dDUwMkhZUStKWmlJYmlqR084UlMwVm9UTEhoWU8xUk5IVWIrMUFqWjR1?=
 =?utf-8?B?UGJ1MG9kR0Z3a0JVZkVWd0sza3YwY3RTUStvNmErblp1S2lEdGxxT2ZNZ0xz?=
 =?utf-8?B?OFZLaE0vUm5LaDB6TFRzYThZbCtYZFlxaFBhY2NQVmlyWWFRQ0pEVHIya0Rv?=
 =?utf-8?B?VkFXeGdPSUhKYktMc0VKVDJQWUQzVSttRzRVTlBIT1M2SmNUK2psdmQwSnFv?=
 =?utf-8?B?a1FsZE5lSzg5UENIS2lDaVAwbkl2YmMvVkhvZkhQbElOL0syc0JYVVZ3ekJa?=
 =?utf-8?B?SisrVFpjMEZiWkY4ZThlbHZhUXlaNTZwa1dwaWVTRnd1NWZRaW4rTTNzbDU3?=
 =?utf-8?B?dUtDS2RBcUtmSmtIK0gwVDQyMTRNRmJRaVBnL1Z5VThGZjVWbW9oTU9rU081?=
 =?utf-8?B?anFLaFBGaVBoc0tReUc5aTgvSXcvbVhXb0preU94WDNLbEpXYTdvWUZtVEpD?=
 =?utf-8?B?Y3RkU25SdXZSNGZWc0JLMHVrWWo0SFIyNFpXNi8zaEpVakUwMXZhcVVtTHJw?=
 =?utf-8?B?dkpYME1PeXdaNzhUMmE5LzZleWl5VVltcTN1VndhWVpBeTl5WWgrbHFQdkFn?=
 =?utf-8?B?N1FQN1R1d3lpd1pITEl5dmNrTlNHMGdsclphaDBkaC9vVklGT2d6TmV0ZHRY?=
 =?utf-8?B?d0lKV0VnOXJSRnFqOExKZEp0ak94WUY0bk8rZGR6N3V0eDl3K3dCbENBN0dF?=
 =?utf-8?B?YmR5ZHJBalpmOHE3U1pBZGRPNWN4YlNzY1RKeDZSeXZyYmZlWkx0cEZsQ3l5?=
 =?utf-8?B?Q2VTdXFEWTU2NzhFcmo1djhqaDl2ZEN2RG10Y3ZaV1k4U0hzUHFUR2pEWHpM?=
 =?utf-8?B?eUExVW1YVHU1ZHl0NURYTnNZdlhHQ1ZUcGd1dWVaWk8vam5LMjRYUzBHdVRa?=
 =?utf-8?B?OE1qZWE0VW1zZXF1YXBkZXBQYUFzc1I2SUFpeW1lbE1IeVRPbVlIeFlMVUlK?=
 =?utf-8?B?SjBxdDgxZWpYNE93ZlVsVE13SThHWVRielRFbXdWRXYzcTRyQ1BYc0szMG5S?=
 =?utf-8?B?eTl0UFFJQjhpRDl1amdYcGpOVElrM2xLV2l3ZjdYY3NlYWlDOG1SVEcrYUpI?=
 =?utf-8?B?NnYyeUt2b1l4WUh2UGhVYTIxVmhNV21jd2t0NE1UbWUza3QwUFdGMlpTQ2lR?=
 =?utf-8?B?RS9CbFJPUEIwQmZQeWRtTGJ4bHhvalowdlA0c3BxSDJhWGlDWDZubmcrdURB?=
 =?utf-8?B?MGl6dEpLQVV4bWhGODVDMEZ5TUVidGNYSENyejVocmRUZUNGTVQrbnhKVC9N?=
 =?utf-8?B?aWhvWmJvNkNOVDdCYUNmZG9SZko1MElFeWVQUnhVb2RQTWplSElpL0ViMUZw?=
 =?utf-8?B?dGJCdy8ybVArYkRTbElmanRnS2JZazBsREw1b3lNWk9NcFpMd0ptMS9PYmtr?=
 =?utf-8?B?UGQrRUI4VU5nNElmL0t6b2tZeXhMNGNXbW9ud2kyOGxXNjBONTVOY0toWGdJ?=
 =?utf-8?B?L1djU25qZmhTRElwdkZ4d05kOU5mZUVmbE55ajU1R2ZBYWVqa2JxSS9lTVA5?=
 =?utf-8?B?c1BQVHdNTmdRTG9zYkFPbGRlRUtXTEtvK3IzaHJaaHNVZFcyd0lZbGZjSEw1?=
 =?utf-8?B?OUJBc2NIdlgwSFI3a2xxWXhsQVJTMVpnUWY3a1JEZHlIV0daT1pmc01lWVVC?=
 =?utf-8?B?MU1IbDJXZlNuMWUwMHN3dkVUNHpHOStHTzl2ZjM5dkp2bU5MZ21yajZaOS9v?=
 =?utf-8?B?ZzFYdzVNcmtTSEdHUDhRWEJFdDY1b0JvNDJRWmd0SzV3TjJGYmJ5cmE5MTJv?=
 =?utf-8?B?S3B6MExhY0VuZ3lLanBIdUJaYVRELzE3WFp5THJlc1BFN1BmM3I0YjVYUkwv?=
 =?utf-8?B?cWhQaHEzV2J2UGwrN3FGUUVxbkl6ZE9DUFZZeEZtanFNU3FwbFFkTkRNRzhN?=
 =?utf-8?B?eXNPYldnaGxKRmsrUDRpbDFRd25CVWpCRXk3a1h2SFd3L2RpSDdsQVN4NnZq?=
 =?utf-8?Q?Zg5WuJm6FuwKxNcUwgzRSKhtpPa/UuLnQ0ewW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e8cea4-95e1-4951-6090-08df4010c140
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:28:01.6675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7wUHns1tSwa7zxKvgVJG4jI2qjBJaWOExbwueZBK1tekWBHD+JVFvlug9HkEhu8U0/f8apgvBVH2Ez3YiUiH8cUaGjf/jARMc8Yzr3lJqM7wQlTqjqqn17CmymMH/1x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB519196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_082811_018136_4D576C71 
X-CRM114-Status: GOOD (  13.96  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 08:35:04AM -0600, Rob Herring wrote:
> On Wed, Nov 4, 2026 at 9:56 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> > while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> > a single "gpio" clock. The VF610 controller has no gateable clocks,
> > so force clocks and clock-names false.
> >
> > Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
>
> Now a bunch of warnings in linux-next. Breaking binding changes like
> this need to be applied with the .dts changes.
>
> arch/arm64/boot/dts/freescale:952:50
>    Schema warnings:50
>      60 gpio@47400000 (fsl,imx93-gpio): clock-names: ["gpio","port"]

I will apply dts change.

Frank

