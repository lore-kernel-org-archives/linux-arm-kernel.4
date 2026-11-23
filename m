Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6DE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 02:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kTa+VEUQ;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=aaWbmw7D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uamSJL7kR7eafNJ+Uq8YA9Hu8PFg0ZESPtkdJciTX5o=; b=kTa+VEUQ6Dv3mxTzHt1nUTdvzR
	/tl8ITqaJTXEfuua6mzOKq7QCVuESp2MxspaKeCENoqAx+HMyJ8eQ3ImO/7hylY98GHEdJYr3QoRO
	CsszVfEFqbka+aHVV3WPbJ/x6vcizjqXv+7ptPE+N1TALu3sZE052PP6J+96UG+H6Kz52DSscGzAy
	oayGADlrJSp3J5A/eoLOAOxtbYpTpYt/QBFo2mhmXCNZMXN5lChTFUm74cySIh7GjivWo+tZgnz9u
	nlusQkwWq8sbMSnJ9xmHrTEpIlcImjGWVeLu/+2fKv4MpKEeQxzDm2tjo2AulMjvf6W7KtpWuQkOv
	gvYvVpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVK9r-000000029hL-0yCf;
	Mon, 23 Nov 2026 02:51:55 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVK9m-000000029g7-27HW;
	Mon, 23 Nov 2026 02:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJUhWZhpgaesiAhmgSvvPWczrLBwrGb160KePAvwxfg/gzYYbWYlRaYgIDsY2kUaJ6YTBehWbIs5Wfz7zeWGfIWfbCPVaKEUYTvsiBZHimOm2flOVO+Mkm459tteo4Au4klqmhYdvOeB7pz5dCJwbxT/Rc+q84qFx0cOoGMIBZscWEIyedY54tbFuP3X0rBruvyvAADVAqD0TTSS1P8/2E+CmUE/biZSlQ4EMqhZMcuDtncVU/bRseayKwxWa+swCHwvM3EJUxBS5xLl2MdClMB+9gIWzO/klOavCckAsp+F+E680FlET+ptLJDUxbOrRLMJCE6Apr8/7MQueLS+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uamSJL7kR7eafNJ+Uq8YA9Hu8PFg0ZESPtkdJciTX5o=;
 b=M+7NMOHWyDf5JHNqEzEWeghBko7yH/YCLrXWwzv92BCkm16ZseMDctm1Q6O5X4EvKfgW+2CAC/pMGb0o0tvQpbhfYPbRZVV1tbJLBTTx0N3HOLeKjnwjm2DyyNIpTTmH+XnhNhn70m+krIDIIJwszUyaugxa74Ld/fQudRuXmzcWWv6SYzuP7MAPmVU2Ms1VTKYlWpbUIz5E7K86RxOMVejkBmHyWPlo91vTE2qbwPu1ultdNKcuK+omEE62n9zreZvzw4qNY9qokp2sa+5kFeDRZkMy87jARs6JO5pqKbiJihxLzT/wDQR/qLksxRKBSfMvE4NV83srI2af+sxJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uamSJL7kR7eafNJ+Uq8YA9Hu8PFg0ZESPtkdJciTX5o=;
 b=aaWbmw7DsBjjQYAJmPOIZSR26JKGQz2ps2OygkdzGhKMIPNOlXeylwVGRbT4l7SF57jGgQc3wDpEkvn2FGYlqvLFBh9NP4JErInsgpFZbs6zERxpTn1v0ZHSpcTS0Bclyy+BrJ6/zdErMJmqtUXdb8xfBhHaAnbwDV249iTvwwzR2m+LJCZsyhLYGVqdGh+eS18sIzSu/Z1hS2Pb/G/I/Lc3prfDiliapyXYN7/L/Ovdn6x9GBdnQXAkb2moXKQG34tWYIpk60gWSlxh/ya/BJf5YSEsjlawtjJ0U9K4zYzx2yu4o+wNe9IT8AEZUjM1kWAaMeEprYno3zTXDBY6Kw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by JH0PR03MB7509.apcprd03.prod.outlook.com
 (2603:1096:990:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 02:51:42 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 02:51:42 +0000
Message-ID: <0ea53475-4112-4e27-b06b-b6301f28e14c@amlogic.com>
Date: Mon, 23 Nov 2026 10:51:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] Add support for S4 audio
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <179536124894.2728475.16240917993133855473.b4-review@b4>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <179536124894.2728475.16240917993133855473.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::13) To TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|JH0PR03MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: e813fded-62d1-48bd-6fe7-08df490cb45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|18002099003|22082099003|4143699003|11063799006|261026121527099003|261022105027099003|261026140227099003|56012099006|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: LObOe3zk2qdqtsaqVd8Stg1fbkPGGV/VeWTtH31MRSGPTIbfloPurTT/eg4G7xbgYtBOuiWdtqPw5WrDoi1FaL0flZA2hZMdwUuamo47TCioSbXWFv9RY9JHUna2DkoMoR7j8myD5sIbR0J3OoYTDDES3KestpwsooD1XJ4EFJI/VGkcZ58+5w97q9vdSaPHwIZXgPpyPz10gkG3qaZNyZEmo8RBisaU5sh+G8csEkSbKYQzio+K0uT6D6NMtmabRoA51e3B8Acp5Bk0eZ5Tt33XBbmKKg1QWaNgWZnd9sXN5np9IENpHpkLlR9jm5QNvQQMemTkLxUioFsOO0HqO44CS33wNebnl3za53i2LZRRKgkVLEShgjmv5ys56x1c3NXWAiV7PNDsQ+q15KErpkpMJz0n0qY6JZ05NQvLwf3VysKBp+MVvrB1P/c5zalQo3hrEoKpTAs5KLXzzjj8Vd2ed2FyKUormJ4a6SzIlaZh0PIXODSHweNX+hT1gmW6NFyuQxEIvV5fVD2R6y4svvbNWx1dHBsofParUb9gykfLaPEhCUx35zve3l8ZkfQ/PMy9PCLsbv4tBDM3Kuz9dVUK866DJzh4XBT9Unb763r/57AaOfwm0LbmS6mFKfzOhl+noeQ6gbkAS/kTHY2dPDjmIjcSvQJzLqEdQsd9+Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(56012099006)(261028144727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytXVFhBYWhTdzdYZzZ2SnNESWhVN0RSOVVBdlM1MXpGVENwVVovMys2LzBw?=
 =?utf-8?B?UUhyek1ES3JOaUhyN0F1QUNkeEVJaTJsWEVOek1tME82blBlUUdBRFltS21C?=
 =?utf-8?B?SE1sald3ZzJ1L0RhUi9WS2x4ZDRBZVFOcGtaMzRFckNvMUZ5RUlIR3kwMkw5?=
 =?utf-8?B?QS9vb1ZYL1NsbG5zMExTUUNZOVhrSzBSa3hzTWNLVFNOcFVENllwMzhxNXRF?=
 =?utf-8?B?YkJRUFk1UzRlT2ZHZlJxaGNtNVVUYVhyYmpHTUl2d2cxaFZORVg2YlUvL1gr?=
 =?utf-8?B?dThVRzJHd28zN2hoWEdPQjhqNmRDZjAvaTgvMkdldEtnZzVoUDRWWTBWbTds?=
 =?utf-8?B?MGo2eTlacU5iTU4vR3ZpR1l5QWx3WjhsUThMMFR0UHl5dFNrWmdmakdQQnNN?=
 =?utf-8?B?eEdqZk8ybHlTVVNvcVg5aTFnOUNBZUJrMTJ5aHM5cUNYVUo5cWE0ZERIaFNF?=
 =?utf-8?B?UWxhR0RMaEQ4anVmeEhXUDF6YURCUEFET0JyZHhnblhRUVZUd3ZuYUhsNUFz?=
 =?utf-8?B?SHFmQVRZcWJhMm1zem9BY0Q0SHQ4L2dVWXB4VGY1Zng4N014eHVYZ290a1Vl?=
 =?utf-8?B?eDU5K09HbEFINU1mZ2VjRHRkTnBtcURBRHhEVkZhNnZEWVI5WHQ0R0R6MUgx?=
 =?utf-8?B?UjkxMEp4Y1BTSGdQdHRqUW9EODdJZCt3dlRZM1pDUnZIcXlNS0I0d1Jlc3FX?=
 =?utf-8?B?Wm1RRGNZckVXdW9GODk0RmRVMmRIU0x6Mk45QTJCc01sNnB3anpsMDVkcmRq?=
 =?utf-8?B?RXlUd2V0U3k2cVltN3J6UXR5bGRkVzVSMlhyb1M1aVdrUmpoQ1lPOWhKWVZO?=
 =?utf-8?B?NkpqUXkyQ285bXM3N2tMZy94UjAveHlyekx0UkRoTWgyRGdmK2ZMeUdkVVI2?=
 =?utf-8?B?Nmt6dE9NODdlRitFeVdaVHVJZkdtT1d2c2F3cXFodjJXcW9UNFZzOUR0Rldn?=
 =?utf-8?B?clRxa2pKOXlJcnUrTHlPNmJrdmpwM2VGcW8xRkQvZnZHWmkrL1hva3hqVlZp?=
 =?utf-8?B?ckx2QUp0a01PNi9kNkVCbk1TL25xd0hBdEk1TWptTjB3VjlvbFhkNlcySXZQ?=
 =?utf-8?B?OWM5NlJKVS9TTFpDc3MvOTVueUlZTEQ2VmRYVWtRWmZZZDgrM1R0cWNhZDZ2?=
 =?utf-8?B?dnh6ci9veHEzeVYxbjhYTXNvVm1BK0k2OUlsS2VabnJJUFd3Y1JpMXdBdmRG?=
 =?utf-8?B?MVNCK3R6SUdHQ2ZuR3hBVUpRNEJlKzdQZnNuUnNTa1gvcUhTVTNyUE1IRkdF?=
 =?utf-8?B?aHFPN2xoTWUxcEtTZk0wck1LbGwzcGI4YWlOUjJBZ2ZGMzlZNlZUckpvRnFJ?=
 =?utf-8?B?aXhta1cwZHcwd1RjWGQyUkxHK1pHREZOamlXRGJJd0lvdHNVdlBndlZXakUy?=
 =?utf-8?B?eUdJUU41VTVvODd2Q25PK1BROS9ZRGErV3hZTk15ejFPVk9qRzBoUEJFMGdx?=
 =?utf-8?B?cUVHQ29QNDc2UjlHRjlWS2NCSjdaRkxYeEJWV0VQTnVxZzZNK0d2M2pnL1hI?=
 =?utf-8?B?dy9PaUpMQlB0TVZRV0FEYmZScW9ESG1uTjE0K3JydnIwc21lRlZ2YnNSSThT?=
 =?utf-8?B?eUNabS8zWWlwOEJDdjFxbzBJcFAzUzI0cmtwcktLMmVlNllEL2JlTi9OZXFS?=
 =?utf-8?B?NklyUjcwVXJrVWtyOHRmQVJTNXh6ZjZJbkwvSld0Mkc4cEZMRld4NTlQeGxx?=
 =?utf-8?B?MCtZbkp0UHBNVUcyWGtWeDNaemlOei9CKzJGd2NXQ0Q2cXJhakpraUcycDRk?=
 =?utf-8?B?U2R0dTA3SEUvcUxEN25NQ2lKWXBKVG1WMlFOSCtLbmlLbWJKaW85bXMvVGc2?=
 =?utf-8?B?YitlN0NpWHB0TFdCd1Nvb2I0VnduU1l4QkNVYWRnKzBlQzNma0ZlenVCckhY?=
 =?utf-8?B?QnRCZS91SFZTSVRnck1LWUk1Zkw0ZDFiUVIzb3BCbnZ1bHRtYkFvckJCeWVk?=
 =?utf-8?B?d0Q3RXZBZ2dIWmgvMWxjTGhZOGFjaCtKdGExR3Rzamg2dW9iTHBqem1NclVM?=
 =?utf-8?B?RERtM1k2c3dWVU1EU3Qvck4wcWFhdGVtNzNhZ3BhMEFhNDZ5TEhMRkpHeGR1?=
 =?utf-8?B?NTNhNytCMDlidDRGcjdpYUFJanhEUG5oeU1NWWhDcFY1RWRZeDQwWElxaUJm?=
 =?utf-8?B?NGg3TTNsNDRXMW1EQ01rUjM2a3krZEYydnJMbmo1RWdjUmx4V2d2Y1RlSFZE?=
 =?utf-8?B?c2pnSUdDZ0xzdUQ2WnNjTStuYldNQWUvejVyUUkrSCtMV0diR0dqZmo5RUxm?=
 =?utf-8?B?aitNNUR0TWtXNEtCUDZkYmc3UnZlR1lMa3lhOXNXWFk4V0xRb29YbUYvd1Zt?=
 =?utf-8?B?b296d1hMY3NRajlnbHRzNjBBUng5QTlTRjBaNUNsZldSSy9wYjN4dz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e813fded-62d1-48bd-6fe7-08df490cb45c
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 02:51:42.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5BbiWR2qzMAYArejtFUX4vADv1mVY9JN4sRFes/idUStP2Yw62ToWJyAtUZMaIev7VpFNEOuxm9gG4lxgf87V0ZhSIhxrNTn3Q3uqLOENs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_185150_549336_9CCCA87C 
X-CRM114-Status: UNSURE (   9.41  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


在 2026/11/22 23:27, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
>> This series completes the end-to-end audio support
>> for S4 SoC from hardware bindings to driver implementation
>> and system integration.
>>
>> 1 Device Tree Bindings Updates
>> Added audio power domain and S4 audio clock support for S4 SoC.
>> Added S4 audio tocodec binding support.
>>
>> 2 Driver Implementation
>> Implemented S4 tocodec driver for G12A architecture.
>> Added S4 audio clock support in AXG audio clock
>>
>> 3 Device Tree Integration
>> Add Amlogic S4 audio subsystem support in arm64 DTS.
> A clock immutable branch is going to be necessary to handle the dependencies
> in this series. Please re-submit with clock changes only and a proper cover letter
> so I can merge apply this and provide the IB. Thanks
i will submit the clock changes as a separate patch. Thanks.
>
> --
> Jerome
>

