Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NkTffIBR;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=mBfxMvGw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xvw9G2g2PiDQ/lywFn1SAfyJ1MyQelEdYTLBOOtKJ4U=; b=NkTffIBRfzhoCls2LgTzlNgyey
	Y8dK4kDDrPRfxAlPbYwT1fisttrFLA2p+azpc73s0sRSxsAhLoU/4e6bPhL+Ub3Igm99msqb6+vYh
	k6Wkn6DZ8zCNKcP9da3kCsv0j7HzyjtsCNbvph/VDe5vALqrPlR/jc4jtZl1jUW2wtIinaWCtbrVe
	LP+hGkZSt8MNBgVJnYoQMA36h5Qf0Ii9KPmApvJ2wnboOVv7Zlyl1Jt6SkrtFo1zBSviMoQkgAuD1
	YqOdLpygOpwjH3kmulgddmCP13TnBGZgql0eNMTsjSafuHEahk1wqFKyYasbo9Mzc4k+T6lb5jJL6
	A6BGFfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAlp-0000000DaHc-1D8Y;
	Thu, 19 Nov 2026 22:38:21 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAlg-0000000DaER-3qSk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phdvnbIkZ9qok0mzlRVn+ps3qhjZftZHwmM5N/J1zdNprqGoH+gn957PsnN9bDJuPAfuQHX28aCRNMNo+d0dr/uHRUgnRb3oYvwwKst9THso7GbIPTmklrEb79EmiH2M+ngSiGHivtHK+dWOJtG0O7/v7s33ZijofCziF29tYQwAnhi/29AzGut/mSUMTN/RKRt1pIW7v/SYb2KTWz2QlSAUmq7Zi0/twcU3XCcdIzhxZ22Gn8wYMCK4xBpuFcL8HZ0KHbjdoY5855/WsbYi24HBXAJtqbpIn4KCIIAXS08mqj2TYd0L+leAJFuwp892akqLTUCVTIfghN9pY/Y6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvw9G2g2PiDQ/lywFn1SAfyJ1MyQelEdYTLBOOtKJ4U=;
 b=UBjIdMPHsVspq3NBXHMOQv7kH6xRJC6akYMyPmzTFBIpP77tDbpyomIXNb7/MhY3JAHSzfX38ligYPVqrEyxXd/MRrMNq60p/FOoTEbdvqnnQ50BBtfLLHnj+XJ4Fbsqk5iaiYAAJFm1qEV4dje2uhHnkEjYjGOAJn0Xa2o31NSUmdJKMuHwMd5xd8iHUriPntj4CDPYPn+hHbTQRpUon7YKxdpm5O1rJUKDSId944Lam4riuwn+2kgOOgl9rYNLTj8ojuaAo9HNlfemkCgZ0tVWxlwkHidRNCP2fnpp+znQeL4D0NrjWijCk/qZpcelvP5o0w5EJOz3DJgNjYPZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvw9G2g2PiDQ/lywFn1SAfyJ1MyQelEdYTLBOOtKJ4U=;
 b=mBfxMvGwI94XU/RKDkBVnuS8m+D+oBmCthTs2VOJs5aVwEsNjfi5EIZ0QstM3zfUoQahYHz7VTlATtdMEgTYBbw+qGisHf+SVurd6q2sKmXjLXyLek8gcgtYCopGT5wSSGvjvCT7vPaKm1z9Hb6tu0L0GzjkejM/CHy/JlFsIDKL+ThkaKSjWGsQWvsRNHcodl6ge01b1gQXVON+pOyhDWl5EYJ3OI3yQAGrG+K5sDEYOsUrdXECaIpPkYzhDZcU915fnU1pUKIjH5EMmlYFco4jSgC6wXBnF1vUKTeWznhSznnOxW4WWSvo8sVm5MnW/6FccVuRCtETx1ECnLb5iw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU0PR10MB5704.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:313::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 22:38:04 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0662.001; Thu, 19 Nov 2026
 22:38:04 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "lee@kernel.org" <lee@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 10/12] pinctrl: single: Free pinconf settings array in
 pcs_dt_free_map()
Thread-Topic: [PATCH v2 10/12] pinctrl: single: Free pinconf settings array in
 pcs_dt_free_map()
Thread-Index: AQHdeGfKowid3jPWTEi8r1K3he+N0Lc1/FeA
Date: Thu, 19 Nov 2026 22:38:03 +0000
Message-ID: <bf6de7dda99ddb51e98db7cea5f48e77e45e7082.camel@siemens.com>
References: <20261119205013.2563811-1-lee@kernel.org>
	 <20261119205013.2563811-11-lee@kernel.org>
In-Reply-To: <20261119205013.2563811-11-lee@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU0PR10MB5704:EE_
x-ms-office365-filtering-correlation-id: cc76773e-e82d-48ff-27e7-08df468dc644
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|38070700021|10067099003|261022105027099003|4143699003|5023799004|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|55112099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: OieBDZ0fFgeU6WRMjrX57svX1QuRDuUWrZdSyTu134hVjpSh18KOO3UgEW2hrh7KRGkNWcbOQIOk5ZyCGENXq8LbEqTEPYCtJTVe1XDIn5+jLq5IvsUq0/kHmPqNTp12E+jMzBX4wsZKAvHW4vme7yG1/irva/Egao7lIxRabzmPnbXg2eRnir1BnGXUKmi+xR7oc9AwLwOkkYVdJqBXaYCkbCpZM8RYf3efZkmi9tOQRHSkSAni1FN1v7YAQf3W3ICIjlbYZQcMrQSHKzQ9/dL8O50vD6/g0T+rZw7A9Pc/k+2R/qlJXPVRMSnHZwIl3xlrExTH2QUCWJ3kKu1LPq/AmGAQwNDhXYidto4MfpP8PmDNnmqoQO06JdxeEtZiNbbZMDPm36lrzBzB+qshbN1liqsleECqqRxecWy+NcQLQyZ9BQGzn9BrBPnM0MgTsmjBYcw+zt55rwBswQwG8bQhglW+HO3dsYBC8R66zp6r3cOpHWYTylL8/LbF4ooaEmx0OFc5jgFgF4a26Y1sT1Xcm7BeKYy589cITMu19aFMrpM3TbX52EwdFxbSDqwxjDwtA1yK+fb4dP/+DT2L53h+GNu34CttIV/3TlmsaKQboo5ra4vma62jnq2IyidGy7o5libbxgmUpwWDPY+dBahGbIInczDTvHcByMU5+b0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(38070700021)(10067099003)(261022105027099003)(4143699003)(5023799004)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(55112099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmZXOEZteVJYcFNscnJvcjQveWtHRTNabUc1bTBKNGZDQjZ2MlRDR1pNbGlS?=
 =?utf-8?B?RGNmeTFvS2xhVFRKdlVVSU9wbi9hYWZHRktsdzhZdTFneTFFUzNvcUFPdys1?=
 =?utf-8?B?aUxzd0hRNlR1Z0tOUHh0Vk5mUnh2U1Uwci9iQzQwSjUyejZVUGw0S3IzT0pQ?=
 =?utf-8?B?Zkc5WGRmVlp5S2RuYlJ4aFBweW9qTGZ5ZW5SY0hmM3pkUTBQalA0M0pTYUw5?=
 =?utf-8?B?Q3dGMW9wRjRGZ3IrWVZOWlF3cHpiTUtkeUdYam02YTl3RGxJalF5TVcwZ0p6?=
 =?utf-8?B?QktkUmd0Y2d3eVp4bUxScWxLdVd2S2lkeWRZaHUrUXBLZlZNQnZzMjgrRXlk?=
 =?utf-8?B?UGJwUWNCREFFZ0xGMGMyYXdaWURhK0Voc2RKM1VZcGs5c3hKZUdtdW43M0lD?=
 =?utf-8?B?dTF2Slg2R2FOTzlYQ2hUYU51WUN0NCtFaHhqUkZFclJrbzN6SjVDeVNHQkcr?=
 =?utf-8?B?OUpJbEI1SkFsbVlyZThaTDZoQTZqVGEvNlczSnExSk1kN2VmcFB4TUxCOEE1?=
 =?utf-8?B?bGlOUHdwN01EOE14TDgxRHZOdzkwRFNRWGw4YWs0RGpGSHZ3MXNORktlK0c0?=
 =?utf-8?B?TVBacHJhdnh1bGJwMXhEQ0Q4dDZLZ0hxMmtvc3MvMWduTW9DbFVBYUIxRGxy?=
 =?utf-8?B?SnZjdGhNSElPejlzbHRFeTNZZERVa0xuN2Q4QjI2ZnhmRDlVSmUwaFF6a3Rs?=
 =?utf-8?B?eXM0Z1FXaTNLRkYwV0psaVpQeVhWRGZPTlhOSDBSaU1nM0FFejU5WmFxcnA5?=
 =?utf-8?B?WUpPMFp5UHpPclRTY2djRXA1YUs5SWNERmwxbVFZTzhxRXE0OEtnZTVEYTVH?=
 =?utf-8?B?eGtPZGRjQmlOSEw1VXE5VlBqZjd4TG1aelpIVVdVKytLdWloTXBNS2UwVnFv?=
 =?utf-8?B?ZzN0eEdEMlMrTk1lNzhJUjJUays5VDBjU1h5Z1lxc2t1MjRQYzVKU0pMMVFa?=
 =?utf-8?B?cXdTUlFva3dNYSs5ZXoxUzJXSlVBMzJiY0JPMTRZOU50WG10Ymw0cDlZUnc5?=
 =?utf-8?B?MjdhWjlxZGlwSC9CcWh4TUxrSkNUZmV2SmN5cko4WnRyamhaWlA4WVlPMEZD?=
 =?utf-8?B?b3hwM2c4aTJVUzM5d3RrL0tJcmtYeXpoTWtjbTYrZ0JQTWl4QkFwZkdnd0Q1?=
 =?utf-8?B?K0srTk9MeVNnL0ZMUU93cjUxYzdGZjE2SURqVUNvUUlab2NQMUR0Tkd1Kzk1?=
 =?utf-8?B?SnM0WVdZMEFGa2lsQkpyS0RaSStTZnJDU3V5Um1KWDI4MHdTcDlwMW5TNmY3?=
 =?utf-8?B?c0lKTllqZGxvcFFSNmtTNG1tL0UvQzBzbE1sQUxWa2lTeVZ1eVlHVVNJWllv?=
 =?utf-8?B?N3RmYkxhYW9Xb1pnOWMrVW40VC9GWFhmSmJ6anF4MGFKTEV3b3ZUcUUrajY5?=
 =?utf-8?B?b2xQYlNBak12cjNSTTJXTXNaTndCdUZ0SUIrc3NIeWpuUFNkN3J1ZnhtU0hr?=
 =?utf-8?B?WVc3dkI4WUZNZUFDTmJqYzIxNHhaZnVXVVcrRWl3ZW5HVGxGQTBpWXZ1Rkg5?=
 =?utf-8?B?aVIrRVZyc08wNEM4SXNPaW5acFdQaXJQSmIxQUdHYytLYmpldkFGTzBxVS9t?=
 =?utf-8?B?UzhaLzNaNGFJc2JFeFpCNWtPb1ZVSGtXeFlVOXRhRDg3K1JJRFBKemZJRzNa?=
 =?utf-8?B?ZnUvMUNKelp3R0hjYjQ3NlZ6RGQyNnA2V1NNVlNTVUQ1OTJSSkZuOUsxNDZP?=
 =?utf-8?B?WXFXb0tDRTRobEdySURjcVpBbnhWeGFrb2RpeGJRbHVxVmRaUXcwRk5YeGky?=
 =?utf-8?B?TFc2QUFJV25ZYUhYMEhiaTZRK0ttMHBiL0g2NllzN0hGR3hkTkxpT0dyQlpJ?=
 =?utf-8?B?Mm5WeGU5c0RBYWcvY2JZR29QNmFQSWlENURuY2IrMW5uUERRNTNxbmhjcSt4?=
 =?utf-8?B?QjRMRlFWOXZ1UzRBd3JzeGNSdUhZTS9HZmpEQXUyM3lBQUQwRDNFOGRHSXVB?=
 =?utf-8?B?YXFyN0dUSWFtcWFwMUo0aHF0dEZnQjB5KzZ3QTVtTGtaK2cyenVJSmo0NzJQ?=
 =?utf-8?B?WWVxSkt3OURUcURrekV2c0pvREhDN05qMlVyclR4TmlmcVpxZ1lrSGdPayt3?=
 =?utf-8?B?aXJ5elY5NG5mbnh3SzJZMFJlaE5Id1RtdVBETHcwL2NSbHZPQjJEMVV2QzJP?=
 =?utf-8?B?ak9ObHRyMmVtZDN1NXhZQ0lDQjlaM3BiTnJSOUtuMzhNUXZERlJKbUFGUEJF?=
 =?utf-8?B?U0l3ZndNeXJKaGZFMFk4VzZ6ZVMyMjczdkE5SHlSTUpkcGIvWEd4QWtOZjk4?=
 =?utf-8?B?bTBHTmdxTnFBMXJmNW1UdHNpSmM2UmJnVENLTUVwRlhXTWd5dUdyUnVCR1Ns?=
 =?utf-8?B?b056WW1zVFRiTEhTNkFKbm13UUI1cUpWYnJaRS9McWdocjBiOHR6NzR6a2M3?=
 =?utf-8?Q?OnOXqlbX2K1GTpy6kGsg+h1x9FPF/04tviNRSvDSzH7oB?=
x-ms-exchange-antispam-messagedata-1: VWPujfO7Sjo2YizHun8DUH+LDKhhRD8XCBXERoS65gWo6jzc/mmKYaKN
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF67684843C37D4CB19FB77127CB55FB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc76773e-e82d-48ff-27e7-08df468dc644
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:38:04.0154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vrKfQf4WpnXU00hB3XE6SBaK7kbrAtVXBq8w+zE8KfZZ4LQvAxo9RTdAWDYEny0mHd1ikKGJ/qMcTLUhDDAo6hg3dJ20UAYTaGV8YtjPio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_143812_958892_CEED07A5 
X-CRM114-Status: GOOD (  24.61  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTGVlLA0KDQpPbiBUaHUsIDIwMjYtMTEtMTkgYXQgMjA6NDkgKzAwMDAsIExlZSBKb25lcyB3
cm90ZToNCj4gcGNzX3BhcnNlX3BpbmNvbmYoKSBhbGxvY2F0ZXMgYSBwZXItbWFwIHNldHRpbmdz
IGFycmF5IGFuZCBhdHRhY2hlcyBpdA0KPiB0byBtYXBbaV0uZGF0YS5jb25maWdzLmNvbmZpZ3Ms
IHdoaWxlIHBjc19kdF9ub2RlX3RvX21hcCgpIGFsbG9jYXRlcw0KPiAqbWFwIGl0c2VsZiwgYm90
aCB2aWEgZGV2bV9rY2FsbG9jKCkgb24gcGNzLT5kZXYuDQo+IA0KPiBXaGVuIGEgY29uc3VtZXIg
ZGV2aWNlIHVuYmluZHMgYW5kIHJlLXByb2JlcywgcGNzX2R0X2ZyZWVfbWFwKCkgb25seQ0KPiBm
cmVlcyBtYXAgYW5kIGxlYWtzIHRoZSBzZXR0aW5ncyBhcnJheSBvbiBwY3MtPmRldi4gIE1vcmVv
dmVyLCBiZWNhdXNlDQo+IHBjc19wcm9iZSgpIHJlZ2lzdGVycyB0aGUgcGluY3RybCBkZXZpY2Ug
d2l0aCBkZXZyZXMgYmVmb3JlIHBpbmN0cmwNCj4gaG9ncyBvciBjb25zdW1lcnMgY2FsbCBwY3Nf
ZHRfbm9kZV90b19tYXAoKSwgZGV2cmVzIHRlYXJkb3duIG9uDQo+IHBjcy0+ZGV2IHVuYmluZCBm
cmVlcyAqbWFwIGFuZCBzZXR0aW5ncyBiZWZvcmUNCj4gZGV2bV9waW5jdHJsX2Rldl9yZWxlYXNl
KCkgaW52b2tlcyBwY3NfZHRfZnJlZV9tYXAoKS4NCj4gDQo+IEFsbG9jYXRlICptYXAgYW5kIHNl
dHRpbmdzIHdpdGggdW5tYW5hZ2VkIGtjYWxsb2MoKSBhbmQgZnJlZSBib3RoIHdpdGgNCj4ga2Zy
ZWUoKSBpbiBwY3NfZHRfZnJlZV9tYXAoKS4NCj4gDQo+IEZpeGVzOiA4YjhiMDkxYmYwN2YgKCJw
aW5jdHJsOiBBZGQgb25lLXJlZ2lzdGVyLXBlci1waW4gdHlwZSBkZXZpY2UgdHJlZSBiYXNlZCBw
aW5jdHJsIGRyaXZlciIpDQoNClNob3VsZCB0aGlzIGhhdmUgYmVlbiA4Zjc3M2JmYmRkNDINCigi
cGluY3RybDogc2luZ2xlOiBmaXggcG9zc2libGUgbWVtb3J5IGxlYWsgd2hlbiBwaW5jdHJsX2Vu
YWJsZSgpIGZhaWxzIikNCmluc3RlYWQ/DQoNCj4gRml4ZXM6IDlkZGRiNGRmOTBkMSAoInBpbmN0
cmw6IHNpbmdsZTogc3VwcG9ydCBnZW5lcmljIHBpbmNvbmYiKQ0KPiBDbG9zZXM6IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9idWcvbGludXgtZmNlZGVjNDYtNDQ4Ny00MzkyLWE4ODItM2QzYmVmMDdl
NTZmDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiANCj4gdjEgPT4gdjI6DQo+ICAtIFN3aXRj
aCAqbWFwIGFuZCBzZXR0aW5ncyB0byB1bm1hbmFnZWQga2NhbGxvYygpL2tmcmVlKCkgc28gZGV2
cmVzDQo+ICAgIGNhbm5vdCBmcmVlICptYXAgYmVmb3JlIHBjc19kdF9mcmVlX21hcCgpIHJ1bnMN
Cj4gDQo+ICBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5nbGUuYyB8IDE1ICsrKysrKysrLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5nbGUuYyBiL2Ry
aXZlcnMvcGluY3RybC9waW5jdHJsLXNpbmdsZS5jDQo+IGluZGV4IDE3NzlmZmJjMTE4MS4uMWJh
NjkyYTdlY2FjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5nbGUu
Yw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5nbGUuYw0KPiBAQCAtMzExLDEw
ICszMTEsMTIgQEAgc3RhdGljIHZvaWQgcGNzX3Bpbl9kYmdfc2hvdyhzdHJ1Y3QgcGluY3RybF9k
ZXYgKnBjdGxkZXYsDQo+ICBzdGF0aWMgdm9pZCBwY3NfZHRfZnJlZV9tYXAoc3RydWN0IHBpbmN0
cmxfZGV2ICpwY3RsZGV2LA0KPiAgCQkJCXN0cnVjdCBwaW5jdHJsX21hcCAqbWFwLCB1bnNpZ25l
ZCBudW1fbWFwcykNCj4gIHsNCj4gLQlzdHJ1Y3QgcGNzX2RldmljZSAqcGNzOw0KPiArCWZvciAo
dW5zaWduZWQgaW50IGkgPSAwOyBpIDwgbnVtX21hcHM7IGkrKykgew0KPiArCQlpZiAobWFwW2ld
LnR5cGUgPT0gUElOX01BUF9UWVBFX0NPTkZJR1NfR1JPVVApDQo+ICsJCQlrZnJlZShtYXBbaV0u
ZGF0YS5jb25maWdzLmNvbmZpZ3MpOw0KPiArCX0NCj4gIA0KPiAtCXBjcyA9IHBpbmN0cmxfZGV2
X2dldF9kcnZkYXRhKHBjdGxkZXYpOw0KPiAtCWRldm1fa2ZyZWUocGNzLT5kZXYsIG1hcCk7DQo+
ICsJa2ZyZWUobWFwKTsNCj4gIH0NCg0KU28gdGhlIGFib3ZlIHBjc19kdF9mcmVlX21hcCgpIHR1
cm5zIGludG8gcGluY3RybF91dGlsc19mcmVlX21hcCgpLA0KZ2l2ZW4gdGhhdCB0aGUgZHJpdmVy
IG5ldmVyIGNyZWF0ZXMgQ09ORklHU19QSU4gbWFwcy4NCg0KV291bGQgIi5kdF9mcmVlX21hcCA9
IHBpbmN0cmxfdXRpbHNfZnJlZV9tYXAiIG1ha2Ugc2Vuc2UgaW5zdGVhZD8NCiANCj4gIHN0YXRp
YyBpbnQgcGNzX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCj4g
QEAgLTk2NCw4ICs5NjYsNyBAQCBzdGF0aWMgaW50IHBjc19wYXJzZV9waW5jb25mKHN0cnVjdCBw
Y3NfZGV2aWNlICpwY3MsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ICAJZnVuYy0+bmNvbmZz
ID0gbmNvbmZzOw0KPiAgCWNvbmYgPSAmKGZ1bmMtPmNvbmZbMF0pOw0KPiAgCW0rKzsNCj4gLQlz
ZXR0aW5ncyA9IGRldm1fa2NhbGxvYyhwY3MtPmRldiwgbmNvbmZzLCBzaXplb2YodW5zaWduZWQg
bG9uZyksDQo+IC0JCQkJR0ZQX0tFUk5FTCk7DQo+ICsJc2V0dGluZ3MgPSBrY2FsbG9jKG5jb25m
cywgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLCBHRlBfS0VSTkVMKTsNCg0KVGhlIHBhdGNoIHdpbGwg
cmVxdWlyZSBhIHJlYmFzZSBoZXJlIHN0YXJ0aW5nIGZyb20gdjcuNC1yYzINCg0KPiAgCWlmICgh
c2V0dGluZ3MpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgCXMgPSAmc2V0dGluZ3NbMF07DQo+
IEBAIC0xMjg5LDcgKzEyOTAsNyBAQCBzdGF0aWMgaW50IHBjc19kdF9ub2RlX3RvX21hcChzdHJ1
Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQo+ICAJcGNzID0gcGluY3RybF9kZXZfZ2V0X2RydmRh
dGEocGN0bGRldik7DQo+ICANCj4gIAkvKiBjcmVhdGUgMiBtYXBzLiBPbmUgaXMgZm9yIHBpbm11
eCwgYW5kIHRoZSBvdGhlciBpcyBmb3IgcGluY29uZi4gKi8NCj4gLQkqbWFwID0gZGV2bV9rY2Fs
bG9jKHBjcy0+ZGV2LCAyLCBzaXplb2YoKiptYXApLCBHRlBfS0VSTkVMKTsNCj4gKwkqbWFwID0g
a2NhbGxvYygyLCBzaXplb2YoKiptYXApLCBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoISptYXApDQo+
ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+IEBAIC0xMzI0LDcgKzEzMjUsNyBAQCBzdGF0aWMg
aW50IHBjc19kdF9ub2RlX3RvX21hcChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQo+ICBm
cmVlX3BnbmFtZXM6DQo+ICAJZGV2bV9rZnJlZShwY3MtPmRldiwgcGduYW1lcyk7DQo+ICBmcmVl
X21hcDoNCj4gLQlkZXZtX2tmcmVlKHBjcy0+ZGV2LCAqbWFwKTsNCj4gKwlrZnJlZSgqbWFwKTsN
Cj4gIA0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpT
aWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

