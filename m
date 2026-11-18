Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F58606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 03:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K7hr1NY6;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=hl8lOdqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8mdiYVXM3RnqCbujc8qXnVYPvKegHNiW50KCdPKERv0=; b=K7hr1NY6s8HP1msdb1A/OIIocW
	IVJPePPboLJ41md9ZqcVdZ+29LXYTJP2Ffk94fZ/ZdE2Z23zoVFA8Yfer99Tp3Ck4p0kfqHT+9MUS
	JTHEi0m+FgOa/JxJYMQlYmUeoH1kx7q8gD95u3dslMM0ph+xHOWosABQy0w43gXLgM4Vp7w3Fn1rw
	FSTilVB/6MW4vFI2S+R27tO1MBx4mxiCUpUhckTExdx+gNsSj4pefOSWsoO/Efb3eD0ffE8dDUZZD
	EO6clb4DTtKJ9xFF94G/IkcRooclHRipGpXkDFGMp5kwWHc0gPARqcN4OwBMjLPUVrU3SeJCxvFW9
	s++GzFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVyg-00000007aOr-0sOe;
	Wed, 18 Nov 2026 03:04:54 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVyd-00000007aO3-2bDq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 03:04:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n++J75frY+ZrOO1zue+BMq3ZJlNWjXSlkoHFcSPFVjb2/ZDK4q9ArJhK7eqYTns1e2KCBWRQCJ4OADwPcH08muxSnlEBV0LN/24nx71NqWNzzuhblOgbyz+fc1PA8k57Oc1LNL2S1hg+0gE5bfvveCYoxfnGxxD1RG9W3sDmliY6PrE3wc8AvCEcAsfV95QfJvD8qSbcvNsSYEOuONtPDz/C9UFjbAzfiv/ZivBIH/K9z3gkMfLwIZ/2qbYAUTnCtJiRLYa6ZLEn/aNc55HlsKIcawLeyTl3OL6SXQZRFuvOZbk+IYWvlvkPIGQQBR7eSA6H2Py2cVxzf7qic1Ilsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mdiYVXM3RnqCbujc8qXnVYPvKegHNiW50KCdPKERv0=;
 b=e9qBxZr2kCapSLdoKhNSk4ct3BLH+zc5FA+5PU83k84+mfF4c6vEoyt+ZiWSf4VCWRiqy4JOksHkyf0NGw3Eorj+AXxqDkmXnq9cBu11IwK3goR6WvG0VVDJ5mpdcmXoidnAyUk+qJALonuLIGEV3MNe5v7BUlGfZZFLVULJP4eoMAwwUFKkHJ232OKv9nmeUiJTHQ/YVe8fTNrc5/lpV28rEyiaXKfGU9KZPzcm2pj0SjVl2/VOEr8wk9VGtJ/vd7eUI9ZOA118Rrm6QEftfHirouo8XNF4foHLLKQXMtv9WHY2/znL6pzDzeA8Gz1bBrM0s9e/3RZxGDhGAgBe/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mdiYVXM3RnqCbujc8qXnVYPvKegHNiW50KCdPKERv0=;
 b=hl8lOdqYFisLLTqHuxMJlAHVb2dsyUbqNxTB00DdTydB8VzEAaTtl0x3Yb/DhKBzcppo5GCwliPj64HwSYM+IF3oWcr51aY4Vb+e+00u3FiZAsSVHD0Nq+7ig5HdFJoMYuNTxxrYznIRCPb83Zis21kgz1+USu1tsgBZM0EeIBmOylrFMq8TqkyY147bHT2qIPI/kGTGEa6B3uB45Jlp2SaHnnIpEkOnCvO6q7wePSCrh/NR4PrfA0WSvQifoxGg5Q6u2pZwb3qkY8ubCFHukfZKFhhK5PKy+GuRT2jRV1JzN/HupwpF8TB+Pp70NlE+BbJEztjmH+6p0lPUys755Q==
Received: from SA3PR03MB7187.namprd03.prod.outlook.com (2603:10b6:806:2f6::11)
 by PH0PR03MB989122.namprd03.prod.outlook.com (2603:10b6:510:3ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:04:44 +0000
Received: from SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::7000:d55:b39c:2e53]) by SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::7000:d55:b39c:2e53%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:04:44 +0000
From: Boon Khai Ng <boon.khai.ng@altera.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Thread-Topic: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Thread-Index: AQHddqIIvUOcjPI2HEaczr5Ryubb5LczJUF8
Date: Wed, 18 Nov 2026 03:04:44 +0000
Message-ID: <SA3PR03MB718781F6FF6BDF9B74F5EE18B47A2@SA3PR03MB7187.namprd03.prod.outlook.com>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
 <20261117-571e631490-net-1@mail.sdu.edu.cn>
In-Reply-To: <20261117-571e631490-net-1@mail.sdu.edu.cn>
Accept-Language: en-MY, en-US
Content-Language: en-MY
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Enabled=True;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_SiteId=fbd72e03-d4a5-4110-adce-614d51f2077a;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_SetDate=2026-11-18T03:04:43.442Z;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Name=Confidential;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_ContentBits=1;MSIP_Label_43f0520e-0011-44d3-b6f7-0e705cf4078b_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7187:EE_|PH0PR03MB989122:EE_
x-ms-office365-filtering-correlation-id: 2c67f020-0318-4068-aeb9-08df4520b243
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|55112099003|4143699003|56012099006|11063799006|261028144727099003|261026140227099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: KzQulhJEvoO0MwG/CVM/ROt+QFWMBMkq6cEWQ9N/JbkoEI0t8PmrjyszU4MEWvE61oxbMhuYTV/km2V3TQw1Tz3DqQ/CkuaY2mkr3cpzJq+ZwzYgqZ/9oTMw/W2N9g3xI2HYK4JRJOzIl/SVQXx30eS61yloWgu3pviP/qUVypOn4TgHBqxrcT00J7cCDsPnMmDRTaIck+whgbtQv8UZc+tgtafDtiIjf+7zhOii4Qu95G83eBbMWCH9vz/iZo19Tkcq6K3zXxzclbwV13071lIXZrj1Ae/SHnm0Uu8XfHERqld22GCuS2YaFFHLouxD3VugMA9TxVVMeC3/CF/SipS76TQxwNc5H32pKLkr9xpUmKvsMoTV2OG1q6WcbBtCxarskL2x/KY9ilrjVH6yvGeMiY140qEAU1HfKQkaw3XDnS6d1J3GXQrGjo0H+KbgtLvmXzK6I+IMYeVKuLlSzTBjxvV/qyRwus52aaewy0LlYZRR2lR/yKDF60JaoSLbJ+aAIzgmeCHD//KEuXHMzVuxIPPX2A7p23/OoVcikyb2YkhEFhjEg6DbmVJmazImtwYpKlG5pIHVQyivvLQFkoUJMsmsnDR7j0fYp0KBnDx0gkKEad1Xywq15IWqC0Pr/qASrognvEJdd5b0azvA+cXIznq9Vt+3XNIPzwSR+V02mG9jlrdbCS5qu5GDhnnMX6XsxnGLeJNJU3lUkiGkahk33u+OsIgrpjdXOWpz4TM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7187.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(55112099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?M/8rxftIJ4boVomk+Taa8+Vu6fdrAih2Wfzap+kUNYm/W6wCVBWMQ/n3hE?=
 =?iso-8859-1?Q?81BA9MIXbQWcBs6mMfDPuOhLRPI1ntlyZabE739Dc0r7EhVaVp1SR/UCNo?=
 =?iso-8859-1?Q?4sQa5SEWewCQ/hbYxt4oZTPPpGvbs7Amn09BiIhBdp+MsSjToLc2aPnDec?=
 =?iso-8859-1?Q?3Vg6+vLscIwz4WTdu7W7sLFRxMghEskL2zRyNhMoNf0crb2NmrSl5Ut/gG?=
 =?iso-8859-1?Q?C/7KgbZ5czvLYXlo8xFPFabyDd9Bqfj/xUYk2MFo8/jvAUTtPc7MxeOXzj?=
 =?iso-8859-1?Q?2QuWsgFODGarR3FOQNInMCXEJHENu0rLznCnWHXPpFN8QnR82MoCUiYDY2?=
 =?iso-8859-1?Q?YeoEyVlfdIVmEVq/qbHnq+PzH5LITwOJjZVUwuSK03sU1d0+ZFNGA2ueiZ?=
 =?iso-8859-1?Q?8BLDP/SyNl4hOQmubQBbuDIVvRmvogLJsYG3VA50xPJBjz45XgzQdBZ9Ek?=
 =?iso-8859-1?Q?U8GDWcO8XkYIXiSueWh0OwEI0jWgeHTp7DNGTKzGQHsawlZKjAJLvueMvj?=
 =?iso-8859-1?Q?UrJ+mYvy7EYbQSS5iviVWFxeGD9RlZe3S53qx4OySLoFAPm5rF+XJfErJ5?=
 =?iso-8859-1?Q?2w8iduDpLYR2fQS1hc0DQXhSKRkO1+YhWvKtiSn8FcuA+wVnbsb0x8VC9Y?=
 =?iso-8859-1?Q?UBJ7JGADYj6s8SEkIzk0ja21g5AMIesSPDE8CXXh/8ByAwp4ftaKI/Ekp3?=
 =?iso-8859-1?Q?QwgaVmnpauULLJDx981CaHVw468i+tx18RzfcVIeU9W5pHhRvFVAjoUnE9?=
 =?iso-8859-1?Q?g8DaNSRDjET4/MZ3LDjRLQPt+nV9NRCXQVszgv0odraK/dOp2OfcUTGFUK?=
 =?iso-8859-1?Q?eDEDJUwvvHwawMcI0o1REjPxApehuY3eOWA/KZA79jfRTLmaGFT2IS2Tyt?=
 =?iso-8859-1?Q?vHfEl6pXe5lsbKsf0dJuNw+ZEDtyurVowv6llx/CpFDymb2b06TmlchJMM?=
 =?iso-8859-1?Q?ewSOu+I7RoIR6jh+3yZ/JIf9yLqmeuTORtVyhUoKzospdki8UDVoxDqmOE?=
 =?iso-8859-1?Q?fRJagENHdxzrE7qja7g+UzVk+LKRNJXuovwa+vYP2LpAjGPxty/JuTVnRp?=
 =?iso-8859-1?Q?c75MWS21MWmcA9rsUoVTlbPmWB7sk+uAMNDAz1r3kkRbz+sJCU3srDHCt8?=
 =?iso-8859-1?Q?XhHPYXHtK4tm2sO4EQP7cvYfUXF9fZaWMYO+HhXTjorTVcXqpMVUkwKB2b?=
 =?iso-8859-1?Q?so8g6/EykcWutZTW7xw3Pf/9B0nuZUF2qJLywJt7P+VkbBSF/U+1fcGY6w?=
 =?iso-8859-1?Q?Y1BR+LZmvPmENEQxBbvcb86GrJulRVyz7ZjRlqH2LU/029ClblmgjHrcZM?=
 =?iso-8859-1?Q?xiwRLr8qqonW0SGBZbdj1owgtN8nniJqhJOvliybFggWDjKgcgk9lGqoGW?=
 =?iso-8859-1?Q?SQ/pV7JvU0DDHVHkJIl5W5fsl75iUTemu1sWWdp26nNputG3+EX83Y54Qy?=
 =?iso-8859-1?Q?150XdlH7TFTzvw8ASBVy141Rf6wy480iihniQ4zmk2giwkG8hH4MxP8ABB?=
 =?iso-8859-1?Q?4+PY5gsRZb+yJuUP4i4RWURWJ/OtyPz2p62KfTzo/jLten9SvGV6c2o/Hu?=
 =?iso-8859-1?Q?JdR8KAT5uNCnJZzW+ef7k41XJt/+E0696ZYMo4g6n2XNBnxFrRYIYEBNO0?=
 =?iso-8859-1?Q?0XNKRjejNEfenGcuAUUpOIoGwbbjvu0yiAWx1rF6uEs/pveg8Rn2CpzIT9?=
 =?iso-8859-1?Q?aGvGqDprj1H7YaYgfyUrmIvOny6Za61PCIfmjnVulgHDK/9aXvdi6QT4zU?=
 =?iso-8859-1?Q?IXYDQSdyRS6x4ikSlP1qQUqPst3OhVqXjgTC2B44xoNHfEkVk2RTJv2pAG?=
 =?iso-8859-1?Q?gb1IwhsS3g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7187.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c67f020-0318-4068-aeb9-08df4520b243
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 03:04:44.1643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqcznYhLbjKlZN8JuI3sqbr1CMEgc7ELGA/BHMeZ59Z7Lp9fKJRKWLLQcw7UqYPGiBwBPwCuH6XOkLvWm6kvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_190451_676404_2CE533A6 
X-CRM114-Status: UNSURE (   5.17  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Boon Khai Ng <boon.khai.ng@altera.com>=

