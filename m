Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37919606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BKbpKna+;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CQUDP7fU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oxE9+WePj2CubjMylSNgBFHweWgdaKtMqSIAv18W/90=; b=BKbpKna+W1ekW7
	DOhXgAL1dfRJEV/4bHytOTzds6tV5wjdsnvl1Lzb26I9sEkppO6lxCTfXCEYpBiPmR8O95FiZBUm4
	T7z6XmdtUF2FLOifIOfMEYEz25CtpU5C4/obyB76AEBtdohU3PMNuT6dUQLn0mbBZoM0FP+kDbTse
	s+hgwuKWmN+urum1hKIO9qDst9DFqE0jIrYqjH6cmDn+w1khKN+f/PJ5t8KWrQ6xcCm6GfBIA4rHe
	nSQlyX1OgBDXaCBQx7uCPk0tyO92vM3QO+UvZ2BVNIGggP9VosF7rqcM37hIoi8Tqd5qbjEzAL5tl
	wFQ+WLiiBeirZYfSiQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC1k-00000009oLq-0IEG;
	Wed, 25 Nov 2026 12:23:08 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC1X-00000009oI4-1ld7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:23:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdzTjRoXCg6YaPpir/gKmvUhMzJ/mujDqoWrbDJ+BBxlac8NcvpKbZfMAZxZN8KAg84XNG9PH6eUhpvzvwM2MoiAgQhQOvyFYWBwELOVV292+rWOFy8RAe5IBnSQRYHImo2c3jz58VspmXjT6q1HKh5ix3cq4gdMiCFeMl/AqM9NYj+Vs2V370F9ASjqaYBpaNOkapbli+iny+qyg7RkeiVEd566J6tRsjmhWNbuosnIeqoY6Fe5jtifUDgcZiGKb0AfOZRGpUxB288s5HD5h+JnJS1wXetsfRuF377mQuH0k9zo2B0di21NQ/h42bQU+QK+aU+o5oapNP9v8X6QFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxE9+WePj2CubjMylSNgBFHweWgdaKtMqSIAv18W/90=;
 b=H58anR2qDqRZfFsxF4T5ABZOEPMvvhjVh0AfgO8KxLnUbOiE8GbaHATAiDKjDdUCQyfEoh1VVN/wmJO3nIBopIzuwpBoubAkNsF8orsVNjvbEU1wImA9GWW9wzcdfyFCyI2fbwgCPSZ6thXCM+YFA4tPhZb3Jgv47mjbvEbBf9cFizSaC3CzKA4r5ZfdKJnAoX4CmbNR5jGKP1CZKt6cjPwb5/l73w2CQZhtXu1TP9AFojF6NENa7saeG4RCA6mZ8ip4xJN3YPX7CCnnPapJjxrLJvBh7B9WC92aY+Le4qJdKVax6tySHWzjfD7G4DNhB+/TGKK05OMx7O6qkRRPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxE9+WePj2CubjMylSNgBFHweWgdaKtMqSIAv18W/90=;
 b=CQUDP7fULoLfhTEKGkA+EYi8akxTBWflTOxoSfdAD8hm+lBKGbVhbFLkFPV96IeGpezTfOL9+yvtRpKjFNLvbt6RRO6StVNWsNKvmLAKs9coUEWR50aF65jMXR0I9P8Fgd36+cYnOHwF7MMgyFkci3S40sZNeRiWkx2b19/6P62I3QsOkPIlK2iiep41UDLq4ULNDAlEnlcJgdvh2rJIOO0Enj+2upbT8joNYkGBspD9rzEzl//BTUKXgvPiHe1UN5wuD4OH6xT9E/4OYoHqzC/rHWXZ+Ov+FjoduMsHkzr6rAdPzfebxwRs1PM5S3tLDXQKY+o3pdR89+NT4M3ITg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 12:22:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 12:22:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
Date: Wed, 25 Nov 2026 20:19:51 +0800
Message-ID: <20261125121952.29502-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123124946.13887-1-stefano.r@variscite.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8dd152-4eeb-47c6-6ef4-08df4aeed28f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: TmBUeeXkl/nuGKzmZQ/hIN2ajzD2qDAOPVU4aXrX2rb7p1mYKAIm66/QomR2URET0AcQDUoCxhvCU71YkrGcrt423nJqv0qxTt7UwWABaExmtvN1XEE15JFoSdUlCjro9Zw8w40FLOJSXRIRHXwc0WrUGl21/UvFyIfwDahZPF+By1yNP1sk324J2ndE0YjEJpL19Ct74X6GBT2RR592CsUHWdTJ8c6feMC2Yr3jOtfpXQB/HxuiyT8wYIAsNEaxnwDJSKXhnNjwGOdouy1JYnH9uWmK+2BHF9hEhTzXRU8AKLFccSjXhnxP8iPFl2bCFVssRnoU9uZfufVRjrPMl0Laii+2Rd83VPtzn938nirIv7RbgrwcQQ4CJQZ0g/yO5kiyYowVCPG5BizKH7AxZbXP5S0xEO/UkZSIZxB/QFuz9lS7HAR9bzp3NP2KL1stwsK4vStH6YrZg//qYIoisjgetrtzqcimu+Clvl2V1y8UPDsAtm/Qbyube8YZ9ySpvvjHn+SSKh3a1OBHJpw5hzrX7x2VpHEEYPJ1oxRCYzSHBdqSyRX/LGam4FFf3mGj0sg3xoy4fUx1vi1twvM75ONvVEWCQM8IlSHo8JH3VYEp+QuXkJiM1D8R5M83lvLZsNWz9J0134kQMsIcz/sN62SlOtsusZByh9jR+gxleYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q0mCFQTfoiAj3ErXHsOubK979SRCbHZ7ZaslMpVrhrFD/Ve+7PV7Rrukd61f?=
 =?us-ascii?Q?ToUDH19/r+7F81bGIOILTtRAzAztENrSjnx2/iqk2kD/h7GIoZsWipdcB4RN?=
 =?us-ascii?Q?d+dg012gIWZYK8Ym8ZdzbvZvBwJJHrS9u2VSlfZd4BH3VFmw0GZpbr/JGVb3?=
 =?us-ascii?Q?VVYFOji85FvSeVaG0UQa5aBEDjunULw6oODiMCBew88FKz/18wbnjwAdRKPC?=
 =?us-ascii?Q?W0G93tqqmtVxuUJtK19LkZEwZadGNSk7Hya6nC9IyF7l5goKYh3kMNuvnCVl?=
 =?us-ascii?Q?zYuETAMeZ6cEd8a3xFKJuNAX5nfjuj7F0mRqBPo7FEEykOO61tGCtIq1UOhO?=
 =?us-ascii?Q?9ejBDbCdfy9z66GBSXcHcdCpcGlfz8PvjTNLiAu3W5X5rKNoLuR720nFd9Iz?=
 =?us-ascii?Q?kwwsc4xH9aVMkA5aSsFebJxGMmTDN5xwHTIRVpeQnckelel82JgYY+Q6alg4?=
 =?us-ascii?Q?KXqNTkxqhkwBO86NjW9eqTj4E/c6UvcuDU4stgoj7HwniI4nvGmC/OMqh1Zz?=
 =?us-ascii?Q?myawV0JOyE5d6GM+2C9yyja9iO4bzuf/pv405It8nM79ISwRWri+C04MSPou?=
 =?us-ascii?Q?jPDfHX9r2XAFg7trsN7v6MRgXNvyHnomcptTsxs0BHPp84pcC+d1S4q8fAAT?=
 =?us-ascii?Q?1rj8qq7+VQU25YUU0cPZkGJazkzevvyj864hdYpd1wq/KwNLfhsJYNdVgEAw?=
 =?us-ascii?Q?MjVaMk9+mSu3i3oyqng6nL6Y2dkAoksqs4U26feE6wWeVMQVw0HXo8aRnlg3?=
 =?us-ascii?Q?Fv4cjhcXg8jVMFfCVHLFsoiMxB61HF8hb1CHrh6Qc4Gpa7eUiKCPc7SdWDHY?=
 =?us-ascii?Q?Wq+RGh6A7Xz8lzYxQe7bwyijvZUDyxTZn6jd/x/v0vTW1JRBEUM0sa6/T0B/?=
 =?us-ascii?Q?Lp4DhUqDwGVBMcbgw9cA+0f4oyzMjcBEP6jePtrLHzguKd9mRoXZktCdPVDQ?=
 =?us-ascii?Q?vh8hfqWTsuea62bUCHfQmLTZVFtz79BhU58R/3dDixP9chhss0XvOVojM5W8?=
 =?us-ascii?Q?RR7Ruz/aKvbJacBu4EAFnWIhH6l8hg5c+nWPAJDMRoNk1NyBccmq4dkkY1Ei?=
 =?us-ascii?Q?JPdM2aiTHbksnR4fTAcujnTSL7NdkMQ0M77xl+zd2PwZC8ehbN/Dh7p3g4lo?=
 =?us-ascii?Q?M7fQ+LJ8YTcOoDp0V0b6EvpSaXe4jT8DdmrbfJQpniIB0UkmlZUTLlGBLLdE?=
 =?us-ascii?Q?pBZrmOCE3pUuPKg2y/EKVg3sIBnCT4uISVOPALvSIV5lSD5JvX0ZusezLtH7?=
 =?us-ascii?Q?m2VmDRQ8AsQOpMXIAGFlHS2rkH4o4aX+QDPQiydOxYcdXnetFD5lPyi19YgA?=
 =?us-ascii?Q?j0Y0GOPH9KK9mWoSFXHAZ5BWZStCDFu9pQE6xbg3/AjsEkozuIgmkidZnubW?=
 =?us-ascii?Q?0w9O25lY+cNaLu5v4zEpW1Tlsc54DshKqx1AuGZAofPIcejVtG1UeBE9SR5i?=
 =?us-ascii?Q?Wj6RZXMH5WPvyMZk63pl9/Nz54mWdaSCMSghrYMgE4LGAx9qeD6NqHbOToyd?=
 =?us-ascii?Q?Tq0mvTLmgTPFZLcEulAO1CejlXqu25GYTWGKjrYZ8vtN1oib98IzjrA51oc6?=
 =?us-ascii?Q?5Nxh2jVcoLS9qjtuBi1twT39Llpw52cYO8kddvUoTeO2cM8IMRP3cie2Jss5?=
 =?us-ascii?Q?PhbP5fk8loy5m8sr9XeexRDiFvHVHGXJS3ge/8jNU9+fAhYiyW6a86IFU3T3?=
 =?us-ascii?Q?nZMFb4tEjOsXtCJjA3P30oYSvI19DQ1C8aD7rOnqlgi5O98IPoezwd42/8us?=
 =?us-ascii?Q?IpksiFk3O7Igrdp+5p11fMVe5v8fY3d0SrJpQVUjTZyyD0H83LJd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8dd152-4eeb-47c6-6ef4-08df4aeed28f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:22:50.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csZcFeLNLkRo63gVxB8jtSwM+tetmomEgMrKsYloYAb60o75nHDKQ40R6xttvWjizGXgwB2WSgQyfb+gTB9ubtbKooDOiGiyyHBqA3qUEGUX0wmkL+76GvRRndK+SM8G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042305_871020_64547E61 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -1.0 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 13:49:46 +0100 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:

> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add a Cortex-M7 configuration for DART-MX95 on Sonata.
> 
> Place the reserved memory, remoteproc and MU7 configuration in a common
> include so other carrier boards using Variscite i.MX95 modules can add
> M7 variants by reusing this configuration and providing their own
> peripheral assignments in a board overlay.
> 
> Add a Sonata overlay and a combined -m7 DTB for remoteproc and RPMsg
> support, enabling MU7 only in the M7 configuration.
> 
> Reserve eDMA1, eDMA2, FlexCAN1, LPI2C4, LPUART3 and LPUART8 for the remote
> firmware. Use PIO for the remaining active I2C, SPI and UART controllers,
> and disable SAI3 and its sound card because eDMA2 is unavailable to Linux.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> +

[...]
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx95-var-common-m7.dtsi"
> +
> +/* SAI3 requires eDMA2, which is reserved for the Cortex-M7. */
> +&{/sound-wm8904} {
> +	status = "disabled";
> +};
> +
> +/* Reserve the peripherals used by the Cortex-M7 firmware. */
> +&edma1 {
> +	status = "reserved";

Should this be disabled?

Regards
Peng

