Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5421606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XhIREE+Z;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EWJ7e6Xq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=40i5SDqo1l0RUMHSXdN58m5r2ATQYilSFO+xlHsRTEc=; b=XhIREE+ZLSfdUX
	Lp5TkfqygqOH2N9+g3WjCxwHZtUgFlrRVZLYJAvlcBvntiOdim4g0PeSRP50j7emfS6Xpi6FseqKn
	V8LSzMqBN5iTQe59K2mtrFvDEV56X+X0JknBSs1oQ8iKVAMpYzo90wjLcT6LT6v4mFJhrVly8WXS0
	zFNvkIe6HXv9JzipGDlUQbKjjzBhoFTdElNH6aC/gn/tDvEI4rEj5Ea6kankkzRHBtoQQ9WFUi6ie
	iLcxIc2gnmoyEJHUPsGnNMl7ZGU1NqFNk0xvNcEVRkKaxSgtqOoF5iymBgTJE0exezKFpwxo+c5r5
	tXb+/9LG3n6kGWtOB1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYB0-00000004QN2-1EK4;
	Mon, 23 Nov 2026 17:50:02 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYAy-00000004QLY-1MOO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3q7PAMnmM/Qlun4GEkupPhLszy+kO4xiwxb/Oxu1uaZYhNNhC5ugJnKAkWqvPKRLRiNVJt0g3sVSo2BjBPRmXS/HzKvqNfxvzkavNnqmgzSpnYiVYNH2Jb+3NFM5sxjDy6oNAdRwHZm/6LQUhUrlVB4U69VsRh3j58QsYjWnuJhOzT18tb+a9fBfs4q2SjSlTePRLuS11dT/ntvvxmAAdA5QvBGM7EYcWk/m+4VGC+zlU4D2JLghyLagLvneuDsa4+rOaj8vTDnt2Ih8cROVU4sVz4OowzLaL5las3LH1JzswH/SCOo2sIA6WN1R1dBu7JRYaYx85k+4CX5km+GyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40i5SDqo1l0RUMHSXdN58m5r2ATQYilSFO+xlHsRTEc=;
 b=bnVoa5Cc2ELUv2CoKsXSGVm8nHVYVUuSgUeErga+tkIGkORmPexBHf3lBX/8J6hEnSHgzgkSoAu9R0DrmgZRVL632+RNvXd6T4OJmykPN556eR/CZkZ1EireZVpDfs1bpx6R4Reil/kzSbC+xyG3Y6kt+bamcHnNnuGCqc50M33imLMsRIAByo3VZV/+kSPkbkJ0XHM3tp/NXYT/E97d9qicIineYlAvXCwyflrGrjkRW9sX4IGRtniPtJ8KdgvB9VWw561P9Z5BP2N5CPpoXK8XJbgrBlUBvOfoCgdi1S1rsNkkcZojOjZUz9DtE71F0ZYCpnR+AEozssiojEilmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40i5SDqo1l0RUMHSXdN58m5r2ATQYilSFO+xlHsRTEc=;
 b=EWJ7e6XqLMy8/3POejy7liHhobW2/lCvy1dhEXEX1OPUl4uEh6fKS7K6O+58v5mvZV1qnf49w4eeh3fiKHaenRYWZVVLj6xHWjfftrJnfNxEZMcs1Yx4UNAG9KY433l9xJHCiyhgvdrEnqXZ6QDLrFxA0a1HOg3Bc65l/O56pazQnas7WlnnZqXJwnWusZ9EhtJBhJDqUQVw9n2GMGLfmSIDTTLZndf55ua9Vk8E4Kt86kynqPWJjZJZ2b+Dys4uE6zHHHnT+Oo/RpaOoU4VQIW7nfPBm4bibu+wepJdExvMQmADEAKs/XPMPQnQztEnG2Rx01hBwRSjudGeiqVZwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:49:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:49:44 +0000
Date: Mon, 23 Nov 2026 11:49:33 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] PCI: xilinx-nwl: Use devm_clk_get_enabled() in
 nwl_pcie_probe()
Message-ID: <awR8rehnxAE3SNFh@SMW015318>
References: <f691bbaa-ddb5-45bf-8f85-fcf354a6af03@web.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f691bbaa-ddb5-45bf-8f85-fcf354a6af03@web.de>
X-ClientProxiedBy: PH8P220CA0053.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c46c95-a3a0-4c79-53a0-08df498a2853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|10067099003|11063799006|56012099006|261021123027099003|261009223027099003|261022075727099003|261021121427099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: OojVOeeLdDABSrmBnMj5OcGZNSZD9JLzh8hlVOMox3ZaozExsSbyzpYSixhjJBS7VN5hvZEFD4G3ocH+Q8JU6ytHVF0DempWaSRZhAMHOJMseD19JBaV3JZPD+FuBWIDHbl4gyMl3g5aNUb3yBdNWlzBbbsNizUL6kwHHv7EzdC+lrVUBKWEJakAmFrXl9qSf7EzdeeU2NIMGEalPEc9xtYqZchmAGiyenZQJ4qy2zC+1OBKBo2V0I8nj+7w4QSO021JM0ZsmTkDphtNPjnximKNDWzwRB2HcGQnpgkuahSGRF6rCOv9vJeunm2w6wz5AI1sFAV9FQyP9xYXmAI5M3NrwvN1wiVFcKgC07th7wpkQFa9PlBdbU1B8oST5gdhnD9/nDE8RO4FYULGvl1kMlNIiUjCDIWpHvym9SwmYBMnE9uTdICX7hiJYbflZEu+NzofYCG70WlM/8CvYLyOGBj1DhL5QT0fDGGOPfiv/ygtwjTZSxrJZ6Qi8LE3mTH9FvHn4nYFGsfBs4UaIhTDD/JfYDgnj0N6YzZgK4mT3hv7PRNfA6+qlhEdyUV+o0+DOeMiBJyIWrpwGJQbGaL4LXH0anJRn7wxSxKPHSX3QJBRDPFprxcuVFEDyjmODiU4orpaGEZdb6nHAhg+2/ryZbg8MHoryyxG+7U0mlMr6vk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjFtS3ppTlZiWm5wUHh0QzBETnRqOXRYS2pLSDZnUExQSGVVc3lMbFJOdkR2?=
 =?utf-8?B?MkNDSTkzNksvd1UrMFg1N3cwL2pHa2hhcExwNkovM3FlOG0ySVZlSmxYSEh3?=
 =?utf-8?B?UWVWeGNVNTg4SnRaOVhycmFCaThUWTJRZ083WHVMY3lvYy9wNTJZYVNMdDNL?=
 =?utf-8?B?b0FWalIwZXZkSHFKK01FYTFHQ0pKUE5ja3VvcEdKRy80M2V2YTA4Rmd0Snl1?=
 =?utf-8?B?QTNqVVFRcWRDYnRlbzFlQyt2MkNNSkIvL1YzYk9nSi9TZmpWM3RmTGhNakg5?=
 =?utf-8?B?Vm5Pa2lUOVdDSUhXMDFIM0Nlb3dHME1BTnQ0L2ZqMDZucWRuRE1mY0JSbkZY?=
 =?utf-8?B?Q2tNUUVEcUQ1QnA4MlEzeUNMUzBvQnhUWTNXYTFUbWxOQXBPZUpMYit1dXZh?=
 =?utf-8?B?WDlqdTJoYzBaalptYW0wL0dqdk9EckkxRTQ4YmV4T3F5bGF1ZGNYTVB1WEtN?=
 =?utf-8?B?WVkraGRBb1JKY0h6am9GTGF6aW04T2NkR3JvcVBrNDJSWERreW5VOXAwU3Z0?=
 =?utf-8?B?Q0VZdnA1RkpJWitqek84Ni9TNXhpejZ1OWpYMVJWeWJaRGhtMHJqNHhrN0l1?=
 =?utf-8?B?SFdTUmxqaElIeUhIS3ZvS2p1MW1tcUJKQW41eHFlVzkyN1AwV3J2dEdxWmln?=
 =?utf-8?B?b050VjI3ZVo3c0FSbldUeWJvTmhJOG1IUEtucXZPcHVmQjBiUWJQdjB2Tkky?=
 =?utf-8?B?Z09maVlldG9ra1BtVkVybmNiellpSGxMZXRlRmNvenMzWml1aGwxNURZSFdW?=
 =?utf-8?B?OGhVbHprK1h2Vk4rZ1ZDNWtVQWoyK2wzclRpSzV5dFRtekRGczI5bXRnR3Bi?=
 =?utf-8?B?VDJtZ1FNbzVxZzBZTDlLSDZBUG1sTWtlNWF1ODgvSVFCU3FOL1NUOVF6Ly9M?=
 =?utf-8?B?Vld5UHBkWFRQelYxc0NpS01oN2Q4Sm9XL3drckZpdCt5aGdsemxVbFBWMFEr?=
 =?utf-8?B?dFh6bkQxVTFaWmx0T1B0RE80WnJLS0dERVNyc1FtQlJNbkxWbm1QdUo5b2x1?=
 =?utf-8?B?dkt2SjhmZUZoZm4wREZ3U3lpc1VpcE05SmpLYkZXZDZkQnpweW1zQ1RhMmVS?=
 =?utf-8?B?eklkVGd1bFdDeXp4R0o2dy8yTk85RUF0QTd5dXAwelA1TWRIV0VBdlIwNVNG?=
 =?utf-8?B?YzFlMWFUclpOblZXZ2pBQW0zeklrT2c0NGRhQU43bVBjVjMzRVlYZFZURTZ2?=
 =?utf-8?B?TEVWeitwNHBPdFI0c1MwZFZydlkxYmR1Wm80TE4xS0ZrbTRsaUJEVmVyRDdz?=
 =?utf-8?B?ejcwS2FrOERvSzQ2ZDVaUVlNWHM2a3FiT0VyeUtCQ1VDNnZmWENPWHk3RXZ1?=
 =?utf-8?B?MEJnQ0NMMmxCUE8xKzNWQ3k4aExFUVVyenNidm5GVTFLeU41eXJ3endEMjB1?=
 =?utf-8?B?T3BFS0JYQk5vckZscnk5Z0Q0NnBMY1UxVTZyUG92TkF5amFyRVM1dmRWVUJH?=
 =?utf-8?B?SWdmdk1jdVp0UUpESjNVL3NsM3ptS2FDbFZGamY0SlR4UktTT3p1dG1ySVpU?=
 =?utf-8?B?Q2xkY1J4MDV0YzRZMmVFZUU5K3JxYVpJUjIraWFPSVNYTE1tSGp0N1B0MW0z?=
 =?utf-8?B?YXArNDRPbzNqY3hPVVpJRmxMTnlWaTNXSFBaaU9jenF6TUExK2VscHFteDVG?=
 =?utf-8?B?VlFIWWJkbElQODcwTUw0YTV3UHlzMFMyeFduV0w2c1E0Wm9DNlJ4ZWgxNmtC?=
 =?utf-8?B?SkNQemdJa05aMDd0bGF1NzZta1QzdFRtL2NHSGlLTWNGMFVwL0NmVkxEOVhY?=
 =?utf-8?B?ZGE4VDF6eDBsYlZmdmkwM3lDb1BFK0tHaGxXQi8yZm52ZjhYZWtDQ2Rqcm9B?=
 =?utf-8?B?T240WlRBZ3lJWXliWDRwZlVJS2xGQTlJWFpkTnROOFdJSDN4MFJ2QjBXRTNj?=
 =?utf-8?B?ZTR0MURINDRPczhiOTRSVzU3Q0xkZ1JQR0h0VWNPbHE4eGp3VEdnclZqZ0Ni?=
 =?utf-8?B?T0NERExYbDQ0aytwL20yckphMHB4VGh4SUwvY1lDSnM1ZXQwWHJhcEVBVjA1?=
 =?utf-8?B?Rm4xaEMvNG5ETXcwMUJjZWY5NnFER0U0M0czZUtsbmNFM0lIZ1FCM0NEcE9M?=
 =?utf-8?B?RDQ5Z1diTFJhb25mT21xV1A1ZDNTaGdXbExEeWl2dXA1U1NUTFRpaG83bXo0?=
 =?utf-8?B?YmwwdDBwRjVpOVRWOXoyVklNVmtzWnRMRVFUTnFRTVZOQnBxUGw3aThHdlhY?=
 =?utf-8?B?QlJURmw0Q3VSa0dUT2RiYndzSCt4S09LcXNyaW5Xb1JkVGJKcE5jMVNYdkFL?=
 =?utf-8?B?MzlxUUc0Lzd1NTFQSlJoWFNzQkp0WHdJbFZEYnpXU25kV2FRVjgyTWRZSGh6?=
 =?utf-8?B?OTFLUS80RXFSdGp5SE05aFVvWm1Yd1pXRjZacTVhUjRyUTVmaUN6Z3BLenAy?=
 =?utf-8?Q?lQGk4ynx0vno/BzE/CinJA4MIw3qUarvY0AwS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c46c95-a3a0-4c79-53a0-08df498a2853
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:49:44.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSkNqttMBpQTStZj5WmBcQjmscLdyptz7q8Fxx78RxK+/EJeGDR3s1DpTr3UsjGjRuK2wgIRVTiNi+CdnDP4FGN3o1s7Ijp20xdfCR0d4lzI/vAC4YtbZYyDacOZygf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_095000_556815_D0DEEF2F 
X-CRM114-Status: GOOD (  22.16  )
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

On Sun, Nov 22, 2026 at 08:52:11PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 20:35:35 +0100
>
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
>
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function “nwl_pcie_remove”.
>
> * Delete the label “err_clk”.

Needn't * in this case. Not title ahead of a list at body.

Frank

>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/pci/controller/pcie-xilinx-nwl.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
> index 0dee19fa24ca..fd134317e9c4 100644
> --- a/drivers/pci/controller/pcie-xilinx-nwl.c
> +++ b/drivers/pci/controller/pcie-xilinx-nwl.c
> @@ -844,20 +844,14 @@ static int nwl_pcie_probe(struct platform_device *pdev)
>  		return err;
>  	}
>
> -	pcie->clk = devm_clk_get(dev, NULL);
> +	pcie->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(pcie->clk))
>  		return PTR_ERR(pcie->clk);
>
> -	err = clk_prepare_enable(pcie->clk);
> -	if (err) {
> -		dev_err(dev, "can't enable PCIe ref clock\n");
> -		return err;
> -	}
> -
>  	err = nwl_pcie_phy_enable(pcie);
>  	if (err) {
>  		dev_err(dev, "could not enable PHYs\n");
> -		goto err_clk;
> +		return err;
>  	}
>
>  	err = nwl_pcie_bridge_init(pcie);
> @@ -889,8 +883,6 @@ static int nwl_pcie_probe(struct platform_device *pdev)
>
>  err_phy:
>  	nwl_pcie_phy_disable(pcie);
> -err_clk:
> -	clk_disable_unprepare(pcie->clk);
>  	return err;
>  }
>
> @@ -899,7 +891,6 @@ static void nwl_pcie_remove(struct platform_device *pdev)
>  	struct nwl_pcie *pcie = platform_get_drvdata(pdev);
>
>  	nwl_pcie_phy_disable(pcie);
> -	clk_disable_unprepare(pcie->clk);
>  }
>
>  static struct platform_driver nwl_pcie_driver = {
> --
> 2.56.1
>

