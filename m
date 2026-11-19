Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lS+TJvD9;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1LUF8Kl8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X7DBSOYe3gbH8UyyfEoiAOdHJVJkAadX59OIqShSqHE=; b=lS+TJvD9Cz90saD0i5/B5/H2u3
	NGQS7lnRDBUhTbzjZTBUeyRmF5wWnyVnxON/ItKLVAJFK8JO7m/wt9J2t68N5wuimFDTQPsNmtuun
	X5K3rOGNh456b7xDPmvqiarPwcp9JRCEyoaETFHANaKaThEyvuiayq7Q4HAgwv0ChoALHZGVsVb57
	lASyP4OYos4RQTgonMwhmcgRGSuvi7YFny+pEtLI8fWDQGdjcb+2byBa9g5rTBthzmepbZtnAfjPG
	KbHgJpRw2kaq2GO1PSG5Ih5RpkV+tuy5vsgMyTAyYepzpxU9vGvktI3Pq3SUJB+SixvJHCLiwROAH
	cHqOWgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuLP-0000000ArPK-0TL7;
	Thu, 19 Nov 2026 05:05:59 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuLL-0000000ArOg-3DUy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 05:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZLsqiL/LofPmUxMkkKMt2PYW+nLnllL33n3ZN2hCwjBNvBn/FpVXJJTrkCrqIueI5P1bL1FzZIztAk8S2YEepZ2E4M1AtvNaP5/F/51LJf0Rd6lzDxTiKuWltmjHmZ3Wqcsh8nIWxkxCOL7nVVO+Z2tOyGGzy77v/ZMw7NXJqZkaixaYMK9PnMyCAqGNghbxN5MOcU58NWump854cwViZSPaziFH/xvM1DwyUMnDWBuLGQaKyPqiRw+xdP4AxSvqH/lqR86F5fy/wYR6W5TDzh+PMNYoWPJrhHNQj6jF1YoM8N5TnyQQuwrO3DX0mluS9+9br0iAvQxbecacy1Jog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7DBSOYe3gbH8UyyfEoiAOdHJVJkAadX59OIqShSqHE=;
 b=sLVmdze+Q52rYvEDTQzuRfZp/HaWPS3xjyl00cRyVl/AKSFYDGVppByhV44rI4BnKl38HqECZtVp/qjsbWY5kLUA8nLKSwqwgZ5iB0Szym5Max8nuNEvXlCk3Ygv38ukAlCwQLlvVoR9hXDNaqHN1PlqWqhYrM42hwk1RN7m9A3/VbxtNVR7ZwUFhVLbz+dcrkD25HPyXUFu/4QPlxSYK4+T3tw3wpPsawxFjRZLpuJawYZBJgIwhp1oFUAIroZ2N8yXUtDFpnHqyDpduH3q8kh9yBVbrI4MfqiZGiPfcga45NPvkCWH6jqsXD6fJps0KLgzheiGlAfw4RVUgIZs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7DBSOYe3gbH8UyyfEoiAOdHJVJkAadX59OIqShSqHE=;
 b=1LUF8Kl8V/SvQp2RUQ7LEMHf9/A+VmRSienwcIySHpJTyf8MtbmvcLYOVmieIVjVdxKwAzL2hCXLaXQynhowpoqKGydVghmT79nt3w5UhmNUY/v3570EBwplz3p0cl7TVcknQke4D8ilGq0cE3zXdSolYu8SWNyZ2jUTkuUDz8w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB943537.namprd12.prod.outlook.com
 (2603:10b6:404:300::7) by SN7PR12MB7954.namprd12.prod.outlook.com
 (2603:10b6:806:344::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 05:05:36 +0000
Received: from LV2PR12MB943537.namprd12.prod.outlook.com
 ([fe80::6133:7d2:ec90:8204]) by LV2PR12MB943537.namprd12.prod.outlook.com
 ([fe80::6133:7d2:ec90:8204%7]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 05:05:35 +0000
Message-ID: <a813c219-ca5a-4c53-bb44-265402faaa2f@amd.com>
Date: Thu, 19 Nov 2026 10:35:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: add shutdown() handler
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Michal Simek <michal.simek@amd.com>,
 linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20261110-pr_decoupler_shutdown_handler-v1-1-b833dfe9d380@amd.com>
 <avhbivs3HDdvzrtB@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Aravind Thokala <aravind.thokala@amd.com>
In-Reply-To: <avhbivs3HDdvzrtB@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::8) To LV2PR12MB943537.namprd12.prod.outlook.com
 (2603:10b6:404:300::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB943537:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc8dedc-abaa-4ae0-3d52-08df45fabe68
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|261009223027099003|11063799006|261026121527099003|261026140227099003|4143699003|56012099006|10067099003|261022105027099003|261021121427099003|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: 9TkGlPmF1Me2MqMp0Q48Sy6WAkEeZqtA1utlwO9MAC2ADfaX6uMbcSY1qs5LGhyDiz/pOTPScid2B8fDkjTAHwMxWP8ci/jC6uizcU7fsOGuZZiEFKgC60D01UTNigeWQkmLqjVZMTiKPgrtM4fKjnCnV6xMxrjowkMB82Yhu0hzbgLivdANVeaR/F8IRZhaLwtnnA7yENHHaLC2+IFfvUJOj4P2pft3sPM3O7abpgpFFg8V/XrjPbTRo4aGDfRpxgIdNALVrZinz/othcta3XNdkcudi2XFNkOgLgRoyNEXGVpn1GK7W8oMVRQyUGJvXnuyJP/srNJPezZCIXlxfLSV7acvL3iWqdLP43ykLlQ21IE+IMOpC+W+wQKqYp+9QSep5p6WMX7oP49bwb6gNXyxiz/ATfG9mxFK0x8VKfQ2nr4IQ2w9nIwJYmN3rnFXuQj5B7hbwdB69JRQqwFa1R6v9m5gA53y1TRLZ/nnQ8blIJ1UXVkVFjwPWlLdxJ4icB+G1oP03S+WTq3P+qb4377kfHs6gZTOkrCJKo0fdleOcJIAkWVM05ItxZDvJDW1xW3IChwVXE70s1C9mPqF+pZSYf/BhVzg/UJHNNjHQTNdvZ4ZrbKky+afNoocFhjT0PKPFs2r0YbaBSWDS4IgvBlzRoOpVcEaS6RVpTbbL9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB943537.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(261026121527099003)(261026140227099003)(4143699003)(56012099006)(10067099003)(261022105027099003)(261021121427099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2c5UVRGVmtMeEtvbldLb05UZ25KQndKRXYxSDh2TUhIVTQwaE5EcEN2dnFy?=
 =?utf-8?B?QnNzb3JyU1dNTFFKVVZlREp3OFRDTHRpL0h2OHlYK1JXUkl6U2FuTlp1RXE0?=
 =?utf-8?B?WXRjQmVKTERXSGh3Z09DbmlaTnlrY1VQTnFBR2dsdW1IZTI0SUFEODJ4Z0FX?=
 =?utf-8?B?bEdTZzgvdUR2eStFZmp1VVhmTi9BZU5kQ1FRZDBza0c1a2ZKQ2pUL3Nmdm9i?=
 =?utf-8?B?N29ucEJQMmk1RS9Tc0JqVDM3UjlpSUtMWU8xZnVBblJIQmIycmhKYTF2eHlD?=
 =?utf-8?B?VVZ3bzc2RHRSSmtCRmtNbkYya2FuMkNQUTRqMldXR0c1ZDFHYWJKR2pTajFJ?=
 =?utf-8?B?S1NWVit0bWtkUFBBOGIvdlpFU2lSSW9EaDF1MVVHUUhIeVc0Y0ZiN01sZEdR?=
 =?utf-8?B?V043bWx0WG1ZNjU4Z0puNGdTMGpsN3g4TmhJSXdLME51cWZsUnRzazZWdE5D?=
 =?utf-8?B?YVdZNmFoZXViUzhaT3p3NEVPRHhBenJsMUdzSlhjSnBVUGdOUEZMbUllNzVV?=
 =?utf-8?B?c3pmRGRRUDhwaU1INStWVEd0NkxUV2ZmeUpocHFMaTJObGxtUVljanVReWNC?=
 =?utf-8?B?NzRBMDV4WXA1TnVRY29lbnFKTE12THNlMnBGRHZLN2I3cWRjaG1WUG1mRjMy?=
 =?utf-8?B?S3NNdTZLdm1qOUZ2QTdTZ3N5b3pDVVZZbFR6dk03cS95dmF1N0thaGFPTllY?=
 =?utf-8?B?RGhROXVaL005ZDQ2NGZmY2dUV0pCQ3BWRnJyRTdzdlBzWlVOTG1LSHRPbjZE?=
 =?utf-8?B?T3o5a0hPaWZHb095U0xwODRaSmM5RUNvVGNMUTJKNlM5UDMxS3BTNDFQN2FS?=
 =?utf-8?B?cStvL0o5dU5PTWYvVXZuWWtYWXF0T0NJeU1uYVBEM2o0ZVJ6UjdJSzgxMmU4?=
 =?utf-8?B?d0RtLzFhZk9qSjdCOXdYdXpiTm9scTc5ODhKd1JKTlEzYzFERTRoOXpHTVBN?=
 =?utf-8?B?YmhhQ2JZdVlibC9VSld0TFZRbnNaRzlsSHQ3UGtFejdsaW1JNWdScXVnc2wy?=
 =?utf-8?B?NHNVVFdSengyYnRYNVlwYkU3aFM4NHhocWc4T1ZTeUdSTWd0RGFoQnNLcDdn?=
 =?utf-8?B?Nll3YXJWcmRIUnRiQURBU1dSTGNrNXpQVVpEdXNpR2ordFk1bDYwdWRoREVX?=
 =?utf-8?B?TnE5V2w4SGJQajV1R2ZHTTdnZzBQQW5TVzRkRXlFSnJUb3YzTHpLN1NMQjVl?=
 =?utf-8?B?WTAvbmNiaXRUbFJMcFV5U29CYWlUMmF2eWhYdUFRMnV2cE9ySnlZY2NPMC9s?=
 =?utf-8?B?ZnhkZ3U4bjFqWlIrWUtYN0NFV1NHZ2dIOU5CcW1CVzFhWU9QVG1CdWg2RmYy?=
 =?utf-8?B?ZGF3MjZtZEtPeUgxYThvOGVIOS9VZVQwK0NTVFhBUU5pTm9lM0VYWHQ3aVhk?=
 =?utf-8?B?Y3FQU3ZEclJ2U0E4WlY1QVZ6TkVyWm5XUDBNTS9wdE5abkFURFRoS0xyM0d5?=
 =?utf-8?B?RGFyMzFsRXJrUFZZM0lDdExrUmVPUVhoMHEwOHEzUFZQNjJTenh2WU1OUWtn?=
 =?utf-8?B?SDJDZFJUclZiSnBaRkRNZXJRcUhENkttSHZ0bTdodGNLakU4aXhsUTJkQnRs?=
 =?utf-8?B?b0tPVVpwU0hGeDA1d2dORTNDdjZyeU1GY0hnK2xPb0hrdDc3U05TYWtDV25N?=
 =?utf-8?B?UUIrRDZBZUFKQ0IyRWd6OVRrRi9Nay9raFpVNnFacHNKOFhkZk5IUnY0OGNl?=
 =?utf-8?B?NHl3Z3NDTkNYN2xGelplZU5qQzBrVHJFTXlyQ002V2U5UXFWSW5Da0xVb3JX?=
 =?utf-8?B?SGdnb3ZGcGlMZWtraWpZWnNQMy9DTmtIblhqaW5takpQQk9KZTVuVmxmQU1U?=
 =?utf-8?B?UjJDaDRIWHBBTlpJblFsWXJiMVR3cE8waUpVZGxkdE1UWmRMbzlmWUZaSnk0?=
 =?utf-8?B?c3dYNWo1TmRLeWEzMldlM2I2V0s1bkhPVTJiTlRYK2huTzVEWXdzOVlGUGhT?=
 =?utf-8?B?c2NzZUxLWlhHK1NCWG9PemcxY1dITEJwcWJDN0tEUmJzWmpEcWlzU3ZhL1R4?=
 =?utf-8?B?b0swN0FtMmtQblc2S3BGLzBqOVJZMWtiZWxrOW84VG85emk2bzZaOUJXNGty?=
 =?utf-8?B?WkxNL3dEZUsxY2I3NDMvMkFvbVZ1WVlWMHY5Z1laSm1xamI3SmsxZVFqTkxB?=
 =?utf-8?B?ZGdoTG9VZnJmYkEwT3Vnb3hETWxtZytXOUw3QXlVbE5PTUJOK0hDdmxyYnI0?=
 =?utf-8?B?ZzdDMStrWFJhMC80YVRUMk4wZGQ1MlBRTERDejhHd2xWMWpKTHBUaTA3MVV6?=
 =?utf-8?B?VXhJWlVhc1B4eGpJZC9WY0F0aXIybkJaVWppUTRzSGFlZ3dOMCsxS2xpdG1R?=
 =?utf-8?B?cW4yd2sxUkZNRUNrV1F5dHhpb3o5cUdQNmhKQitWWWRPS2twbVlzZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc8dedc-abaa-4ae0-3d52-08df45fabe68
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB943537.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 05:05:35.2152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7Gdjyt+CadsBdmBBi/LvIbKrUtvTJPLfl7ZT3eh+KEgNfGtjpGzooofiS5Lp0uIc5OyXrk1th8CKPUyBiYqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_210555_817622_BFF577C3 
X-CRM114-Status: GOOD (  21.37  )
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

Hi Xu Yilun,

On 11/14/2026 6:30 PM, Xu Yilun wrote:
> On Tue, Nov 10, 2026 at 12:46:35PM +0530, Aravind Thokala wrote:
>> Add a .shutdown() handler to decouple the Reconfigurable Partition
>> from the static logic on reboot, shutdown, and kexec.
> 
> I'm not sure what problem are you going to solve by gating the PR region
> from static region regardless. Please specify.
> 
> Before I get enough information, I generally think that's not the right
> way to solve problems. You need to gracefully handle the specific logic
> inside the PR region which actually impact kexec, so that they work in
> expected ways, rather than abruptly cutting down the HW connection
> regardless.
> 

Thank you for the review. I will look into this further and follow up 
with more details.

Best regards,
Aravind.

>>
>> The handler writes CTRL_CMD_DECOUPLE to the control register. On the
>> PR Decoupler, this turns decoupling on, which stops signal changes
>> passing through the bridge. On the DFX AXI Shutdown Manager, it
>> requests that the IP stop passing AXI transactions through.
>>
>> Signed-off-by: Aravind Thokala <aravind.thokala@amd.com>
>> ---
>>   drivers/fpga/xilinx-pr-decoupler.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
>> index 1405ddbe88f1..75b59edbf440 100644
>> --- a/drivers/fpga/xilinx-pr-decoupler.c
>> +++ b/drivers/fpga/xilinx-pr-decoupler.c
>> @@ -137,6 +137,13 @@ static int xlnx_pr_decoupler_probe(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +static void xlnx_pr_decoupler_shutdown(struct platform_device *pdev)
>> +{
>> +	struct fpga_bridge *bridge = platform_get_drvdata(pdev);
>> +
>> +	xlnx_pr_decoupler_enable_set(bridge, false);
>> +}
>> +
>>   static void xlnx_pr_decoupler_remove(struct platform_device *pdev)
>>   {
>>   	struct fpga_bridge *bridge = platform_get_drvdata(pdev);
>> @@ -147,6 +154,7 @@ static void xlnx_pr_decoupler_remove(struct platform_device *pdev)
>>   static struct platform_driver xlnx_pr_decoupler_driver = {
>>   	.probe = xlnx_pr_decoupler_probe,
>>   	.remove = xlnx_pr_decoupler_remove,
>> +	.shutdown = xlnx_pr_decoupler_shutdown,
>>   	.driver = {
>>   		.name = "xlnx_pr_decoupler",
>>   		.of_match_table = xlnx_pr_decoupler_of_match,
>>
>> ---
>> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
>> change-id: 20261110-pr_decoupler_shutdown_handler-bf2596f6d1de
>>
>> Best regards,
>> --
>> Aravind Thokala <aravind.thokala@amd.com>
>>
>>


