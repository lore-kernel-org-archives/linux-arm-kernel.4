Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vo5AFBOE;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tR0hY/j3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lTQY82W0uNq8p3mN3w5NPzX/PNjvwPz4KL9yh5lHRwI=; b=vo5AFBOE5TOgMtkVvh+cTA+Kyr
	BNHdN1m+J2mEihez9XNX4jY/UzsoE2sGMsbl++U5m+5aN1Wo/vWS8GkBuHTxIzmRBZWQg7sLRK2jV
	SP1BRdzd6XPozEYfovVI28s7fIa/aBKDjyDkfUlzUh4uPhGEn1UdTy1gv65m6JheHHut7QN/NoT1N
	h2RVc/0aYf/WJYCQ/NsApJ/a0+krFAwqBf9h/p/VSxGnkZ1UKDvbUCg6GG6IfMUevZP5/Z0/fM5Hh
	JBMhdVJiAOaLkqEzvOi7IhX7FeB6zdDAeOfSoHRuTTE5qx0kktl5PiyAOPl/WkkgJgfKfqdNU1n0O
	bAjxHPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPN3o-0000000D6eY-1MWe;
	Fri, 06 Nov 2026 16:45:04 +0000
Received: from mail-northeuropeazon11011058.outbound.protection.outlook.com ([52.101.65.58] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPN3l-0000000D6dt-3Pp5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjgjMaLWi+/oa2If8h1QedBOisNKHCl05HAKNgzsClDZYC/n0/HNbO0Qgl5Evn5Fd92eNnWqhMxG63pMHNfqHl80w9J1GhhIz90Vkzc9oC+sHPnGV5Rk3II3Q8enS9BW0zTi/HLJcPTH8Hea6cuh/AfCuQ+55OXyJEcKz6zSYoGgv57boTKOxjbiSQuXLxiDaYN305RnlkpT8T63jWrvAFfUJRlvMK4KHr+kVWBBpvIkhbIFp2LPoeY75NP5mE7vJWyYVLS6xjOF6xllSX4sIgm2eumDlNmjo6xj8n9QcuboCKK6Kv5seclDUhbmer+Vb3Vl64eoGAc1HLMSM8xM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTQY82W0uNq8p3mN3w5NPzX/PNjvwPz4KL9yh5lHRwI=;
 b=DmmTpuFRiV9DH7EdE5RL47f+BPGM5D0guiAFLwsRg+bcXOX9gpgL9WvkeFvTNB+B41FBqvboD2EKSkV8HgV4llh0xJM/lIRgj9u6x9m0KVesQbn1zYidrBuUqYmMGcZm6IStXv7n2Wp4b6UnwT2gR/S5dAydm3mb+ILlQWaJ7mP5o5vhkInJ2Oba+il71erbdkflkSo3jblmT4XzcFFIjT7/68FFQkgYE+0jv4v2Hwwet0TNSiyIwDeYqoaYQBrzc0QeXkNKSQgKkKU149WzuZshFdF9edj/UEXHgl87zLMwz4NchOMMGJJtWDnzXiLX8RwiNlpC8pKv+5hmp50pCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTQY82W0uNq8p3mN3w5NPzX/PNjvwPz4KL9yh5lHRwI=;
 b=tR0hY/j3UJPGJtGVOGe3Ng67xBuEMfxEe5D7UN7qfedqpuOI4qzf1ozFalCiZ0Cfgkb5ZNVmofxySX/1mnr15Kz7ZfmyTbHaCzvji0hMxLdiGynMVi7No6Dfmy8I3KNc606ztp2jeVDbXlU/vSj6+yBpI2JFin77cMi+vnmUddFdlfvtgpNxAp7VQ0RqN9eAhWLBrwM+b43WIJYyQemLRFKtjRH3OlgHtw2xFAqUZMvlcuXBohhDkSySakgj9MMAleNrrq0BEh7TKS0SUFInQ6/vzlqf5eEdz5GPYuRYZEVL9gkv606Yw/GaGNEHTdYdgVT4ohXU961K580A4pgBgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:44:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:44:56 +0000
Date: Fri, 6 Nov 2026 10:44:45 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Florian Ager <florian.ager@bshg.com>
Subject: Re: [PATCH v2 8/8] dts: imx: Enable USB OTG mode on BSH SMM-M2 and
 SMM-S2
Message-ID: <au4D_aHhd9kBmpQi@SMW015318>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
 <20261105-add-bsh-smm-m2-v2-8-fb5ffc7da486@cn.bosch.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-add-bsh-smm-m2-v2-8-fb5ffc7da486@cn.bosch.com>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a09761-944f-4b1d-d15f-08df3c254a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5ev8iYOvy42b8LCiNinMIJQI5o99A8ie/b1soG0x01WZCFmwR3W24d3K8Zzztt8FKiLziV+RA3OMXnM+mxCXFK3x/cKdWUEgcD9AdrBgYuPw+PeLSZVsSpp8QmgHfyG3tN3Af+UxHAa0e4d15ZCPojQc5jmvqH1B7OCPRMncaf4Kz8hBHniRj/KCNKwRDKzG6B1ewIhA/QFlql3f+wm5B4ViMcarZfBm8ScZhZpINw0QXgwT+WGe4rHSV4ld7ZiThW0OarD9rP4WsvhgHD8TkObGtXMqbx/nZSx4IfHMqYRFXUu0l8lYRqHwVnrKnv5bXS5cD47N2MOzh2cNb+MiJ/m1U2qLSVwyM+afaG+DfCIhYTO+/VaMHa8dTP7GhjbVtzw+UhX+pAPpZiJQn4FEp75lID0TDQZWZCQkQG6K5qy5vGkxdMU10xBieMKO71Hw/ebm8Pw8kl7rREP9UV2RnBx8qmv5pGmqXkqJzrkrKQjgWdsWT4XYKNAqAIWBux0bWvZMdHdXqKxmzr6Qy6/k2PdH85N5cx0d6FW24CjQKhuTtwXzXPlCvR+Z340lTtuu3S2MwZ0/OmJJ/FzfZi5Zmlc/qFpkR5trsZ816jwL1vh+OJecWKOULlWjDhOfI+sxS/K+gaJTzLIz/DCESrsUCcUWJ3cJBCE5hSsBsUYMLGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8ZAg4ANYpqOOLlt5hFh5w92tnYrIa4QHyJsdo04PbahCXahKy7QtljjuQem?=
 =?us-ascii?Q?bsWiDeSa6lJza3JEYAhqiFqtZ1KDzY9GJhnec/+uFh/Dus1jCiI5s72mz8kD?=
 =?us-ascii?Q?HI41XnQotxdu++7g40l7FroDfSdxSgGIiUO6EOWnGeaOF0TL6CqcRfmiywE4?=
 =?us-ascii?Q?xn1+2hGgxWCzL42bKYJIRhfjBo7AF18iiHtWi+b67QZN4Bwbz5kOlzOnHcfg?=
 =?us-ascii?Q?f2eLCSMveVOFhsauF2g7/s/1rQoiXiqNYApDZ+rgrJ91ToO5KrQubtLKiqy5?=
 =?us-ascii?Q?K6UVuuWDVmOI/b3OzJMbGForA14S1UGlgjVCAgqvcGO6pTsAmT01dUlry1zS?=
 =?us-ascii?Q?d7XyWZw8cNlGWtj30V4798uO2iBMiw43C8VK+afDmYjFE6btCrp+X/xMQRSg?=
 =?us-ascii?Q?EECZkpPT/fSZ0LEEP8YIh3uoVw8/k7pweXLooPPs+81G3sVvC3IYfrdHAru9?=
 =?us-ascii?Q?TQsnaF91yB3irMQ5NH9Zm/LL2xKKes72dtDVYYKyTUbphyCF0SPqug0y2Qyh?=
 =?us-ascii?Q?d2Dvv/e1MmTrL2gj/mkWVjgqsJOsEX2fidJZNGm1Vmo+VIgTWmBbuYyRkVyk?=
 =?us-ascii?Q?RR6qY47XXgistlXVaDWXYlZ7ekItzWAhTKJ0fuRXsu2X5s4BniP8HKcKYp6B?=
 =?us-ascii?Q?IJKD1wmPc7o5zIHYYID9HjRLuyCrql2B4qgH/mBYgWuK7A7xxObNiVaSWhuo?=
 =?us-ascii?Q?nWOs0e7J8nAvZPF9XLkdvBSBx1uMZJrVbD7Gs/FPQ+KqzfyenDzv2XhqzlVO?=
 =?us-ascii?Q?maPo+sSeiSLn1WnGnE8UKNRwO9zka75/IRba7TOXMqBC/ZyOf8MQIkSMj+bg?=
 =?us-ascii?Q?yCrkneBQnFiEpGS01VXnQie3L2PFJ7CgX+WtP99YvTgutkEZIC0OSYMvWtx1?=
 =?us-ascii?Q?Brx883txcGybahSA2YIz/m0Q5a9kuXdtP8zkF+1qdro7ALeyma1DPmNM7wnu?=
 =?us-ascii?Q?a+1k1++PLrBu8wFpWTbXVk19lIGbeFegfFo6nhaGqqmM/3sa+xzz2HuUJmUi?=
 =?us-ascii?Q?82Qg1XEpK4iXaCtSAiR/MaC/dCTo7cP6IVOQrEMtmFvCAHPJh5WXM/kyezvw?=
 =?us-ascii?Q?L0vdLDE27R6ClyKH3hGWtE2kPqlt6qkM2XMTvgN7DuVIwfiTH/dQrjg/DNoR?=
 =?us-ascii?Q?kEqhraeI6mpPc4NzyS/+Axy5AXQfGzlu4TNDTkDh/b8AfU06t5VHGih5fUyn?=
 =?us-ascii?Q?Iu3HRPsUTsEkABzmxT0B4r7YAuhCyu/i9yE6LVgjadONSCuOvMF/aE6mBWCT?=
 =?us-ascii?Q?ouQd/MwpQLbA9rBpD+RZ8jFKXPPlK2cs4+KOaC0dH9I1dtJ23LqOdrc/Vw8t?=
 =?us-ascii?Q?TVnh9Bx0fvqWIHCvxd2+BDv9kAu+cd8a7/w3DctUzb3slBiX0HFV30wtpZ+v?=
 =?us-ascii?Q?D2Md/qg0OOyhIpyWe0xUvkQsGRG348aPseXVQDZMWaOADKnMAx7ePqeH6YiI?=
 =?us-ascii?Q?IvW3TMZliG9m856TRb6WGtoPqOA3NCS5i+tChjnb0BNcXLT8TltPwoAACDe7?=
 =?us-ascii?Q?f0X1iATbJb9S8Rv/VbM/Cjp9/ZXgrDOW52pcZSfU3MIfLkf2Nbq2AYv0mOJr?=
 =?us-ascii?Q?QKeDFQ+nK/R0r/b3RswJ4SFOEjRR9L5VC2pVsSZ3/cuZsM3UgjUrrcG7TWSc?=
 =?us-ascii?Q?XkplbcXtgQpPVk1H9NiC0hJVMqRHXPJYKpYQADOCs/Z4mjZaVaXP7G08+PdF?=
 =?us-ascii?Q?ePtNFPyEqy5MhfObBAdKyw+8yswzlt0m8dSLN0d+nZOBe6DPIGWoKuPKSxm+?=
 =?us-ascii?Q?z28hcAd30ycfPThhjSv/9WON/kopHm+JWEQb7n9YZcuFGAF0H3cJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a09761-944f-4b1d-d15f-08df3c254a10
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:44:56.4594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqBNpXJU80E6Tz+4dcesBSkN+CyIEfvdyomk3Ml5etMK69ne1ZecKL4XOzY1ZAzU904HG23sHhQdYSFk4gcluFNvqdYiT/71byYPqW8iKx4N0HdVqbvIquMEMg4WmF6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_084501_864086_BE90EAA4 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:41:22AM +0800, Haoning Cheng wrote:

Subject missed ARM tags

ARM: dts: imx: ....

check others

Frank

