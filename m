Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q4oNhNLX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FLpOa2Io;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wADRzyAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UUDITZAEW9ee8ym9uaENrFqYTBTgkPJxgYCvfYKvDNM=; b=Q4oNhNLXjNAx2UTfn0mWvBheaB
	y12r5gZqwCRqjHgKylIFsrkhfRjqVnqAQC8+6fWX2RQIKN5V83rfdxrAEKV9ArjKzMLcgQPxo1jE7
	vpA1ANdbXIOEhQnGkXf+QlK6Ju3HkAbgePVfZdvcE3FKOI2T5dorU0XjwNM/X+/BAzK4uKfD98Gkt
	xUrX/ltIt7BpVIZKregekER8By7q7g7gb9f+pJHxzEIEICUfAgu6NWwz5AuGZ0oBm/WLlLCJvdCwd
	C9GTHptI4J8v12r/OJ3LbLwCYmiWCeYrSaTKE4skr7F414fr7bFJD2hOcWWFA93B+iue7uggZSywF
	NMpGxQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFig-00000007nH6-2qeP;
	Wed, 11 Nov 2026 21:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFhq-00000007lHH-3zIp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 21:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UUDITZAEW9ee8ym9uaENrFqYTBTgkPJxgYCvfYKvDNM=; b=FLpOa2IoXoVJ8/lH6/NzZTl9+C
	NzSxZGqjmtBQxjzJB1ZmjNxGb+dSK+24/1GotLS0dzOYbFc4vD5j67F2rN2qe5n6hNQDqNkpvdzY1
	8G6bDLqk65jKVpfM+WZODutMeMVhweM876Ti0zvqQG6XSGcwzUeyfLabmc/RAyg9AlSC8HrWv39lT
	XIKLRfJ/QUMhCZHPNo7EktsKwGGbNiz1LjFl0yOCREa3PxcsjkSm/sHLTRXHGPm4eSmpv41NIicmA
	+v+kbL8G3JemmTPTKXs8QlftiEe2GnJfRLTdNtJsy2+I8Xc/KrzpwDl2QekiWRpVwV7HdqZF98xRo
	x7xSeUaw==;
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFhh-00000009aG7-0jWB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:18:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMjgmieTtfUdtenegw+nScgiMvrNIvMK0960vyI2bimicKbiyssLrgaesQrcP0/4omjGPfbT97VZSbrcrrxs+r73ykFdkcbexPIiItkHqv/pxQfocteoz7/RkUILjcuokCjmyGgPnUNYkmZQIABd2UqR8x3zSMf2j+PTx2/Ke5R6FQiiD7uR7BJGKIUkI5gGuarYtywZfJGo4Sh6rhgWywxsPeG6KMHJAwePprtkhS1KYb4CqdVUi35ca3AhM5mbtRVzcCZ+yRq+9l/0UdWnnjeVvAwjh8bD3h3KEgxagSKN5ZuqneFiDg8QxElG0wgJF7hpdlovUc52HJSNXPxgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUDITZAEW9ee8ym9uaENrFqYTBTgkPJxgYCvfYKvDNM=;
 b=IUUodU/lGZdXI2wqiOsT9zk07eQBb273vUXw6mNIBAds3stVTzAmwwUYOHSoxMKAVQWh2s9oQfdVpaicpGPLXg6N8tR4Z65UUj0k7F1b3JqGzQemrONfH8ommQget3xQX+oHJicIIWvScndeh8OZx2PFn/Y4Kof32hxBZ3rYUzLxg0eDMvACPCdHnt/duLCoTB8CoXdFKZ0xH4pKkCVpcSkxB0WHU58KLGBKOHyDngRXILw9PFWOnxIDHdJmliAcWYONvyMNWUYGfRJkFuuKKxNH6dRUqlCseVSZxFp3gupoz4JtFky6bWA+jbrP1Z+B5QEUbk2CsvkGbbqr8GmkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUDITZAEW9ee8ym9uaENrFqYTBTgkPJxgYCvfYKvDNM=;
 b=wADRzyAgEIHjRdBIf7mZPv9isixYi0lEyG+X2lXkqx6jR7laS9B8obOa+CvjPmfbCM5O509zWgOAfKfNkFHCRpKz688Izcv2oN61vv9LYQkoWSWkXQSfFgQHq02/xHsXUK/jqvmBqgCa2gwy0FmaJIlPh9O8eyj15LHuk3/RAkAUTdN6JJqIJMKEHAHsQrmGLWOX2e0CvDUaUPGo+dJ5wY4NqhDUMYx+ziv3tgiv1vZF0jK9ogynT0z9a+ufCTPmC7tSthlioe9+wkWoKwrOD3q0sc0zr9N5DO0kM9VlNfYxlfuJgRFg8CngKvAD3TvT63i8EbzLLw+vqGLNM7Ptqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI6PPF55290046A.eurprd04.prod.outlook.com (2603:10a6:808:1::3cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 21:17:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 21:17:56 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vincent Jardin <vjardin@free.fr>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: freescale: lx2160a-nbxv3: fix the TCA9539 and 1588 line names
Date: Wed, 11 Nov 2026 16:17:47 -0500
Message-ID: <179443186648.3993950.10338794472735796169.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102-for-upstream-nbxv3-dts-line-names-v2-1-58f234e478fb@free.fr>
References: <20261102-for-upstream-nbxv3-dts-line-names-v2-1-58f234e478fb@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P220CA0098.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25a::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI6PPF55290046A:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be4fee5-a1e3-418e-8317-08df4039415d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|261026121527099003|56012099006|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info: 81tFHx9Jmwx/1H9v652tckZt0CFwfQXW90REDTZxvS4XgCA73+MdF9yH/dVg6zgTPo9GRoXmXCQHnGC3YWMkg9kOW06jhOfmiLGUVnW2FAtDHQYOPi35zkEH3aWAU1Ti3z0WfUw69kZB3oXCI3uAkk/U4gmil/pQlD4ApXsCCil5L1Si5Dk9xObJav2D4Vuv3YtV4BeA2N436tL0QHf0HoIrhVGvgddSkzp+1tN+Ph0GoBdnb+R6w72uG2++fkhVKuRsrG7lhzU6F4rY1MR0U9FGhYyYVlq64qzneegQmvhUxCQy+zXiUdxGkGBh0dfa805cr/vX6+GU0KSkH5Bmy/d4JYK753BeylNLFlxFSbFUgDCVuyn2L5FT/FKcnytkHi2T7USH72zrJzIdRSLXaWnkozhnUlqKY393pImm7zqJaFxomeh+rRTwZSgbGFgEFWF2BEWFbYGqFF7JZcYOeztyz6SCOhaAgEg5kCbIcTihreGcHKnErOi7Tp+pZ3fjRcQv9L6TzC2/wmmj+lJVY52CVGBvKMbzY4JMojKMlsUGboLwxM8meu4QEdej2F9QHBO41dpqS1biheN1oxk2TBwZD3VsS1r19gEXo+EDfS+8OM841U2bAEtpKRKNJLbpuErs+mhdnpFNbs11KKktBtGPERrHIpq+jA/Lgq9aVGDTxwghLg3PDkutPXH5gZmUY0cTApiWqqv96f5SNFFqXJXMQIG7bHIYNXVBAYXiEf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(261026121527099003)(56012099006)(10067099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWtWRkxER0RXTUtqSWpFRUhNeFFLckw5WC9Uanp2WitKb0Z1WTY1cVY1T1hO?=
 =?utf-8?B?LzMrTHNQR1ZwOGhhUndXdHdmWndKMHMvdWFBam9ROG9VdDgrYXZPb1MrNFl3?=
 =?utf-8?B?ZUgwRFErNG1qQnczeVQrRU4yNWdOeXZvZGdEVjYxVkVyV0VwN010bzNUOTV6?=
 =?utf-8?B?SEdOUEhramF0NGZBZ05TL2M1ZEc4NUtpNTU3SGd4ZngrQ1BKMEI3cWUvbnU1?=
 =?utf-8?B?ZGx1eStOMm12cW9Dcmg1VWZJYW9VaGlnRmxuczZuNFJVcWxPUjRZeUNhT0lk?=
 =?utf-8?B?RjU4Z1J5eFh0YkVxUy9LUGtiNDcvdUozVngwTkYxZVc0OFkrOHdIU0ltRFE4?=
 =?utf-8?B?N0U2eE9zRmUzelBNVXFxSFJ4WXNWQkpPQW5zcFREUWhxUjlGNk9TSk12bXd0?=
 =?utf-8?B?U2lTdjRVR0IyeWdHN1EvbTRzTHBGSDVPbzNFQWFaMTgvUDZTOWVNRUkxMFFO?=
 =?utf-8?B?NUloR0dua0UyM2VmMGFXaC8vdXRwNVJYdDFZRTBRcUZFQ2VuMFNIVnpjLzN4?=
 =?utf-8?B?a0NSOEVra09pTkNnRVg1K01WeS8yMDYwdzFlNkpWRFlNTU1LaXdWTW5lZ2lM?=
 =?utf-8?B?SVBBQTFyYTQrRytxVVhSTWhVZUZob1p4SjBVWjZucHorV0ZVdytmYTdIcGxK?=
 =?utf-8?B?OFlycUdsdjh1Si9XelUwNVQzbUFzZ2JFN2prSHIxVVR0TXZiS01KQVhaaDRi?=
 =?utf-8?B?ajJIWjdXS1NScTdGNWVabmhXMHUxcy9seFhXY1d1bmJ0OUN2bWdnTS8veUVk?=
 =?utf-8?B?MjM3V0ducWNkaVpkRkhnOHFHUGhQdktXSzB2OXgyb0hOSzFrMGFtamI3Zm1m?=
 =?utf-8?B?aFNhS1VWR1NjYTFzZ3pWSnRkUzUxZTFWRk9veCs4Q3FOVkRDcVJIOWJUZTIx?=
 =?utf-8?B?QlE2MHRwUmtVa0x2WkNWVUtONHBjQW9jaEUrNHNhYzU1bm00UDBiWHdIUnEy?=
 =?utf-8?B?VFQ2ejgzVnZEOFJ5cGhycEdqTDl2S1JPY0xLYmJHOUYxMlZWTmx2VEVXdS9V?=
 =?utf-8?B?Z01MYnhlTSs0OUd0YVo1K2JVd3ZsazYvT1NLVTVTZkRudURreStVZERUZU9q?=
 =?utf-8?B?dFlSRUVjOThSSm9Bd2ZqeXJkeld1emtpdVRGTFNTK3dLMUsxM01lbVJScTY1?=
 =?utf-8?B?NXByckg1VlAvWXU0VTB1dlcySVo1bXBWMUcwYyt3Y0pldjJZVWdpSEhVK1VU?=
 =?utf-8?B?TmRSQm9CaVVoMG4rRzYwbEx1TjQ4aGZMY2MrK2tNOW13UDU5UjBUNW8zNTY3?=
 =?utf-8?B?RmpTbmdRNjd1K3pCYWZvc3pXRjJNUlBWYzdlczhDSVdRUjVMbTFIS0d0dmZr?=
 =?utf-8?B?UkZGZWcxdU45RTFkYmlySXdMOXR2MDR3Um1wdGtHbXRKV1puMzNPczIwalF6?=
 =?utf-8?B?VG5rNytxMVcyT055a1l5QVNhanFReVpoc2t3SW13bnBQZGtPMTZpM242MGtu?=
 =?utf-8?B?RTZNcm8yNzFxNUVpV21xc1l6dWtEVFBtMUwzeHg1cDJjK1RIQUpVdjQ1MEVG?=
 =?utf-8?B?WnRXQm5WR0hKdVlvOUQwazJ1aDJGRHYzWWo2Si9LSC9EQ2Q1dHZnT3loZXJ2?=
 =?utf-8?B?MTNST0gwQnRLR0tZWUJ2Vlk5eHBUUWZIdGRLc3hiTmhMeFJ4dVFMVEhtQ1p0?=
 =?utf-8?B?SlArbHlkMlpLV0YxSlN2OTlJa3NJUDk5TlhCekVYWUR0eElsK0NUSkF4NjJF?=
 =?utf-8?B?R25xcEtmYmFVN3ZYMUYzVjVkYTh6cDFPQ09XajVLblFGL2NzR2taVHlZSU5R?=
 =?utf-8?B?TW5vNUNvNXgyRGlZVnczUUJ4WFEvR1ZLY0N1Wm5INTgwNmhuWWdBLzJXNDM3?=
 =?utf-8?B?OGs2V1FQdjdHY3ZRZmFIZlFmMkNhY1NEUmVtWFhBSHhZTlZzYi9zWlUxVkg1?=
 =?utf-8?B?enhVVytHUmVFTkx3Q2R2Tjg2bml5QmpWdldORGVSL3NRTkxWaVpBenRkcHZk?=
 =?utf-8?B?ZEVsSkpRRlo1cEY0K3ZnemVnWUZCaTZEZGR1VDRCU3R6cnQ5dGdjeU1VWTVE?=
 =?utf-8?B?RGNtd1RuOU1aT2ZWU2RrR1NFNVBlM0ZXTHJKRDVzYkVnd3V5aTR4OHhaaTFx?=
 =?utf-8?B?aE9rMk1kSU9NNWhPc1FHMkNBR2ZZdG1neUo0cjFrMFFBaGYyR1BXR08vWGlZ?=
 =?utf-8?B?QUVTZXJabEpTdXR1MEZGZnpHbDNlZ3hWVnNXWkJlMjNlZUM3c3RpQ0FFSUU2?=
 =?utf-8?B?QXQ1NTc3MUtNeFJJeUZoSnBhQ0xOL0xrcHJOeFBUUkxkZE0zZDd4V1JyMzhI?=
 =?utf-8?B?eHR6QXFqN1VMemM2STk3NWNQbE5lVEhTbm5UWUxMUHc5MzYzT3ZWSmZyRkpT?=
 =?utf-8?B?dWIwL05hNG9rNzZzRWI0MjluTndEZldjZzBoajNLWlZPeEpXYUZXOEc0Qktt?=
 =?utf-8?Q?86pATLPD6SMWE/dOtvza8ukpQLeTVNzQ3MJX6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be4fee5-a1e3-418e-8317-08df4039415d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 21:17:56.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnYUcZiE1+9kmzBBoJ79DMUec2uHL+hUjfgXGwzeW2rrUUJ9e4AngHvTPEwo6FU3LYNGAniKh2mxY2BiGqzQTNNYpysJ3Se8ksmAzsn/OwNhebZYsPQ0u/G7ay6kUtfW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF55290046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_211801_176847_AD0B447C 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.9 (+)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Mon, 02 Nov 2026 15:12:47 +0100, Vincent Jardin wrote:
> Some gpio-line-names do not properly describe the board.
> 
> The board CPU's RCW sets EC2_PMUX = 2, which gives two GPIO4 pads to
> the 1588 timer, so they are not GPIOs anymore. Name them using
> lx2160 function with the altfn: prefix this file uses for every pad
> muxed to another function:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: lx2160a-nbxv3: fix the TCA9539 and 1588 line names
      commit: 27033665c68765fe81a8201cb06486c027b9df17

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

