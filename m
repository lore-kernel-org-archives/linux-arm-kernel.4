Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D106C606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ug807GeV;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=cPOqurhc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=54gzJ0f1Iu4WoekbXINpvny2QXOKLI+uMBBubYVfK/s=; b=ug807GeVf4rmFRRREJN7dU1My+
	yibdOXR8Pw7Fl38EMyz/pMMkHW3IwNK7VMLExK7bt31zkCmHLMOohpvPFC8sV4CEDnC2PkLCn0ipO
	HyMuuU6N/fucKtb21ISyjJqYY42gzDABV85xmDtx8/KioY96IbYA4Oi7mZGYUoT+KfepjmJbWHA0O
	/Atuyg1TUAqrbdAbVCB/m0zsouwFj/OnaZPOI0YW3errxmodEuiEpqmx0MTu6x6mnBI1Q52LsEBbe
	cRRY6F8was7J+LVmk/HEXUJW28n73/pHkvs82GomK9x2xR0dc7SSWMMI/gh5Bpwia9uC3x5PIaxRE
	h8ACIBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKRn-0000000EPMT-258b;
	Fri, 20 Nov 2026 08:58:19 +0000
Received: from mail-koreasouthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c410::1] helo=PUWP216CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKRg-0000000EPLg-1K7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEcMc8Eth2MHp6r625Q304fbVokCa5n56OJdU1EEGw9AOJNciWzMebwQiG5TPUfNtNErOzeNEjkcpdCQ6SLGnaL6zNKQ3toug+p6CEIC7F2zeB4MutMihtzdPM697Qc+wXpNZGczwRnIh9AgcYeSiAKmtWpMfWUgsvh5RnaXiswGEJp81FH16VekLm+7c4ZbBtxuDGibkpKsGr/xc3aeiS5XlakvWzwxkCjqvPkibPl0gu/i3d+nOB95TdFtuCodT+LErEB7M/iVJhrWafQjCFPe4xbB2yicE3khSvtRSZBkM14/QGjhSeWjapUpgsRLEGluGJm+PNpnxa7XcuwLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54gzJ0f1Iu4WoekbXINpvny2QXOKLI+uMBBubYVfK/s=;
 b=juBic4/Lqt4s3+hddY7dRp/UpFonN2rb+FBGoxwUZdQyobdDw6FAbg16KoMYARCM29MxE0wjSP+drLC+P34FGY5IHuTlqWOMZ42q9M247+QqrxNxMCZCEp2np6O3cI0tyDkCoBpx9Y4HCc/f7EVn8ShV0iwGMXrnppWbswPukSnWqBMu6dK2vXltN4MutXuE3Gn93fpwTu2wdPPxe6dc34BwLgmQ9/ZFkCL3RNeMVZpdwIx231lHJFL529Bh0N3suAsKp87rD/enr52e/lyyng0W6Fu1DbfhPDqE6s0d+ZnCRW+m0Lj17OA1xCDZm7E9kh7314a39Hook3Gj9Ay7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54gzJ0f1Iu4WoekbXINpvny2QXOKLI+uMBBubYVfK/s=;
 b=cPOqurhcErhHL4ZbitrGSOjBx7adUtgYsyU1dQT1N9trZdimvWI0Kv9eDI/STsSYloqjLVOXLB5K60HdfNq6p76VYYeILHm8QmCTO/1POXppdBXLFTLkrIyziHKy0lepWDrOe2lOFtPlzyIB53YvGdiorR03ZnT0f2G+f4ZH49ZWqNVVICAoUyJ3uyyL4c8kSqZb/qHA7P/rspf2UHjc4eGguoDcZ6nOzpvsF4m68FnF/DZXqUGz8T9DvehL+dmA75w2hWZjKIwDqLXnNxlzV0xHMkx9yb0FZwMP2z4pBN9r/1w6S4jkaDvYB+l+5WELFGw1pzc7ouBDCsUsYZFDYg==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:58:07 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:58:07 +0000
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
Subject: RE: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHdeARozyfnwPkovUOydj9BJXEYp7c100uAgADWJ1A=
Date: Fri, 20 Nov 2026 08:58:07 +0000
Message-ID: <SL2P216MB2441AAC89D661DE574918603FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
 <av9XG97eKQ1gZCFb@SMW015318>
In-Reply-To: <av9XG97eKQ1gZCFb@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUUP216MB3514:EE_
x-ms-office365-filtering-correlation-id: a97609cf-aa2f-4a82-9457-08df46e4652a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|38070700021|5023799004|4143699003|56012099006|261022105027099003|261022075727099003|261021135927099003|261102123227099003|261021123027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|18002099003|22082099003;
x-microsoft-antispam-message-info: HMRPoZ83eBHGgLuRcKucja51kxULVkeLfbQYYOnxofiB47vKTiQZ3iYXqsgRVSUcP0PhrxbnjLX6WscpPxbxsBL07LOByN7fE2EQWIs6qHsKbbt+Stoh4U8Okv/aoeXaHDjS0fzGYZKbC8H5sUc2BYrBn8rZTgsBndRpxYTi9ewH0qNZjsVG9JgjG6Oz2CO1Wru/AK1/+xgWmeHro+242hyTPOjxSeTxsXlZeFbemwXeFDIpU3xlMluOEITwLq04x+mae7/f2MsPNW2IMkV5rqCb/xURNH+HBmidIhJ3+sNvn+GvoV9BNFXk7jTusW3+Sd345ee0iI0/f5FOLrvWX4ux2c4qZildiPUPPuauzHg7XHItKPPyuDX5dTrFRXPayrcYvEib6Gv+5fxGYbwaxnJkt8GatQdl6/XrPmmdZ3lxeVd7/qOFJkRnN3FtL0rEKqZ7DJo3RD66MtDgHnY0VNkbwhbx8q3PMpMUp0cvyts7bkQY3qMITqT9JSw+KreP7e/ypGKxFg5m7T8Pqns+2sXw01UoyYV9A+GhEoq3zorGo7Jve/n7VpS4HEH2a4Hjy0W9qS6KfjT2zCws1RiEB9xFj7H7YUrNiDoYP3s48aYiwLtVrgjUYkKKl+hljmJJnfg5lBUyxOu9uLhNbEzp4jkWFCGYJ3yw5jSx3KyPRrYwGxfAxr+ISSCNS/zvcRVR24Ekokumk3gExu6V3ZDdldxXrH9DdMEGS2jSWycA00E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(38070700021)(5023799004)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021135927099003)(261102123227099003)(261021123027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fpW7lhhbdCvIkYFE39b7FUFte+YXlfYPwjhkYP/ygYptVYeG99EYxkd02gby?=
 =?us-ascii?Q?+6eFkj++mTHCluJ9aFsbvSyJjFjo3xyOxsP7ygtQVsbS0ifqiSgvBmlU5Wfz?=
 =?us-ascii?Q?e8c2VGMwnCVmdYjxY/Z+frn9qS4Oz3DQDuIF8Vq2tspM3KoYr/uZ6gileKSD?=
 =?us-ascii?Q?+qtqxIms5xiKnR2k4SR5a41xUue6xH/Rskhnas/X6xJ3k/q51bXxGkOTjuXn?=
 =?us-ascii?Q?v78Etq/hLl9lDZCdOdUTc6bwQf1cHefSSWnNdXLvLNzmGC3WyURaCyS2xpDa?=
 =?us-ascii?Q?FjHe0OG2KkONGtP3U0LsUn3rlfKC7QL3lY3w/bQDJp1U8QB53eNZmintK6FG?=
 =?us-ascii?Q?w88o1lrayYsFhCg58+GGhbvZHC1plwIGt3tNfb3yIupgqV34MQv4G0PI5D/C?=
 =?us-ascii?Q?TQmT+bZQ7l86IOxD2dtCYgmOalCcHEoZWLQspHLknlwno9l3OIg/hRX+tc/w?=
 =?us-ascii?Q?BMK+OOuVk+yf2aQH2r47UjWy5bT6TG0aJlMBDtRpkXRvF84BgdRhodoFe0s0?=
 =?us-ascii?Q?YKhRtI+j1qpil/DTQ2UHs/arghQsi1/co5NAH+9BLzQDUXCc28fzX2fJwdWu?=
 =?us-ascii?Q?39nZlvSQqIKhQSyAhFSQpb0Kqqz4r7Aem1gWSiOuKNg+hqCDrTMf2sYPKiGf?=
 =?us-ascii?Q?tKsWjrsTkHIo+ST/mWSXpH+OSoHGbRG1XMNEh8QX6Wo8yeK6EGpNdrCmBSpp?=
 =?us-ascii?Q?IPRNOv9xLVFXVSZjciXgU57tm/Kg1jhHSRibdBSnetYl0jcK33stvPQKW9yk?=
 =?us-ascii?Q?uoF6hOjSITFap+UxiI4Aa3dfipze56DGbIGtXNTIbgYs7HsK8Q3qZWqX1WU8?=
 =?us-ascii?Q?YPwliDo8P+oV+02lG6cCpGo6zmmXg9uh07hOHFzLEUNEROiqLRojwhrhUkE7?=
 =?us-ascii?Q?dTvQ+Vb5RVBjZ4HIcr/e3vzgIx1suZeIJyYcAtGuWtxgWfg+OQMTngYU9a66?=
 =?us-ascii?Q?xj8q+P5icZjn3k+KDTuvWqSmGhJlcGv0weWE7xfCWFW2eyMgKuFhkRX2r894?=
 =?us-ascii?Q?x7LK/oDkh+DJhZ/67riT6V8RzeMkJBkOICtBUk68iIyODEGSUKZOV6F7uZBF?=
 =?us-ascii?Q?0X01/9VgtLJzML/zBUNmWy+8+qQgLhBBkzi2BvNURdQhWTpUB4UvRv8pdlyu?=
 =?us-ascii?Q?AKGkoQJAW6brJsX589NxU+MOF3O6PthZuONW2VP6nob+g2rou95zv8yr3KWT?=
 =?us-ascii?Q?1cNW+5pNyh8m/9OocB9Hro5UFuFtHZ15S865JolL0jIRSuXzK6cGL5MFgjby?=
 =?us-ascii?Q?g9oNUK6WqrVP5cAUGE484QTr+78StksWYonIw+YNwUMpmyLUmWR4ZtzNJZaC?=
 =?us-ascii?Q?o+qm2hVR0JJf7XejsShE/RiES5U4xAaKOO3SOrJHiyM7pZ5uGTlW+PFzuIOU?=
 =?us-ascii?Q?hwdZmqtJbnhSdqojpzjfq75XsYAhsT/Eld4zaRO86zZtKtCTrtdSCCBQi/sj?=
 =?us-ascii?Q?skGhlBQYc8mg9kMDey7kjJ8QXgHSY1xfSCeqiwnjy0kpQbbAG50m3RCyTgdE?=
 =?us-ascii?Q?quvNlnv/nSTD+zAgw6+NFBbvq1qMvThV56Clupx3KLQYTJ/0DZq7rj2HDDFx?=
 =?us-ascii?Q?BX1zourBR2hR6FjlC7pZory1hQZTWjnp0kKtLQ1LBjeRZDYH+RVh1rRbq/PK?=
 =?us-ascii?Q?t7qh6dhDd07DTKbELUOzsf/YMvfXIagSLsxZq6jtye5VTZ3saRdQdaS+rdsv?=
 =?us-ascii?Q?xyuaJxI2aXN65TMl7x2a+3Uo3ncP8DfpmMYzLRV6oEb95PYlgIocfrokyU8z?=
 =?us-ascii?Q?XXz3YlK6BQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a97609cf-aa2f-4a82-9457-08df46e4652a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:58:07.2756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oi+eaebIgb6nWBUnZsqSVciHbFQdJTK3N6kTRFUq9jbv6qXQRDRIziMzcUX1n2IdfLTGiKm3PMno4AkHuoiZS+s+iGw3ljVAyTN6QdWqf2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_005812_503232_55CA2F68 
X-CRM114-Status: GOOD (  23.65  )
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
>Sent: Friday, November 20, 2026 5:08 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
>driver
>
>On Thu, Nov 19, 2026 at 05:59:56PM +0900, Nas Chung wrote:
>> Add the control driver for the Chips&Media Wave6 video codec IP.
>>
>> The hardware contains one control register region and four interface
>> register regions for a shared video processing engine.
>>
>> This driver handles the control region and manages shared resources such
>> as firmware loading, firmware memory allocation, and coordination
>required
>> by the interface register regions.
>>
>> It also instantiates and coordinates with the `wave6-core` child devices
>> for firmware and power state management.
>>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>...
>> +
>> +static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_bu=
f
>*vb)
>> +{
>> +	void *vaddr;
>> +	dma_addr_t daddr;
>
>Nit try keep revise christmas order, check others
>
>dma_addr_t daddr;
>void *vaddr;

OK, I'll fix it across the driver.

>
>> +
>> +	if (!vb || !vb->size)
>> +		return -EINVAL;
>> +
>> +	vaddr =3D dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
>> +	if (!vaddr)
>> +		return -ENOMEM;
>> +
>> +	vb->vaddr =3D vaddr;
>> +	vb->daddr =3D daddr;
>> +	vb->dev =3D dev;
>> +
>> +	return 0;
>> +}
>> +
>...
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/property.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/firmware.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/genalloc.h>
>
>order by alpabet.

OK.

>
>> +
>> +#include "wave6-vpuconfig.h"
>> +#include "wave6-regdefine.h"
>> +#include "wave6-vpu.h"
>> +
>> +static const struct wave6_vpu_resource wave633c_data =3D {
>> +	.fw_name =3D "cnm/wave633c_imx9_codec_fw.bin",
>> +	/* For HEVC, AVC, 4096x4096, 8bit */
>> +	.sram_size =3D 0x14800,
>> +};
>> +
>...
>> +
>> +static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
>> +{
>> +	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
>
>now use min()

OK.

>
>> +}
>> +
>...
>> +
>> +static int wave6_vpu_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *np;
>> +	struct wave6_vpu_device *vpu;
>> +	const struct wave6_vpu_resource *res;
>> +	int ret;
>> +
>> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
>> +		return ret;
>> +	}
>
>Needn't check when mask > 32, if check,
>
>	return dev_err_probe()

The mask is exactly 32 bits, so I'll keep the check and use
dev_err_probe().

>
>> +
>> +	res =3D device_get_match_data(&pdev->dev);
>> +	if (!res)
>> +		return -ENODEV;
>> +
>...
>> +
>> +	wave6_vpu_allocate_work_buffers(vpu);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>
>devm_pm_runtime_enable();
>
>you have not enable clock here, so you need select PM at Kconfig, otherwis=
e
>if !CONFIG_PM, other register access will be hang because stub do nothing
>of runtime pm when !CONFIG_PM

OK. I'll add "depends on PM", as other drivers in drivers/media/platform
do.

>
>> +
>> +	init_completion(&vpu->fw_done);
>> +	ret =3D firmware_request_nowait_nowarn(THIS_MODULE,
>> +					     vpu->res->fw_name,
>> +					     &pdev->dev,
>> +					     GFP_KERNEL,
>> +					     vpu,
>> +					     wave6_vpu_load_firmware);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "request firmware fail, ret =3D %d\n", ret);
>> +		goto error;
>> +	}
>> +
>> +	return 0;
>> +
>> +error:
>> +	wave6_vpu_release(vpu);
>> +	pm_runtime_disable(&pdev->dev);
>> +error_detach_pm_domains:
>> +	wave6_vpu_detach_pm_domains(vpu);
>
>use devm_add_action_or_reset() to avoid goto in probe()

OK.

>
>> +
>> +	return ret;
>> +}
>> +
>...
>> +
>> +module_platform_driver(wave6_vpu_driver);
>> +MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
>> +MODULE_AUTHOR("CHIPS&MEDIA INC");
>> +MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
>> +MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> new file mode 100644
>> index 000000000000..96d67e931e71
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> @@ -0,0 +1,137 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 driver
>> + *
>> + * Copyright (C) 2026 CHIPS&MEDIA INC
>> + */
>> +
>> +#ifndef __WAVE6_VPU_H__
>> +#define __WAVE6_VPU_H__
>> +
>> +#include <linux/completion.h>
>> +#include <linux/device.h>
>> +
>> +#include "wave6-vpuconfig.h"
>> +#include "wave6-vdi.h"
>> +
>> +#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
>> +#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
>
>If only use once, needn't define macro.

I'll drop WAVE6_VPU_PLATFORM_DRIVER_NAME. The core name is used by both
the child device and the core driver, so it stays.

>
>> +
>> +struct wave6_vpu_device;
>> +
>> +/**
>> + * enum wave6_vpu_state - VPU states
>> + * @WAVE6_VPU_STATE_OFF:	VPU is powered off
>> + * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
>> + * @WAVE6_VPU_STATE_ON:		VPU is running
>> + * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
>> + */
>...
>> +
>> +#define W6_VPU_MAX_NUM_CORE		4
>> +#define MAX_NUM_INSTANCE		32
>> +
>> +#define W6_VPU_POLL_DELAY_US		10
>> +#define W6_VPU_POLL_TIMEOUT		300000
>
>Need unit surfix

OK.

Thanks.
Nas.

>
>Frank
>
>> +
>> +#define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
>> +#define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
>> +#define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
>> +#define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
>> +#define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
>> +
>> +static inline bool wave6_is_product_w_series(u32 code)
>> +{
>> +	return code =3D=3D WAVE617_CODE || code =3D=3D WAVE627_CODE ||
>> +	       code =3D=3D WAVE633_CODE || code =3D=3D WAVE637_CODE ||
>> +	       code =3D=3D WAVE663_CODE || code =3D=3D WAVE677_CODE;
>> +}
>> +
>> +#endif /* __WAVE6_VPUCONFIG_H__ */
>> --
>> 2.41.0.windows.3
>>
>>

