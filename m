Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FILXj1PZ;
	dkim=pass (1024-bit key, unprotected) header.d=transsion.com header.i=@transsion.com header.a=rsa-sha256 header.s=selector1 header.b=Zp8HKLbm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1D0vvv+3Ay/HYCaPwMHK8m0ezIgFwyfSeXdjl0oJUY8=; b=FILXj1PZrBizJwyQqe2qCvJE8M
	shKnsHYwcA52Q+HhurflILSppCnwalA+jwIqvSvg1/0VA1s8Xu/9vJmYGXUqnEN8/tN5OVNYAEOZL
	rnVmZVR7ktTsRg1jRbVozfhXePSBj61IdXR4qbk6KI23lncxfMAyhRWzFV3/fz7PHxnFiVidZZXym
	LJ4LX6jLQioPtt4ZPVPA3SPSjW4WkRNCtOBRDPCfc4kGve1NuKq30gGGCJnVefQVgsKiXM6dWP3DV
	rTzuMve7m9yOdGb/oxax0j0sDfyx8fv8HmZt1PYXxegI8w3vv+L0EHV5wrfx2cXx2lsdA6wBX4xQK
	MewcgeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPa1-0000000BwR8-3yNt;
	Thu, 26 Nov 2026 02:51:25 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPZx-0000000BwQX-1p82
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isLfj501qOXT350tY1+6041vVY1RduWf60wsJVMBdZXkKuifkzLwDAUIH0+DsG/SO2VQYA0b8Uq3u5bSSIyykyII9BY0jZOQv/y7On+XDoc3vdOQ1BgerhvYlzG1T877YZyjtvIzAgSB2L+pNcSTjo8i8FCM9OK3/STUgR4ZsWtKN3bKAJVavr7nbO3q2/8uwoIABDPvXPqM4tOey61ZKm1GdhLIbS8kiSim1jwTTeTuHZNpGlxlpz48d0Fq6ayJa6NLVFMXbXVP7yDU16mqSTBCLI4Cxx0vZPzuUa9DQ6PrNXtzS1LECVvSsx/alZ3pL1+UmND17Sc0TSacEbMBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D0vvv+3Ay/HYCaPwMHK8m0ezIgFwyfSeXdjl0oJUY8=;
 b=h/tTK19KLa1BO45t57TjJOb9mZKubc2amZmBpMUgbeZ1pU5d+n8NBFSQ9BrPBzjsLxUW3LVHH6yydR/A1/U6muWbgP/I/3TpIHQ6bLGJfJ2Q4EQ3QVxtq0LunCylHUfduujFk0EBBuIN4K+Cy+3Vq4SQ+KYor1xJKQFYZ7dMu26M11p0m5zIQW2mr5S/ki4aY+IDUIYRKdVdNEL747qCTEKCK4YSzlFOeiZN/qDfaWb+Vj8xY1GTGDnGFe3AJDb64xgwQx0Ab951TcqeOjpVnyQW0LHi2wy7vndG+uS9h7YyKit1s829J9u+BMHsPK7Qr6n5UXU1nbC1y8xRiZOlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D0vvv+3Ay/HYCaPwMHK8m0ezIgFwyfSeXdjl0oJUY8=;
 b=Zp8HKLbmGmNOn1yeKLKtIeUjZCVkGVBG4igbUJ5XknXRlpTfqhCPboR5Fh0xdftZdWUXW6lyYpkCFYBl+w/y8dzM/2x1pQRItSLhjNIZJ3UU6wtHl4q4tzvcip7cB2kRdjZxs/ohh1JU+BFn4/gYXUfGVfoZY1/dzlD7K6P5p9c=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by SEZPR04MB7356.apcprd04.prod.outlook.com with HTTP
 via P2P; Thu, 26 Nov 2026 02:51:10 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 02:51:10 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Song Liu <song@kernel.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: Always inline preempt count and reschedule
 checks
Thread-Topic: [PATCH v2 2/3] arm64: Always inline preempt count and reschedule
 checks
Thread-Index: AQHdfU42UFpDHpeUWk++THiW+ETkkbc/p1mA
Date: Thu, 26 Nov 2026 02:51:10 +0000
Message-ID: <f3e1dc21-7ed2-44ab-95a1-f00bc34e51e2@transsion.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
 <9546998cffeaf365f8f67901a48ef103945dc342.1795631277.git.kmehltretter@gmail.com>
In-Reply-To: <9546998cffeaf365f8f67901a48ef103945dc342.1795631277.git.kmehltretter@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|SEZPR04MB7356:EE_
x-ms-publictraffictype: Email
client-request-id: c81a5b17-e537-4385-9e7e-317d0bc51310
request-id: 9a709104-b53c-4bc0-8b0c-08df4b68206b
x-ms-office365-filtering-correlation-id: 9a709104-b53c-4bc0-8b0c-08df4b68206b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|38070700021|10067099003|56012099006|11063799006|4143699003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: rrm9vjZDBXDWnomNr0473HaEXIlSPBpVWKITeVBAStHKJ4sEm1q2GVWGbr8YvEzKBXW6d8BHZmTjC4koWDrIc77LMkvlCMTdXE9asRYcfcro/QRWYkPS57Up02UQZ0HveEi7HOfrUL8x5bjbC/FM2NMhdFLP8oE3Emh0VREm9JuDwJobviCkwOrpsGd7SMh9wXPNZwk9WCSpITAEvr+VeDeysSrULG9dX2oS36TbhDZdYGCaKnYouTcMxozafvom4YnxeKN0opqhjtq9LiDv6A69FGhnB9PvjP9uEM8v+D4mXVEu04QXsuD6jemQu4hP+RsDzUVPJnYcI9gCr/yW8aXBZL/QpaM7hxDNBMwLyV8MbZUSI1wrvIESG3D89+fSt2OgUPj35bdWcySkRGo6Sv8CLcJcu3gkyjDuq0Bd3HUNmVkcz3Pj/wa2VQV6xy/07kxWnC0TvFffmyUQQnutUVnb2+xRbOjPQsPTQ481fyhHNxrlvXwHuXRNDjwhyvaIgVTtahUF1vkHcYIg1V18bNY9squBecshbWLXMjZefmSSct3zjbpmRFDTjO40ARHRowCB+Uivmd13rNyyJqX9fRVsGUkP0DwBb1YP4qifoyTTrGEEFjYAu/qdTDmbJ+hEkP9dFrNksLv0F0/9G4/UGucW/vLuDmQl4nzyX75u5+LOWYO0x5XKeRo4ewXgMBGhImc1E7WnOfOtKi/uH1+74HCU7FREds/hPNUcyFowd10=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU1sZ3g2WVNxOVhrWm1lY2ZXUVpPbDEvWHlhcWdaWXNBZGdXL2xMWjgzTGty?=
 =?utf-8?B?ZTQvd3ZiTzdwa1c2clI0enV0dlpIMXlOa1RwRWdGK1kxRm0yZG9KREc3UXBl?=
 =?utf-8?B?S3BkRnBjRUtNY3ZoOTg1V0ZKU3gzWVhyMWFXSCtsV3MyblBBUHhqSVhVcVBW?=
 =?utf-8?B?WlZFSEpUWnRmR21lM05JR2gwTDFtMGt6bm9ZcFN1UWExeHlqa1FiOFhjMXly?=
 =?utf-8?B?R1BEdUQ5UHpGODMrZDIzRXluMVRoaDBrcnljcksrWTd2NVhVcG5DL2VoUXdZ?=
 =?utf-8?B?a1ZabmMvd2dkZ0h2ZGJnNzV0QTNQL1JxM3pva1VHRjdhaHFJRStiWXhxOTN2?=
 =?utf-8?B?Y0c2RElkT3JjUFNGZW1IMHMzK0VlMlhFeG94S2tqNTFJRlZiWXliVlBVMERZ?=
 =?utf-8?B?a0NKOHQrd3RnSXRTSVFFSzhua1J5YmN0MUoxQWtqa2ZoVlFvQy9FRDZzcXVz?=
 =?utf-8?B?eDVobGhYT1piN1VYMlloTmwwaTNuaUcrQkFrTUVySWt4Yk1QeTAyK0R1YU1D?=
 =?utf-8?B?UmFwTGl3d2xianZaMGh0eklJSmg4Qk1VblNDS3ptYmQ5Sk54YUoyWFcxT0dO?=
 =?utf-8?B?eDgvOUtCOVQ5Vy9pT3dZeklWclVHVTQ1a09paG1rMEJLZjJhSC9icEZSaFpM?=
 =?utf-8?B?VEZ6dEcxNHIrOWtONW54Sk55WnJVdE44cGNKelg4VW1qOUo3M2ovTEFtQlhW?=
 =?utf-8?B?Smpxay9iUTdycWFNRk5LUk1jZzEvMEJESS9ibUtnK1A1QlhRcEx3RjFWdlJC?=
 =?utf-8?B?MVYxeGV2d2hnNDhYNDZ4WUlrdHZZSTBhbms1K1F1QWZzT0RIS2tDK29rcFpl?=
 =?utf-8?B?ZmNFVVMwVU56U2JKRjh4Vk1zSDNvdmNGcXBlWWE2WXpuUkV6QVNRcUxHd3FW?=
 =?utf-8?B?QURXNGhvczRRS0V5R3Fkb3cxTktOUE1XbE43ZXdKODJEZ1poR3V3TEx1aVZW?=
 =?utf-8?B?M1k5ZklvTUZHVUpRZnRaK1ZVdkp0Rlo2ekcwLzhiVmZkY0c1UHdsZW1UOUov?=
 =?utf-8?B?NkZNWUJCdzFKTjdHRWJpU0tkMkZHZk5jbTdKZ0xyS3pGYk0rOXQwMnF0eUNX?=
 =?utf-8?B?V1RUTjZDRW9UdENReVVPVFpCY0RQQUZlZjRlNjMyamM4N0d2RzV2bW80czZL?=
 =?utf-8?B?c0ZNN1M2SUJaYzhEN084ZmFOd2QrbENLOWFEUDgrd3pnZkNueEtBVnB3Tzc3?=
 =?utf-8?B?ZXYvWmNJYXlUVTkycTh6OEFNNkZZZGlyRjF6aHlkNmJYaUhyM2JWY1RqcFkz?=
 =?utf-8?B?cU56cU8vU2JwMjhQd0QyaTFldDhyQWNLVnZPTVlET0pLeXZkczRSYUFRUi9y?=
 =?utf-8?B?THplLzMzY1cvZWo3c3laa0hKZnZjVC9BVHNzbzdyT3FNREs2V1kyZGJicGhB?=
 =?utf-8?B?U1U0VTZnNVhzT3hRT0Y5M2o3Z0hsaGNveDlpekxTOUx1ZGl0NGoxN25pampi?=
 =?utf-8?B?MGtzT1MyVzVkazRPVGpxd0E1NW5pTWtKL1Ara0Noc2h0cSt4SmZyVk9FNTdM?=
 =?utf-8?B?TGxFaytaTzJaenloKzk4a3l1UTVqTWljQXRPNnpkY0ozM2phbjQrZ1g2Ykhx?=
 =?utf-8?B?R1VBcTV4bG1TaWV2TkhlVGR5TDV2Z3VNUDU5NFdUb2UzUUI4R0xFTzlBdlBv?=
 =?utf-8?B?cnpUS0lnUXBOb3JXRTVPQnUyMnJURzF3N2ZlZUdJSjlFSEdqRXNmcmRYT0I3?=
 =?utf-8?B?Nno3SDRqVHluaUNJVjlMWXZIdzRJVWhLNXlZT2RvempSUE5BMngyaVlINi9W?=
 =?utf-8?B?Yk1EQUE3V0ozWkdqMS9PUnoxeENQaTNTVGhjUVlGeW1CUStvdXJNb244SHRn?=
 =?utf-8?B?NmhwYlkvQzZxZmNLWnlwQlNYOXFIaXFMOXJWakprbGVhY0ZhS3dYSDZ0Ukwz?=
 =?utf-8?B?eEZVNjQzRjY0U0RqMldNNGJVdDFtb0Vid2xPTlBTcHV5bUpRYWlYRDN5TXVH?=
 =?utf-8?B?VGd5SGN2VVUwNmtadEVDQm9BcEVCNVhpdUVKcnExZm1uZlZsa1FER3kyU0N3?=
 =?utf-8?B?d1p0WGFuTGVFcDkwZFB4ZitERGhZQnNoYTBmelBKdzNrUEJDeW8zQVVqME9t?=
 =?utf-8?B?Vzd1Mmd5dnN1OXNxeWtNK1VEcWtZRm5uTnJYM1U1VDVJYzd4UmtwRi9TRmox?=
 =?utf-8?B?LzVDZStIOVBYQWxWOXFOVFpCai9mM1M4L0ExR2pVNVdjMCtzbkdqK05TMXNp?=
 =?utf-8?B?Z1pYNVcxOFJJN1JpdktpZ2YvOSszL2IxdHhtQitBL2l5OThqUlEybFc3K043?=
 =?utf-8?B?VmpuS0ljQ3kzNWd0eUlIYnhJK3ZwVEJzQlFzdHZJWFhuakpkN3JTSmNBbFVs?=
 =?utf-8?B?U29CRWdEZWpFVHNZOTJIdUhTK3FyK3NXRi9XMkJUbU9DeWljYlF3R1FOVkc3?=
 =?utf-8?Q?igF5oyslTPAS74lY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51F41C0C2506B745B97B4BC53DCC11B9@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a709104-b53c-4bc0-8b0c-08df4b68206b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 02:51:10.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjYmMjTLJ+EPE9GxpSdMQHzjjb7M0zLI6jTqkOzBZ3vbzXqrB8su0HpNGhLaUlYOqzmxXxzGts/2HzxJZkBitselF0gr5fYCDFzNJWtntvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_185121_522162_6A5334DE 
X-CRM114-Status: GOOD (  11.45  )
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

T24gMTEvMjYvMjAyNiAxMDozMCBBTSwgS2FybCBNZWhsdHJldHRlciB3cm90ZToNCj4gVGhlIHBy
ZWVtcHQgY291bnQgYW5kIHJlc2NoZWR1bGUgY2hlY2tzIGFyZSBwbGFpbiBpbmxpbmUgZnVuY3Rp
b25zLA0KPiB3aGljaCBwZXJtaXRzIG91dC1vZi1saW5lIGNvcGllcyBpbiBpbnN0cnVtZW50YWJs
ZSB0ZXh0LiBUaGUgY2hlY2tlZA0KPiBub3RyYWNlIGhlbHBlcnMgYWRkZWQgYnkgdGhlIGZvbGxv
d2luZyBwYXRjaCB1c2UgcHJlZW1wdF9jb3VudCgpLCB3aGlsZQ0KPiBwcmVlbXB0X2VuYWJsZV9u
b3RyYWNlKCkgdXNlcyBzaG91bGRfcmVzY2hlZCgpIHdpdGgNCj4gQ09ORklHX0RFQlVHX1BSRUVN
UFQgYW5kIF9fcHJlZW1wdF9jb3VudF9kZWNfYW5kX3Rlc3QoKSB3aXRob3V0IGl0Lg0KPiANCj4g
Rm9yY2UgYWxsIHRocmVlIG9wZXJhdGlvbnMgaW5saW5lIHNvIG5vaW5zdHIgY2FsbGVycyBrZWVw
IHRoZW0gaW4gdGhlaXINCj4gb3duIHNlY3Rpb24uDQo+IA0KPiBSZXZpZXdlZC1ieTogSG9uZ3lh
biBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEthcmwg
TWVobHRyZXR0ZXIgPGttZWhsdHJldHRlckBnbWFpbC5jb20+DQoNCk5pdDogSSdtIGZsYXR0ZXJl
ZCwgYnV0IHByb2JhYmx5IG5vIG5lZWQgdG8gcHV0IG15IFItYiBiZWZvcmUgeW91ciBTLW8tYiA6
KQ0KDQpTYW1lIGZvciAxLzMuIE15IFItYiBzaG91bGQgYmUgYWZ0ZXIgeW91Lg0KDQo+IC0tLQ0K
PiBbLi4uXQ0K

