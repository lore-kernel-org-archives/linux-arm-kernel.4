Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4DE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0+4G/ucz;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=cU0PSkVp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GfxPGAV3vAK9GHPr8FAumGT8crwX8V9VIz/rlqREHYI=; b=0+4G/ucz9Ma8n9YuIYs0DTxL/W
	WpQgbG9dlDNpyNNzquyhdZDKtfKN0tacoyIJxtPVXzA5LbId26rfdC2HKEJ+z9iUj4Jdas03rISYi
	KGCum8fKi5xzKip2HDeF+LYUoEapg51cXBQD/t1EaaZxTXUmBvF/8ccqyJpeKC1qyVZK1TDJ2s3ED
	imXfBt52y0PxydPzny+XYaJLo3ut5o23LYdqElyE7igloOXQZzYBuzanAY2i/Knt6VOc103O5i7uI
	3XX5f5aDloM21Tgu9qMBNSn7lOLHKK5WtrK8cdyM6uGrKjbtjN9y4c8WMJQQ6AlDzY3ycfaQrRL5T
	PD13Tw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1RV-00000005hjf-47j8;
	Wed, 11 Nov 2026 06:04:21 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1RT-00000005hiu-3ja7;
	Wed, 11 Nov 2026 06:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFh64LTOcwIOy4NU6AKkbscKqpfPZDHvU95OM2VmGiyRf5nzeKLaF7jrgQv0bBlA6UlhIhwriDxxa8GCs66JSKzFZ2TNqFTyF119/rRpJSemOgWXO2RTg6PA7yp54kZ8XJzy0PBEY2VOT2JZC9D/GP33TuzoFaHXTgzme8q1wBy904mZBEiin3e1qcrWSsodhBXTTRxhUIfGaqxEjxrIqqoY0xBq5x4y9FQe8rm0IhZXoyoSxgCRBY3O95KzsvL02AEc95gkw9sqeQTO/yy6gOPrPGhdejpY7WtA1Hr+S4ScKFO/kK9TrVQnsvd0b21XF2ydRroDd2mbh11TmnekSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfxPGAV3vAK9GHPr8FAumGT8crwX8V9VIz/rlqREHYI=;
 b=IxAe9j4BB9Ip1ODWMv4IYl25SWJnhimrRb5MWrC3Tae+dyzh1LsqmVjgfgoQTUzImdK54pViyoidRkFexhAK7ZXpXrXe+u6vnFKYrDw01OYVo9ENuApslCHVKPvJ3O5cpQTY3XnCqC0fIqnSrx1suhDaAB5Hlbuk8mR481yYWNz8W6c0NeGH4Z9nF7ci6EbOhGNRK83LSU8eT70ONswEiPuZ8J/r0OcSKLYUmWr0dGb4t6dv436RLwhBBRv8kr63ZfgDyhfKw0K19161Oj8bEy5WGdrl/1CKgrzxxdIMfgLix9VOUzKAvJ92mbdOBhC7+Yw8KEyyQp14z7YpboNwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfxPGAV3vAK9GHPr8FAumGT8crwX8V9VIz/rlqREHYI=;
 b=cU0PSkVpxepf/MaM+dT1oKLhcTYEAKthTNxqRx+9UPPJ6Es57PgfYr9sr8Mduf8fB/qUHE99UHtUj08mIXsApychHC6l+Ye4QTtSeud9nH/e/EGZA5Z+5TpipsGybvhkEcev7p2Z599lz328m/0nJoiVjkvROgVMSIhR1/cR7/7gFTJUF2XSjnetk8wjH4HGeURUh4MlPpxyw70eNY7OlpEY6Czr927HlIVea7IMek14PO4LOwlIou403G2QK01CW4G9Z+5QNo77+da+6uuJqGhjS71mP9cArbi16De/pl5Z+4ZIF0wIpY2qgxR/saskTR1PF/HZSpNe4vpsWAdIjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8305.apcprd03.prod.outlook.com (2603:1096:820:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:04:07 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:04:07 +0000
Message-ID: <0b49c0b3-1089-47a6-8020-8aa0fab0cf30@amlogic.com>
Date: Wed, 11 Nov 2026 14:04:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a9: Add power domain controller
 node
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-3-1fe20a44bf2d@amlogic.com>
 <9dffc605-2ab6-42b4-a7f9-565bc16d8c07@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <9dffc605-2ab6-42b4-a7f9-565bc16d8c07@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0caab8-4fec-4b7f-1886-08df3fb998b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: T6Rcc8/kr9J9ovd5b0vqY1p3WFoCcwt2rc0Hv7kzr3JNGSKN4+IeGZnfAO+KTzwEXhC2FhAl7zjpPi1nWB2+hMGhFSuassJ5DU/GlMxs9oRE4r7FrxkDW+KmuP+jdDskLElpC/zodChd6VpDyYMAf0sBXR9V7Vf1KVnLzkqRRNdDmHHQrcLd8kgHjGgFQCYf0iat4VnrB4Jq3kWqkaXJsS8FwouFjqI8GgO/JeteWYpegmjXld4aARmKJEdprnpB9IdkCdSy8Ihn4OElyQ/r9V+6V7zwgZ0jFJjMaDtxQ35AA9PF0iORBYjFeTYP6uXIi44Wum1ebbNfxdHVBrJs/GgB2sXK9I3sMu9aO8mGzPA/fLN4iDMWMGehXYLaNoTdbdEh2ueDeP2Mo2q3dI4STD5jorFM1efXB8Gok+9BdWI6zXL5VhlFZoXff263x1SLyyQ0IQjf9PEVXoGTVNig0PLlZylBmK3CJ4yDfU0IvPjWUCkr0FkByy7z02PDE3Nvtftht8de6535E6JP1wjNHPpHa9iK+gwLFKjgl4T209/Z9qZM3fYdwBC8feOW+CiQroBvXwRA1a3cMRbGsTzTvbZoNVxxItN+VsFTZJ+QiqCLNbpkCNNtZIuYCYoJtCzjPFOqKuwlABjAd0OA9tN0/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNCa0JlNmxVOGdnNFRuT0oycVFHcW5KUWc2ZEJ4ZTgzaXp4NEEvNndpVDdO?=
 =?utf-8?B?K0tFZXhESWJpaXpBMjlKYlFZSzl0bHhkakJ6dlJ6ODdCdTJvTjFDNmlYakdz?=
 =?utf-8?B?aU1GS1QwVnBKU1AxSStvR0gvZTB4aGh3U2I4NXhCdWF5bzE2WjltWTkzc2V3?=
 =?utf-8?B?YVdORXV1L2F4dnRnNld0R1d2VGpwcFU1ZXVQTEt4SHlIdnlya25EczhSaG1W?=
 =?utf-8?B?Q1NCMjVSZ2NBdWF1UFZyWlc2RlNGNVlkK0RGNVkvY3hsRWU2NFpud2hqRk9i?=
 =?utf-8?B?M1A1M0JiU0F5MjF6OHkvTnYxSTE3MHRuaUU0SjNTbFNXT0dqbEFoUnpXOHRt?=
 =?utf-8?B?VjBSdktYMnpOcTZuVzNQQ0plVXE2N1ZPK3czbGVleTRRdnhXWnRGdC9ZMzl6?=
 =?utf-8?B?WWdvOW5aclFmTEk5Nk1lVmxuUkpPdmdFOVRDamp3dmlIRnJUQjZ1dTV2cngy?=
 =?utf-8?B?NS9ELzNSVGNuOTBBcTRtN0lweVFaeWNOT0RMK3N0SFBTNmhEWTcraTU4UW1x?=
 =?utf-8?B?Y3dGeDhVQTJseGQ4QXEwWkQ0NWs0SlpSUXZkY0daY1pOSjNYcmRmd2xrbmRx?=
 =?utf-8?B?VEVQTTQyTlFnMjRQd29GWmdlVzJIUTFvNlc0a1FQcS9rWFFBNTFPSnpLYWNr?=
 =?utf-8?B?YVorQ2dGZ0QycTUxdmpiVHM3TkR2Q1hXdnF3a2Qwb1UvZ2FhQ0RScVFrRnZq?=
 =?utf-8?B?M2VrSk4xTnR3Q2JIZHc5VXhrQytsQ1kvSkNCVWhEbTNtRXFQQnVFcFY5bTIx?=
 =?utf-8?B?aHIwVTBBR1VmS0pGa0h6TmNSaG56TGpGSXkrQ3Q5bHpUSDVQRXJZMzl3N2g4?=
 =?utf-8?B?eHluNFh3cjYyc2ptSW1wQ29TQ0tXZ0theU01VUJLam9uaFNMdjFBWDd2SmtE?=
 =?utf-8?B?WkJ4cGEzU2hwb1M1VWJ1bU4yVDUybmxhWWFoTnRRODBhNEFvV2lkRHdWQTd1?=
 =?utf-8?B?angwZkl1eHJ1WjZ0ZkFIMlc5VVlNUWE4SFlZS2F5Vkc2VXhVc0hWYmVrczJx?=
 =?utf-8?B?VjZXbkdDWG95T2VnRzBaSU9zRU01M0YwMEtpaW0zNmxHZkJwb2QzcG5NamdK?=
 =?utf-8?B?aWx1ejRKdE4xTGh6YTZaZHU1MXd0S2kzYzdWNVJsSTZvUldBTjdJRTV2N08z?=
 =?utf-8?B?RUs2SGlpbDUzTytmN0hmQy9XblZzdmhBeFRPUEEyMVBDdCtvd3FSVFk5amVR?=
 =?utf-8?B?MFp4ckdhbjBGRFhxUkFWZ1dJbXcwZ3FteklaeXBxZ3lCRHlFekhvNEZLYlFS?=
 =?utf-8?B?TzlKZjJCdUhIZTdLM1JwMWhDMU9FK1FJRGVCSXVsNTczeXFqbkhWMWttU0lr?=
 =?utf-8?B?NjQrZDloeHNyU2pQRm0vNHpHU2psMFlBTktzZ3FMN3RXaUZ6T3RxMElPMkRF?=
 =?utf-8?B?SStJWkI1YmZBUmw4UVlKODQ0azIwQ0tJZk9vRzhsSm1zMG5OQmsyQ2gwc1Vh?=
 =?utf-8?B?Q1hnOTEyOW00eTFjTVJnL0p1MGE2MDZseklTZlFKKy9IZWxqMG5ibnJDblU0?=
 =?utf-8?B?SkJ6S0YydFNlNk5NZWhjWDRIVWMvSzNYd2xKSkxySlhpU3JLRzB1cHFMSlhX?=
 =?utf-8?B?QWRMV042RWZvVHJLRk9zSWNhb1VLakttcjhjUjJMeFRZRTh5djBIRWZPUkp6?=
 =?utf-8?B?RENMcW5GRnc4VXZiSThIbHllTXRCNiszV2w1TUpQcWk1WHQxdHFMZ0VmcnJk?=
 =?utf-8?B?Qlo1VjVBV3BIcTdoOE95d2RNU2lxZXJBV0FqZ1plSG8rZU0rUHhxdE16QWd4?=
 =?utf-8?B?RkVxZ1cvTFIvVzhHVTlaS3ZuNmlpNFEySHZhL1hzcExlTFJSM25FMmhwU080?=
 =?utf-8?B?cG1xN3hvdXQ1THk4SDNRMDhLT1owR2xzNlFQRUtNbHFuekg1UlU1TzVidHlk?=
 =?utf-8?B?VFJnaHhXaVFCSGpsZmlSMzBIZmJQbTg1SmQ5dFMreDZFWnFWMjFvOWhkRTM2?=
 =?utf-8?B?VDFNMk96Qit1QWJCZkxrS2tDWGVKWjhhQU1jQW4zOXVCV3FXMVBtN2E1My82?=
 =?utf-8?B?azZFUmVNYndUNDl3NGV5WVpCbmUwNEdhdm9OcTlhejRRUWlxYWo3RlkrckE0?=
 =?utf-8?B?SEhGWU9acUFaRndFV25FL3lObmkvVkZsY0tVK2ltSnUzL0ZtcFZNSFZlOVg0?=
 =?utf-8?B?OVd1TGZ4QlM4RGh4UW5hdjFWZ1NzM0U5TUdrR3h3cWxVQ1pTWElNR3UrdlJz?=
 =?utf-8?B?N3ZxZGZ6UE44WWJtN1htL1kyZExkb2gvRWRnSlBQbHAxeFZUeWFSWmErdVhC?=
 =?utf-8?B?dTVKdEdjTHZudVU4aWlKak9pNU5ScnA3cEZwa214NHBCcXNEd3cxY25tU2pI?=
 =?utf-8?B?OE9PcVR4OEdEZGkvRnJsa3g1T0RpOVVwcXBna2VZREh3VmlrbjRjdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0caab8-4fec-4b7f-1886-08df3fb998b2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:04:07.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxcHcjNqoWQGZU5cMlxIzQ3AT5UMAzZ480EfczdDE13y4jqsWNCbuMPClw3samwt8rDcKtOz4T/rEDrpkX1spWeySDN5TK3lJG+9TiwoeFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_220419_961675_AF541B6E 
X-CRM114-Status: GOOD (  12.00  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Neil,

On 2026/7/28 16:34, Neil Armstrong wrote:
> On 7/22/26 10:39, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add power domain controller node for Amlogic A9 SoC.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi 
>> b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
>> index b0e0fadeed82..3652b2034c96 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
>> @@ -7,6 +7,7 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +#include <dt-bindings/power/amlogic,a9-pwrc.h>
>>
>>   / {
>>       interrupt-parent = <&gic>;
>> @@ -72,6 +73,15 @@ cpu7: cpu@700 {
>>               };
>>       };
>>
>> +     sm: secure-monitor {
>> +             compatible = "amlogic,meson-gxbb-sm";
>> +
>> +             pwrc: power-controller {
>> +                     compatible = "amlogic,a9-pwrc";
>> +                     #power-domain-cells = <1>;
>> +             };
>> +     };
>> +
>>       timer {
>>               compatible = "arm,armv8-timer";
>>               interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>>
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 

The DT binding and driver patches have already been merged.
Just wondering if there is anything else needed for the DTS patch to be 
merged.

Thanks!

> Thanks,
> Neil

