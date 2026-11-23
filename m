Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD6C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nqWy9kXn;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=WORRtsc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8xEcf+JyXjOCRv3etNU7OeMjdr0ygwgHqZHtKv9gdYo=; b=nqWy9kXnu+QcfREBFiK99ntRUn
	YK4Bg85VdJLA3TTlYDst9h7Ml93LwKaj6WUs/MnvtfrxS7jGejlPurGR5+zJFDl3uqBc67LlMc/2Q
	2GcVXXbHEztGcD6qV1sTILwLB4vomT06L7tGdEHIqU4szhM/BbfbjVc6aIaASFB0jAlQuHzwvgcEf
	JLN+pIX66uWKeQSghXCB5L/7WjNWp8AdlM1xXnM6Y1neXruLzPARAIsKQhE07ZUqVbHcxSc4bFXFa
	TcsqYFHUJm7bMFsYdhFfnMRIG4EZfQyATgnygq20X1YtbLxmm+uGiSOGbypVd4ijLTn5GQGlol7n4
	gJMRgv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQCy-00000002gHO-2sWY;
	Mon, 23 Nov 2026 09:19:32 +0000
Received: from mail-koreasouthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c410::1] helo=PUWP216CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQC5-00000002g0o-06PI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8zDj+b5NOGkmiZzDU/V0m15enOHTmNbNf17hKb6ByXbkVrKl6XHzin5ZJOsc65dpaghnInwq3f6NbbtR7Gdrrwq16IE+Ryy4BrAO3eS1fXCUTAjvqylL9EXQNTUb+j6Qon0PtkqfQ+HYkrUpCnthP0ixgvHJ/7MCzXHarOOxikLQXGjElq13XyBfTKxEa12/k1WHwGvcFNlFApgvaaVTzJIGJR8cMSv+SiCehalj29Rs3ywSabohip0WKAp3hFu2VB0ap+nkjZhpyStG+pPfzNwgqdlzfzJSb8XtTiEZ4/98z1rNZ+aKKHKtglXZh9Sx/Q3jw0vxypP/VequiN+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xEcf+JyXjOCRv3etNU7OeMjdr0ygwgHqZHtKv9gdYo=;
 b=T1T6rvueSfkMfu99m+enAyMJC3cyq6TfZfMDxBazuJA7sk+vYNCrpaex6wAATk/BXaPcs5gK4eR54SWjDX7I/Tr8ojOLZ0TRvD+4ZqHKOH4rh7VQcGGwYnT+C8gg2ZkH3qV0LR3AcTuwmfOiMHxTFsvtvzjK+YtCjbgiWGbqztiT5T4QH+Bf8MY1IbklKjG7g/0JCJ2Z9MbIFqdjcIo5m7uvI/BWsZcgZlqYRvYoJl3v7Dv/t2Jr/rcya8tO+NToDWgUutuJ56zKe0plqU8iqMglHZFFy4hVfd1kIy/sUQE+qECGgrrpNnJci/nbfsCxMVhpo8v3xCIrQcg+QDq32A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xEcf+JyXjOCRv3etNU7OeMjdr0ygwgHqZHtKv9gdYo=;
 b=WORRtsc2LXDgsMhKbbED4aXMdhPc+2gwcKJDxbZVepphjj9PppY3ESM8gPaoshKMLvlMX48peerTiTNTDqwenHoOBawr6Q8v9lF5dA7OMT/qg6moWaKxvmVe8CKVr6/CSNM8eGEa6pdUigrMDg9b9yUy4EAA1qPTXVxMHz3BysjaV27oaAGzYiWZdv3PW3gtvTkQmN/rkJ8zrtq7XxEA7E6ApMGdU8inob/Oxgg1shLPvOLfXByRxcem/BPtri9xm0Rz5feQ4QFy3SClI9KxIrkmakoJRzXPtrEkJZLDDojXDyUAh8qmQ5XvK4JBVpqIenz3vmVNDK7Sfn1s6OtipQ==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB1826.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 09:18:14 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:18:14 +0000
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
Subject: RE: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Thread-Topic: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Thread-Index: AQHdeARslT7+PahjZk6zjlKKFGa+pbc14MWAgAWF4AA=
Date: Mon, 23 Nov 2026 09:18:13 +0000
Message-ID: <SL2P216MB244104B49860D6D6B3A92821FB452@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
 <av9iadpXveXGb0R0@SMW015318>
In-Reply-To: <av9iadpXveXGb0R0@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE2P216MB1826:EE_
x-ms-office365-filtering-correlation-id: 838553d4-c788-4b7d-d296-08df4942b396
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|10067099003|4143699003|56012099006|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003;
x-microsoft-antispam-message-info: eJ5NdXO3b1Dhpv1k2OHMKuI33xleU7G5UgwJkFZ1Gcc0ZZSmiw6quP9ta/iD9cM2/+HyhfLvaG56Pb/vtdlK0puQjbXujDIovFDZ3I76MjJ01cm+cO0INgT0uAV9gfWX3rb3m3t28DwJnFztI28sOpifs2IykYkqE3kMjK3n1SVvgpAv8pGTcd3tiIh28ZmchFuaYCvdEbE4uKGXjkdZl7gpGXoICOgVTJW2Rwfgj7QFgAenjJ2p2KHbyK2RjKCaNddAtOEMHMFzBjGBoxglsb0b1sOOjrO3dq856wwlACqCWdnbx0J6UeBcvzAfxj/yiz4p5cAYs4qsbWsJLe9j3cg4/Q1OhBKCn+hkINhHbBHW5r2PPqJXiVJCcOvXXr99Mh1Tlaqtxa3/6Cfm4hCLbNqBTWhg9ZjEwSErTDS/Q0wqPYS8taggQQnqaSrfHc20sB/AtqVAryqL+CRvbZPoQzaqsTLf+uCZC23EJeVbTcHN8PJCh3fQZTraXKDPBqHBdIZxJbzaU4zzSzXnoZckF8lt/+HQDtb6zCfenlwBObQGtxdfrwznsQ3SFZG12jWwE0sJcVRjYXa28CxPQn40bkSNJNWvaF7uJNl0pSKif6vkzq5Yu/YHdytW86WAUHYVDCM6wj5oZf/EqXbXzd/szQPqGAWD2vxYe2kMtPNxH0mjEPLiiIj6FtXhN44yOXvSbOPvWxQmo480UDfQHqsFvo2ZPfl3HpZDhnWRYcSwRFM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(4143699003)(56012099006)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s4lkpaZnhfa9KsKJnlYWQSaXePtM25XaoDkPlBRCxVl5f2b/fpJZFJll+dvH?=
 =?us-ascii?Q?tC7TUfx1duRk69cnfR9xKistE/uaVhexOiK/msOEEJ0nhIPh8exSw4M4IhAu?=
 =?us-ascii?Q?xkJ7GBr4vfXabQwZObvrD5ekPxwRI6MLuOymNJWAQO9uI/vXGYCXuIB3z7CQ?=
 =?us-ascii?Q?M3CgIVOdvhTprTBqkTr9uEicgqMJsG+Ez4LQioV8wfSleX0jjG1anuzVGB0e?=
 =?us-ascii?Q?yyQjhiStmHq3JIOEAOsZ6MANVEibxdgTMTm1cI2pfYGszO4iDf6TRQuP9u0C?=
 =?us-ascii?Q?poP/4y+yEm4AUeOjHZdhxQl6prF4IqTTMpNIdyaaCEfN/2R3t4F0Zj3E1dh8?=
 =?us-ascii?Q?RLgAQwNtAZIfE5Sll0pbS4OXG0KptXrzwWbc8sNPwbqlVJqUOCxQWl0EUNJy?=
 =?us-ascii?Q?37nj32fRxUiQyqbo6Ttu3no8UtwYWhwQwpmoach8/0DWgB6hZ77qT4RATZpm?=
 =?us-ascii?Q?6WWXT/7r27tKzXo6rZsvcVYLfRKNOXbHASPCvSCzQJkn2dNjTWpj3A7v3hh+?=
 =?us-ascii?Q?xbNzKW36VwK1u8AUYGucq0377ixkmCQ4piQobZSo7ULSzix6Agj1DkREsZmX?=
 =?us-ascii?Q?Ob0ke9aLCt/qEqH4+s99MN6MTQVEIdob77Iq/LS8fda/AtMhdqms8l2Z+6eY?=
 =?us-ascii?Q?uW+GaQlkf7rSfh1EcaxW0U8r7SOefjcpCddT8wXzsdtCmyNQNCOf6HYW0Hvp?=
 =?us-ascii?Q?6rPiR/D7A1CeTp6ru4BUnRQ5Pbfi0TFlGsHijc6iKIgLwpLwSeBgH9SWmfsU?=
 =?us-ascii?Q?rXIdlm2fqpcv9ySKoPtK2CDebFZKtM0ci8xiQ5Cj7uF5nWiAehXd4Lda6FA+?=
 =?us-ascii?Q?NXTVN6zp81HoDbSuyMdb+u49XYNd9zbw4pCK2fPpiySO32j5pkwNmLa64PT0?=
 =?us-ascii?Q?vU8/aEc/mWwShSuxaY52/NxL/rSxlLjpHs+FFiBvYdy7bU4ZnWL5clv1MQy8?=
 =?us-ascii?Q?I/eeFRQPNtF2TkquTq39GSN8OHrsWW7Ony2tO2Qag0wsqrVnscgD7wvO7uLP?=
 =?us-ascii?Q?X9VvOjBblOt8PQu6SJ55pfC1NezCWotwmfOi5zkv7AykL7HK+Kn4w+OzcIY9?=
 =?us-ascii?Q?6270d8mKEkGqya8hjXdMYfvSD1Zovrl08uwGy6yxE2rR9DymEXAX8v22qajk?=
 =?us-ascii?Q?VRbHDqPbZxOLCC1dCelT2kMAOG1lpUeey4WWFLiVRiVABeOA7qMj3ZjyCeUS?=
 =?us-ascii?Q?5q3Tqj5v5IkzelahzMJwsIieIAC60JN4kUCvmRhH//6VLGWLy0xcw/jE/R0B?=
 =?us-ascii?Q?Kh/skBIxgwa4lxpxuMPs6tQ12MdSx5WuBzsGUldJw0VZHBhzdCbcxmCQ7h7g?=
 =?us-ascii?Q?dMs0HykNkmj4wKD2B1mmxjHbeWQfEKkJZEb1nF0B5JFcbEHDpgqhNDObBfE7?=
 =?us-ascii?Q?W8viVCSmGn0tluDr1oJu5284zFrGHfzVa+pNiVgixhxEPBVr1tWIJw0VneOt?=
 =?us-ascii?Q?Wd/K4UCHi+3f4vtYQHDf0jJ7EnGKkXJno8cleJQR+IA97tQRn7NIobq3Bhi4?=
 =?us-ascii?Q?d6znjrn20Oorr2KrGRuaA5UrP5H1njpqN3ElGUbS/MOQxYTR4kRzGE2bw1Ix?=
 =?us-ascii?Q?fVG9vAHUrJx/5Cdf7Vu4AMdN6T2AuKfj1GAae/tlarl2iFSXXJxc1ZkhT1K8?=
 =?us-ascii?Q?QVS5GdqaeJodn3Udi1RPx0T5fPU+ND4mtGgKJek3l2fLtHVGiwLNn9Rr4SlZ?=
 =?us-ascii?Q?GDqAtjJEDy9a7TQ3V9WAUKhfwVcN9/S0LQOAy8b3umDct53o/TJFgeT7j9iK?=
 =?us-ascii?Q?8curHs+Ing=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 838553d4-c788-4b7d-d296-08df4942b396
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 09:18:13.9546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOJh6WqfKpDQJ2Cq3B15HZHuLpQFndY4kv9uaPS4js/UgFceyqkNyhKyo9IIWq2x2BImM0uOG9enZ07dBDBJjs97X2HM0cSk00UBLeODZKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011837_387465_0326948C 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, November 20, 2026 5:56 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
>profiling
>
>On Thu, Nov 19, 2026 at 06:00:03PM +0900, Nas Chung wrote:
>> Add per-instance performance profiling to help identify whether a
>> throughput problem comes from the firmware or from the host side.
>
>why not register as perf interface?

The numbers are kept per instance (per open file). Each instance has
its own fps, latency and min/max frame time, and they are updated each
time one of its frames is done.

As far as I know, perf can only count per CPU or per task, and a device
PMU usually counts for the whole system. So perf would only show the
total of all instances, and we could not get the min/max frame time
from it.

Thanks.
Nas.

>
>Frank
>

