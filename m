Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sJETLyFI;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=rQkcSSDD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxohWvFr8QIIg1OK+RBgJl13wftkEu1KHEV5pxKPKwQ=; b=sJETLyFIjasDbxnX49Ha2t0sDY
	i6om5Mr6lrCBaecslAXc4jranABDr8Kt5cOh+sFI6/3JrOdAoMMn3vOxMZeeJVBzi/PY61jFtYPSe
	41jhbd3k12yIVTlSthaEU6qkTIR89qQfTsN6udy1SUO7DyO4zNuGqwXpRpn5zGa1tsyMUUoDMukHG
	d4qGB1sisx27hDMoQ53zELfN3+fNi3ZjzGCn56DwY8+w7msn9egMmNOZBZRp9cBIkVKtJq5iuf1Fk
	h1s6dUrfTC0+lV+FZBX8cnCTW1upTxt0C3Cit0GHlAX6uTCDTEee2wURwds3I3RAADDkSH91wCk0u
	3ctu1NAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGJD-0000000E1xK-1Jzv;
	Fri, 20 Nov 2026 04:33:11 +0000
Received: from mail-koreacentralazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c40f::5] helo=SEVP216CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGJA-0000000E1wy-1PbT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 04:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBmfVEt0/dU6dioIlYnWtZ/s7dVdW9AGA1vM4vC2a4S3XPLsLQwU0lV0tNxqYXY2xhuuvOA3BmENpnvjwWBnKGt576DkZoLpLJ+ou9TT28AMSQDd0HeLbjXbSPZmqTK2ReHpdJ3LO0D6QfvmuNHslSfuCtBcXqzuBit1RoJhGT1NyeHDd0t4+tDrqJZ7pWhjuJys3Un0Idey0oaa/OkqUuaE7Tc3HOGDJvAA0NJhlDP2arZw+3Geg2vi7KNw9Kdf+zS9gdTwz334MzegY0PMNOv194SKOZ+45TkMvT/CULY+DFCvIRjcO8J21DihasUtPbNDPs8jqyGhgCJmsvOhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxohWvFr8QIIg1OK+RBgJl13wftkEu1KHEV5pxKPKwQ=;
 b=bFLvM7JnkMfNvFp74ke8ucUG80KEiUdcsXvOaTSyMCI8Q0hLdmUxME/iJ56qPvbaf4gi48E7PgmeA/+I2fKiTWKNgVmyGJRJwpwVzOpnTm8mdfiW+VwiNTywxSWRSRc5Agck5ZhM9YJf0Obuisch8GoZrynFL6SsRTeDNhVoscN8yrfOgfqWD7vlEbQN64xkZnv5B4VkBIkWUukNbzdN8bFNoh5VrKPvh2sLqWyY64Wjvq5CwqMVGTGUpViTPRj1WskL+L9vksEN8Y1lltuPgKcK0KPjwXLJ95caNS0+sEXTB7p4L/vVzur5qZVlFCGnp3qFBvqGOd1PCmSos7xFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxohWvFr8QIIg1OK+RBgJl13wftkEu1KHEV5pxKPKwQ=;
 b=rQkcSSDDCqDYqnWIfUnenTY/ClBMDHJqeEppNGp0fzHtj89M9rEgQQsyTzc2ht+6ClrIG20BydM2qq/IO5B0bsiqE4kVeOHQ61l5GHtGf6tl/CmvvhKPhu1xZKFmKk2rTmtQwFGLoixXde/r8aLvt4Xw+znbBGlZvs3RlgWZXUJmUiywksssYx7Wuy2Y5tpAYXefvs/1rExb4qabpN9HDPMiy1YlLN1KL7PdadsvuZCMjx15+bpvJWHSbQtHPXIU7czOiz1QUbEoxxWUWy159yMSgsoOIrOpdgVb0Gp8YkkNpzNJAcE9iTXol9FqJc+rQk3I1MITvTKFBIfcsvtVfg==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE5P216MB3149.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 04:32:59 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 04:32:59 +0000
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
Subject: RE: [PATCH v8 11/11] arm64: dts: freescale: imx95: Add video codec
 node
Thread-Topic: [PATCH v8 11/11] arm64: dts: freescale: imx95: Add video codec
 node
Thread-Index: AQHdeARuPeGvtxX9ZUmAYJ5CJm8ueLc140UAgAB9AUA=
Date: Fri, 20 Nov 2026 04:32:58 +0000
Message-ID: <SL2P216MB24410951EE38383CF9200468FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <e89f330486c8b986088278b563d0c4364d35f19b.1795075582.git.nas.chung@chipsnmedia.com>
 <av9kgix0B4irkC1h@SMW015318>
In-Reply-To: <av9kgix0B4irkC1h@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE5P216MB3149:EE_
x-ms-office365-filtering-correlation-id: 843e6d10-2399-44ee-090f-08df46bf5b09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|261026121527099003|261021135927099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261028144727099003|261102123227099003|38070700021|56012099006|4143699003|10067099003|18002099003|22082099003|261009223027099003;
x-microsoft-antispam-message-info: jPt91azLuPrp7w8qg/Qc8dU5yLe3x1cUWWGauV06u7NJefgDFppHv7OdSBxK7WYW2f7XMckH2JZoO2LeuaQkuOzZbQ6Y7i/imz2Nixx03PqKi+ICPKCXNXaf/Wxs1t0bfh+IsbJpJ/u7Kl5mKMDuj85QAFPb838NT6s58mPlXtbHJy8Te2WbHv4ElWWpWwtPpxZRP97Hpw+xWNZdyRdHkX5AFvyiL49PeVRwRWcSgxKBSgEFL4O96AEiv9H6MSTU7p8FnLINON24xWepa8Lxb539EmtaH490ueB/yIl/j9lPF5lX7I6k/pn41p74xMMHIhKhWOSUQ1yWO4TNhwB+vA9ZLlbQeqRChw1JBwd5CGS19fTcVYmSLK42Hyzylh4nLTmJm9xi2jfJWWLAbxU1wVIhLK4gBKYLdGM1quWJzqR6EvHKl0/h2OuOvj+d8I7JreH5/FKFgIV2aInfjHCM2waEjy2wpm8PYK5bj0gDiz0EJGIMBo18UeOZqfw1o0sYeejJuHMKM79VFEEOZkZD+dEsL1hkcsMjiy5LBEzpMJ3GpBmNxZkT9jUaCRkqFw7FDUMLBQzEW/skRJ3bcwtUlx/bGzmkwmZht4FToJkTmdoec9zpPwn3RkwMxqNfV+uKgbsDNIVvQmVn1BsYDXqHqepzVfaCn6Az3s7WISL/3WZsnbFprJsg+gc2A9ZMO4uECKnOEOgfIbVu9kTNEN2AdthDJ8Dqvbuvajv++sa6f8Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(261026121527099003)(261021135927099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261028144727099003)(261102123227099003)(38070700021)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s++36Q5wXWNc0oDHIcesyrvZusLkHrfBgEbtbjmalqnJ8+3eY9a/vU3EvZKS?=
 =?us-ascii?Q?TB8+9iZiNmUsJ+HodoCnTFfM5LryBxVOUIamoA9oPiKIQuHJN3TpXAa3Q3R/?=
 =?us-ascii?Q?O78J35oKNKEH8DVx3n/2q2QZ/ypKAkDSJlf7pXazHzFupW+OjKbUR6k8rVQZ?=
 =?us-ascii?Q?+CGuQ14aR7hf2T+p8t4x/bEoeKYwn1v1EbfVTIWgHnoc2zxaVRkeVl/6I4ea?=
 =?us-ascii?Q?oU//o5oQJHw2xUCrnNrbuPwyJpVhfX1jPijVtVA3Q/5Jqv5uJ0yl/9HKHgE9?=
 =?us-ascii?Q?yRoITW70BEF4nV4RXfAY7B0u6ZT2Ka9MkUgeu6Gf0ZqHTMVUGXJ6a29+fe5N?=
 =?us-ascii?Q?IFLZXzuxnoEN5LoIhCP7BwyXjhQ0QKDqsLjKyslKegznjOx6ZIRmlhFbt1kt?=
 =?us-ascii?Q?gttq8Fu6A8NB+HQ7iY4UYzT/DXTn1jTKeGVcABfFC2TLbxGQ+Hf26sfSdMJ4?=
 =?us-ascii?Q?D4xZrVStIC1A+ADq8g0ULgPQidYK/wZ24preE9U93qYuI+Tx4h1SPwXf6t8I?=
 =?us-ascii?Q?aLclzzllJmTBW5Be1gpvHTCWsCx4WDmyqRKCPF1YZl/w+rVh5TZ+oCjeSTVG?=
 =?us-ascii?Q?ZHC+H9k/13y5KnB5WKsZ3ZH6BjKIPGMOcftRh/nibLBEQRefpi6QvaIdYunt?=
 =?us-ascii?Q?7J931eVduf6LsON2HPpH82UQwHoWmVkBB2DRLP+vwQirj+suvWhoeeWd+7RQ?=
 =?us-ascii?Q?QfKRfGwxbV3MjFsg7gOZICY6rZHRiSpOkmL7wGrgGx6drnMUILZ4zLgr2VXz?=
 =?us-ascii?Q?V4QtTXTzLEFFPp/JMiwsJYPgEy29gvQA6XTtwJRHsT5GDAdJYiezE7xYS7BA?=
 =?us-ascii?Q?SFxKi7mFJxN6hTTbnFri9uhc0r6vjoml8mHuWpBrm/oG19Y5jaG1RVX/t9nR?=
 =?us-ascii?Q?C+i4c9oTNQnQhJ0+JDKvxK4ka3vOnj+8jun88PthNUhM5dToOlpMB5tXbLd0?=
 =?us-ascii?Q?RV1r0ekJlJMEo/2I7v0E92jIa9MttORBDr1zJzQQA/EvkDg3/WpRB2DnWjsC?=
 =?us-ascii?Q?wf6Eb7seEYrQKC6aPSDANlt9EfxMi4OSfsirCSgQxx0AoaRwqvDkvcA35J/u?=
 =?us-ascii?Q?QIL/gUDyntP5+wxG1b6Nk3401jeOwFXJYfqRglZpXOewir4vm3fGYYi3m2IB?=
 =?us-ascii?Q?BCfdw/pOhJLT5waOBqpB+9rytE+dstDJ5loZ6yL98uvfLMNC57msmVyW2/AG?=
 =?us-ascii?Q?xTe73TNiXrVMRfZVPGfZBjMD2KLtL97jAYgHmx0GOBptxe/bgLpsb8lI0kNa?=
 =?us-ascii?Q?owtqZZXNygUU6wECGOwYgGlXoYrDTv73fptGm7SHPhobw0a5cpE9wQuDt8bo?=
 =?us-ascii?Q?5EBbQAVUICyZV0vVnRCQRDexEtZDXAyoL1nWmT2BhYNtLYwTCxQaOTHsAPYm?=
 =?us-ascii?Q?lrdNEBoC4E0pQoejoAEnOxBuaD3B0nWIZoMM2Ak052BTmmzI0ljr0vcHBFwt?=
 =?us-ascii?Q?t3FkNe967l8GUPcaICKdwQaLxngz1aAYhdf/ExQim5VluksuIEUtykWDOtk3?=
 =?us-ascii?Q?a9QS+50N4xmh7L20VpyaykYmKer69IUCn5YzbwRe7Ue2Crc2JJ9LqP5vvu9t?=
 =?us-ascii?Q?/eGdxdWPO9D434mRbvhy7YxP1c+sG8CigSFOqDY94WJlAN8wqkqtR+cpRE7z?=
 =?us-ascii?Q?e6lwDh+GInMIqZUlerneeURdxL8dXH2SwHItBeyLM3Nj6RDNnksIFfT2aIJ4?=
 =?us-ascii?Q?mV4qHMBtg6Wg0mnTbaXErwcVB8cUda1cGsr4Md2BbNNMxryG5luBp0rd94go?=
 =?us-ascii?Q?8Rogg8gPSg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 843e6d10-2399-44ee-090f-08df46bf5b09
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 04:32:58.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5AB3l9Lf1fsrDYhfdFvqPCiMyhGCSPk7/HLa+dyjvaMez6DrnL0FByg6tllKwnTzgOmt6Z4m3jNFeyjLqz1jiE/T0WKoEtMjrebqprGcANQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_203308_688546_165A0261 
X-CRM114-Status: GOOD (  11.25  )
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
>Sent: Friday, November 20, 2026 6:05 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 11/11] arm64: dts: freescale: imx95: Add video code=
c
>node
>
>On Thu, Nov 19, 2026 at 06:00:05PM +0900, Nas Chung wrote:
>> Add the Chips and Media wave633 video codec node on IMX95 SoCs.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++
>>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 37 +++++++++++++++++++
>
>Please split two patch, one patch touch soc dtsi, the another touch board.

OK.

Thanks.
Nas.

>
>Frank
>
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> index 47ed0ef67611..a15d5b471708 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> @@ -143,6 +143,11 @@ vdev0buffer: vdev0buffer@88020000 {
>>  			reg =3D <0 0x88020000 0 0x100000>;
>>  			no-map;
>>  		};
>> +
>> +		vpu_boot: memory@a0000000 {
>> +			reg =3D <0 0xa0000000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>
>>  	flexcan1_phy: can-phy0 {
>> @@ -1225,3 +1230,8 @@ &tpm6 {
>>  	pinctrl-0 =3D <&pinctrl_tpm6>;
>>  	status =3D "okay";
>>  };
>> +
>> +&vpu {
>> +	memory-region =3D <&vpu_boot>;
>> +	status =3D "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi
>b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index d20c2498b9aa..b6323e527ab7 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -2139,6 +2139,43 @@ vpu_blk_ctrl: clock-controller@4c410000 {
>>  			assigned-clock-rates =3D <133333333>, <667000000>,
><500000000>;
>>  		};
>>
>> +		vpu: video-codec@4c4c0000 {
>> +			compatible =3D "nxp,imx95-vpu";
>> +			reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>> +			clocks =3D <&scmi_clk IMX95_CLK_VPU>,
>> +				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +			clock-names =3D "core", "vpublk";
>> +			power-domains =3D <&scmi_devpd IMX95_PD_VPU>,
>> +					<&scmi_perf IMX95_PERF_VPU>;
>> +			power-domain-names =3D "vpu", "perf";
>> +			sram =3D <&sram1>;
>> +			#cooling-cells =3D <2>;
>> +			#address-cells =3D <2>;
>> +			#size-cells =3D <2>;
>> +			ranges;
>> +			status =3D "disabled";
>> +
>> +			interface@4c480000 {
>> +				reg =3D <0x0 0x4c480000 0x0 0x10000>;
>> +				interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> +
>> +			interface@4c490000 {
>> +				reg =3D <0x0 0x4c490000 0x0 0x10000>;
>> +				interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> +
>> +			interface@4c4a0000 {
>> +				reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
>> +				interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> +
>> +			interface@4c4b0000 {
>> +				reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
>> +				interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> +		};
>> +
>>  		jpegdec: jpegdec@4c500000 {
>>  			compatible =3D "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
>>  			reg =3D <0x0 0x4C500000 0x0 0x00050000>;
>> --
>> 2.41.0.windows.3
>>
>>

