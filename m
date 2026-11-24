Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05239606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2+a3zT4M;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MJzj/tHg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H7q/VmAhp61gvdP861oLrsAyY5kExIGzad6GfqFJS/8=; b=2+a3zT4MGbIQUbSDOkdvgyABC1
	S4QdoWU2Lys4jI7keqFQ+BRQUPGD+geM6wGul2jAw/OThK2r9uHHXem0RoeS93NSyi/OBbMEnoBar
	gIG1vjwA0s7nJ8MtSBZUrBZBoUfrdMRSbEm+1k1HyRQsWHC5W5RHNROGN7asUlhZ6yOEqWnyPvxv6
	eY2HW8XgItK9wJxAE3CwChaYOjMxyHnG3fl6M2NEw/GBnrOWLRk9M01PlqN3/68sY00qTlxW8Qhce
	+q53MnA2RHf1h1s/zSg6oRCf+ilImJ4VPHfqQQWd/RNvNN2R5SP7bFyaUKtTsgWHm9pUrJGC2B2Aa
	tmKMm1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqRf-00000006cek-2j0z;
	Tue, 24 Nov 2026 13:20:27 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqRM-00000006cYx-1Mm2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:20:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KToc22NudMr4QKzbTOyDxXYQxCrajxGvwfV4J05G3zzBmEXszGGqTN5649zHQJVAeqgxyEck00PA7Mj9ihuOKgfeewkXyi8dItXva7dXP1baFxbbEyL8cgxQ+SvTXrrpd+n35z9ozLA/dZnIaaGwRYULMI0zDgOckPqvAQEu6gumxACvWoqZXZYlAWshH4fbMdxHM3cxj58lzYvJBTKl0A6V7DEf0Tw3KuLA0JSYYuv7pZf2dLxgs9Eyq9W3VVrs68rWwwwwtjPXxgHws+REq00NdZNXHMW4ai3St+8fJkrKgZWHLIUOe5+P75655/ykyhsGSqDgHmguZSviRW803g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7q/VmAhp61gvdP861oLrsAyY5kExIGzad6GfqFJS/8=;
 b=aF97wheVGR3inS3EyVKGLmmL/ZD2Za+EzUHstWiOq35NMZlESpm/OsPndlSEC2Wi4K/OXrpuRe6/MepHr8aCYGn5OBxfm6lYYoxSRuvPDQcB3cJGlkvKFlhOTCYfY+uWOARIlLeiozy4gl35Tzg8DYH//YMNY1HoUpuH9gUnvOI+mSjwG84RklLivcQc3yg48+8VCDRVmNQwpZhKsCTvAEZC59ZV3ukpEjUtbTyHvgt/Xb1aPq1EGEV4AfvkDcAVZE2azJ7LDThsNM05VJuVXqKc9ExoFcddkFdqrzLBQA4TgiBY5b7l7aAbkxHcqXIi9EUhMv2uO9y5NxNR3I0XDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7q/VmAhp61gvdP861oLrsAyY5kExIGzad6GfqFJS/8=;
 b=MJzj/tHg5Z9eaHH0NQ2DU85KdEP6bTVPL1C5KEWDHWy8xY6LgWk8t5tAF1TlFwS4JYf7i8N1UGrKC1yMto715kmNhHef36aHwKhFesIbZZrqbQ8YgRjH11NwRYFI3f9wdbAXTu0k2DOAvnlV2p8PUkS3H9sQ25Wu/PVv5+9sZbOb5hZnld6FYxmbgylMObxjDBZtaswpI9CM6XDFNvDDcPoabNrk4r14YH2G9me1EVJjH4xh+ra3U4DYJ0q0aT/W7dkq60FcdKCNfcpjayedHFAmzJmIROT0atJPqGA39Gy7JOSJNpLmEpXG1EfdSumBZRlP4osnq34K06GQxwoQsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by MA9PR04MB839208.eurprd04.prod.outlook.com (2603:10a6:250:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 13:20:01 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 13:20:01 +0000
Message-ID: <df17c9d7-8ca4-4f51-98ae-5ba4c0f7e406@oss.nxp.com>
Date: Tue, 24 Nov 2026 15:23:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: imx6: Fix kernel oops on user-mode external aborts
To: Stefan Ghetu <stefan.ghetu@nxp.com>, linux-pci@vger.kernel.org
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sahil Malhotra <sahil.malhotra@nxp.com>
References: <20261124131432.695946-1-stefan.ghetu@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261124131432.695946-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::17) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|MA9PR04MB839208:EE_
X-MS-Office365-Filtering-Correlation-Id: d814f26c-0a38-497e-4293-08df4a2da4bd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: pWc3znYSbs7Z6OoBlBaB7y3BLfkHxlrGA5Er4br7HPNic9SS239ddHoubusUHJXBHNAYMRPse2q1cxmeW6TkAiNiOFGzwut3vSDWwzhgVViAD92K7DDkAdgOuTlsNYYunAkSCphVwsC94JWR39Ze99F3w7drLGLlZBOWZkY8FMQYI9pLb7tAjOzpCmlIOzbomVgFuyfOB0s29voUUQL405ZZqSRp1Qb2xIO3Z5e9n8ORriFKKMkB1AngJoyq6FDMKUX73EXWqJvjEvURF7tyU51/NFIbAEcnGxBU2xY76cSDp6Zuupj3unJHJyfH7mxG1nUW7WuOuzr1QvXqG4qVbguFh5X/3a0Wg5q6Z0HfJnv5rqOrM8nlASLK6HjFYEE6+nUTBDXyv943Y+XV7P1HxyyfsifW/hOTZ1EymYvPW8dpNK6zyBxTpXDFIsY2eOV59ueastF0QZe2aiUJCST+dgrsGnzxTAcLo2CFOEcNsU6mI8vevRGDsA9j6g9HVSNgONR891lBj6BqoJbEtDVh1a4/96IRhx+YlYpLCyE26fVjGn02LIQiljzU4NwDi96dm4hg1teyZEFPx4j3CRKMtZ6Br5xg1BSFGxMwoPuieOovK5P6OHI+mwrIGmKdGRbfeL8YPJ6yC1jmR6bQpg1iUynMlK4nNg3Pl9nGp60EBpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2xLRUM3cnZWSHl5Mk1QdjhwVUJqZ2U4cHNwamprcFJ1b0tmaE1uVWp1a0kz?=
 =?utf-8?B?V21uR0JtL2ZvbXBVVWM1ak1QbFFtdGk0ZTRMQlpCb3VZL2tNL2hUN2pOVUJQ?=
 =?utf-8?B?OUhUUVQwRXlaMzA3NjVUWVRFTHFDZUx3cmxoVVJmMEZaQmUzSURlQ0FwQTMz?=
 =?utf-8?B?Rzg4a2tiVFZ4YVpTaFU5R1JvY1F0emRGa01Kd1oyN2NneXhuelRZa0NRMytm?=
 =?utf-8?B?V0tZMkpSWXlsbHRDOWRpN2FNZStuQTlCQjV5MHBnZG0rMm5MM0xqWExFenVi?=
 =?utf-8?B?cndlZ2pzcUVkS0N0dDVXbkpBdEE1MmNpVi9WNkFqTEhsc3RlMlN4U3FtWEda?=
 =?utf-8?B?Rk5rS0pEdXlyRC8wa3U4SHpLeXZkS3I2ZXNCNHQxN3NWeVZMbnVOSnpFZG1N?=
 =?utf-8?B?VFNZWWJ0Z2trWUVEV1U3alB6U1p4cVYycGNpM3lGZGZjUW5jZ2l3dTZlYjQ4?=
 =?utf-8?B?NjhZZnZqU3loUWd5T0VHOFNBdWlwLzhobWdJbm9NTDhpUFpOWGpJYi90RXNs?=
 =?utf-8?B?VXJQejBuUlNmU29Wc200YXJLU1IwSVN4RGJLMDAwQ21zb1p0NWpMTE44QXdB?=
 =?utf-8?B?cjkzM0Zsd1FOZTNMVkIzYTdPTHQ2UHUzaDZSVTF4Ly9FQjljWWtJZXVxd2pH?=
 =?utf-8?B?S0Y2YzBuN0c3czk4M0xpY3paaXFuNVFmd3JiNjVsOU85ZnQ3d0Y1RlZhRXVI?=
 =?utf-8?B?UDZUZUtIeGdGbnRXaTRVbzFGTzQrcW9ZZWdCbWN6N3ZzQnRETkpZZ1NtRmpS?=
 =?utf-8?B?ZVZibi9HRnR1bFhGM2NkZEwySGxtTDlDcVFpUU5zb2lLV0ljQVRsUithYlF1?=
 =?utf-8?B?UzdmT3pLWDhvbTlrVWI2QVZiOTgxMVhObk1YVjJ1OS9RSnJGeXkxaXpqTnA3?=
 =?utf-8?B?SVJmNzZqZGJTNStiUkxKTitJN2pibU9hdzI5ZjN2NDJYR1I4OWpKVzE5SHk5?=
 =?utf-8?B?RU9FUkovR1dPYU1UNFBtUlRxM0FyWWMzYnR3QlhZL2MxUGwxVjFiYW05V21R?=
 =?utf-8?B?NGpMbFlUQXliVnVpVExSZWVPY0tUYUxKbjF6aExnc08vRnY5NmcrS0RPRlIv?=
 =?utf-8?B?VVhxenVRWVVYeWNISTN6T1U4dllmQWpGREZ1Tmg5aWNRNWI3TWlzb1RNemRp?=
 =?utf-8?B?dG5mYWJzcHgzZi9yd2dtTnh5aTd0ek4zQXNmQzV3TjRRdWRRcXA0c2VXdmJY?=
 =?utf-8?B?b1F3aEtiL01Rc3NuVTc3S3JzdnNIV3pkMy9UMWVoYkRwUUhpejJGTlBuSG82?=
 =?utf-8?B?OGRZY043eDExTDdpbFdoZEQ1VzNacE84RXQ4T25CNFpvVzRTVWNkVDhoaGha?=
 =?utf-8?B?bFZOWEFQZzBWa2txbTUzSG9iR3lBem5aam1hdEx6ZXFjaUxid0l2SUpKVmJR?=
 =?utf-8?B?c2gvR2M1aEVBang5VDRQTm5RR2svTktyQXQvdmRFNExwdnJFdExkekVBTFor?=
 =?utf-8?B?RVdTdUxoWXoybzhlbytydy91R29Ha0g4eFJkdm5FNnorN1djc0prMjREVkRo?=
 =?utf-8?B?cG5yNVVQcGNNV1o2eEVnQXRRMHlPb2lJSnZaV0hJQUxiN2FCblFkdCtiem9w?=
 =?utf-8?B?N3ovNWR0M2d1MWdwZExTMGhnM3UwVDk0VitxdFhoenhZRytPSHQwVzY1OVdj?=
 =?utf-8?B?cVBOL2p3RjJ5bWtwUm83MldvVHFVOGZ2eno1UVlwQktJaHdpdi84V3F3WkFI?=
 =?utf-8?B?N2t2QytVWHYxUFpaU2dMc0w2NnZ5T3pMVmo1QkY0UkY4WFFQczhlSFlmajNC?=
 =?utf-8?B?a0h4aHEvMG5tWUYwdHpCK21OUlU2ZlVQVXJGd2NjVmJQaUF5NmhYTnNabkc5?=
 =?utf-8?B?NU5hL204ZUpVT0VzZnhXem5ZVW5jVGFKcWdla29HVGhhaW01NU9MYWpXWnJW?=
 =?utf-8?B?dXZNWXN5YWxpcDU5L3JGdkZJTHpBYmV4MGx4N2NhSWl4NTNMQWJiZmR2QnI0?=
 =?utf-8?B?eTZmN1dYcmdGb3M3NSswdGl2MUFuYjVUd1dXbElLZ1hWYVRhbG5hZDVHbDdZ?=
 =?utf-8?B?NTdnU3h2Skh0UmV2NXhUbUE4c3QwYnpYSjUzeG1lSnVKaDZSSzkyOWFlMVFz?=
 =?utf-8?B?QkJ0LzlWTzF2aWhUMkRvQTcyUmVEbHdLYjR4ZENZZitGS3JGd3YyZGEvWnoz?=
 =?utf-8?B?bU92RDdLeXQxaVlKKzc0SWk3SnNHaFNQeUlIOVd5Wm5TL1VOb2RZdGFVMDVM?=
 =?utf-8?B?bzR6UWx3OGE1NGlwd1M0THVRUVN6WWJwYlArcDFTa0pITEM4a0tJMnVBV3FS?=
 =?utf-8?B?bjRzaURqOTBCUDlvZEtONjRieHdiWjY2QTlCTUF3WDNUblNJbFhZaUdYOEl2?=
 =?utf-8?B?d0NRS0FTaEVycHdUQ3FEdktTMHEwa0I2STFxUjRNTkNkVTRGNzhhUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d814f26c-0a38-497e-4293-08df4a2da4bd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:20:01.0358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/Id13c0CgK3PB41t3uiVWuATmzuUBktYH1+wRXgrUDsIaYdL+VKQMjz/w3qEtSa0vDtdXJsY/5ERvwgCxmfIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB839208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_052008_408495_619F2F15 
X-CRM114-Status: GOOD (  15.67  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 15:14, Stefan Ghetu wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> When a user-space process (e.g., memtool) accesses an OP-TEE protected
> memory region, the SoC raises an external abort (FSR code 8). The
> imx6q_pcie_abort_handler() registered for this fault code attempts to
> decode the faulting instruction by directly dereferencing the saved PC:
> 
>     unsigned long instr = *(unsigned long *)pc;
> 
> However, for user-mode aborts, the PC points to user-space memory. This
> unchecked dereference from kernel mode triggers a secondary domain fault,
> which is not hooked by any handler. The fault then escalates to an
> "Internal error: Oops" and crashes the kernel:
> 
>     Unhandled fault: page domain fault (0x01b) at 0x006e3316
>     Internal error: : 1b [#1] SMP ARM
>     CPU: 0 UID: 0 PID: 1415 Comm: memtool
>     PC is at imx6q_pcie_abort_handler+0x4/0x7c
>     LR is at do_DataAbort+0x3c/0xb0
> 
> The abort handler was designed only for kernel-mode PCIe configuration or
> I/O space accesses and never hardened for user-mode faults.
> 
> Fix this by:
> 
> 1. Checking if the abort occurred in user mode and returning early to let
>    the normal fault path deliver SIGBUS to the faulting task (as already
>    specified in the hook_fault_code() registration).
> 
> 2. Using get_kernel_nofault() to safely read the instruction for
>    kernel-mode aborts, preventing recursive faults if the kernel PC is
>    invalid.
> 
> This ensures user-mode aborts are handled gracefully without crashing the
> kernel, while preserving the existing fixup behavior for legitimate
> kernel-mode PCIe access faults.
> 
> Fixes: 415b6185c541 ("PCI: imx6: Fix config read timeout handling")
> Signed-off-by: Sahil Malhotra <sahil.malhotra@nxp.com>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


