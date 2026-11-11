Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=amrF71HT;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=iiIIRphl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nPNc2OM8u7bLEgvo/SguSftNhmsxCeRNKpZIyE2R+g8=; b=amrF71HTsWdQN2
	ztNDQCHM7pe4qG0R5OntESHYXHiNKBo9XUW/0dNxs/3XjgakTF4rraZ76wqLCrwVLBfahiP4qQEaL
	mwc+iwiaNHmXpmRkNCyWwcln5fZuKfD/Pc3VaI6yUtyWoJsmRmtRjVGcKGZfUnRNDYU3php2j3Scf
	porE1IChDfxXST4Any0ZST0sb15sjUHfoIAyyPyL1Mmqn556Vkv7oN/cchPvxDv83V/WgR9w/hkll
	BpLh9GyES3md0NqI/e9yPDE9d+DMD1i3wFv07+jLQLmSwW6SqYIXJjfR9WB5zlZO1GIIfN5iA4g8F
	Iv6AYpNbUrI+gageDCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxl8-00000005Pl6-1w8q;
	Wed, 11 Nov 2026 02:08:22 +0000
Received: from mail-westus3azolkn190110003.outbound.protection.outlook.com ([2a01:111:f403:d116::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxl6-00000005Pkn-1xAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlYqe7c4uTKTQKpeXnnCSVeeoJFVYogDqf7aDRMoc50U4SBxvcXClfd070dtVtElNNfU+qH88lvp1xHjg62qwUpsSuINVCwyQc9nWh0gO73a5p82l5IVKsr94L4uaCrkufDM+NA4OkRuW1vhvxvoRbC4fC36ipBp0Gb/Ue4/raDrswQuq6PMYRCsnzAvEBF9k7WikkNwx8xoTYVXysgsq6HqdcMQ053NLeZ5XJwX8EQU1P3VeydGOdYPVh1tyuXASEHB0/a7Ypw7WZR+lejDKjkLYvx+SEZDpMs7d+u/pfZvGMFXCPnrje5FgyXvmIBEJ/QQ26j3rMCbi2sFh/kt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPNc2OM8u7bLEgvo/SguSftNhmsxCeRNKpZIyE2R+g8=;
 b=gX/aTdMkSIA7TceQAqV0IabYuRvAtsz/450bVXAkHjbSx94lR50yV43QW57dFRCYPepXShEbgvEQIRQQg9lGt0aYv16IQuW7sHfGWXqcPVyWU48Njp/nX3PYI3Uc3xTEIHqJRWV4wQJ4TRWcFAqeDhXVGJbjA2fsyaeYu9u8UPhPCnJ2JN/1Br2UffRPBFEhOkKX+8Kgp3ATSqmEbHCQl40XVlU/xI/vESg3AH0L8v5Cw4u64BMlT8JqukuZSgEwhiQcaFMK59dP0EFJNMqowTnJqhDAY45TDh72TdTgJyNEvHyNnJl+2tzF8igxYkKdlAWmPHQaOhUtlGEjHEeGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPNc2OM8u7bLEgvo/SguSftNhmsxCeRNKpZIyE2R+g8=;
 b=iiIIRphlX3Bly8vNEkBoI0D1SNNOEwnExWAMvkSkvPW8bK4G1krY+bAaqOilR6MMC3PRVM4EvvcbuzQgmhfc7thHyvuZFIftYAqjE73EJNKT6xkcLz4ooO8ggvUdBKXMg44nfO23J/0Od4DGXV2VOZXsXDD1ZjRkJykQFOKyhlcLZIUbbS72eTD+yPrZ4QSUsvXUJ9yZeH82RNLXbNBENVX+GDRdAFPSN1pLlmzh5TtDvJCfdtvO14/7rhqcMSji7qJE8trpQ0TP32pcdFFlKWDILLw9kw3hywliHNmov0R3DvSSXgyDYWQSEF2gF4+TjFOmZIXsMIn0lb7eXcahGg==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by CY8PR12MB8409.namprd12.prod.outlook.com (2603:10b6:930:7f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Wed, 11 Nov
 2026 02:08:13 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 02:08:13 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: cwweng.linux@gmail.com
Cc: andy@kernel.org,
	conor+dt@kernel.org,
	cwweng@nuvoton.com,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Tue, 10 Nov 2026 20:08:03 -0600
Message-ID: <SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104091136.151269-3-cwweng.linux@gmail.com>
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:610:e4::6) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID: <20261111020803.1121900-1-chernyakin.victor.j@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|CY8PR12MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 05408700-a35c-49a8-5018-08df3f98a36c
X-Microsoft-Antispam: BCL:0;ARA:14566002|260925184616899003|24021099003|4140399003|25010399006|22121099003|22091999003|24121999003|23021999003|41001999006|39105399006|5072599009|19110799012|15080799012|8060799015|40105399003|26121999007|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8O2xGncXhaXosalckQDdHB2cHHzLBLWf77ld5aLp5hJEmNxwpjBY1iv7F7UH?=
 =?us-ascii?Q?pibcB7o/ZAAtYsddQ50YkaIlGTkCKdoUwpOO9wmw1wyzKoLK73EFEXvQ/8k0?=
 =?us-ascii?Q?yg7+dNQkKfoRaEMqoBSeZGPPnlliD8M3B/FSIhLAB5TjI8U+YvaBmbpxdos+?=
 =?us-ascii?Q?ltsT81N6jSM8hgvUTCfTvt9zUOQEewmwRXCTIUyrpQFVSbazgxcP4yyMZ0pg?=
 =?us-ascii?Q?/lsHRPj8oyfyRGo1CJ3K+G+iUp2XB5ML9UWccemWjy1v8LfhEhzXgbUKqHpg?=
 =?us-ascii?Q?U27vSPC4/DKWIYzvzIuXAt3040nxKkL+HNwpIWDwL6mdHMZRtY6rs5Sux2Y3?=
 =?us-ascii?Q?xT8iiJjy2GLxUqJPD2GDZW9/HNnYWyQqjx3OWTcAqnStjMFg43BlA5A7D0oZ?=
 =?us-ascii?Q?ZY46tWYMRXgvxexmD8JlodznlQLbuP4Jr6hPmOqCITutTR1fdWH0EE1l/2Ad?=
 =?us-ascii?Q?TH6a78lFkeqB+6jRUXznlRPUW2SJDwLI6yueD0wK6zx126gxLQZycOMhYQLF?=
 =?us-ascii?Q?aIQ+/z3Jx9CjJEnCAaTRa/U7U8SSYjG3EbiY1QvNuIVwAs7JM/4ABafj/Nip?=
 =?us-ascii?Q?1xttbR1sXvO0Py3H5H4LY2YNb+imsfBIlim0mN5ZRXHdIp9A25Yi1E3wLuoo?=
 =?us-ascii?Q?8RKSl7xPF+CoBeQeCddAMEVYQIeGGb9l76CoYA3f2CN9yGWn8M940gemHBUy?=
 =?us-ascii?Q?/dAhIQ1U1GxOgE7xnDRv4PvtksWe2ns07H8y3YhCjwvNtaDkp8Jy+Y/TEkoX?=
 =?us-ascii?Q?lX1xmrmp9YFKs/RxBnn2wMRi/IzkN1Yt2xF5s3u/GzOiOwO9wsdBdfeGONJk?=
 =?us-ascii?Q?85mJ0oqVYqvAUqf1lgfiwevqGq8yyJbOmKv0BkPVJyEJox83sR4LKTV8jxvS?=
 =?us-ascii?Q?AGqvzDJXrFnQntp41VoER3J3VZlBCl+hCIPo7MbJqoUXm5llIUIwqxHavjaX?=
 =?us-ascii?Q?u168f9+tlys3CI7FnmtLTjp1oZxXnQM/qkL40YQTI3WpAygVNrHHg2TjhK2L?=
 =?us-ascii?Q?UstsEF60ZdYaIkSo6Zx/q5SPfpcOi5AmNSfoziqoIxWNfBJlGV+mH0oepYjB?=
 =?us-ascii?Q?v9ttWDUnx9S2ts4Qm2BIkwEfisWAryaH1HKOtkP2txzsjYWNK+I=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wj6Kc8iNA8i1j+qb4aTeICGrEL9wlgDmIXLKOBaxdkMkoMtr8F+fr6WS4h/+?=
 =?us-ascii?Q?GP0EkM0GJyBwoKkz9lV9qVuykbdTEbh9N2A6JLn81TiXuPkpO52St+Zc1HwV?=
 =?us-ascii?Q?cfmQr6eaIq6u5h0TmPf0LnzK23MYrOt4mjIhfCiT42oyTutKFZMidulR/D48?=
 =?us-ascii?Q?zndY88WYqLHn8lMQaiWnFIHeuZxUKQG/d1Ric79npF2Xl89xePsisF9lS9qK?=
 =?us-ascii?Q?Mzj2LqcCiJNC7MH6FsA/Q3VuYVaqRE3s5qDGgYcB6XF4pq+dTMeuZlNGJrtt?=
 =?us-ascii?Q?cpg558W/n9wUHC8ABlCC9RnttvdjtkEzsRWcDbEGYTxrSTLWSA54UTpclzRU?=
 =?us-ascii?Q?Mgox9eSbxn4HdtJdBtY9MrUuuKPF3ldoXJZDkRnkulKeXbLKOKxDyJk0wiKW?=
 =?us-ascii?Q?Tgr42We/yyo/dLSmJZR4PAyALlI7GSgMmyHhbKTo4r/M1MAlscBFSt4Ewf8x?=
 =?us-ascii?Q?nTTkJcze0Tq+EchtkROFmhsiNiK97vf9uox07yFGDKKAR1/7chxOCLufSrsx?=
 =?us-ascii?Q?oQxQmLut7l8jz6Zf+8xM6odxOV962DfNiWR2Ohfj23bT806LmQOfboNxWHvw?=
 =?us-ascii?Q?E1A4uFEyksYwfcWyE8OzLdBmnh5BbsrUu/XQobvk7ytg6KrTSdPx7FsrJ5gI?=
 =?us-ascii?Q?p6/TlZ/Y00PZGkJVUr7mntHf/P6nn3DsdodIcqgLEMbmxBGqEbzF9xMntaEa?=
 =?us-ascii?Q?bpz3J7+Z9/OdsOIUWqwFJMq0baZtj/OUVoK6MJwcuOIb8Y3AI0cXP5XP/Vay?=
 =?us-ascii?Q?vJP3pIUpe04vJcqOnhof9XO4suunc+Ve36Gtme6KXDp3u9KjuddSL28LkT9F?=
 =?us-ascii?Q?Ce2TLF2o3Z1uuTHJDk9RA+7pGnR9DGGPW/WC5senZSs07vGvL5VuKzTxbuTl?=
 =?us-ascii?Q?qR1iVjUvFJXtxkd6+ZKOp0JLTTLQ/IJD7MebMRk/zbZbGypNmpRMS945Pg1f?=
 =?us-ascii?Q?uTLOysiWv+tNKYZ1JxsTeioCZT1xtum/Oe0CVATxQnehd7r0iRB7Vozvasq7?=
 =?us-ascii?Q?bkLaVYkcUzdtkT0rB8TCxgVpw6S63YN6euIGMFuzqys1Z8CszxwFQRSOI5Iw?=
 =?us-ascii?Q?cOVUQck+xCDu0FqyMhUbckKNMs1WjophwLXLVEn75Rm6KyhCtkSCoMEM4y0U?=
 =?us-ascii?Q?aSGLAKeShh6TZCCDr+TMhE+hNd0gPJKNLjznZe3g8MgFQqfvOcwnnuBnoutp?=
 =?us-ascii?Q?1ZQIRZysMaoc+84K/6Ta+31O0SbtICWo7OHeNZrAhbp1I0mWuLyYT/jN++2t?=
 =?us-ascii?Q?u66A9WPv7oxRxDvsIHbNgYTw/rNgbv19fwEknJb8E3+6IDFvNRtsSYwr/85v?=
 =?us-ascii?Q?cFUG0kVi4co2DT6fgBH2LYJFpCU9Hp5oHf2v9ymY3nVxWsLfKEMLN7rg8XkQ?=
 =?us-ascii?Q?cdkqbDe7sfpaOGc8WXhoU8h//LRaoDl1F50k/zupNgY4TUoSDw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05408700-a35c-49a8-5018-08df3f98a36c
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 02:08:13.0026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_180820_520721_4BD6B1BA 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static void ma35d1_adc_trigger_capture(struct iio_poll_func *pf)
> +{
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	struct {
> +		u16 channel;
> +		aligned_s64 timestamp;
> +	} scan = { };
> +	u16 raw;
> +	int ret;
> +
> +	guard(mutex)(&adc->lock);
> +
> +	if (adc->suspended || !adc->scan_chan)
> +		return;
> +
> +	ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &raw);
> +	if (ret)
> +		return;
> +
> +	scan.channel = raw;
> +	iio_push_to_buffers_with_ts(indio_dev, &scan, sizeof(scan), pf->timestamp);
> +}

Do you need 'raw'? Seems like you could read into scan.channel directly:

ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &scan.channel);


> +	num_channels = device_get_child_node_count(dev);
> +	if (!num_channels)
> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
> +
> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
> +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
> +
> +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
> +				sizeof(*channels), GFP_KERNEL);

Couldn't size_add() just be regular +?
(Question to Andy who originally suggested it)
We've just checked that num_channels is small and won't overflow.


