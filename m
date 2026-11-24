Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF75606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ajt1f2Jv;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=CRwHSRJM;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=rt4m/giK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=axVmUSeOQRUXzObL6mTDF9rKvao8koFNo986jAYaims=; b=ajt1f2Jv3DBufCZBWh2vOO3bEF
	rC6CXITJ6uCImVyVYVKTBBDpP7DvMa0snlxP/NxywM4Xm62IOSCXmO8Qj+6Cp/Az48lWPEBL4lY+9
	JCz1bsxajgatCoi113C/Xe3MDP72Qo2UsmUnDo1d9zNTowSJfkqhDknHBlOkz0ZRYagNnXfehqBnC
	c+cBb/3WWb/0R0UKQyXrxzohbfHnRX13TW7dGoVM2RMwxcUQx+upqG1l5s3bQOc+58+GDa9l4neCV
	1f9UupAJdSJClGt3q4RaZdrccV6OFCQKHW/9iYtC1AkDDMCDmctNCXRBXA2lnZuy7YS8AjgqL5kdR
	wZoXcQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoaH-00000006KaW-3TQb;
	Tue, 24 Nov 2026 11:21:13 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoa4-00000006KRG-0GJ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:21:04 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAvRG6592387;
	Tue, 24 Nov 2026 06:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=axVmUSeOQRUXzObL6mTDF9rKvao8koFNo986jAYaims=; b=CRwHSRJ
	MDqwjGHSJGmaj4SGXP5YQpOZ37DIhPsrc6mIsETy5zKGcscsIel4lp+KhbutnXza
	IhHYpyKsMhZve//LiuVWvqelaY+/6+auCdfb8kv0CdL4MQj8LT4EeZBH4XvRF6Z5
	o1dLBAX0L+FmVjStEQMFhL1SmdpPz5ovy1GqkuX6/7pp9i2xfDRxjsvy1GvvGYik
	NmNcz+0U+f1GEtKqjCyUBgcLkRGXopkadxXNaHolq+AIMN1z+I9Ni7I3cye5kTLr
	6tt9Hb4zCE1jNAvSZfUU3PEf69L+qoYAogFhx2j48pW0sHiafBPVv7GqBUL77uff
	yFL3lfc5SMY9X6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=axVmU
	SeOQRUXzObL6mTDF9rKvao8koFNo986jAYaims=; b=rt4m/giKb0rMxnt2U3sB5
	WEBqGDMCXZeWi4u12fAh+Al763gEigPDzuM+E//k++qrVF/F4s/EQfahmOKpdYVm
	Ty3SFeJ5ZDi5TJPAUlnp3Rjoma9whYtnicGBr3E1WLOhya06j40kzRNh4tuXYArQ
	u4GHcXpqVjx3H1BHjFj+hCq9NxITHUYGS96npBZg9VBoRsgmnpQIqVA9q8t46EJA
	qCgYJMl0374PRPfNXl9QE8E8bXQ15k8rjy1KWy5FArR8U2MuGahtSjTOofP1CJuK
	AqL+hnf/BhrpQcpHJGH2sX/flUdbqhWfskqeMaICeK697A69d8xCRQ7tbsw1FQLx
	g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4j574h0raj-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 06:20:27 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ2UdC0nLbVrnStMLZQjXFMVhDj5Rcvhu+lykILk2O2yEgWoHsWC7pmKrR5ZOXzp9USMfTww0ImwADwmDiJ3mL6H74oJLy4hDFokTsTJVh1Z2GLdYuL1HaOb5d/HNB+zu5WPu1t/4pHJCN0h1nWBZ4h52H/x+3q3Oj6ohSmsPlgyaDqDIWdA6AgVm19zK+4z7ukvmvyPrVTPlxxA9Ab7dyXvsVjaAGbXHEFlbFHTMuNcoSGPTH8DNzAOg4Q38h2OzDufY6X+fSeNhWoGk4+0Aq46OkEPmVgCEzVDzB1hEtIMiK+CF8rYWm7Zn789NRtggewtGugY4jPJHqu7wiwjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axVmUSeOQRUXzObL6mTDF9rKvao8koFNo986jAYaims=;
 b=CU22i6bD/HqsJxgADGdFdOuMlbtgNL1d6+9nIUb7L2WWx/NEoNocgPFkDVs8B+Oxe/s9bWC4rJAu2mOqZEwk1S9brS5xiUf0iRofh3dY73oNaKqbrna9i8CYd7XwT5B5DW/rRQEDfW3y3DgJVvvwn9PoyhKzxgYUT9kvnB3Z90o3EoLX/l6kcN2A5Zl7fDjPdI34sndjddlqWec8viaEMm9ZBRPCG+Dq/unLz3o2W3EuUtvqta7MWC3X1/vsXd5Sem69KGEalTk6Ys5cFmi4buv5FZ89I5jULhIwDYNZGMt3mxwL8VW3YrUqH0oU1RftWjQbZGC4pHD9T4FVZ5wJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SA0PR03MB5545.namprd03.prod.outlook.com (2603:10b6:806:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 11:20:16 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 11:20:16 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Tue, 24 Nov 2026 11:19:43 +0000
Subject: [PATCH v7 3/9] dmaengine: dw-axi-dmac: Use bus width capability
 helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-dmaengine-support-wider-dma-masks-v7-3-5d57df2c3ebd@analog.com>
References: <20261124-dmaengine-support-wider-dma-masks-v7-0-5d57df2c3ebd@analog.com>
In-Reply-To: <20261124-dmaengine-support-wider-dma-masks-v7-0-5d57df2c3ebd@analog.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-spi@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795519198; l=2831;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=HwWZISiJEFGlZ4TfImjsDUS/cf0Y2y4TBCsBmfiJulQ=;
 b=YUP85G+/Jwj2JG5Kqc2hNYw0L997xBBzV1ljZpjkZ6bIL7ZIXOQEj9g+6OVu93LMsdI45QQJs
 SH/afR2TbgFAKtMbvGPZNKfL46dD0JFNjWq6bSDrLrNUiXPBsLOoCbQ
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SA0PR03MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: 772590e5-8b7f-4327-b9eb-08df4a1cea9b
X-LD-Processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|11063799006|261022075727099003|10067099003|261009223027099003|56012099006|261021121427099003|261021123027099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: DtH3qaBziQMxm+2R3YjBZys4ymGXjnNFI2PxAhPyYVUmRYr8nhXoCVbCy2s5OBJnx6s4afJWYA4bv9YmdpDsC6sUASfijMcDz17nZEuuhgMw0iU1nnGsd37DJGiVYklA0/lM3NAffGNYq/NMSzw57uVH53+bLbWVo39JSvFnTTyIte+h4bNpoa8J5rjhNsR8FCgkgubeolc+hHx+xV6BTRIoYbODuKKIr5ppBrC3pL2u4ZOLCxVtQD2NKNXKRN3xZlAFYhAm3ETWOgFLyL5O34wbyO9nEcBDb6o5Veh6vHE7bcUV73EfXUzqk9XcJudhRKp8Md8OAgmtAhR0GAeLQQwv/u2UvM4lthfQOWn9b3UFmNbKoW/oJOmtXuXIgkgqk3cPO7Ovx5MdqHirsLFh4OuyW2sHqTkbq8C3mlI0HW7ObDt1tE1rP+yP+1A7WtJWMdclL43RA8mU8QgDnyM/n/ZenkgF5wOQsYqjWXD6hNuwczFoG4GZY6ZODfM0bz5hHSeMEVLUG852g4gQUr46VndHNQawhW+GOozwGKYjtINaWT08Ishn0XEPf3z8njPqAyMLe69FLPaKZA32ICoBnVZVX2ssHRPVOz2Wp8d9LhA0TY+cXfL3qLaRrBGp4203DIinSM3c6uYmGfcuC9snpmOunp5yCPPTUm+rMVmEXcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(11063799006)(261022075727099003)(10067099003)(261009223027099003)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJwbjIzRTY0UG9td0l3dlNVRGhGRWlJa1lQcElNT1YyNnhnVlhrS1dUeHFx?=
 =?utf-8?B?UUVheWlFZU05TC9zUnBtaXY1MklEckkwL0VrbVoxaW9RYklkUGhQNXpSeGkw?=
 =?utf-8?B?TEtHRUFlNFpIUXEyTkcvbE8rc2xHRFNueDZEMytBWnZtY1ppRTJRazh0Vk1Z?=
 =?utf-8?B?bWxnWldBdXA2ZHVwTkl5ZXEzUk1CTzNVcmZWaXU4WmZWWjdXOGNSS24rYWQz?=
 =?utf-8?B?ZWk3L1NFUXJiNFZPbEo5cGpieTZCeW14Z2lyM2FiYVc5NVpkUFYvb1FNK3Fh?=
 =?utf-8?B?REpteWRQWlJoUWZXTnUxSHdQanhHdHhIRldYSEN0eXUzUzZ0RUhqTU9XMTJG?=
 =?utf-8?B?VUdYbFdWYXl3L2t3QnZDQ2Q1VXpmaG4wL1lDQUJmRzlMYU84UjlFWUh3SmtD?=
 =?utf-8?B?YXZFOE5OZHg3dzhZVzErUUQ1Yjc4WW5UN3FhakdqdzZ5Uk5YYVhGRllKeng5?=
 =?utf-8?B?RFlBRkxEVTdDLzRoQUJuNktnQVE0RDQ3U3hUcHc4YWZmNGVPM3EvNER5Szdo?=
 =?utf-8?B?TkxYQ1ZDNFVLVFFVUXBObzNhcHkySlA1cXpnZmpQK0tTTk1GOE1Fb241eWpq?=
 =?utf-8?B?NzFJaFYxNmNwZlk2K3JNcHV2bk5SVGhveDZUYkxBSHFOWlNYZklXMDlUbWwx?=
 =?utf-8?B?MURwdTdteGgzSDZZQzNEeDRDeS9kd2U3eEY3NjUwY1kvOVpjRGk4WWJGRmhJ?=
 =?utf-8?B?VjE1RWxvc0Z3eE9WamVjeUUxSG96TlBUYW02dTlnRlp1TUgySHdGNTNCQVVa?=
 =?utf-8?B?RDF3VDFVQUhHMXcvQkllS2o5NWZ5NUlJaXgvNHZFRDRyN1lDVU15ZnFZQkZE?=
 =?utf-8?B?V1pQZlNnRHFjUkJrREtnSEw2ODk3VEtQNGUzbWVaSkxLdVZsVnpYVHYyWWZm?=
 =?utf-8?B?cmVZQVlLYXgrbFllZ0hna3JqU2hSQmZURFlWZG5TTnhnakFxVlBNaXNsbkp5?=
 =?utf-8?B?RGlFdjZza3BDV0pKYW1OR0owU0ZFcWEzTkJMakRQdjBqTzhoTlRNTHpNcVIr?=
 =?utf-8?B?dVMwRVBPamRTNStjOXBlVmZHZ0ttWUt3S0xEb0p0djljSURDdzVMMzltNnll?=
 =?utf-8?B?K0R2SCtPaFJ1NnNuRjdscHJBMVo0NlFveld5dk4zdUoxazhkUU0xQlU2UU51?=
 =?utf-8?B?N2hwUVhGL2VPQ0dXYmsyYzI1RkI4d3BYV2huYmt2b1ZBQkt0MVZBWEhjV0hP?=
 =?utf-8?B?RG1LWFYzYzZkd0tRZzQ5RVkrNDJ2bmF6Z2tNM2FIcC9jQXhTcElydGJNQ3BN?=
 =?utf-8?B?c2JnNmtaMk5hbzBMUitFSGZySkFGZEMxZ2FwWmlEcWhWSjlWaGt5M1NKVmY4?=
 =?utf-8?B?Tm40YXBadWl2SjFOR1pma1BmQW9tR2JQenlETDR4YndJNzBXQnU3eE1ra0Ft?=
 =?utf-8?B?UVJITlFqUTR6K1M1NTEzTS95dmZnTFZCcXBEa3A1RUFHY29CaC9wN3NtOHVj?=
 =?utf-8?B?Zlg2YkJpTlI0TnFFUWEvT2ZyLzlNQWc5aVY3NmZmRDNWU01uQ3F0VGxIY0JJ?=
 =?utf-8?B?UlhJUnJ3eDkwbEZtS2xOcnE3clJYQlZiVmlQUnJmTzJ3WDZ2ck5UdCtwSWJT?=
 =?utf-8?B?Wmw2RXlVckREMXdLNC9TdDJlNHliVU11ckFjN0RkN29saVJRV2VmUzgzZVpY?=
 =?utf-8?B?bVZTYURLdzRDZDJTT3FtQnBDV055UFhMU29nNk1nOUhxZFpJTzl3SkFrMEwv?=
 =?utf-8?B?RkF1aFlWZkFUM2c1SWFtL0w5dUdxY0RXK284S2ZETDdEcHRCMlEyNW1ISmhC?=
 =?utf-8?B?Kys1NEViSUZlWVBvYURlTHFzdWNkeHpDelRWYk4yaGQ1dHQ2d1FJTzBiYTFW?=
 =?utf-8?B?YitmV04vWFBSaFlidkFLelJJdWVsY2FEVHNXMExPd0FTK1JFVEV6a3Uyc0Q4?=
 =?utf-8?B?N0ZvNFhOZ3dKTlo2L25TOTNNUHpOTjVhUnEwMU1tWDY2MkVmYXMxaThXRGda?=
 =?utf-8?B?cWNVT01SWjZybkhJYWJzVURrdWRjM1hPWVRnbFNNVDBTbVc2QkQrc2o1N2J0?=
 =?utf-8?B?NHZGOThoWFlEOWVCWlRNWllkVHlYWUpXdzFWQTBobXRVakZxQXgzYTRoMUZW?=
 =?utf-8?B?Skh6YUpwQVRtZ2JTc2JOdy9tZnl2dE42c1dUa0ZEeE0zWVZGRnRnaVg5SGF1?=
 =?utf-8?B?bkdIcGFoT1Zlckh6dm4zd0pVWkUydlBqc0FIc2hZMnpNWnlLZ1QxNW1EMkFD?=
 =?utf-8?B?NTM2MWUxeUVLdmlJUDE5eERhZEY1VmkzYTJxRXlYd1VxMFNrL0dHSGFLRHNC?=
 =?utf-8?B?dlRaaUxMUTJtaEJRTUtTRUpjeHg1UHZBellYc3pFTEZ1TjFLMllaMDg1d1FH?=
 =?utf-8?B?SEFuQWJhc2laT3kvK0JiSkZJV3ZtVHV4a2FDUGo1bG5SVC9NaDQ2QT09?=
X-Exchange-RoutingPolicyChecked: W9N39PD6FhMRF87yVah1NMiYn8oiFygZlXOv6QdzLbS277UUZREtl0N+gxxjFDZC5/DFsiWvQAhQn3G4fc46oYIuVKr8wftLNKXL1THiSDJgNGrQ4i1Z7thWbm7MmCjXWhRZ2CzmlgWlZEZjV1j8hpq3ZSfTXwQ7r2WzUVUtP9j1CbNDw+EV5Iqw07T8tN984Kua5LCdZoLQ8xrT9NjJ/iocpxfm+/9V125z/SZeZNuitc0VJ4WwJ0rMXrzAFoSn0zycUo3EtO6K9L3+ESK/ISbA6DLTkpfTs00zscEIjtmis26CH482X0Jf1hlOqorbw1pwbk+0Uzz1d7T1tHvy9Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772590e5-8b7f-4327-b9eb-08df4a1cea9b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:20:16.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cI7IRYpxvSk7DmDTXa742ZqpUZrJIgI5gJKZQ57A7mJdSapjLwHdl5PAHZSGdg+//7sLkYn9prLlVA8XlXS6UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5545
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NCBTYWx0ZWRfX6/EeDGOZY9r1
 s6/pVQX9kBhtpl/ceqPmQXUws/VGuB0JUDWkPMo2CA+imhbj/1AHGFLbNLVuvOvpHr2OJA9qr9N
 KkRfKssaZFtRMcHwUSkH545LkDo9vqWXs+ulbWEjLTW0Hx22+LQdHAq15+KOkrZqSb6VaAfqLhk
 dl1ebtuwfYRTAOAjZaiYaTIGTx2V5eh64CrfByqZW4foQcpEevRxRZLwP9gyckl49s5jcIJjIWD
 YfyT/uT5t5C7Fbr25uJRLhWHdBRsEkc0Rl22+4c+bl+JT+cWVC0rDSHHUKl2ZoT64tuIus2RSDl
 8ahDJuA4Wd6EvavSwCZCvSAbXcwl4zn5Ue+5egsFVGywm/vs7cR61Xsfj7f678LMrd/Wj37iaOc
 LmpGPuIhPaAhBDfuHt4+u3yrJy4iA7NOjUMGL6fynlxyahJwS6TgoCf5AEAI+fcN3aSuQLSR61L
 Ht6MMES/j3e1ZcWpkRA==
X-Authority-Analysis: v=2.4 cv=Yt+a1IYX c=1 sm=1 tr=0 ts=6b0572fb cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=8AirrxEcAAAA:8 a=gAnH3GRIAAAA:8 a=y_OmukUNvUlgtTeSwsgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: qCdOcPc2guGYYuJM1s05vLSNiOSBLsqh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NCBTYWx0ZWRfX/rYbA2/xd3eT
 HbmtHBDhbKGAckuWFBAA59N1lEd6y55zE+t+gonGUwWzlSN1yGIiOjOeUvKcWrR2azEFkwZJ/Uy
 rQWEnG6D0QW/u4LKoyQO5t3qriYeCZmvCaXaHXN8bd50mDieQP/7
X-Proofpoint-ORIG-GUID: qCdOcPc2guGYYuJM1s05vLSNiOSBLsqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_032102_171308_EE34F376 
X-CRM114-Status: GOOD (  13.60  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Advertise the supported bus widths through
dmaengine_bus_width_set_many() instead of assigning the legacy u32 masks
directly. This keeps the driver using the new bitmap representation
while preserving legacy fields during the transition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 39 +++++++++++++++-----------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..f7a0e926fdcb 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -34,20 +34,6 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
-/*
- * The set of bus widths supported by the DMA controller. DW AXI DMAC supports
- * master data bus width up to 512 bits (for both AXI master interfaces), but
- * it depends on IP block configuration.
- */
-#define AXI_DMA_BUSWIDTHS		  \
-	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
-	DMA_SLAVE_BUSWIDTH_2_BYTES	| \
-	DMA_SLAVE_BUSWIDTH_4_BYTES	| \
-	DMA_SLAVE_BUSWIDTH_8_BYTES	| \
-	DMA_SLAVE_BUSWIDTH_16_BYTES	| \
-	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
-	DMA_SLAVE_BUSWIDTH_64_BYTES)
-
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
@@ -1476,6 +1462,20 @@ static int dw_probe(struct platform_device *pdev)
 	unsigned int flags;
 	u32 i;
 	int ret;
+	/*
+	 * The set of bus widths supported by the DMA controller. DW AXI DMAC
+	 * supports master data bus width up to 512 bits (for both AXI master
+	 * interfaces), but it depends on IP block configuration.
+	 */
+	enum dma_slave_buswidth buswidths[] = {
+		DMA_SLAVE_BUSWIDTH_1_BYTE,
+		DMA_SLAVE_BUSWIDTH_2_BYTES,
+		DMA_SLAVE_BUSWIDTH_4_BYTES,
+		DMA_SLAVE_BUSWIDTH_8_BYTES,
+		DMA_SLAVE_BUSWIDTH_16_BYTES,
+		DMA_SLAVE_BUSWIDTH_32_BYTES,
+		DMA_SLAVE_BUSWIDTH_64_BYTES,
+	};
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -1557,8 +1557,15 @@ static int dw_probe(struct platform_device *pdev)
 
 	/* DMA capabilities */
 	dw->dma.max_burst = hdata->axi_rw_burst_len;
-	dw->dma.src_addr_widths = AXI_DMA_BUSWIDTHS;
-	dw->dma.dst_addr_widths = AXI_DMA_BUSWIDTHS;
+	ret = dmaengine_bus_width_set_many(&dw->dma.src_bus_widths, buswidths,
+					   ARRAY_SIZE(buswidths));
+	if (ret)
+		return ret;
+
+	ret = dmaengine_bus_width_set_many(&dw->dma.dst_bus_widths, buswidths,
+					   ARRAY_SIZE(buswidths));
+	if (ret)
+		return ret;
 	dw->dma.directions = BIT(DMA_MEM_TO_MEM);
 	dw->dma.directions |= BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
 	dw->dma.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;

-- 
2.56.0


