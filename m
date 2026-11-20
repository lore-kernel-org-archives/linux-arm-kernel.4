Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AA606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rfuovgUa;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=caISTFJ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YmaM25r+8C+J37WvP0GM+EhWHpMzbHlS12Y+Zb4EwcI=; b=rfuovgUaJ5q9q9likvCHWtW9pI
	D3+tMAQ2ACqiRjGfxqXt895DUFI84IDfpKhHXN4YWEy2KwOJO4AyEJ5Yj2jaLFrkgdZPbaB98Jx5Z
	hkBlfqXUN+5uJ8NKcxCQlip3fFNxACIfSftI1BwGytrj5TeuX/vWDy4ydb5aNGZ2vhgXUS5AF+vuT
	fD6kv6aMFDpdBzApL34v3hCq1W6GDUH1zqkNbp7/Mlv1WKxyPxc0IK4m1mSS/106rlvUFydZLBY7s
	G0+mLjUT8d89Jx2fP6sBRiUBDGowl+GddjOL/yERo9sz59Pbdrr81rRb8M2TDBUb6nWMDioVtNJNW
	YaH5Weyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGKm-0000000E25F-2i1I;
	Fri, 20 Nov 2026 04:34:48 +0000
Received: from mail-koreacentralazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c40f::1] helo=SLXP216CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGKj-0000000E244-1FBR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 04:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5PQgazYdN9Q245n6jlc31W16RStMcpWV86+rR5vCKTdNNMQRMWkKk5GncFDATd0sbAzU0splcWerpF24Jw3VRisjC42IEqYaujYWV8aHsKWP+1bxaAYcecfBVdqx4ND5IgloX90BIO7p7ZusBjLIwUni27hzkIC6p1xSPmOBLOxMhqpHYbuBmlVKe/4b6tpBCyCputu8tg7RbHRY4/NKtmLU5ISkYrdADTfZeQ5mx9uIIb9kYlNe3585XuM0pE77GTwmqWUHLrDhDJRgsx08B+8Tir1FuvUSYkEMY2/ytcsqu/nTwmQW6X3WjZIU82SvVHhfj1Z7r8vBQHgWTxLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmaM25r+8C+J37WvP0GM+EhWHpMzbHlS12Y+Zb4EwcI=;
 b=XFt/4V3Nldhijf+EvjYH7wG4S9XMTgHk5vByGlX5RrDFU2xzpd0eKWte/PWlNtAS2in/hi4GZK8zX0jEA5uxKt9VsBLLcmeJPxW80V7dwBhj7Pr7S0dlxu4S1kKJRk+0JDgv1D8bkvy+Bc1tvgGsUCKoAz1vidieARqw6HSpHsnBWcHm6WyAHd77nuWmE17j3I1/eyDVChr9fzyZkjFzKtA72UHuvT7H+EhrTn3b6pEfodA84pUJRyyRqPcfFRR+b8HxhS1WmOZ/eDqOglVrICtHfO85G2wzM3dPuq+K3WXtGsA6Q3cwHnBSSQfPv6pP7bO9d1waH77jWV2dN7SFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmaM25r+8C+J37WvP0GM+EhWHpMzbHlS12Y+Zb4EwcI=;
 b=caISTFJ3m7mzY3geaN3sEQJ7RK+23/wkr9F+rhTa29MwXacZRKJVVHuyrn71FXHXx/ejYE3TIo8mQdF1fs/t0Q2W1wY/co+ipbnobblRcGom78c5SQI+e99/cZsx/qnkPgOdl7hf6AClCkdeW4nehsGFCvyf17EEm7ZuK43uuphqObeEk7QEnm/+nT3JDu+LZYhy9GFBmBt5iwWFwiXYOdIP46sOAi1r8f79B8WbEXrAqUbqGrVy8KRHZxn1D3IKhCAzAXD+n299ljTBEk0WiguWx9ZQB0P+0ltZsE77lxIr5C38AUkaciXUMrgEbWlbGw020YpuIGjpS8yAcJB4Zw==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE5P216MB3149.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 04:34:38 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 04:34:38 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@kernel.org"
	<hverkuil@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com"
	<festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>, "marek.vasut@mailbox.org"
	<marek.vasut@mailbox.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v8 10/11] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Thread-Topic: [PATCH v8 10/11] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Thread-Index: AQHdeARtlVZt/dvDTk+1cGJg7YekHrc14tIAgAB9rZA=
Date: Fri, 20 Nov 2026 04:34:38 +0000
Message-ID: <SL2P216MB24418B9F81DE8CF8D69A107CFB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <d973e48036b43e9f1e5fc254153303a4c21deebb.1795075582.git.nas.chung@chipsnmedia.com>
 <av9kIkW6rYeUGFBE@SMW015318>
In-Reply-To: <av9kIkW6rYeUGFBE@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE5P216MB3149:EE_
x-ms-office365-filtering-correlation-id: 0da8e5d1-2ab2-4206-3c9c-08df46bf962e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|261026121527099003|261021135927099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261028144727099003|261102123227099003|38070700021|5023799004|56012099006|4143699003|10067099003|18002099003|22082099003|261009223027099003;
x-microsoft-antispam-message-info: yA3vXVtW9k/pA5yQsvVTkp5bhuwiKz9e9MNZ+/Gceh3mg4wp6nL5txm1ZUv0E31B5dfwQd7bQXWtmAL7LbJ/mGuqAd5eFAeifKlfyijLIIoi+lp/jyidA/NwktB/aD+WPGJmDLCKS4mr80DPYhQ1aPVRf12K6XrZe045YQOGZyN+ZWy6a9Fw2qGMXxaOzDogM5+cT9ixj8eEDJVCHL4uQFVxivpfa3Nm4EfrU2Vc8fQ8VmxqHEl2VOa4PNkl3FpLaowSFVWukkHReukSD6ZzoFBKxggTd6gDW4XtDHob5OZ6/3RoqN0JR8x73te29D2Mtdj+8YrqJFOdaym0TSWHuPz8bAX76ZCAv8esL0qEQExX9Kk4OHnYQT+90VMOgmv9BW5Z3tpR8SMgf0F0Jnlq8MVNobdeGy6YZcIPF8XNduPO6Plnd4gOoLW8MlkRUSB5jZDIonkr995L9RRYpTG5kv2maWsHS2Vk2KgH0dX+4R+k1OEb0duocxYmXDdmoLb+svhKdNKZlI62fdrsZ9//YlEI11bB8SGiQK6FH0cB2vGkiCy2hjfzymtytCrx/D1pB4oX4TrYvnykM3gs3qndxnt0PrYAnmq3tR8hVYDUdFxWEDfjO1YkWhJ60cb2/b1vC0e5MJAnhH8BO3nvkD9KxluSmIt2S5B9pv/8CiKIILvzW94xldHgktMJPtOFsGRhK06MfxBziN5VWHp6X7SJho4BtShtxO60gu/3Qott3Vw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(261026121527099003)(261021135927099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261028144727099003)(261102123227099003)(38070700021)(5023799004)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F9pAuNMX2Z+yIJ7ueumtei55OUGZ3rcB7ihRxHfM++DvrMO+5LPVki9ipq9f?=
 =?us-ascii?Q?pJG4DzxL7LRAt7HvOi8/UnB2waCiNmAe4/f9lAkaFF87ADWIRP5OON369bZu?=
 =?us-ascii?Q?ifTV0YplYs8Bq8poin8pC5dS6xoNacgWp3cG8iTnctK4R4R+tfX8g0mUCLeh?=
 =?us-ascii?Q?wQS4pnxAUhGZEOT+Jo0+9qRRxgDjoFknxStY5u+iud5T5bTN2Bw2DnMBJIA+?=
 =?us-ascii?Q?T22l9EKOSQBYrPVvjH5VQK6iQkns3tjPDVtElF+C9R6VFI5w8gg3DTNMp50S?=
 =?us-ascii?Q?B+xNUdu21vjKx7KbbmIl8zitd7J+5yHXH5rVe9qmX+DRFv4+4W7E9u3WQKr3?=
 =?us-ascii?Q?m7lmJLdeRCCE7o36pYBl7m4Ayw0nFyBo5GKgFsVJ6oMEsDdFe4UwrahHGf7V?=
 =?us-ascii?Q?mCTf/oFF1/teR+1owGjA5Eqiolfi6DM/HY4jQDGQ6/M8sXDXfty2Ia7LPA27?=
 =?us-ascii?Q?EqMWJtarbVsDFN+pWPJxkwMXxomtLrc4jp6C/dC1AA78dC0r8qKJZklk9+YR?=
 =?us-ascii?Q?dvG7bTykAtx4aX1YFtdlbYuM6M3qfnW/l9L60Hl2/XbEfjqnDXNNgi+6zd6Y?=
 =?us-ascii?Q?d1GezdnFPKxeKIw53vX7Zj1KFSGAQFcX2bsEoNC65X9SoxP8ZSohDqnqiJHu?=
 =?us-ascii?Q?mu8AhfljiEZ3dQnntnQiMiKD/MKmoPBqWA2luoPxZaJMXo7yBFmKUAmrMKC6?=
 =?us-ascii?Q?90PmAe39rZhPNj5j1/HoHH/FIlFxhs13lOaFWlhi0P2ltp18agE8gpIuUaFD?=
 =?us-ascii?Q?86+TQARgP11QmQ8psQbL66DWzoOoG71F/7wvjPpbys3zEx0R9Fn8/XLVRdmO?=
 =?us-ascii?Q?+cFZrE+h3NRtD2HzoqL5x0noCTDy9PLeQ4oVzfrQJ3miLZZAccZEXB6sg7AA?=
 =?us-ascii?Q?8WHE87TaULyI+XFYCyYdyiIcpUEz6dqj9ZOS5n976lColcG7ZQwT02FUbbyn?=
 =?us-ascii?Q?HCgRhiXtk1jdJ4ulS59B0/MRuAZXooW8J6Fi8moZHdFdgwt053A9JGo3sTLO?=
 =?us-ascii?Q?s+fFhj6L7UWm/HiIz/GUS4jmFyxKIAa6rQkeLlRwtCnV7YnfUFBkSJfF7Ajj?=
 =?us-ascii?Q?vNIFnBCLkVAFK37CdqPXtLzsDOoq7V30dqZ6sV88wHQRAYuBdYAL7+BbqJ/Z?=
 =?us-ascii?Q?dFOk1ad3VqOY3bhPo7Zite/3PPwxXNJDkuyZh7JwB9hsFZQrIl3jXPkxPc6v?=
 =?us-ascii?Q?E/8Kpo04FsRCW/u55XqDKCM9ctG/ssyAxZMlPceQVttNwMbez17NnUYwoGM+?=
 =?us-ascii?Q?Aj3C8xm9i+YU8kWarYOBoNqaQ4u9wd4A4mHUtenPgnI/IFN/BBuMJrPcZg+e?=
 =?us-ascii?Q?EDEBR9rCBKIOWuIk+qUHtWJvxtfrYGvqgVuo6m6Gu1cn3N+hsQYrH8JadMD9?=
 =?us-ascii?Q?64F42htHDbi2zhOr/VmaDsmhNI9/fZazHdG7qmfe6gbcCebPmfYpnjFwCgje?=
 =?us-ascii?Q?Zaxy8BC5OatC39lyIX54nQaRfl6kpTPJaGfqXuxoSSJuSFiDuiSKzRGb7m/S?=
 =?us-ascii?Q?9wnvZfr9H9SYQNvTRLj8VCkzVw40ZCBRjzfrz0evBqeShZIUfkF6PrUGlTsb?=
 =?us-ascii?Q?5I9mc/iq8swjsKL6lwckhQcGsvPIG/c0QagG4Q0uhOzNdiuV/PX0h/pz7BoF?=
 =?us-ascii?Q?c8ipEkeotlQ1YvAqzSY3+hVK7DrlpXMYlq6qnOM4jaVKL+r2KMmMvgkZWG+l?=
 =?us-ascii?Q?UpvjIUbQYFPKQnZBExzxaa+3PZRIb0bJLzrz1tn5LMiepgZPh8r9wglJKq+a?=
 =?us-ascii?Q?gDJ1DXivgg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da8e5d1-2ab2-4206-3c9c-08df46bf962e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 04:34:38.1488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biRVmxMEp8Y5qwEtVdPGEd6bHiKacGOhXesYg8EauAmyPrBq/8QK+FYU7EXnke6W9PGwbmqGjKk2dh6w0V+BLy5TVxQCJYJjJzwUnUBRUrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_203445_342532_06DDFB11 
X-CRM114-Status: GOOD (  13.91  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, November 20, 2026 6:04 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 10/11] media: chips-media: wave6: Add Wave6 thermal
>cooling device
>
>On Thu, Nov 19, 2026 at 06:00:04PM +0900, Nas Chung wrote:
>> Add a thermal cooling device for the Wave6 VPU, so the thermal
>> framework can lower the VPU performance state when the SoC gets hot.
>>
>> The control driver registers the cooling device on its device tree
>> node. The cooling states are built from the OPP table of the "perf"
>> power domain.
>>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../media/platform/chips-media/wave6/Makefile |   1 +
>>  .../chips-media/wave6/wave6-vpu-thermal.c     | 141 ++++++++++++++++++
>>  .../chips-media/wave6/wave6-vpu-thermal.h     |  24 +++
>>  .../platform/chips-media/wave6/wave6-vpu.c    |  22 +++
>>  .../platform/chips-media/wave6/wave6-vpu.h    |   3 +
>>  5 files changed, 191 insertions(+)
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>thermal.c
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>thermal.h
>...
>> +
>> +	if (!thermal->thermal_max)
>> +		goto error;
>
>nothing clean up at error label, just return ret

Agreed.

>
>> +
>> +	thermal->thermal_event =3D 0;
>> +	thermal->cooling =3D devm_thermal_of_child_cooling_device_register(dev=
,
>> +									 dev->of_node,
>> +
>dev_name(thermal->dev),
>> +									 thermal,
>> +
>&wave6_cooling_ops);
>> +	if (IS_ERR(thermal->cooling)) {
>> +		dev_err(thermal->dev, "register cooling device failed\n");
>> +		ret =3D PTR_ERR(thermal->cooling);
>> +		goto error;
>
>return dev_err_probe()

I'll address this in v9.

Thanks.
Nas.

>
>Frank

