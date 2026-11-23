Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B879606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ebnVnwIo;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eBgWMezh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TDf7aXbavQtYipmJpbHGNJeBpT+O4uVmMPhFsSMbBBo=; b=ebnVnwIo0xuxABiG6BTUkeu2jH
	oake71x8Txd3UU/vZZiNJD3lNNkBlWsaXtUPXI54XObDchJgtH2Ax0yQlLfWwJ802RDF7xlQBqP66
	0aNnwd1SemW7Wc42zjO835GqDrz82FgwCQU33tEE0ov03LEl6k5gondE1Y8zj9jMUw2GADW6dgO0O
	SqQKi62F78X6zWPsMZk8AiS3MJmUBd/oZGjVrttQPlxB0nt/zpPyPl6lPSKVflgwBYecAyzGK6E8b
	ddsyaOmJnZZxTA00ypfzq6YzJQnYQoHNlu9+CDCdIzUrprgRe5GBBxR+cHLTZECacNRr/xKyfHp3n
	RCGPoLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcIz-000000053bL-0IGL;
	Mon, 23 Nov 2026 22:14:33 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcIw-000000053al-2nj3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq2lZL5XKJIBx4vXxqiE30eTFugH4ewALnBqqs7AqiuyshA/socYtdHQwEX9Dpmjw+CHV/l+3ThhcPvqDVm7IxJCrvbyyt0octyIslNGNNZGJIcHELngE+iG1MmVIC51x9fLBgOyEIXo06MXCspgby0XkSD/yOffj7j+p76oUPETV2+jwmCuWIpOs4Y3rxsx963//5DzPaX7Csc3j149xTRI2nh5UgS58B67Jf099x2aYmqJtkibyA3uesZ88s2dVHcCshFpTJazaSKFk7O+5qR58UuSlG9a2uSEZUm/YZhX440+J24yFSShlXUZAkFHQ4YF9hnd9aHfw6LDbS5Y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDf7aXbavQtYipmJpbHGNJeBpT+O4uVmMPhFsSMbBBo=;
 b=Toi/+rl303PCg1c0yGXtpfX1Dkbn7CZihP4ChQm1GMxn+gE3C0ODWbGrsYxKkeTNOIWyCLx2b4Yz0oNr2c5bJTXV1a51SJXepsD9rzy2VGXYyezywC1NrU5AV5zCK+xgsIREmM/NN5QPfNcQrtlgyA769XbQiM86vvI9vSftyfYWlp4dMmlRCK1QqozcyXEOXoJ6MQ69cPHVT+UlSMzApfW3iR/2K/hauGU3Kkp7OwcD/6Ii78F0Wt65VvhMidbeWICqg3+xO1m13j3Dmi7WUnXYjGMKVIsG7o5LKBnNVp/9WLKel41AU3xFclYUJaMmZ/BitmeBmwSRQJrqOBLgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDf7aXbavQtYipmJpbHGNJeBpT+O4uVmMPhFsSMbBBo=;
 b=eBgWMezh+1DWrLw08HaqppJZUaKJqG5PEQL9OlqsdZV2cu57HSTXuhFxLopXJjDlwaDaQlxpodMRUbz3yuQfx7VSinJ1VmEokjEs/cuTFLD0rUzWn8BvP9T9GPdvl/cgfPth5mqiPowgtOVzkpOVA9TJdQoiKIfYu+2s1im4o6tpmFxNfS/39jnn2BbksqIO+PlWrSV1WJiRu6QWQUoThP8m9vBW/G7fNth4vWWXNqZybDFvNqqhYY/UhwCtiUBvxeA5UV8kEKgXxOjZmEd0/EZ+D6VzlQp/hR9betigmEUz35ZPmvIgvmNSm9pYf1d/9fX+3BIj7YWTpFo05uzobw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBAPR04MB7398.eurprd04.prod.outlook.com (2603:10a6:10:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 22:14:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 22:14:24 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Mon, 23 Nov 2026 17:14:15 -0500
Message-ID: <179547204936.3036195.15781860181086275991.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBAPR04MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9661c777-f1a4-4d7f-1037-08df49af216d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|261026121527099003|10067099003|11063799006|56012099006|260925021911599003|260925022911599003|260925021311599003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Hk+fdqNjPExJoL5QXRqgTOiLhg+Dsr9vBlDbPfdGiEoQVlnGxeeQiiAy9WUFLC3XA9oDe7s+cdKYZ91Rz11U+nSkh4ERTkoC8VYZZuRG2qgUOs7NXj1/peTP5fg+enoZwvsoe1qG1nwyqMVELF3au73nYWb3cYNEPsmsJXgzijd7v6UBaZGd63dqscHT5IcbnGeheLfSdz6uP6TGd9hltGfTEZGTOpu0ifLmtdw8tq30X2zpxnC7seFicJtiR12/h2TIIFUgxJY/M8eOfP2e78ahaVIvLHAkeoWNAD6b+3hiXY+ID6uU8gBZl0iDfD3j6LAqPJXSbCrfe+WybLIXx0lYKggoB/VFXMWuMARk+EWoqgi8nsplQIZMvnDxDh0NUQ9E7ash7QWoSiEWhYTHwUmWuEjQ5YZf/y8HOvmUzO0oCkD9HLO8lGwrctFIylh5j+RWT8F9YDP5SjuamoT0vLfWdHTBgzY71K7LrpQFs85RYPsNfGSsd4LJ3na9DLgjqF/FEVLc2QGsoYPWRCQw9sxu1zt/XHkmS7P5A8WxXLGkl8tCsZPMhvZhXuQZz9moS/2+ujXYoW/t70M5rH/5KDFuAEd7zeHkSZjmDqVm3F+YtjW/zO9orTJx9Ps9BnmqtP8KlhBdiGhrf5vWtHTrF1W3dRwyzTfHnclCe3M0CIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(261026121527099003)(10067099003)(11063799006)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjlxdlFjUEZVWmJ2SUk4UXdxdVVHcFRPOE9sVmlXY0wvUmtFcndhSEFnamc5?=
 =?utf-8?B?UUdXZUh5NTZHaFppaEdhS25xNWxVSWRIR29zc2o3SlRhYVRPbWhVRFNoVW1B?=
 =?utf-8?B?a1BJR293empDVEp2RGdrdlNoQktGcGFzdjlJNlF0cm8xbGFiS0pWc1JOMnVk?=
 =?utf-8?B?NlBxYUkvbktUWXM3VHBYbDFUOGJkTC9ySTA4RGtVYWRXeUd0NXNMZUkwRjRa?=
 =?utf-8?B?dlhwSnlPeldReTVheE5HanJPc3h2NWRPeEphdStlZm9XbzBCQ2tLdzkyaHVM?=
 =?utf-8?B?dnFwTFpYTS9xOGduQS9XMHJwMU9zRG1EQnc4U1NQdnBCSGRacFo5OHdIY1Jk?=
 =?utf-8?B?b0QyZkMwS2Z3T2ZlTUswbGVPSFNVbExxamN5WmpxeEh5VXg1bG8xUytuRFFs?=
 =?utf-8?B?aC93ampDbzFhTzZ5Uk15dGp0clB3ZWlJVmRDMlhOc0RBakoyc204RlNGSVYx?=
 =?utf-8?B?Nmp0b2pESEplZno5Z2NHTXQ3b0pJd2llYmFMc2FSb3Y5KzIrb3dMRVd2VEts?=
 =?utf-8?B?UTV6VE51WDRqZ1BTRXhyUnpQeXBTUmVOT0x4RmNiZTc0NVRjdnpldWorVE5h?=
 =?utf-8?B?RXhHb2NuR01TL3JMME9nRWI4WkhpN3MvZ0Z1cTBldDBDL0lTdTV0TzF0c2hm?=
 =?utf-8?B?K2xoOUh4cWVsY0dkZ2V1OC9aaFdvYVRqdG96ZGFYNGplcEFGYnRxNUNNWXpH?=
 =?utf-8?B?NTByaGt0d09udVh4YzNxMmRJTVVRR1hFV3dPUy9xTlZOY2tYTUIrVGJycWJF?=
 =?utf-8?B?ZG9oQ0l5SExuWXRSS0o2RnBMKzdHaVlGR1hsSFhZcTZ1SWZDRmo3dkFXT0tQ?=
 =?utf-8?B?eTJEWHNxejg5VU5GYUs5aElyaUlLSXIzbnZZd2srSVl3WHFaWmtXbTNjdlZW?=
 =?utf-8?B?aEZqL2x6UFBXSnA2UkQ1VkcvNjhpUmdsSVZhd1hGT3F4SjFSamVoQU9jTEFL?=
 =?utf-8?B?NjJqcHpDWjJqS1I1TEk1ZlZ6SGhUakNlaGdKUUZTNVl5OUtOckRkYm5mWk1R?=
 =?utf-8?B?cVFKall5cCtPMVFzVzdxZm04N0hxRC8wa1RXN2NvN1JOd2pzNmZuSlk3VzBD?=
 =?utf-8?B?M284Z21nK3lhaTZMMVd5bGhzamloRVJyeGFJUGdDN0MycDVPTmhpRDhHS3Vo?=
 =?utf-8?B?RzdBUUhLcXh2TDcvNXJ3c1kvVXdrWkRCWUx2NzhhcWk1ZmlwbUpFQ0Vkc1hD?=
 =?utf-8?B?aVVpcE8xY1BzUTR3VFJqNStLS0pQNmFXYlBHZm5UVzdETDZiUWliMFQ2Zzdm?=
 =?utf-8?B?ZS9VNWdoRTBvUnljaUo2Z0FQeVBMcUgvV0M5SnRpQmpnOGJqY0V2QU9acUU0?=
 =?utf-8?B?dWduZFIxa09Pei85cWVkTms0NnhaN2N0N2pBZG0xOXpsMzUxTm1TOTJxNEQ5?=
 =?utf-8?B?eGhxeDNhQ294Nm9NTkR0THhOeWFqNUM0eHExR1V5OU5mVTYxeUZBUytVL2xZ?=
 =?utf-8?B?VzFFWDFOaDJ1YUJFN3YwakNya0VXTEk1OThzYnpJWUQ4TlNqN1NoSFBxMm1O?=
 =?utf-8?B?U0FIWDAxcVhxQXBydHNMZ3MxLzE3am1ISTRUMXcwaXorNnlGVlIrT1BZeU9X?=
 =?utf-8?B?bzJmOTRENUdWWXdlTHIrMXVncVVxaGs4Nm55WHJhOTQ0byttckJlSGRzU0dE?=
 =?utf-8?B?anBnR2ZvVlE3RWJUL1llWTFEMHBIb1BBcVJ2ZlVlSEhNRTRsa25XWEFITkVv?=
 =?utf-8?B?YnhKTTVjMVNhRXhOOWFNbTBPRkIrb3N5U003STBxZVFSam5VSUZDMVdHbmVp?=
 =?utf-8?B?UnBNckFTaVJZZUdVV0loS0p2blJoeUdOM3lPQmRpOHpTTmZGY204UVpOK0xh?=
 =?utf-8?B?R3NReCtpeG1ZYzZWc1g4L2puUnI0ZE9UdGJ4ZzZYa3VZOExFV2hCY0h3QUdu?=
 =?utf-8?B?UTByT1FHdVovSlgvOEFHekNRd2ZCOG00VDVGVUJaam1LVG1nam5OVklBZ3pE?=
 =?utf-8?B?T3dkblVIL0FMYkZxSzNIRHJ3bExmOEFydXE3dmRwZk9Xdnh4OHY3aHNXSmZ0?=
 =?utf-8?B?M2Vjbjh1OUdzRXhLNHF1ZGxHSC9KYldNN0FoTkNnNEFaaG5iT3RQNDA5Tk41?=
 =?utf-8?B?OHVITStvV3hETWZ2bVdBNkNFSitnVUpZM0dkaUErM2w1YWttS3VJeGRvVjdY?=
 =?utf-8?B?K1JOY0dNQ0RaVjVMSmdOVFI5OE1pZE01MDYyVlZFZnBTL3gzRnY4Nk5RMEEw?=
 =?utf-8?B?UHNCUmNoQWxpUUhnUWpWSUl3UVhWR0oyUkhsTU9uQiszNkFobmtUMkVsRDc4?=
 =?utf-8?B?S3VqS1lLUm5lS1VQeVBNS3IyWXk2UGlOZDJDdmZFTm9KaTF3Ylc0eTlmbFE3?=
 =?utf-8?B?YXpaYXZIckdMWnJERWhBZENic25ySmFFeVYycWZYckQ2ZUNDMUxLL1hPOGkx?=
 =?utf-8?Q?AP0ewjGbGZlIctrrnp/0tJLXTlUSW45C54JuX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9661c777-f1a4-4d7f-1037-08df49af216d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:14:23.9735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk3sbKRCzD+Pp/VTunnuGnPMkaHMWW5SkAUFcWkPGJIZj7KT5LqG96owl80Isjy/PuDZKazaX6Iy1PB+0GcX+CXgTpC9anh3cbdsRrcCB9PNhXMnHUjMONHzEAzqATUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_141430_736862_C165B868 
X-CRM114-Status: UNSURE (   9.07  )
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


On Fri, 30 Oct 2026 17:35:39 +0100, Dario Binacchi wrote:
> This series adds initial support for the Engicam i.Core MX8M Plus Fast
> Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
> SoM.
> 
> The support includes device tree descriptions for the SoM and for the
> C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
> LVDS display (C.TOUCH 2.0 10.1" Open Frame).
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
      commit: f28b6d3dc72d4091bc68e39c195c962b8833f34f
[2/5] dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
      commit: 859f7c51c7c6092bbb4855550ddff3e95b5b69a3
[3/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
      commit: 06e9ff6252cdf646f61c9e0aa2c0700259aedd2b
[4/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
      commit: 22af6825efb8c1986860828a2937aa42a0c0ae65
[5/5] arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
      commit: 65f8b4684f2bb651f3e5168da9b237a31fed25b5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

