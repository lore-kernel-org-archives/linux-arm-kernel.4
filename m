Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296A3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lLuFPE5j;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=f2hTdWVd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qxz6R+j9XrfaGHKg3vX9N96N8OcdlHnI/XLnlnWqmDw=; b=lLuFPE5jys98HDP2Wbn8edFluS
	V/Z5OMgu7Qo1URoess0jNur5b5VzhbEPr46+50GooXLt5V/7xgTJQ9QWiI0vWyUu4x7D34yPLAaB2
	FYUZeOSXOubu/rJNYq9mHZusCJU6iUc+oR4cQ41fS6CWl6aiquK14dqoEG+C+kfWiMUlBhMNexmjK
	E2zsjVafQijZgOXdGtQM9PbHGUVEIT1P5mj7cRJDYy9M35d+AYbMWb9xHc+KfgYMpJn3kkIh95NlE
	HSUWtVzJe8nJ23it15sA7lyoFhxrpzF4ZtnPU2VkIX5fwRpF90E1ksELXZWq4accyQyVIMf/xxRTe
	zvo2Nd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTZi-0000000CFFc-1zw7;
	Thu, 26 Nov 2026 07:07:22 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTZf-0000000CFF6-2tid
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:07:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp9pXaLCYG4e5w9iasgJGMJa6aLAfhaMpbHcxQdvKw0LJba94wJG7a9uoBduuCi7ApEAbCIHnGykW+cOTgc5ktZRXFjVj0NYUC0ituITwN7P0KWnhw5ScaImelz65YAPQYy8ne7s+Fbds8zZSwFVnzmdiUjICaWKlKh6ib4dpd0IITTL8NfqksSWjSVqOlMSeplO6cqi9axMpXBBRFR8reGkqoe72RNkntA6OxO6HvFqcnskPJeI+ZXV5zc2+DfFT8Ax6N863cRu0dOt8KYagAtQJDc9BP3P5GViitpgFt1ZyuwyKD6Aoo4qZOkY8Wd/BXQXGd8yhhqg1tQF6QKvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxz6R+j9XrfaGHKg3vX9N96N8OcdlHnI/XLnlnWqmDw=;
 b=oAxSbLMA7LWdslkkPcyu3kBfGFonmXKfPbBXnq4ioc6CqwBMKu2RZ2ImNaCa1Q3MLCqu7zs1IGcPRFW74i9iGhDg/FBd20nOEz4v2L1ajs6x1OK/wyJPJUfjsYSj9Cp+NI3gt4miln4M1Ru5z3hLDpklc6ddXk02X7JiJ0W2j5enX3cMREZhvBJNvbCyMc+zanzH0vYzvrBAtA3RJM3mSoGF/1DVPisVlyCnKgLp7dlko9OuOvUHL1nM8ZCj9YMbbGS5mNjvst75vDf/GOCBbnJB380/LSCo2a9rPoNqIWPuXOVmpGuq9JD85a1wChNKxybatfoSvnAxkSsghASFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxz6R+j9XrfaGHKg3vX9N96N8OcdlHnI/XLnlnWqmDw=;
 b=f2hTdWVdHlyklBr2nUQyZoPCYSNPNbnGTn/AoKcCEjOWcCUpko9FGT/KnDb5AABCjLivA6w/i/idMGkzkvUhCDBMPOiR1potDGb7/bpg/B3hdW9BQZamKWKZJPMqXsZTrszZ83akQe3JizNyZWGenelFvpo1k7X8XOxpJCHzAspsnSei4M3IhMeMolNXiVWq93PTPzzitCyZD+ENe2DMCfNGzcgmgxgYHUkabsgD3fDCht/0gPW6xDq5FcBJm3vhvFqISW40+t0kbILnanH1Ww3mB6YPEQ8fiPvDSyCTbFiSVeZKuRcqHUB4wAbARpqi4knZNcH/+ER5FjDSoBxjMQ==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TYYPR01MB15663.jpnprd01.prod.outlook.com
 (2603:1096:405:295::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:07:12 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:07:11 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Fenghua Yu <fenghuay@nvidia.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Will Deacon
	<will@kernel.org>, Dave Martin <Dave.Martin@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Chen Yu <yu.c.chen@intel.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Vikram Sethi
	<vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu
	<newtonl@nvidia.com>, Richard Cheng <icheng@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RFC v3 11/15] arm_mpam: resctrl: Add NUMA node notifier
 for domain online/offline
Thread-Topic: [PATCH RFC v3 11/15] arm_mpam: resctrl: Add NUMA node notifier
 for domain online/offline
Thread-Index: AQHdcJDDQvSdAILQMECK9tMEevzbl7dACA8k
Date: Thu, 26 Nov 2026 07:07:11 +0000
Message-ID: <TY4PR01MB169306FFBE80FC073877C39218B422@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
 <20261109212427.1409204-12-fenghuay@nvidia.com>
In-Reply-To: <20261109212427.1409204-12-fenghuay@nvidia.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-11-26T07:06:37.117Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TYYPR01MB15663:EE_
x-ms-office365-filtering-correlation-id: daff923c-3a98-4fb9-ac5e-08df4b8be443
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|38070700021|261102123227099003|10067099003|56012099006|11063799006|5023799004|261022105027099003|261026140227099003|261022075727099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261009223027099003|22082099003|18002099003|4143699003|6133799003|1580799027;
x-microsoft-antispam-message-info: oY6y/WpcJp5lU6zhXxQlYmfbzOoc8mtFVobG3qSPAM1WLiudNOq8GICwxYdvNg5ks+fdwJI21esK+iD61ySKT/jjWB5UyzmfzvbFAkO5230KLMDHXDeumrR5ZJlN23Wq5BBqKvEJgoPOX1pm5Z7LFLyzOhvLcpyF8OC6xg96VmOwkcCilQlFdC0bixxKwcsXqBhFnlIU75eGPnoSVG0wRVcpqRMEHLqlsaV+Q3Ef/5AWYtUu57Pn0CrkYxN/rvKo9clnk8McmdcZ+PWDy4JsRIqcSZdn+MsRRcieDxrZfiLUmqY1WoUwTTZA4SqZ9PhwjrhcM432B2OT7NtbryhZz7g2FaacLmRuJZtvaJrdQ1mYNnLWrOUyatGUyuQhT33yMB05EOuvwPyodv04pj3xLY372Amjbopqz8y5NFnQxjOQ+/WK9HkAbEnLflcySoFwxvFxfL+vowyf71CXanGZya4BYubN5Ozzwxgn1UWPS8TvobrTB6k7p9NwAqzzFxG4Y1Ztt+5y7suV4zhv4qqrHAbVGIeq0ihCpjRyHFw5ypiCBBAqImZvaaJtcWK+l1Snq8zIgq7X86Bv3XQw2lHh9XADzfeL5Aj0b4eD1W6Ee/t2VPdsRX/KNX4BwEK3XdW6eu9TRr0kbDQpHKnn86Y+y9eXoXNnKTx14ANKOBOy9xU8uyLCmt7XBHzRerB/X1NVwnSDWixy6rF2XGHIm9qUregRP61tw27Tomq/LvEK+Jz2KMgPP0W5OPCxTPP8EyvoPX629XFDrgTamFbNcKZJuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(38070700021)(261102123227099003)(10067099003)(56012099006)(11063799006)(5023799004)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(4143699003)(6133799003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?QzM3d2wzRVhuRFNXYmEvZDNYUmdHOXlMbEIzUEp6QTlOcUJaeVRYNVdU?=
 =?iso-2022-jp?B?SGx6d29STGZNaGZ3NElTSkhYOW8vSGV6a1FldU9UdDc1WTJjbDBUTjVN?=
 =?iso-2022-jp?B?R2lqQUpRdmRpditibkxEeXpWRnFidGg5UGsxZVp3eE9MdDg5ZzN5cXhy?=
 =?iso-2022-jp?B?Yzl0Yk1WekVIakdRV203bUhLcFRjSmgrWFF2UmN2aWFrbTVrRnd4Wkhi?=
 =?iso-2022-jp?B?aWxpbkxTWkxNRzFGNTh1bjBzQndjb0JNcjZ2TXBwc3MwdDA0VlNHc2Vo?=
 =?iso-2022-jp?B?TE5NRElVMWtTVUpOcURlRjJGTnlVdWNUaVZKWWQ3dU1rWFQwamRMNmpL?=
 =?iso-2022-jp?B?c05ZcUx1em5EVkFnTkhFdHZsR3pINm1jYS95alMrd0tKbXhCVldQc3R0?=
 =?iso-2022-jp?B?cWFqeXo1bHkrZ0lIT0xxQkJvT0lmK0pTVnVwSzMrYVJBV2Y4TENpT21F?=
 =?iso-2022-jp?B?QW80Snl6YTV6QnV3dXJ3dG45ZHJYbVNPdzd4aDYrT2hTbmlSeGlCUXlX?=
 =?iso-2022-jp?B?UmF6aTgyM3VuRmRDeDk4Z0dNZ01nMTdIVzg0cDBraW1CeTEyS21aQ3VI?=
 =?iso-2022-jp?B?a0R2Nkxvbk9DTExzVkdCcFpBRnV0NVZYTEdFNzZTaW1JZHkrbEVHTHBH?=
 =?iso-2022-jp?B?aWtldStKeUw1UEJCMmNudGd1Nnk0TGlwd1h2RytXdHRKVzVKTVNzY1Ri?=
 =?iso-2022-jp?B?a1diRTN1d04wc1hHRGlJQ3NXOGtuRDJZWFpPNm5UUGhhZlUxT1RQblll?=
 =?iso-2022-jp?B?NFZxd1ptZm52aEJOV1VNL3VWc1QyRnZvWGloNTQxL25HajBSanRnM1NK?=
 =?iso-2022-jp?B?bXVwSWtTVmlwclJUd2FXRHFRalAzWEtuSUM1WjVnc29HbnJnaVhsM1NG?=
 =?iso-2022-jp?B?M1RIbjFmMjI5SC9OaVgwTnp0ZVAvUDVnNnQzSEI2RW1mVlVGMXZOSGw1?=
 =?iso-2022-jp?B?NGV0YklnVHlLd2RCZXlCSWhFaXJUcCs4ZHVTdnJFR2luck5sak43TUsz?=
 =?iso-2022-jp?B?RkVUeU9FODNTWVhzSzZOYysvM3h0cFd2Q3RuVG8waWEvbFF3dXVSRHpz?=
 =?iso-2022-jp?B?dUp2T2liMzdTYlN2TWJkWlA0YnJJZnlaVlRXTXV3VWJ6eTUvQWw2YkpX?=
 =?iso-2022-jp?B?MnJzaDRQWCtXRGFoRzNZaWZ0VXphMWg1TnNnejBxOTVJaTFhSExMYnJt?=
 =?iso-2022-jp?B?eHI1OWtmL2FRYi9Sd0pvWngwdG4rb2pPRjk3endlSWtQaTN1S09QL2JV?=
 =?iso-2022-jp?B?Q1orMCtEc0lBOXMzSm9rdjlHTmN5OWhhQ3FMNnJhR1RmS1BhMk9ZVE85?=
 =?iso-2022-jp?B?TFBCVjlhd1VCQWh3T296REJyTzAvUVFCMkIrTm4vU01SU2o1TlFFVDBO?=
 =?iso-2022-jp?B?YTVVL2NWTklPMk9JVUlUNGd1S1pQVER4QjZnbFJQdEZSaTJTSzlDK3A3?=
 =?iso-2022-jp?B?ZWhzWVBRUHpHM2paQnRUQktXeWxOakdpSTZjSFkxb1J0TGZkdGVsa1JT?=
 =?iso-2022-jp?B?NU10ZEV0cUQvTm1rdGxNNUFJSTlaVWp4bDFLQkZzanZjZGlZbDdsRmcr?=
 =?iso-2022-jp?B?QWR2Zng5eEtXMlRUSzhmU2lEK1lMeERVR3BkU3FzRjFzcWgzdTBDQ3Ex?=
 =?iso-2022-jp?B?ODRzTzByeGEzc3FSN3ZkczdDV0ltcElkVC9jYkZyS3F5WFFTWEhFc0h3?=
 =?iso-2022-jp?B?czlVUG1aOU9qYnVyNExxb3R3cS9KYi84WEFSbWRyb21UU0dJTWNZYU9o?=
 =?iso-2022-jp?B?THJsY3BIaDdMbTNib25qcGwwU0NGcnQwZXZKU2R3MFg3dmxHWWZmT1ZE?=
 =?iso-2022-jp?B?Q0loVy91azVGU01ZYUgvdFFDaUdNbkMvTzE2cEpLbWJ1d25wR0tYcllv?=
 =?iso-2022-jp?B?cmlIZHVMUUVQYWdBbnI2L2xIS3ZnWHNIR092cXc0UTMxWWlueWx0RVNT?=
 =?iso-2022-jp?B?OXkySW8xWGtCTjQyUGlFNlhoQ24waitXSEIwQTJsM0UwZ0dhcndDSXNa?=
 =?iso-2022-jp?B?SUFHMGduWHZ5RlNueGFEejNrQXJuM3RkeGRXOFpoVW1qalR2eXFNSzRn?=
 =?iso-2022-jp?B?RmVhcVpTbk5qaFVRNXFMVTBtY0h4V0QzVklrNm0vZExwR2JVTnlNTkNk?=
 =?iso-2022-jp?B?STFLTXIvVlpMKzJXUXhiY0dkVytHMUphYWRob2ZGSFJ6ZWpsaWdhdVVL?=
 =?iso-2022-jp?B?QUh0V0hmYXR1aCtybTc5VS90TlBQYXd2Y0JKaC9jUnRLNmYwNUJrbE5q?=
 =?iso-2022-jp?B?cDREZG9VSFh3Nm9Jc0RhY0FCdDNNU3FPZ3hWaDhtekQ1R0ErQkJuQm82?=
 =?iso-2022-jp?B?K2Z3VEZOanJESkNORmUyelZYbXlPYWR2NEhNaHZ6em0zTVB3bUkwalFE?=
 =?iso-2022-jp?B?aEhZMklZd0N1MG43WXdoTGNDVmNnTTdqS2lDZUtmNUl4REZMcGdhWjFX?=
 =?iso-2022-jp?B?Wk91L3NwTFZpd2xzc2s0cGNZWE14UC85bitMNEpPeFMwQTc1WEppM1JD?=
 =?iso-2022-jp?B?dXA3T2c4T0dzK1pwVU04elFpak5QMW1ja01uQT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IDhoEcCH3tbjX7SyaAMOt2z/L8l25iL+YN4Gy51u9fKVurv9ouIOGYl/h/6x8XutPtaHooYJ9VLORKxVdX37uSQcx/nRNWD94npE4ZaviqU7gz7o3xNgOZGRotLZgpVEiZqQndg9RGi9cqOia7sjL+tEYPskyTBXc5H5HjvTVZOIKmwfQtFYBFVFPq/Fx7qGFy5a1HAOuP+d9c2GOrM+99Sqnwzb/m5Q94V5BizUxbnCfNePpeq9M50GwO6e0qngEgWlBQFXrF0BmYDXH6bD55tX4yAbk14qJVT44g/F6dE9rxREiVNK5C9hyUjk8OSEP4TOWP0OEbGcBBCPRIZ67g==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daff923c-3a98-4fb9-ac5e-08df4b8be443
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 07:07:11.1647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuDOTeKxCy7xcntNKN3dQZrcR9oT3F81NE+MA2ij+ajjHCcg++AP1FB+fDICYtQq30Rf9bdwQDa7E/MgcJKphgFkfRuYLFCk58HC17XJYFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_230719_872680_DA4FDF6E 
X-CRM114-Status: GOOD (  15.85  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Fenghua=0A=
=0A=
=0A=
> To expose resctrl resources that contain CPU-less NUMA domains, resctrl=
=0A=
> needs to be told when a CPU-less NUMA domain comes online. This can't=0A=
> be done with the cpuhp callbacks.=0A=
> =0A=
> Add a memory hotplug notifier, and use this to create and destroy=0A=
> resctrl domains.=0A=
> =0A=
> Signed-off-by: James Morse <james.morse@arm.com>=0A=
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>=0A=
> ---=0A=
>  drivers/resctrl/mpam_resctrl.c | 321 ++++++++++++++++++++++++++++++++-=
=0A=
>  include/linux/memory.h         |   1 +=0A=
>  2 files changed, 315 insertions(+), 7 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index ac0c488abe12..8a169676c4ac 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -11,6 +11,8 @@=0A=
>  #include <linux/limits.h>=0A=
>  #include <linux/list.h>=0A=
>  #include <linux/math.h>=0A=
> +#include <linux/memory.h>=0A=
> +#include <linux/node.h>=0A=
>  #include <linux/printk.h>=0A=
>  #include <linux/rculist.h>=0A=
>  #include <linux/resctrl.h>=0A=
> @@ -1681,16 +1683,25 @@ void resctrl_arch_reset_all_ctrls(struct rdt_reso=
urce *r)=0A=
>          mpam_reset_class_locked(res->class);=0A=
>  }=0A=
>  =0A=
> +static void mpam_resctrl_domain_hdr_init_mask(const struct cpumask *cpus=
,=0A=
> +                                             int id_cpu,=0A=
> +                                             struct mpam_component *comp=
,=0A=
> +                                             enum resctrl_res_level rid,=
=0A=
> +                                             struct rdt_domain_hdr *hdr)=
=0A=
> +{=0A=
> +       INIT_LIST_HEAD(&hdr->list);=0A=
> +       hdr->id =3D mpam_resctrl_pick_domain_id(id_cpu, comp);=0A=
> +       hdr->rid =3D rid;=0A=
> +       cpumask_copy(&hdr->cpu_mask, cpus);=0A=
> +}=0A=
> +=0A=
>  static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component =
*comp,=0A=
>                                           enum resctrl_res_level rid,=0A=
>                                           struct rdt_domain_hdr *hdr)=0A=
>  {=0A=
>          lockdep_assert_cpus_held();=0A=
>  =0A=
> -       INIT_LIST_HEAD(&hdr->list);=0A=
> -       hdr->id =3D mpam_resctrl_pick_domain_id(cpu, comp);=0A=
> -       hdr->rid =3D rid;=0A=
> -       cpumask_set_cpu(cpu, &hdr->cpu_mask);=0A=
> +       mpam_resctrl_domain_hdr_init_mask(cpumask_of(cpu), cpu, comp, rid=
, hdr);=0A=
>  }=0A=
>  =0A=
>  static void mpam_resctrl_online_domain_hdr(unsigned int cpu,=0A=
> @@ -1711,12 +1722,12 @@ static void mpam_resctrl_online_domain_hdr(unsign=
ed int cpu,=0A=
>   * indicating the parent structure can be freed.=0A=
>   * If there are other CPUs in the domain, returns false.=0A=
>   */=0A=
=0A=
The comments here are also outdated and need to be updated.=0A=
=0A=
> -static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,=0A=
> -                                           struct rdt_domain_hdr *hdr)=
=0A=
> +static bool mpam_resctrl_offline_domain_hdr_mask(const struct cpumask *c=
pus,=0A=
> +                                                struct rdt_domain_hdr *h=
dr)=0A=
>  {=0A=
>          lockdep_assert_held(&domain_list_lock);=0A=
>  =0A=
> -       cpumask_clear_cpu(cpu, &hdr->cpu_mask);=0A=
> +       cpumask_andnot(&hdr->cpu_mask, &hdr->cpu_mask, cpus);=0A=
>          if (cpumask_empty(&hdr->cpu_mask)) {=0A=
>                  list_del_rcu(&hdr->list);=0A=
>                  synchronize_rcu();=0A=
> @@ -1726,6 +1737,12 @@ static bool mpam_resctrl_offline_domain_hdr(unsign=
ed int cpu,=0A=
>          return false;=0A=
>  }=0A=
>  =0A=
> +static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,=0A=
> +                                           struct rdt_domain_hdr *hdr)=
=0A=
> +{=0A=
> +       return mpam_resctrl_offline_domain_hdr_mask(cpumask_of(cpu), hdr)=
;=0A=
> +}=0A=
> +=0A=
=0A=
Is this wrapper function necessary? It would be simpler to convert the data=
 directly in the calling code.=0A=
=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
>  static void mpam_resctrl_domain_insert(struct list_head *list,=0A=
>                                         struct rdt_domain_hdr *new)=0A=
>  {=0A=
> @@ -1741,6 +1758,23 @@ static void mpam_resctrl_domain_insert(struct list=
_head *list,=0A=
>          list_add_tail_rcu(&new->list, pos);=0A=
>  }=0A=
>  =0A=
> +static struct mpam_component *find_component_nid(struct mpam_class *clas=
s, int nid)=0A=
> +{=0A=
> +       struct mpam_component *comp;=0A=
> +=0A=
> +       if (!class || class->type !=3D MPAM_CLASS_MEMORY)=0A=
> +               return NULL;=0A=
> +=0A=
> +       guard(srcu)(&mpam_srcu);=0A=
> +       list_for_each_entry_srcu(comp, &class->components, class_list,=0A=
> +                                srcu_read_lock_held(&mpam_srcu)) {=0A=
> +               if (comp->comp_id =3D=3D nid)=0A=
> +                       return comp;=0A=
> +       }=0A=
> +=0A=
> +       return NULL;=0A=
> +}=0A=
> +=0A=
>  static struct mpam_component *find_component(struct mpam_class *class, i=
nt cpu)=0A=
>  {=0A=
>          struct mpam_component *comp;=0A=
> @@ -1925,6 +1959,275 @@ mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, st=
ruct mpam_resctrl_res *res,=0A=
>          return NULL;=0A=
>  }=0A=
>  =0A=
> +static bool mpam_mba_uses_memory_nid(void)=0A=
> +{=0A=
> +       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_MBA];=0A=
> +=0A=
> +       return res->class && res->class->type =3D=3D MPAM_CLASS_MEMORY;=
=0A=
> +}=0A=
> +=0A=
> +static struct mpam_resctrl_dom *=0A=
> +mpam_get_ctrl_domain_from_nid(int nid, struct mpam_resctrl_res *res,=0A=
> +                             struct resctrl_ctrl *ctrl)=0A=
> +{=0A=
> +       struct mpam_resctrl_dom *dom;=0A=
> +=0A=
> +       list_for_each_entry(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.lis=
t) {=0A=
> +               if (!dom->ctrl_comp || !dom->ctrl_comp->class)=0A=
> +                       continue;=0A=
> +               if (dom->ctrl_comp->class->type !=3D MPAM_CLASS_MEMORY)=
=0A=
> +                       continue;=0A=
> +               if (dom->ctrl_comp->comp_id =3D=3D nid)=0A=
> +                       return dom;=0A=
> +       }=0A=
> +=0A=
> +       return NULL;=0A=
> +}=0A=
> +=0A=
> +static struct mpam_resctrl_dom *=0A=
> +mpam_get_mon_domain_from_nid(int nid, struct mpam_resctrl_res *res)=0A=
> +{=0A=
> +       struct mpam_resctrl_dom *dom;=0A=
> +       struct rdt_resource *r =3D &res->resctrl_res;=0A=
> +=0A=
> +       if (!r->mon_capable)=0A=
> +               return NULL;=0A=
> +=0A=
> +       list_for_each_entry(dom, &r->mon_domains, resctrl_mon_dom.hdr.lis=
t) {=0A=
> +               if (!dom->ctrl_comp || !dom->ctrl_comp->class)=0A=
> +                       continue;=0A=
> +               if (dom->ctrl_comp->class->type !=3D MPAM_CLASS_MEMORY)=
=0A=
> +                       continue;=0A=
> +               if (dom->ctrl_comp->comp_id =3D=3D nid)=0A=
> +                       return dom;=0A=
> +       }=0A=
> +=0A=
> +       return NULL;=0A=
> +}=0A=
> +=0A=
> +static struct mpam_resctrl_dom *=0A=
> +mpam_resctrl_alloc_ctrl_domain_nid(int nid, struct mpam_resctrl_res *res=
,=0A=
> +                                  struct resctrl_ctrl *ctrl,=0A=
> +                                  struct mpam_component *comp)=0A=
> +{=0A=
> +       int err;=0A=
> +       struct mpam_resctrl_dom *dom;=0A=
> +       struct rdt_ctrl_domain *ctrl_d;=0A=
> +       struct rdt_resource *r =3D &res->resctrl_res;=0A=
> +       int id_cpu =3D cpumask_first(cpu_possible_mask);=0A=
> +=0A=
> +       if (id_cpu >=3D nr_cpu_ids)=0A=
> +               id_cpu =3D 0;=0A=
> +=0A=
> +       lockdep_assert_held(&domain_list_lock);=0A=
> +=0A=
> +       if (!r->alloc_capable)=0A=
> +               return ERR_PTR(-EINVAL);=0A=
> +=0A=
> +       if (WARN_ON_ONCE(!comp))=0A=
> +               return ERR_PTR(-EINVAL);=0A=
> +=0A=
> +       dom =3D kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);=0A=
> +       if (!dom)=0A=
> +               return ERR_PTR(-ENOMEM);=0A=
> +=0A=
> +       dom->ctrl_comp =3D comp;=0A=
> +=0A=
> +       ctrl_d =3D &dom->resctrl_ctrl_dom;=0A=
> +       mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, comp=
,=0A=
> +                                         r->rid, &ctrl_d->hdr);=0A=
> +       ctrl_d->hdr.type =3D RESCTRL_CTRL_DOMAIN;=0A=
> +       err =3D resctrl_online_ctrl_domain(r, ctrl, ctrl_d);=0A=
> +       if (err)=0A=
> +               goto free_domain;=0A=
> +=0A=
> +       mpam_resctrl_domain_insert(&ctrl->domains, &ctrl_d->hdr);=0A=
> +=0A=
> +       return dom;=0A=
> +=0A=
> +free_domain:=0A=
> +       kfree(dom);=0A=
> +       return ERR_PTR(err);=0A=
> +}=0A=
> +=0A=
> +static struct mpam_resctrl_dom *=0A=
> +mpam_resctrl_alloc_mon_domain_nid(int nid, struct mpam_resctrl_res *res,=
=0A=
> +                                 struct mpam_component *comp)=0A=
> +{=0A=
> +       int err;=0A=
> +       struct mpam_resctrl_dom *dom;=0A=
> +       struct rdt_l3_mon_domain *mon_d;=0A=
> +       struct rdt_resource *r =3D &res->resctrl_res;=0A=
> +       struct mpam_component *any_mon_comp =3D NULL;=0A=
> +       struct mpam_resctrl_mon *mon;=0A=
> +       enum resctrl_event_id eventid;=0A=
> +       int id_cpu =3D cpumask_first(cpu_possible_mask);=0A=
> +=0A=
> +       if (id_cpu >=3D nr_cpu_ids)=0A=
> +               id_cpu =3D 0;=0A=
> +=0A=
> +       lockdep_assert_held(&domain_list_lock);=0A=
> +=0A=
> +       if (!r->mon_capable)=0A=
> +               return ERR_PTR(-EINVAL);=0A=
> +=0A=
> +       if (WARN_ON_ONCE(!comp))=0A=
> +               return ERR_PTR(-EINVAL);=0A=
> +=0A=
> +       dom =3D kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);=0A=
> +       if (!dom)=0A=
> +               return ERR_PTR(-ENOMEM);=0A=
> +=0A=
> +       dom->ctrl_comp =3D comp;=0A=
> +=0A=
> +       for_each_mpam_resctrl_mon(mon, eventid) {=0A=
> +               struct mpam_component *mon_comp;=0A=
> +=0A=
> +               if (!mon->class)=0A=
> +                       continue;=0A=
> +=0A=
> +               mon_comp =3D find_component_nid(mon->class, nid);=0A=
> +               dom->mon_comp[eventid] =3D mon_comp;=0A=
> +               if (mon_comp)=0A=
> +                       any_mon_comp =3D mon_comp;=0A=
> +       }=0A=
> +       if (!any_mon_comp) {=0A=
> +               err =3D -EFAULT;=0A=
> +               goto free_domain;=0A=
> +       }=0A=
> +=0A=
> +       mon_d =3D &dom->resctrl_mon_dom;=0A=
> +       mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, any_=
mon_comp,=0A=
> +                                         r->rid, &mon_d->hdr);=0A=
> +       mon_d->hdr.type =3D RESCTRL_MON_DOMAIN;=0A=
> +       err =3D resctrl_online_mon_domain(r, &mon_d->hdr);=0A=
> +       if (err)=0A=
> +               goto free_domain;=0A=
> +=0A=
> +       mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);=0A=
> +=0A=
> +       return dom;=0A=
> +=0A=
> +free_domain:=0A=
> +       kfree(dom);=0A=
> +       return ERR_PTR(err);=0A=
> +}=0A=
> +=0A=
> +static int mpam_resctrl_online_node(unsigned int nid)=0A=
> +{=0A=
> +       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_MBA];=0A=
> +       struct rdt_resource *r =3D &res->resctrl_res;=0A=
> +       struct mpam_component *comp;=0A=
> +       struct resctrl_ctrl *ctrl;=0A=
> +       struct mpam_resctrl_dom *dom;=0A=
> +=0A=
> +       if (!res->class)=0A=
> +               return 0;=0A=
> +=0A=
> +       comp =3D find_component_nid(res->class, nid);=0A=
> +       if (!comp)=0A=
> +               return 0;=0A=
> +=0A=
> +       guard(mutex)(&domain_list_lock);=0A=
> +=0A=
> +       if (r->alloc_capable) {=0A=
> +               for_each_resource_ctrl(ctrl, r) {=0A=
> +                       dom =3D mpam_get_ctrl_domain_from_nid(nid, res, c=
trl);=0A=
> +                       if (!dom) {=0A=
> +                               dom =3D mpam_resctrl_alloc_ctrl_domain_ni=
d(nid, res,=0A=
> +                                                                        =
ctrl, comp);=0A=
> +                               if (IS_ERR(dom))=0A=
> +                                       return PTR_ERR(dom);=0A=
> +                       }=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       if (r->mon_capable) {=0A=
> +               dom =3D mpam_get_mon_domain_from_nid(nid, res);=0A=
> +               if (!dom) {=0A=
> +                       dom =3D mpam_resctrl_alloc_mon_domain_nid(nid, re=
s, comp);=0A=
> +                       if (IS_ERR(dom))=0A=
> +                               return PTR_ERR(dom);=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int mpam_resctrl_offline_node(unsigned int nid)=0A=
> +{=0A=
> +       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_MBA];=0A=
> +       struct rdt_resource *r =3D &res->resctrl_res;=0A=
> +       struct resctrl_ctrl *ctrl;=0A=
> +       struct mpam_resctrl_dom *dom;=0A=
> +       struct rdt_ctrl_domain *ctrl_d;=0A=
> +       struct rdt_l3_mon_domain *mon_d;=0A=
> +=0A=
> +       if (!res->class)=0A=
> +               return 0;=0A=
> +=0A=
> +       if (!find_component_nid(res->class, nid))=0A=
> +               return 0;=0A=
> +=0A=
> +       guard(mutex)(&domain_list_lock);=0A=
> +=0A=
> +       if (r->alloc_capable) {=0A=
> +               for_each_resource_ctrl(ctrl, r) {=0A=
> +                       dom =3D mpam_get_ctrl_domain_from_nid(nid, res, c=
trl);=0A=
> +                       if (WARN_ON_ONCE(!dom))=0A=
> +                               continue;=0A=
> +                       ctrl_d =3D &dom->resctrl_ctrl_dom;=0A=
> +                       if (mpam_resctrl_offline_domain_hdr_mask(cpu_poss=
ible_mask,=0A=
> +                                                                &ctrl_d-=
>hdr)) {=0A=
> +                               resctrl_offline_ctrl_domain(r, ctrl, ctrl=
_d);=0A=
> +                               kfree(dom);=0A=
> +                       }=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       if (r->mon_capable) {=0A=
> +               dom =3D mpam_get_mon_domain_from_nid(nid, res);=0A=
> +               if (WARN_ON_ONCE(!dom))=0A=
> +                       return 0;=0A=
> +               mon_d =3D &dom->resctrl_mon_dom;=0A=
> +               if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mas=
k, &mon_d->hdr)) {=0A=
> +                       resctrl_offline_mon_domain(r, &mon_d->hdr);=0A=
> +                       kfree(dom);=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int mpam_resctrl_node_notifier(struct notifier_block *self,=0A=
> +                                     unsigned long action, void *arg)=0A=
> +{=0A=
> +       struct node_notify *nn =3D arg;=0A=
> +=0A=
> +       if (nn->nid < 0 || !mpam_mba_uses_memory_nid())=0A=
> +               return NOTIFY_OK;=0A=
> +=0A=
> +       /*=0A=
> +        * Ignore nids that have CPUs. Resctrl needs to see the cpu offli=
ne=0A=
> +        * call for each CPU to update the CPUs in control groups.=0A=
> +        */=0A=
> +       if (!cpumask_empty(cpumask_of_node(nn->nid)))=0A=
> +               return NOTIFY_OK;=0A=
> +=0A=
> +       switch (action) {=0A=
> +       case NODE_ADDED_FIRST_MEMORY:=0A=
> +               mpam_resctrl_online_node(nn->nid);=0A=
> +               break;=0A=
> +       case NODE_REMOVED_LAST_MEMORY:=0A=
> +               mpam_resctrl_offline_node(nn->nid);=0A=
> +               break;=0A=
> +       default:=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       return NOTIFY_OK;=0A=
> +}=0A=
> +=0A=
>  int mpam_resctrl_online_cpu(unsigned int cpu)=0A=
>  {=0A=
>          struct mpam_resctrl_res *res;=0A=
> @@ -2088,6 +2391,10 @@ int mpam_resctrl_setup(void)=0A=
>                  }=0A=
>          }=0A=
>  =0A=
> +       if (mpam_mba_uses_memory_nid())=0A=
> +               hotplug_node_notifier(mpam_resctrl_node_notifier,=0A=
> +                                     RESCTRL_CALLBACK_PRI);=0A=
> +=0A=
>          cpus_read_unlock();=0A=
>  =0A=
>          if (!resctrl_arch_alloc_capable() && !resctrl_arch_mon_capable()=
) {=0A=
> diff --git a/include/linux/memory.h b/include/linux/memory.h=0A=
> index 463dc02f6cff..1497d4be38ee 100644=0A=
> --- a/include/linux/memory.h=0A=
> +++ b/include/linux/memory.h=0A=
> @@ -120,6 +120,7 @@ struct mem_section;=0A=
>  #define CPUSET_CALLBACK_PRI     10=0A=
>  #define MEMTIER_HOTPLUG_PRI     100=0A=
>  #define KSM_CALLBACK_PRI        100=0A=
> +#define RESCTRL_CALLBACK_PRI   100=0A=
>  =0A=
>  #ifndef CONFIG_MEMORY_HOTPLUG=0A=
>  static inline void memory_dev_init(void)=0A=
> --=0A=
> 2.53.0=0A=

