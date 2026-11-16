Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05451606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WJ7drYWy;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=YUHoOo0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SKcJGaTFC/WLgD/dBg3bvortPm1cJJ/0jLyc1BGhsTs=; b=WJ7drYWykj8wMXFchbMRNuHLgN
	4IPW8x+2+SOB40gpWa/ahjP+7bs+IG23JdMIM6feidMAd0dv2n0Lp9EkwzpXa/aBSqwKP6Dwmntar
	R7nRTa4J7cLpHI73PP95tYeXG7MEZAMqAhHZW711cVZvJ4M0rm2orFCQloomIAGKt1f3JJmEUhDkf
	SwC5NUGH4kn1C25YZptVthV9CphDsaoRM/q03C231jFRgrhicrtD+YszyHuhzmeXflHMe+o1fwYlR
	FrfWVKF0ZHv4sQj5fQNpNsq7lDOyoreaVLnEcWlslkaLN/pvn5KhSXnTZ73eLezPmixITt5hjTxqp
	yNDsMuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt01-00000001m1r-10KX;
	Mon, 16 Nov 2026 09:27:41 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSszz-00000001m1B-1Jgt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfh0ID+seScxjasTRiWbfn3CtDIUlyj5Bjjzy2vIxRNZlijxGYiEBLJ6CDXzErjeG5xdWF0N4LcngiQwaSY2nWDPgzajkLqgtV/QBE9Nrm/Km8/nshF8BrwZr9KjtVOtCgb+Fkh4ZSPsDTxrVRiRAcKt9kk8yDwU7Ffujl8CmLM/2q8DLKsJr96J17htRfSYaD9VfcPjacXjrgMk71JheNwpA4HrZ7mLmZf+4LpfCsGONkdExVqoIlojYjekbQjLy6ZwSKmkiKojnp5xFMrEOK+1w3O7lO/QKlW2rAoHfYg6nyGpiHIsrFEjZ06mXylZGxs5C45caDzjlDA+d/DJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKcJGaTFC/WLgD/dBg3bvortPm1cJJ/0jLyc1BGhsTs=;
 b=rjRcCpNp8gQo1bbfZw32S1RiPt+qwetmaZ4K7y+oeR2cgMix1I8PiLKe62+KPf3Gai9NQPvAXNhbqirRAmhr5moOZib5IO5v9ojhN2FvXSkItWFSWkYZwvS5G0OaXKa8uI7kwEFnuqtKEE165eVUQKW15iyMa/wJI+ztt2yFi2UNoeRbdHg5qPulTlFqLbEOeT4piL5pnzc/1A9fMD10//MVNFDKist0LSMf/kxMRIdQVNyam8GcCx4ugXi/00vRfRJQFTzfgnGBjXf6Cz1YEsAI9fWmckYRB0+c5Njj7uOZtPoECvcvICv2289RcddHSDm9PEGQJGpwuOMuyCpdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKcJGaTFC/WLgD/dBg3bvortPm1cJJ/0jLyc1BGhsTs=;
 b=YUHoOo0y9Wg7JqkfkPR6Dsr5puXPWI1nT/Z5u3qqDQq1jjiq6tSn6lG09vhEeeJPtFwiTluFxsBF/hIZzzuUaxnh/gWVgN/0PNSnCxkWzO2I4rQZh5bWcvBjF/KpNXIvbXHigu7gawZly9/O8xXfZGWjXdwAFMs40H7FKdTS6EA=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TY5PR01MB18315.jpnprd01.prod.outlook.com (2603:1096:405:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 09:27:32 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:27:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "magnus.damm"
	<magnus.damm@gmail.com>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<ukleinek@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: RE: RE: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe():
 reject devices without match data
Thread-Topic: RE: RE: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe():
 reject devices without match data
Thread-Index: AQHddDe+pqQcO6zuIUW4lgS12hIyWbcwYs1wgAAFEwCAAAMz8IAAA+CAgAAAcWA=
Date: Mon, 16 Nov 2026 09:27:31 +0000
Message-ID: <TYYPR01MB66035B42E6870B1A55DABF57867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-4-2d82025e9646@pengutronix.de>
 <TYYPR01MB660340F5E219C29045BF61F9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
 <20261116-cream-hornet-from-lemuria-703c6b-mkl@pengutronix.de>
 <TYYPR01MB660333DE58031D8231CD1B3B867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
 <20261116-passionate-vulture-of-potency-331d64-mkl@pengutronix.de>
In-Reply-To: <20261116-passionate-vulture-of-potency-331d64-mkl@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TY5PR01MB18315:EE_
x-ms-office365-filtering-correlation-id: cbf836a4-c8ef-4f7e-8ae1-08df43c3d745
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: +lXKhG82GXRbujXA+17VrMVdUDzG/S+FBOnR0lS7TQUknVcYYa7nOFHswz88OWu8nRYs56KMROEoBa00HfjPwBbsxhBUTSS6WT1VJ1446jhMkmEaPXeVkl64rRUrfE8ISqKphYemZW2iu7XTfxlIa7E2OSRwhC3dGvUxfeh6qrWxLTlVn6KVB9SdfXEpz8McDtQriIAqgDCvLSu/lB3+/HAC6GLIq5cDQ7THhvdaOpRO/WfD7VytA6bSPOtkWH1lTGbCi/bEWKV+gYzlk9YHtuVjaEwJ+MB0FZYfcLSAykQdx+AuVsiAIXfJtonOsAoJ5AfPjmw2Q0xgEGImsuf8WMhSRpUwjIyTsBDm1g/ttDm8Ecii5/ThOnVChJTA+mimB8o+giqEdzEvZsfwptaVGmI2N8N+jHqlUpq5c2pQl9jsxUNAnsZKlIOZIw9t714TYkWVtjJb5gIbAqv+NYSOKluEs19na7zw6loGg1DW7q2eyUq9jyXFGAqJiWV/BBvVrt/8uKqBySa/96DkcIEZ8E8v3wT0MqNYZcP0wQ4Yy+jVVBu5uQMtMnpCcajs2fmZtYN31DYprHjvGMhtoA3q3t9uut+y9wKvkY6swfAGXi2sNdIwlzJxQoC/n/DfDrCx06FlGVVS8iowj9FrXMKc5oMOfYs72bu5gwm9pSu+qI9nruzg/ww8clIFgs/I5vtF3rJWwu89gEr0RCA97lNxIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STZqaWdITVcyYWFEQlRqbWt3YWcxdjR6Z2NuSk5VNERIa1M0TDhTYlJnWHpJ?=
 =?utf-8?B?L0RoK2huQTZ6TnNhMjhnQ2ExYmdtYk1KRTA3WjZzdXFYUGxhWjR5RjIveDN0?=
 =?utf-8?B?K0krOGR2TjBRQkMwS2NVQit1ZytvUFB6d1o2YXJ6UERkMTU1R01vektzV2lt?=
 =?utf-8?B?emE3R2hVOTlJeURuRStUcnZEeC93bFVzMXM3V1IyTEpZcjBwSHllZHNpK01n?=
 =?utf-8?B?NStITmtmaWROR3VEYWxqaXFQbTlqWUdFeEpDYUhRenBBMEFsa2VTRDdDYkFY?=
 =?utf-8?B?MnFUalpmb2dFbnRXNHd4VkFieldrSHI2TUhYZ3VxSXNxWEVHZkNTeXpJUkdr?=
 =?utf-8?B?ME5HMk1wQmRjYnFwSFhxOE9yRnpUTXJNQUR4enhnc1FwZEpSRUQwRy9YVkJB?=
 =?utf-8?B?NnBpWS8wRXFsekdpSzViV3BlaGxIcktnRHYwTXhjeXMvRzh0NmM3bzdPU04v?=
 =?utf-8?B?Rkl5aW5EeUlpUk50bEdCRGZIN2RReWdZRGNhdEYwYk03Y1Bvc3dkUGhINUFL?=
 =?utf-8?B?bHB4UFVMa1AwNTZtVE5QTFd0bUlxRjZWczR3MUxkVEl0eU50WDcrOHZWQ2Y0?=
 =?utf-8?B?cTRkZk40VFVsWXZTZWdXY0RtL2Vsa29wVFMxVGxXUUdWRlUxcnlKa3dsMFox?=
 =?utf-8?B?ZjQ1NHY4Qk5VcytWRGZQUTRFL3NOTUkrd25peGRRMXczNlJaY0hSaitaZDZC?=
 =?utf-8?B?YzFubGNQc3lyUW0rTlhySDFPS1ZTcTdYckljVUd2NXB3TEJFenQ5REU0WEtJ?=
 =?utf-8?B?b1ZFakgrcVBldldndzNXZHFWVlp1M1BUTFFOL2FHVWR2UUVKZkY1bHMwcFNi?=
 =?utf-8?B?bkdoUnZIdWQwZHNndFBId0xibE1Na1c5c3JFMmw3cW5PRWVyMFVrYXgwTXRu?=
 =?utf-8?B?Uk5QYVdCNTY1YVg5T0MwSlVVa1I5MzNmVHJXMGdVU2ordnZzeTVnSlRZUFZk?=
 =?utf-8?B?ZXRzd0NDZGlYTk9ZMFR5eXBkSFBFdHBtUWx6MkhRQnVWMytmRGVXcVE4em1l?=
 =?utf-8?B?bU84YWtENSt5WDMrM084WHhJeTJQblVYMmk1MG1LaElLb3RGcStPU3lKd2J1?=
 =?utf-8?B?ZzN3cjRVc25JeXlyaytoL2VSbjhJYmNSMmV2aGI2YVVlOU1XOWxWTnNOc1dh?=
 =?utf-8?B?OGk0WVFoaFFUOHpXdWdtdGJnT3FyV2o3QUFuTlNiRlR0ZkI4ZUVlZW5lb05m?=
 =?utf-8?B?eE9BWUlKMU1DWFcxZ3lnRFFxNFI4dDFGSzVwMGhsZGlrNTNOMUsrT3dlL2JD?=
 =?utf-8?B?ME5pQlkwWjJxQ0JmUkgzR2pXejVzWVVhckVudDZJSWNzWDJRTHZnOWVkSjZM?=
 =?utf-8?B?UEE2TUR2ZFBqM0ZYVzJha3Q4RWh0aXVkOHpXTkkxK2R4UU0zeGhLNHErRGp6?=
 =?utf-8?B?YjBLdldHN01WOXdYOWpGaXUyalpETFI5eHlOaUs1bkJtK0hiQU5VdzVKdW5n?=
 =?utf-8?B?UVlKdHhJbCtIS0tybXJiUzFOTDBSazl5QW9RNXY4VFdFZG5sRU9mZy82VHVZ?=
 =?utf-8?B?UEh0dE5QSzNxbm1BR204TkNjaWZoTm9WSnFMVEhGblRQNXlOK3ZyY0pWMGEy?=
 =?utf-8?B?a2RSMm1mNFZnUnpBWG1VZmN2c0xYbWY4TVFlTlZndm13a2t5SThuL1B4bUtN?=
 =?utf-8?B?UUZ2d3FDekJpVmgvWGdQaFVSM2FyQmtJVWYySytNUC9WVXQ1R2lTTlNrQXdx?=
 =?utf-8?B?eTdOME5IemdQQ3BiV3plWXluMUtkSHJsa1pKTElMSEZwMm1zZ3JGNkRlUEZU?=
 =?utf-8?B?bSsrMjRkV1R4ZjIvUGEyS0lsaXY0R3lNSUI3MjUreFo5UXRIRysyelh5cmFZ?=
 =?utf-8?B?VitaWDZJS1ZqdGhxemY5YkNsU2pidGZUcWIzTHI4aHIzRFdjSkllMlhIc25G?=
 =?utf-8?B?MUZyV1hjdVhRbUQzWkNPaXZQTmk3ODJqbnJVSmpYbU9CY2FYUFB4TXJaS0x4?=
 =?utf-8?B?dlFCUlFNQ05qZUE2aXg0RjgrODVRQzNLMUFDR1BCeXJBSDVtN0Q4Z2dUMFNr?=
 =?utf-8?B?VVBqb0ROLzdIaW4rMktoc3lidDhGWUpsMzJnTHNQeCtPR2kvRFFWN0xXbFhK?=
 =?utf-8?B?L3J1Y3l1a3ZaOEVzRHpGMDB4V2FQdmZPaCtadFdLdjZxb0xaejV1YU5ueTVk?=
 =?utf-8?B?WWs0SFA2OTVLem1ONEJ3djdMcjg4SWw1dG11OHdxQks5ZWxTMHhyYnE5MC9w?=
 =?utf-8?B?VDBjWFY3MFdFMnpoR1hzdW95OFVibDliMXpmOFVIT25PTWljSndyS2IvaktP?=
 =?utf-8?B?dGRYYnlsLzE4ZTdVb3ZEdkZXbEx5YVlIQzU0YWpjZ0xtWXh3ZEw0bzZ0cXdX?=
 =?utf-8?B?ZFRTY1kwN2FlWGxFU1d6WGdyU2IxUXpSSlRkbnJyVkUrY0llOGp0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf836a4-c8ef-4f7e-8ae1-08df43c3d745
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:27:31.9057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoSxEmHSSm7nMyNczC3Icp6bcqQLdrMptSqMivCjVsZfLcyX65wTuUpPD0W2wziSYPGnHQ6oG2nQhwHzFTvwF9bhma4vNk/qcKYM1ruyEps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_012739_369852_1D759192 
X-CRM114-Status: GOOD (  19.18  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFyYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJjIEts
ZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAxNiBOb3ZlbWJlciAyMDI2
IDA5OjIwDQo+IFN1YmplY3Q6IFJlOiBSRTogUkU6IFtQQVRDSCBjYW4gNC80XSBjYW46IHJjYXJf
Y2FuZmQ6IHJjYXJfY2FuZmRfcHJvYmUoKTogcmVqZWN0IGRldmljZXMgd2l0aG91dCBtYXRjaA0K
PiBkYXRhDQo+IA0KPiBPbiAxNi4xMS4yMDI2IDA5OjEyOjEzLCBCaWp1IERhcyB3cm90ZToNCj4g
PiA+IFRoYW5rcywgSSB3YXNuJ3QgYXdhcmUgb2YgdGhpcyBzZXJpZXMuIEkgdGVzdGVkIHRoZSBk
cml2ZXJfb3ZlcnJpZGUNCj4gPiA+IG9uIHRoZSBmbGV4Y2FuIGRyaXZlciB3aXRoIGxhdGVzdCBu
ZXQvbWFpbiwgZml4ZWQgaXQsIGFuZCBhcHBsaWVkIHRoZSBmaXggdG8gYWxsIGFmZmVjdGVkIENB
Tg0KPiBkcml2ZXJzLg0KPiA+ID4NCj4gPiA+IFNob3VsZCBJIGRyb3AgdGhlIGRyaXZlcl9vdmVy
cmlkZSByZWxhdGVkIG51bGwgcG9pbnRlciBjaGVja3MgZnJvbSB0aGlzIHNlcmllcz8NCj4gPg0K
PiA+IEkgdGhpbmsgc28sIGN1cnJlbnRseSBvbmx5IGZldyBkcml2ZXJzIGFyZSB1c2luZyBkcml2
ZXJfb3ZlcnJpZGUNCj4gPiBmZWF0dXJlIGFuZCBtYWpvcml0eSBkb24ndC4gVGhlcmUgaXMgYSB3
b3JrIGluIHByb2dyZXNzIHRvIGRpc2FibGUNCj4gPiB0aGlzIGZlYXR1cmUgYnkgZGVmYXVsdC4g
VGhlIGRyaXZlciBuZWVkcyBkcml2ZXJfb3ZlcnJpZGUgd2lsbCBhZGp1c3QNCj4gPiB0aGUgcHJv
YmUoKSB0byBtYWtlIGl0IGZ1bmN0aW9uYWwsIHNvIGl0IHdvbid0IGZhaWwgYXQgYWxsIGluIHBy
b2JlKCkuDQo+ID4NCj4gPiBCdXQgaGVyZSB3ZSBhcmUgbWFraW5nIHByb2JlIHRvIGZhaWwsDQo+
IA0KPiBXaXRob3V0IG15IHBhdGNoLCB1c2luZyBkcml2ZXJfb3ZlcnJpZGUgdGhlIGluZm8gcG9p
bnRlciBpcyBOVUxMIGFuZCBpdCB3aWxsIGNyYXNoIDUgbGluZXMgbGF0ZXIgd2l0aA0KPiBhIE5V
TEwgcG9pbnRlciBkZXJlZmVyZW5jZS4NCg0KSWYgc29tZW9uZSB3YW50cyB0byB0ZXN0IG5vbi1m
dW5jdGlvbmFsIGRyaXZlcl9vdmVycmlkZSBpbiBhIGRyaXZlciwgDQp0aGVuIGl04oCZcyBPSywg
SSBndWVzcywgYXQgdGhlIGV4cGVuc2Ugb2Ygc29tZSBjb2RlIG1lbW9yeS4NCg0KPiANCj4gPiBp
biBjYXNlIHNvbWVvbmUgd2FudHMgdG8NCj4gPiB0ZXN0IHRoZSBkcml2ZXIgdXNpbmcgYnVzX292
ZXJyaWRlLg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl4NCj4gV2hhdCdz
IGJ1c19vdmVycmlkZT8NCg0KU29ycnkgaXQgaXMgYSB0eXBvLCBJIG1lYW50IGRyaXZlcl9vdmVy
cmlkZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

