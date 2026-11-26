Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB94606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pQ9YvAOb;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=JXBZEI7/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x3dGHRecRny2FLukUnx6jH5Qvh5oozDw5APiR9xdL5M=; b=pQ9YvAObT1VOYjBjy4WO74aJcj
	7Dm5zjkwxNlxQSZRYlKBzTGpwI/vDXpVJ/gjfFAFk8N8NysvlnAaTaA/2Q54B6ADFzRTacBVP/rA4
	ONyMFB1oVrSKYlE0UnyG/lYBLmBQN45yUb/43hDHjc8B9ddDNmWDDVmVEownVGVxz0pf6c178pLjx
	5B0V+itxoQW2cf4hJuKCFSj9g41+qUK9mse2XtAwPfGRp2mdYQZZlsZRPV6wupwd57C1muJ5fu4Yq
	0tZSsf60EiObgH8pGWdhRy0gedXNLODR/7K8td39aYt34MTYrRb3VQ2VZ+cVgkpgalJDWSZgV9SN9
	3WIVrSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTP3-0000000CESv-1Joy;
	Thu, 26 Nov 2026 06:56:21 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTOz-0000000CERk-3t01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mE2sgFQRogS0SFupkSdW5KHjFwLYzyhya2SNEgVA1WIR9RKDh/M8sLcv3cg3H/orIQ2xE0crf5GSgW/4bKki4/WQtv0t2eb7sKIce4PKY00wQeklXLeNJopwEjUC8BdSfGmsFaSbZIyXA2xbHpicNu6c98BGjhViP+2Tw2zieCZN3hvjf78ydcMt0rotZrtCUcKuG+fJ55qE7gQXSTo+aIPGNEoe96JV+QfRlR1rYzs+E1HklbSb/AgNB6tS9E2BKdHTn3/27rXC7jULPRGGGIf75nFJDAHxbu+p438fK4DS/OSS0WB9IWYJr4DC4++lGCDAVbclynLgqe0Zb95pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3dGHRecRny2FLukUnx6jH5Qvh5oozDw5APiR9xdL5M=;
 b=H5/JeXlcqRErjoZfbsCQJ8vsuwQ/uvKxdQqdZTUTM/hiULbuDcGwXWn8gr0L/CitdgxjznY008L64smo6pGn5BzCOXe7wbwWjcmSwSNfkHpP14Lj3b25lRuDCfZZDkUCQOPHv+6y/JrLncoBAWm5fF6eWX75XVuhnCRa/LzEWCSx6v0fQW6T+FhWPy/yoMc1z76rUyqeEYB9GHQXULJjcGtGAKvotszoCMIdutpukNXkJZ+gqhc4Xty6JOxTIwFPxSRswSeYtLY3+AB72DyHZ5yH0Doq+0WgY1ZiDLSAz92Z3GJLzh0KxeTJWHi+8H9pvxI6UUyiFljwp13vi9RIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3dGHRecRny2FLukUnx6jH5Qvh5oozDw5APiR9xdL5M=;
 b=JXBZEI7/JSukM6WNMVSqyK2u7vA7StGKfua+Jc4wn7KPWlWLjWbYBJgF8CZkWf/f5pq3EqjdlPzxOPwx/McYSN7IXlxZtsWwA0lf3rkWH4Zo8X2lyIbykbpMElfh70XWozbuVsayO5mArht87cBLVpJj6EURnRXFqxCbbrs114IlGq6VgvY73J5OJtCvhUdxy56Sr6x5ZKqq72AzGwqalPdig/rBQvQtFL4LqpmNgKo1ZC6kdOLu7LllUDgKPyvheaf9Q9iKRpYbCv3UQ0im0lMD8SvElCZ+LJ+iKoV1ZuHQoFZ2TSOArGOJ5aMfMvweEboa/ZBeoLOJ0iZGxTRnng==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OS7PR01MB17540.jpnprd01.prod.outlook.com
 (2603:1096:604:443::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 06:56:11 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:56:11 +0000
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
Subject: Re: [PATCH RFC v3 08/15] arm_mpam: Include all MSC components during
 domain setup
Thread-Topic: [PATCH RFC v3 08/15] arm_mpam: Include all MSC components during
 domain setup
Thread-Index: AQHdcJDCPmvImW7qFkWuUW++5wasfLdABPbb
Date: Thu, 26 Nov 2026 06:56:11 +0000
Message-ID: <TY4PR01MB16930FCD62AF481882AE43FB68B422@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
 <20261109212427.1409204-9-fenghuay@nvidia.com>
In-Reply-To: <20261109212427.1409204-9-fenghuay@nvidia.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-11-26T06:55:42.156Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OS7PR01MB17540:EE_
x-ms-office365-filtering-correlation-id: c1f21395-45c9-4ba0-79e6-08df4b8a5add
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|4143699003|6133799003|261009223027099003|18002099003|22082099003|1580799027|3023799007|921020|5023799004|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261021121427099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info: wo3HY3cIINk2vWZCtlPtmKjuXfEueS6YuenidhltqWp8sPtqagR+v0PbnvuTUQsfjg4qO9HX4RVBMt/VLnukRCtNPpjpF+ZneYawV6Dn1clS32XpB4HWvhKy7dv4/coh/aOAxvVljTWSWyIsi4VymLVcv60D676kax7vGWpqz44eipNMjZ8ctFB3MXNDyJ7O6IBn2+wdRcihaAvryeDW3gm3ZJzNs/Z2J8K1VKXmSwItuNmmGYVnFORK97ghNfvwRpFmIPfJppkbUqPH2jUpb0ZLBuo8K+llZmYjaTlelGu4UvlJaxaHBDH3gQNbdakMaIoPwVtkwkW76vT7F9hNTqh7LHRGcvaWa2yvWGBbF5awsv6W2cJg2Ht5wuS2gWcFBqs40bAYHFju2u8tjgFu4vThdst+1qJ9zjaQbiC/1OfyK0UaN5uiOgiXUPbMxqKKY0IlQerFhVPgwa5klqYEpVyiEP86gbT9lDaJJ4cbgTVUcn8Mf3UvblBW/yrUrDnH7pNC+v8CcDnlHTbXyorjJNi1Tb/MOX58cIm18fsitXF7Lqy2aWpwgmUhbeKue1W2Rux5QT6ak93ZcQLwIrMyL93OxmKf1NCMqhfU2KcfznwPtKlgR6WbIYY93aj+1a5YLp8c48EVvslvZBpOxlWbNEK0krUhP4cBHfRjhWphQSr+EVzd0PmTyloy7XoibNjFnulwG7/QZ1YxYQvDk2kZoog8/e4A6ov0yYaA6xb7jnaTM4+EaadLRjzrWOezXOaIkbp35P7GSdM5PALy+k4c9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(4143699003)(6133799003)(261009223027099003)(18002099003)(22082099003)(1580799027)(3023799007)(921020)(5023799004)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261021121427099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?QlJtQUFyUkVhNUxsS2hTQ0JsUG1TYzYyWHh1ZmZwcjByWElGY1FTdEhX?=
 =?iso-2022-jp?B?RFRiaEFZY0JQS3I3Z2RrbFFtdHYzOWxuSU8xaE9SQWV2THpucEQ5ejlD?=
 =?iso-2022-jp?B?UzE0RWpTK1BnOStNTjdveE4yRi84YW5yM3NSTUI5VVN1WGN1cnJOTXZ3?=
 =?iso-2022-jp?B?STJOUjZTejYrV1gvaUJvQjgwK3FUZWJ5elprVTJBWlBoUXhXRE9tRi82?=
 =?iso-2022-jp?B?RjRsOEJDZEFkQmhzKzBQVEpxanpwRkl1MjZ3a1RqbFc5dG9sM3FTVnBJ?=
 =?iso-2022-jp?B?VmtmTEl3U2dtV084bVdid3pzRGNxT1FHNjlGc3FOVHhSNllGN0htY0l1?=
 =?iso-2022-jp?B?YW91T0d0QzB2bk1VNm1JZ2lSZzlsSTVnMW5VRkFPWnR4TmVjcUZZSVVw?=
 =?iso-2022-jp?B?dVVHSERkU0RMbGd4SFdXMkozZjNzYVZqaTlDNDRQbWxVR2JCbVNZTVFt?=
 =?iso-2022-jp?B?M2lIQ2xseE9neThXbGJRcXdsTEhyNFYwUllKTDlGZjJnbGlUVHFkOVM2?=
 =?iso-2022-jp?B?T3JRMzFBVG5QUXJoUVI2ejJGYXJiKzFYWUxWZnY5K1FFaU5zVG4rQ01u?=
 =?iso-2022-jp?B?N29FOXhLcmlwTHNKVGF6WXBrWmtYcER2YlBZRS9DZWZpc2VDNDA1Q2hN?=
 =?iso-2022-jp?B?UXVLUnJyNFVIN3FBVkYvWmtpcnB4ZFdnUUJib2ZYN0hERnltaGdENUR1?=
 =?iso-2022-jp?B?TmIwMDJkQnU4TWFpUXVKTktoM09TYVVCOE96S000WS9qWi8zaTVQRHB6?=
 =?iso-2022-jp?B?YWw2K2hDNVhLeko4MXpjYXlvNFlFczdCWE5nTnNpNE56eU4rRTV1VDVD?=
 =?iso-2022-jp?B?SWcwbUc4SmpHVlBNWjM1OXVtUWlKcFBGa3FScWhFOHZyQ3ZmMEFicWcw?=
 =?iso-2022-jp?B?bGZza2ZLTG95TFlyRDhwSHlFUkxtNmVabi9uRVA5cGsxcFU5LzZjek5T?=
 =?iso-2022-jp?B?M3ZzT280dUwvdkczYWp1T3hoZjBTaFNXRFFMVGswWjZTekc5VUtWZE9F?=
 =?iso-2022-jp?B?SEs0WC9tdG0wK1FNbVZCbDNRWGdmTG9SUDc3OWlIRFdTS2V6T1BoWFo3?=
 =?iso-2022-jp?B?ci9mOENWM3RkdER1THNHMzV3LzVkR3hKMkJNZkFFRFVJVXE0MVVDenpu?=
 =?iso-2022-jp?B?UGkrdm9ZS2EwbW1sTkZCRmVwbFhIb0k0MXNtNkNWNW5CYklyZ2ozTHE1?=
 =?iso-2022-jp?B?Z2liVzE4OG5Oa2IvbTdQTXg3K2ZNek9PY2ZjUEZGLzZ1ZldYY05RQ0Rl?=
 =?iso-2022-jp?B?aWpONkRiN0tXdWU2Ym9rWlpraDd3dGoxMXcyRmpPVUUvb2xIT3RCSG95?=
 =?iso-2022-jp?B?dkIrczMvNmwwcGN2ZVBQMHJKWDFqMG94Zm55ZGdsSjJ0U29JTjVKaFRL?=
 =?iso-2022-jp?B?enFETlEzUyt0bi9rUWVMSHcvRDdPbFJ6SDVJMDNiQ1pXaTJlQUtCLzh3?=
 =?iso-2022-jp?B?RFJDS0ZTWW9lQUR3VHdEeDlkNVYyOTZleUtXUDdQZGJBSkpDWDBUWUk5?=
 =?iso-2022-jp?B?U2xZTjZYRi9qMldwcFA2cFlrd3RjVm9ub3RQRFdZNE9wSzUxeUdZbHNZ?=
 =?iso-2022-jp?B?UnZJQ1Y4QlpFZlExOTRkbnE0ckdSTWpCc0tJbGZsNWRxYi9LTFJLOXp4?=
 =?iso-2022-jp?B?Y2lNbkZMbG5hSzdhbVAzZVVlMENpZXhFdStIUmhJQlZmVDU5YVNIV0k5?=
 =?iso-2022-jp?B?SktaeGg2VHlZMU1SWmFWdmJTUXlPZHNXYmNmaHBtMmhVVGt2SHJCWkRj?=
 =?iso-2022-jp?B?SnNwSU1YaDJnQnBJZTk0by94S0k4WUVuWnR3eitJeEJFM21wRHZHRG9r?=
 =?iso-2022-jp?B?Y1NabG50WHhPRklYRVQvTE92K2IzZkY2U0lpam9xY3FRNXhMVVdQVmNJ?=
 =?iso-2022-jp?B?NXUvcWNEUnkwUFJ4OUExQmxkeExVT2k5VnJSenRqOE5aVEFudmtWa2JD?=
 =?iso-2022-jp?B?ZDEra0Nva1VpZGVyRE5uSnNuSURDdTZNY2cxZjNJT1RTSHF4eDhlQmJE?=
 =?iso-2022-jp?B?cEEwZmlhMnlRTHBneVVqSVZGcGpzdTRZVitSeEJCWG8xcWNITHFPNTBH?=
 =?iso-2022-jp?B?NkViQURjcmhWcWUrVXE0ZWtpZkRPY05MVUNqT241aUs2KzNWaGNBVjNx?=
 =?iso-2022-jp?B?T3E0ZmFwMXJtanpHYWNRM3NxREpDUm1lMHZEUFduSnVTaEdKcVc3T3RZ?=
 =?iso-2022-jp?B?eDFHRzI4VWt4d2ViaG00NWNjcFpPcWNOUFE3YlhZN0pES2sxeEpUTVdV?=
 =?iso-2022-jp?B?UWE1am5SaitBTVNyQ3hKUEpFd3RTelE0T252MVdXaktTRHdadEFoZ3ly?=
 =?iso-2022-jp?B?bjNUKzNtS0JWbU95WFV2K01JNGF0SU11MDNyNXVRalk4UFpxNHE4WE1u?=
 =?iso-2022-jp?B?bDhXNUZORDd1UzBNbXNWblhUaTlHbFc3N3VKUFBKMDMyajVDUXRJbGpJ?=
 =?iso-2022-jp?B?alpCcUZLYUxIZnQ3UHJ6YmV5V2NEbkFsNXkvYVVKa1gxRVFqd0dnbjhI?=
 =?iso-2022-jp?B?NUxsS3lSZVB5Tmd3ZVBpdDFYTnltZWlBRWlzUT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RDVVY/VbvPljLQ+ZTlGP1j5D8Pjtsx/6kRq5rYDaAyNdrT+HLNbrZQu9WbhIMqP4EH9ckzaZs8VLbkSaE3EGS0qxEQoxvPaMPF6jkM5iv6Bdykcd+xw505ZnUzE6U3DSGDJZgkZHshREDL6EMvma8GcGXUmfMvEtmPxZtmqZvZF+fmA3X3hJTdXAtT3Uanh/UUbm8wVKa7YCkiLDgNpof9wE22ndiZbVzInH/r1jPH28y5FpbCaDzFiUEWiI0aB2HJWXGjXOBOHbMWTnoEwe1sMyQytgB+GSMLGztjT89HGhzi6M0K9kd7CuiH7oIb5uBBSIestOsWfWw5ZxOKyrKQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f21395-45c9-4ba0-79e6-08df4b8a5add
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 06:56:11.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Fyyo+IH32IvnTGoyOhs7Xrro7dPsN+uCVpMD4AJelDAXU5QPQoo2kHvSxC+f3w6y7EaNp0FtR96iKGI9yDUGw/nMt3DFiE9ELKpiD+TZl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_225618_098538_26B65F87 
X-CRM114-Status: GOOD (  15.61  )
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

Hello Fenghua,=0A=
=0A=
> Iterate all MSC components per CPU when creating and looking up control=
=0A=
> and monitor domains on the controls branch. Key monitor domains by=0A=
> component, support MBA mon_capable lookup, and report mon capability=0A=
> from any L3 or MBA monitor resource.=0A=
> =0A=
> A memory-class MSC keeps control_mode legacy and names its control NODE,=
=0A=
> so the schemata line is MB_NODE in both legacy and native mode. A cache=
=0A=
> MSC keeps the MB line.=0A=
> =0A=
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>=0A=
> ---=0A=
>  drivers/resctrl/mpam_resctrl.c | 209 +++++++++++++++++++--------------=
=0A=
>  fs/resctrl/ctrlmondata.c       |   1 +=0A=
>  include/linux/resctrl.h        |   3 +=0A=
>  3 files changed, 127 insertions(+), 86 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index 72302f6021d7..ac0c488abe12 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -95,11 +95,27 @@ static bool mpam_class_memory(struct mpam_class *clas=
s)=0A=
>  =0A=
>  bool resctrl_arch_mon_capable(void)=0A=
>  {=0A=
> -       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_L3];=0A=
> -       struct rdt_resource *l3 =3D &res->resctrl_res;=0A=
> +       enum resctrl_event_id eventid;=0A=
> +       struct mpam_resctrl_mon *mon;=0A=
> +       struct mpam_resctrl_res *res;=0A=
> +       struct rdt_resource *r;=0A=
> +=0A=
> +       for_each_mpam_resctrl_mon(mon, eventid) {=0A=
> +               if (!mon->class)=0A=
> +                       continue;       // dummy resource=0A=
> +=0A=
> +               if (mpam_class_memory(mon->class))=0A=
> +                       res =3D &mpam_resctrl_controls[RDT_RESOURCE_MBA];=
=0A=
> +               else=0A=
> +                       res =3D &mpam_resctrl_controls[RDT_RESOURCE_L3];=
=0A=
> +=0A=
> +               r =3D &res->resctrl_res;=0A=
> +=0A=
> +               if (r->mon_capable)=0A=
> +                       return true;=0A=
> +       }=0A=
>  =0A=
> -       /* All monitors are presented as being on the L3 cache */=0A=
> -       return l3->mon_capable;=0A=
> +       return false;=0A=
>  }=0A=
>  =0A=
>  bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)=0A=
> @@ -1293,8 +1309,18 @@ static int mpam_resctrl_control_init(struct mpam_r=
esctrl_res *res)=0A=
>                  break;=0A=
>          case RDT_RESOURCE_MBA:=0A=
>                  r->ctrl_scope =3D RESCTRL_L3_CACHE;=0A=
=0A=
Do we not need to consider RESCTRL_L3_NODE for the scope here?=0A=
=0A=
> +               /*=0A=
> +                * control_mode stays legacy. emulated_by is left empty s=
o=0A=
> +                * legacy and native mode expose the same schemata line.=
=0A=
> +                * A memory-class MSC is node-scoped, so that line is=0A=
> +                * MB_NODE. A cache MSC keeps the MB line.=0A=
> +                */=0A=
> +               r->ctrl_mode =3D RESCTRL_CTRL_MODE_LEGACY;=0A=
>                  mpam_ctrl->r_ctrl.type =3D RESCTRL_CTRL_SCALAR;=0A=
> -               mpam_ctrl->r_ctrl.name =3D RESCTRL_CTRL_NAME_DEF;=0A=
> +               if (mpam_class_memory(class))=0A=
> +                       mpam_ctrl->r_ctrl.name =3D RESCTRL_CTRL_NAME_NODE=
;=0A=
> +               else=0A=
> +                       mpam_ctrl->r_ctrl.name =3D RESCTRL_CTRL_NAME_DEF;=
=0A=
>                  INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);=0A=
>                  INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);=0A=
>  =0A=
> @@ -1731,13 +1757,12 @@ static struct mpam_component *find_component(stru=
ct mpam_class *class, int cpu)=0A=
>  =0A=
>  static struct mpam_resctrl_dom *=0A=
>  mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res=
 *res,=0A=
> -                              struct resctrl_ctrl *ctrl)=0A=
> +                              struct resctrl_ctrl *ctrl,=0A=
> +                              struct mpam_component *comp)=0A=
>  {=0A=
>          int err;=0A=
>          struct mpam_resctrl_dom *dom;=0A=
>          struct rdt_ctrl_domain *ctrl_d;=0A=
> -       struct mpam_class *class =3D res->class;=0A=
> -       struct mpam_component *comp_iter, *ctrl_comp;=0A=
>          struct rdt_resource *r =3D &res->resctrl_res;=0A=
>  =0A=
>          lockdep_assert_held(&domain_list_lock);=0A=
> @@ -1745,28 +1770,17 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, =
struct mpam_resctrl_res *res,=0A=
>          if (!r->alloc_capable)=0A=
>                  return ERR_PTR(-EINVAL);=0A=
>  =0A=
> -       ctrl_comp =3D NULL;=0A=
> -       guard(srcu)(&mpam_srcu);=0A=
> -       list_for_each_entry_srcu(comp_iter, &class->components, class_lis=
t,=0A=
> -                                srcu_read_lock_held(&mpam_srcu)) {=0A=
> -               if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {=0A=
> -                       ctrl_comp =3D comp_iter;=0A=
> -                       break;=0A=
> -               }=0A=
> -       }=0A=
> -=0A=
> -       /* class has no component for this CPU */=0A=
> -       if (WARN_ON_ONCE(!ctrl_comp))=0A=
> +       if (WARN_ON_ONCE(!comp))=0A=
>                  return ERR_PTR(-EINVAL);=0A=
>  =0A=
>          dom =3D kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu))=
;=0A=
>          if (!dom)=0A=
>                  return ERR_PTR(-ENOMEM);=0A=
>  =0A=
> -       dom->ctrl_comp =3D ctrl_comp;=0A=
> +       dom->ctrl_comp =3D comp;=0A=
>  =0A=
>          ctrl_d =3D &dom->resctrl_ctrl_dom;=0A=
> -       mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr=
);=0A=
> +       mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);=0A=
>          ctrl_d->hdr.type =3D RESCTRL_CTRL_DOMAIN;=0A=
>          err =3D resctrl_online_ctrl_domain(r, ctrl, ctrl_d);=0A=
>          if (err)=0A=
> @@ -1784,13 +1798,12 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, =
struct mpam_resctrl_res *res,=0A=
>  }=0A=
>  =0A=
>  static struct mpam_resctrl_dom *=0A=
> -mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res =
*res)=0A=
> +mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res =
*res,=0A=
> +                             struct mpam_component *comp)=0A=
>  {=0A=
>          int err;=0A=
>          struct mpam_resctrl_dom *dom;=0A=
>          struct rdt_l3_mon_domain *mon_d;=0A=
> -       struct mpam_class *class =3D res->class;=0A=
> -       struct mpam_component *comp_iter, *ctrl_comp;=0A=
>          struct rdt_resource *r =3D &res->resctrl_res;=0A=
>          struct mpam_component *any_mon_comp =3D NULL;=0A=
>          struct mpam_resctrl_mon *mon;=0A=
> @@ -1801,24 +1814,14 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, s=
truct mpam_resctrl_res *res)=0A=
>          if (!r->mon_capable)=0A=
>                  return ERR_PTR(-EINVAL);=0A=
>  =0A=
> -       ctrl_comp =3D NULL;=0A=
> -       guard(srcu)(&mpam_srcu);=0A=
> -       list_for_each_entry_srcu(comp_iter, &class->components, class_lis=
t,=0A=
> -                                srcu_read_lock_held(&mpam_srcu)) {=0A=
> -               if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {=0A=
> -                       ctrl_comp =3D comp_iter;=0A=
> -                       break;=0A=
> -               }=0A=
> -       }=0A=
> -=0A=
> -       /* class has no component for this CPU */=0A=
> -       if (WARN_ON_ONCE(!ctrl_comp))=0A=
> +       if (WARN_ON_ONCE(!comp))=0A=
>                  return ERR_PTR(-EINVAL);=0A=
>  =0A=
>          dom =3D kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu))=
;=0A=
>          if (!dom)=0A=
>                  return ERR_PTR(-ENOMEM);=0A=
>  =0A=
> +       dom->ctrl_comp =3D comp;=0A=
>  =0A=
>          /*=0A=
>           * Even if the monitor domain is backed by a different=0A=
> @@ -1833,7 +1836,7 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, str=
uct mpam_resctrl_res *res)=0A=
>                  if (!mon->class)=0A=
>                          continue;       // dummy resource=0A=
>  =0A=
> -               mon_comp =3D find_component(mon->class, cpu);=0A=
> +               mon_comp =3D comp ? comp : find_component(mon->class, cpu=
);=0A=
>                  dom->mon_comp[eventid] =3D mon_comp;=0A=
>                  if (mon_comp)=0A=
>                          any_mon_comp =3D mon_comp;=0A=
> @@ -1870,25 +1873,32 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, s=
truct mpam_resctrl_res *res)=0A=
>   * for anything that is not a cache.=0A=
=0A=
The comment is outdated and should be updated to reflect these changes.=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
>   */=0A=
>  static struct mpam_resctrl_dom *=0A=
> -mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *r=
es)=0A=
> +mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *r=
es,=0A=
> +                                    struct mpam_component *comp)=0A=
>  {=0A=
> -       int cache_id;=0A=
>          struct mpam_resctrl_dom *dom;=0A=
>          struct rdt_resource *r =3D &res->resctrl_res;=0A=
> +       int id;=0A=
>  =0A=
>          lockdep_assert_cpus_held();=0A=
>  =0A=
> -       if (r->rid !=3D RDT_RESOURCE_L3)=0A=
> -               return ERR_PTR(-EINVAL);=0A=
> +       if (!r->mon_capable || !res->class || !comp)=0A=
> +               return NULL;=0A=
>  =0A=
> -       if (!res->class)=0A=
> -               return ERR_PTR(-EINVAL);=0A=
> -       cache_id =3D get_cpu_cacheinfo_id(cpu, 3);=0A=
> -       if (cache_id < 0)=0A=
> -               return ERR_PTR(-EINVAL);=0A=
> +       if (r->rid =3D=3D RDT_RESOURCE_L3) {=0A=
> +               id =3D get_cpu_cacheinfo_id(cpu, 3);=0A=
> +               if (id < 0)=0A=
> +                       return NULL;=0A=
> +       } else if (r->rid =3D=3D RDT_RESOURCE_MBA) {=0A=
> +               id =3D comp->comp_id;=0A=
> +       } else {=0A=
> +               return NULL;=0A=
> +       }=0A=
>  =0A=
> -       list_for_each_entry_rcu(dom, &res->resctrl_res.mon_domains, resct=
rl_mon_dom.hdr.list) {=0A=
> -               if (dom->resctrl_mon_dom.hdr.id =3D=3D cache_id)=0A=
> +       list_for_each_entry_rcu(dom, &r->mon_domains, resctrl_mon_dom.hdr=
.list) {=0A=
> +               if (dom->ctrl_comp !=3D comp)=0A=
> +                       continue;=0A=
> +               if (dom->resctrl_mon_dom.hdr.id =3D=3D id)=0A=
>                          return dom;=0A=
>          }=0A=
>  =0A=
> @@ -1896,14 +1906,19 @@ mpam_resctrl_get_mon_domain_from_cpu(int cpu, str=
uct mpam_resctrl_res *res)=0A=
>  }=0A=
>  =0A=
>  static struct mpam_resctrl_dom *=0A=
> -mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct resctrl_ctrl *ctrl=
)=0A=
> +mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *=
res,=0A=
> +                                     struct resctrl_ctrl *ctrl,=0A=
> +                                     struct mpam_component *comp)=0A=
>  {=0A=
>          struct mpam_resctrl_dom *dom;=0A=
>  =0A=
>          lockdep_assert_cpus_held();=0A=
>  =0A=
> +       if (!comp)=0A=
> +               return NULL;=0A=
> +=0A=
>          list_for_each_entry_rcu(dom, &ctrl->domains, resctrl_ctrl_dom.hd=
r.list) {=0A=
> -               if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))=0A=
> +               if (dom->ctrl_comp =3D=3D comp)=0A=
>                          return dom;=0A=
>          }=0A=
>  =0A=
> @@ -1914,6 +1929,7 @@ int mpam_resctrl_online_cpu(unsigned int cpu)=0A=
>  {=0A=
>          struct mpam_resctrl_res *res;=0A=
>          enum resctrl_res_level rid;=0A=
> +       struct mpam_component *comp;=0A=
>  =0A=
>          guard(mutex)(&domain_list_lock);=0A=
>          for_each_mpam_resctrl_control(res, rid) {=0A=
> @@ -1924,30 +1940,40 @@ int mpam_resctrl_online_cpu(unsigned int cpu)=0A=
>                  if (!res->class)=0A=
>                          continue;       // dummy_resource;=0A=
>  =0A=
> -               if (r->alloc_capable) {=0A=
> -                       for_each_resource_ctrl(ctrl, r) {=0A=
> -                               dom =3D mpam_resctrl_get_ctrl_domain_from=
_cpu(cpu, ctrl);=0A=
> -                               if (!dom) {=0A=
> -                                       dom =3D mpam_resctrl_alloc_ctrl_d=
omain(cpu, res, ctrl);=0A=
> +               guard(srcu)(&mpam_srcu);=0A=
> +               list_for_each_entry_srcu(comp, &res->class->components, c=
lass_list,=0A=
> +                                        srcu_read_lock_held(&mpam_srcu))=
 {=0A=
> +                       if (!cpumask_test_cpu(cpu, &comp->affinity))=0A=
> +                               continue;=0A=
> +=0A=
> +                       if (r->alloc_capable) {=0A=
> +                               for_each_resource_ctrl(ctrl, r) {=0A=
> +                                       dom =3D mpam_resctrl_get_ctrl_dom=
ain_from_cpu(cpu, res,=0A=
> +                                                                        =
           ctrl, comp);=0A=
> +                                       if (!dom) {=0A=
> +                                               dom =3D mpam_resctrl_allo=
c_ctrl_domain(cpu, res,=0A=
> +                                                                        =
            ctrl, comp);=0A=
> +                                       } else {=0A=
> +                                               struct rdt_ctrl_domain *c=
trl_d =3D=0A=
> +                                                       &dom->resctrl_ctr=
l_dom;=0A=
> +=0A=
> +                                               mpam_resctrl_online_domai=
n_hdr(cpu, &ctrl_d->hdr);=0A=
> +                                       }=0A=
>                                          if (IS_ERR(dom))=0A=
>                                                  return PTR_ERR(dom);=0A=
> +                               }=0A=
> +                       }=0A=
> +                       if (r->mon_capable) {=0A=
> +                               dom =3D mpam_resctrl_get_mon_domain_from_=
cpu(cpu, res, comp);=0A=
> +                               if (!dom) {=0A=
> +                                       dom =3D mpam_resctrl_alloc_mon_do=
main(cpu, res, comp);=0A=
>                                  } else {=0A=
> -                                       struct rdt_ctrl_domain *ctrl_d =
=3D &dom->resctrl_ctrl_dom;=0A=
> +                                       struct rdt_l3_mon_domain *mon_d =
=3D &dom->resctrl_mon_dom;=0A=
>  =0A=
> -                                       mpam_resctrl_online_domain_hdr(cp=
u, &ctrl_d->hdr);=0A=
> +                                       mpam_resctrl_online_domain_hdr(cp=
u, &mon_d->hdr);=0A=
>                                  }=0A=
> -                       }=0A=
> -               }=0A=
> -               if (r->mon_capable) {=0A=
> -                       dom =3D mpam_resctrl_get_mon_domain_from_cpu(cpu,=
 res);=0A=
> -                       if (!dom) {=0A=
> -                               dom =3D mpam_resctrl_alloc_mon_domain(cpu=
, res);=0A=
>                                  if (IS_ERR(dom))=0A=
>                                          return PTR_ERR(dom);=0A=
> -                       } else {=0A=
> -                               struct rdt_l3_mon_domain *mon_d =3D &dom-=
>resctrl_mon_dom;=0A=
> -=0A=
> -                               mpam_resctrl_online_domain_hdr(cpu, &mon_=
d->hdr);=0A=
>                          }=0A=
>                  }=0A=
>          }=0A=
> @@ -1961,6 +1987,7 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)=0A=
>  {=0A=
>          struct mpam_resctrl_res *res;=0A=
>          enum resctrl_res_level rid;=0A=
> +       struct mpam_component *comp;=0A=
>  =0A=
>          resctrl_offline_cpu(cpu);=0A=
>  =0A=
> @@ -1976,31 +2003,41 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)=
=0A=
>                  if (!res->class)=0A=
>                          continue;       // dummy resource=0A=
>  =0A=
> -               if (r->alloc_capable) {=0A=
> -                       for_each_resource_ctrl(ctrl, r) {=0A=
> -                               dom =3D mpam_resctrl_get_ctrl_domain_from=
_cpu(cpu, ctrl);=0A=
> +               guard(srcu)(&mpam_srcu);=0A=
> +               list_for_each_entry_srcu(comp, &res->class->components, c=
lass_list,=0A=
> +                                        srcu_read_lock_held(&mpam_srcu))=
 {=0A=
> +                       if (!cpumask_test_cpu(cpu, &comp->affinity))=0A=
> +                               continue;=0A=
> +=0A=
> +                       if (r->alloc_capable) {=0A=
> +                               for_each_resource_ctrl(ctrl, r) {=0A=
> +                                       dom =3D mpam_resctrl_get_ctrl_dom=
ain_from_cpu(cpu, res,=0A=
> +                                                                        =
           ctrl, comp);=0A=
> +                                       if (WARN_ON_ONCE(!dom))=0A=
> +                                               continue;=0A=
> +                                       ctrl_d =3D &dom->resctrl_ctrl_dom=
;=0A=
> +                                       dom_empty =3D mpam_resctrl_offlin=
e_domain_hdr(cpu,=0A=
> +                                                                        =
           &ctrl_d->hdr);=0A=
> +                                       if (dom_empty) {=0A=
> +                                               resctrl_offline_ctrl_doma=
in(&res->resctrl_res, ctrl,=0A=
> +                                                                        =
   ctrl_d);=0A=
> +                                               kfree(dom);=0A=
> +                                       }=0A=
> +                               }=0A=
> +                       }=0A=
> +=0A=
> +                       if (r->mon_capable) {=0A=
> +                               dom =3D mpam_resctrl_get_mon_domain_from_=
cpu(cpu, res, comp);=0A=
>                                  if (WARN_ON_ONCE(!dom))=0A=
>                                          continue;=0A=
> -                               ctrl_d =3D &dom->resctrl_ctrl_dom;=0A=
> -                               dom_empty =3D mpam_resctrl_offline_domain=
_hdr(cpu, &ctrl_d->hdr);=0A=
> +                               mon_d =3D &dom->resctrl_mon_dom;=0A=
> +                               dom_empty =3D mpam_resctrl_offline_domain=
_hdr(cpu, &mon_d->hdr);=0A=
>                                  if (dom_empty) {=0A=
> -                                       resctrl_offline_ctrl_domain(&res-=
>resctrl_res, ctrl, ctrl_d);=0A=
> +                                       resctrl_offline_mon_domain(&res->=
resctrl_res, &mon_d->hdr);=0A=
>                                          kfree(dom);=0A=
>                                  }=0A=
>                          }=0A=
>                  }=0A=
> -=0A=
> -               if (r->mon_capable) {=0A=
> -                       dom =3D mpam_resctrl_get_mon_domain_from_cpu(cpu,=
 res);=0A=
> -                       if (WARN_ON_ONCE(!dom))=0A=
> -                               continue;=0A=
> -                       mon_d =3D &dom->resctrl_mon_dom;=0A=
> -                       dom_empty =3D mpam_resctrl_offline_domain_hdr(cpu=
, &mon_d->hdr);=0A=
> -                       if (dom_empty) {=0A=
> -                               resctrl_offline_mon_domain(&res->resctrl_=
res, &mon_d->hdr);=0A=
> -                               kfree(dom);=0A=
> -                       }=0A=
> -               }=0A=
>          }=0A=
>  }=0A=
>  =0A=
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c=0A=
> index 4bc7090ad0c7..77a2f2e877a6 100644=0A=
> --- a/fs/resctrl/ctrlmondata.c=0A=
> +++ b/fs/resctrl/ctrlmondata.c=0A=
> @@ -359,6 +359,7 @@ static const char * const resctrl_ctrl_name[] =3D {=
=0A=
>          [RESCTRL_CTRL_NAME_DEF]         =3D "",=0A=
>          [RESCTRL_CTRL_NAME_MIN]         =3D "MIN",=0A=
>          [RESCTRL_CTRL_NAME_MAX]         =3D "MAX",=0A=
> +       [RESCTRL_CTRL_NAME_NODE]        =3D "NODE",=0A=
>          [RESCTRL_CTRL_NAME_REGION0_MIN]         =3D "REGION0_MIN",=0A=
>          [RESCTRL_CTRL_NAME_REGION0_MAX]         =3D "REGION0_MAX",=0A=
>  };=0A=
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h=0A=
> index 195c0948b26d..3c4675656b51 100644=0A=
> --- a/include/linux/resctrl.h=0A=
> +++ b/include/linux/resctrl.h=0A=
> @@ -398,6 +398,8 @@ struct resctrl_mon {=0A=
>   *                             has the same name as the resource.=0A=
>   * @RESCTRL_CTRL_NAME_MIN:     "MIN"=0A=
>   * @RESCTRL_CTRL_NAME_MAX:     "MAX"=0A=
> + * @RESCTRL_CTRL_NAME_NODE:    "NODE". With resource name "MB" the schem=
ata=0A=
> + *                             line is "MB_NODE".=0A=
>   * @RESCTRL_CTRL_NAME_REGION0_MIN:     "REGION0_MIN"=0A=
>   * @RESCTRL_CTRL_NAME_REGION0_MAX:     "REGION0_MAX"=0A=
>   */=0A=
> @@ -405,6 +407,7 @@ enum resctrl_ctrl_name {=0A=
>          RESCTRL_CTRL_NAME_DEF,=0A=
>          RESCTRL_CTRL_NAME_MIN,=0A=
>          RESCTRL_CTRL_NAME_MAX,=0A=
> +       RESCTRL_CTRL_NAME_NODE,=0A=
>          RESCTRL_CTRL_NAME_REGION0_MIN,=0A=
>          RESCTRL_CTRL_NAME_REGION0_MAX,=0A=
>          RESCTRL_CTRL_NAME_LAST =3D RESCTRL_CTRL_NAME_REGION0_MAX=0A=
> --=0A=
> 2.53.0=0A=

