Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F34606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HzOpeQpN;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1mnv6mBb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hXofRKU80HobS0eEy0BLJ+bXjd3BZ1obLil78HUAOCc=; b=HzOpeQpNAuncCsILu/lotjhv77
	TfMd0FjEU+z6uQjJnkXsUuxwZL2w5t4QE4jZJBb3s64yQSzd979VDtJXAEbgoBK7sViA9mpDttVsM
	92A67DQKYCc3LAEsFwY+vti1T44mR3rS5qWfhw4C2Wx++C+YtvQkq0no99tidN/TU+ozT/zX5ooTw
	VNhDSJBxX8qcEgwtoTt3O0fJKqd5FE4Z+BfcOqG+0yGiYWe2QxAAB2V7xPos7c25+9c75mPo6DxSk
	zitdvMBjwv8E3w22cOQ7Os5H1SgB+uLMS/x6hONEk46Hf3zwhHWd58Qx9k/PhpURp/qU3eebS12hc
	1n8bh7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbDM-00000008Bdz-3njk;
	Wed, 18 Nov 2026 08:40:24 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbDI-00000008Bdb-2mLM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylmUT5bZfDxB2qz/q2ZzLjHu5uCWoSQgUuu15cwHEDzf7BlzFLqy+sCvNHbrf0IR7Hk8i9jDB3IK3ZmiRk1VscNZbRlL047qec254BFjHE9JKedOuoe6GA57b6DlmhqzVeIGroFidLQawlICeOLw86OXsyOHcHQLsYStO5aK1HvlkTyL9t8Neb+ySp8gxPzSGb0Hhu4MM+wzePwPEd9w5/dtfwtuUHUhXFKhk61bE5uyuWd8HZ1VTKp/iDhWJYC/s9nv9qezH1fT3g5IVeWZcc+HMl/YxHfiGhCdy/O++SZ2ZF+OA+eQzCat7i8tBOCE78xbfxnnjURQxrkVU9nsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXofRKU80HobS0eEy0BLJ+bXjd3BZ1obLil78HUAOCc=;
 b=SLoFIcAgEpUs8J2eZDzMsStehdH2UrOB57+NOQTAGKZgJNTjh8/WghJuJ1AFGJjC/1wqpX89t9US9DbjhRyhiPp6Du3MF4LY/7xlRCJb7CnXCstp8KJyK/06fUn69CQxWjsk2D5jmWaCPvMbeQpMCg4rftEXZv3vSXrml6Rl1vr6zncWsPbzO0iHcRDW++7QmdZBTyONp7NSO/EQh2x7lJF4JR8+y+RofQFLWZ9pq8CcshoPNroDrb8+weGapWru70kYAj2/+xwsexy/fIDp7bzuwZyrksbeH56d6nj+jsnam1gAWdvkzB0ooODcGvhfCpBtgO4NZe8NFQ2uHUMrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXofRKU80HobS0eEy0BLJ+bXjd3BZ1obLil78HUAOCc=;
 b=1mnv6mBbp4b1DGGSepdPXBBRpUziwF8r7pbeBMtEV2cxldV8D+zDDemC2OdbTKpFJLrSre667Lt8grZGSnPJdYFNarUV1xImHh5anvEqBDYwCBdoSrdWWPSwFf7DDFfLEcqBOJIWaSyqsY8/ujogWqhD6YDYCZSSgf60GFU7nvo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) by
 SA3PR12MB7783.namprd12.prod.outlook.com (2603:10b6:806:314::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 08:38:22 +0000
Received: from DS0PR12MB9060.namprd12.prod.outlook.com
 ([fe80::e096:864d:d60a:c83f]) by DS0PR12MB9060.namprd12.prod.outlook.com
 ([fe80::e096:864d:d60a:c83f%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 08:38:22 +0000
Message-ID: <85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
Date: Wed, 18 Nov 2026 14:08:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL terminated
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
 <20261117131616.0a631d5c@pumpkin>
Content-Language: en-US
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
In-Reply-To: <20261117131616.0a631d5c@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DS0PR12MB9060.namprd12.prod.outlook.com
 (2603:10b6:8:c4::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB9060:EE_|SA3PR12MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 44271f06-7127-4522-db4b-08df454f4ddd
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|6133799003|3023799007|11063799006|4143699003|56012099006|261022115727099003|261026135527099003|261022075727099003|261028144727099003|261022113327099003|261021121427099003|10067099003|261009221227099003|261021123027099003|261009223327099003|261009221727099003|261009223027099003|261021135927099003|261102123227099003|261021130227099003|261009220027099003|261021133027099003|261026140227099003|261026130827099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: M02bDW2vX/UFPgDlNMzKUcnnMejPN8yeQVCQ36C7ysCQ2vYsELALi0vbyMCbSUCDPxiC4ieMOUswRFFEwpWPyYBZgNSYa+vQyRKKkAdE32Ziv5fFx4q3rKyCSUN8pSNNutxyHdH2ATViciUsKgDjNqy/u34spUCTHrYgVZvyW+31ACRmup/VdmjXLQ7yj1MRhJbNAYzMbKFSiZPUG9UpA+460UUbE2iwBzRedIjmlIkyYAVmy1Tb4ODD/5GIYEihM2oGofvsDrkK08yGxomSrDAoMnVZXPLA61xgkN/AgRiAr+EGH0Z+fQO5RpHsUeqxZ0e2pFlfVGAYHDv7yqMMl7s0/zI/3DrYbNHT5bD87vj/sI17IRx0Qlc0edLgswLUmEb3i7xXLgpx2TOPMNzyGWiX8UPIqhumvOofBisiRinqkYwOe+CQeYzSLhSU7K5wnBFJkjVmq9aVomg6F1uwRMuUgLbBGTbGItx8qpNQ+JMO5JTNv1c47o+XCWGRFlmSSh+IVW+fx1FzoHfln4qg2KVzyPppXCY9ErHtzKYWp34DFwP9nq5numaZ/uSYh0jPouBLzsJG58m7NMQd+iuu8gzau67lOLAfManqLD3Z8OwUIpWX9KZ6nqBHbBRFJDD+fEAzj+aXizV089s61jR/djjZXjREEoi8fLOs5PbXPh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB9060.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(4143699003)(56012099006)(261022115727099003)(261026135527099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021121427099003)(10067099003)(261009221227099003)(261021123027099003)(261009223327099003)(261009221727099003)(261009223027099003)(261021135927099003)(261102123227099003)(261021130227099003)(261009220027099003)(261021133027099003)(261026140227099003)(261026130827099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hxK1Y0NHRCR2pna1BIUEY4NjErdDVWT25PTllIZlFmMms0aUoyczhqZWtL?=
 =?utf-8?B?TWF4Vlplbnc3ckRzbENoRTl0cWIySDRZYncwdXRLVUhCUGNOQmdmVkJwNmlw?=
 =?utf-8?B?cDRNbEJCSUx6ci9HQjl1UE5JY0tWUXFPMnQ0MXhXdG5UZDB5R21uWmROb3ZU?=
 =?utf-8?B?dlhNYmJ5WkZhalFZYnVpcXZpK2R2T1pqSnFVSVNWQ25WRVNEMzRaMlIvQnBI?=
 =?utf-8?B?UGFOYk1lMWE5ZklvSzcxRVpxeDRPQVZwb3NoajlFSWRoRlQ3eSt0Ly92R28z?=
 =?utf-8?B?eXM5VVJtT2xSWEdUbUJQa3kxTXh2R3RLVzRsQzFBd1hNY0ZkRlBPTkIyVDRZ?=
 =?utf-8?B?aWhaMlVsY25JNGdXdldmc0dxdzl6MEw1S0Q2dWNlc3BUaVFoTmk4ZHJ6VHIx?=
 =?utf-8?B?QW9DbWpCamtqOEZuNkZ3dE5nb3RRWGlQaWdVNDI4bjlwVjNQeUlvZnZ5ZzRw?=
 =?utf-8?B?Z3Brd28xM2lRdHlzelB5Z0xDKzhTN2hkR1ZoMDBudXhDOVRiUnF6TS9TdlhK?=
 =?utf-8?B?b1A1eURHK20zZlBBa0xDNkQwNjhDeDJkdDZodW52MUE5OUdjRGJMMXR0VE9i?=
 =?utf-8?B?NXJsNFRmbkkvWVB3TXFyZVFOSHZpV2FRcnF4ZThWZFkzUjh5dkRXRnVuWkhn?=
 =?utf-8?B?SW9nczhZY0Q5Wm01UkhQT1BKWUN3YmJZTldnd0k1bnVTaDJQQm1CSnBEaTlL?=
 =?utf-8?B?eHp2dXhCS0dZc255SmVGNW5oNUs5Y1h4NjhkUEsyZWduVXo3MnFJZWIxOURE?=
 =?utf-8?B?S1RNQmVMNlRNVmMrMU1EekZ0bEtLVXhSblBLakdOQ2lhYWFPazFmRzNWNDlX?=
 =?utf-8?B?RG9MY0N2ZzYyc0lUWEVFRlV1Yml1c2RiaXI0SkJtODFDeUhYVXQ3S1VuSW9v?=
 =?utf-8?B?ditLWmgveTgvQ2k3Wkdwb0FiK0xZaHYzeldyRm1Fd1E5aUxDZmx5SUp4b3JF?=
 =?utf-8?B?Ukd5a25WWjFnV2FwbmZ5TkhRdTNDQ2lSb29wYVRMdWQ3aVM5U0xHYzE2TDN2?=
 =?utf-8?B?QjAwU290RVZoT0RwZ0d3bWR5ZnhUYTBZejNkSHE3OFlXdFdqZjZickhhOXpF?=
 =?utf-8?B?b0psanJVNWh0czhiNzN0SDUxRlNVWk1GSXdWRHdWbS9VQ2htVWhpeEJuTDN0?=
 =?utf-8?B?SUhtOTNiRTltSzZCbVlCbTNZYjBNSzE2UmZRUkRjdTlDUVhib0tJNHVLRXlY?=
 =?utf-8?B?LzZ6enBJS1UrSGlEaGg3Wk5tV1JHaHRoSGl4ZGxKT0RGVHZIenM1RStKZmta?=
 =?utf-8?B?L3NzNFB6N0dxbzlrUDA2dXZYZW5oOW5HbzVqOGlSZGJHTWJTdnJSVU9RZW5y?=
 =?utf-8?B?SWRvbDNXWjVpMTNmY2JOTmVKV1A2YTVkWHFDbnF5dmhEcDM1dzNGTnRoU3Aw?=
 =?utf-8?B?VVBLMDA3TWhFV2hTNi9XazczT29ZQjk1ekN6ZVpFSVpiT0JuTjEvNVVEQllS?=
 =?utf-8?B?eThBZ1Q5b1BLYSsvRUVIVXhJbm1xd3o0dldxdXJCUXE2S3d0bzFUbFNTdy94?=
 =?utf-8?B?cmZXV2FKMFVRaTBWLzJldE5QQXIwUlh0eDQ5ajBwdTZFMndVdGc1UGtOT1R5?=
 =?utf-8?B?aFZZa01YN2Jib1FOK1BzVERWYnkxbEkyQWJac1VWaVMvaXJyd0dzYmhvREpN?=
 =?utf-8?B?Ri92M29wS3JYSFFqQWQremYwY2JPOXh5TzBtZk5wVzNwenpnREpJeXhPZmlh?=
 =?utf-8?B?SWlvNE9GZXQwK3JvOURscmpsSW9JalhlTEkrQjlERmc5OXhiRndHQ2NJMXMy?=
 =?utf-8?B?MTRnWnJmM0VVWVVPQ1VZMHNJKzZtK3Z1ZzR1cmVTNGViekVLNno3TktaWCt2?=
 =?utf-8?B?ZHo1TzJBajREN3h5RVB4cEJ6d1d2MFFrYU9uNXk0SHByVUNrdWg0YXdiaUQz?=
 =?utf-8?B?dnFwUjJYUW93M3J6U2NhMUIyTHFGZjZsK2pEc2x5dDRyWVNZMnNFZzRFNFBv?=
 =?utf-8?B?UmxpMzJwODlVK0lYSUdEalZvb2M2OHlsbFl5bG03S0ZNWkpVY1JoekhvV3dH?=
 =?utf-8?B?a0FsTldEQ1ZRb3ZkZmdEOWZGVm8zRzBKVkRleU5LbHFwUlVYdHBGeVhKbEpv?=
 =?utf-8?B?YWdkVk5LL1BxdWx6V1JPalhCK0VxRHZCUFIyWS9DV0ZWbDZsZUFmZFpHSTJm?=
 =?utf-8?B?SFVuMysxeDY2aEwwUGV6bU56NjlvcU1oYURXWEVoWGc4dG16dWhwV3NXblpm?=
 =?utf-8?B?dXBRdE4vM29VbXdRaXRkR0IyeWRqZGZ4UVRvTkRzdWZsMG9lREhpT0Y5L0Vw?=
 =?utf-8?B?QTVQZ3JBTytvL01GYmlka1VGbndTc0dJVXNqMHp2VTU3YUY2TVpLUG5RUVY0?=
 =?utf-8?B?K0RqT0l1SHY3b090YnRLblloRVUyUVBVUGxLT0JtWkUvZGpGSll5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44271f06-7127-4522-db4b-08df454f4ddd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB9060.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:38:22.5265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICZ+PW1Xc+NXtbGo4MJNQ3/XvDzDgs47U4UjmkaxL74TIAU5oTcieItUJiMYTJQ9cFAVhc3p9I8wHqJP9kAlrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004021_109062_CAF3CCBE 
X-CRM114-Status: GOOD (  18.68  )
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

Hi David,

On 11/17/2026 6:46 PM, David Laight wrote:
> On Tue, 17 Nov 2026 13:09:47 +0530
> Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:
> 
>> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
>> 16-byte field and does not guarantee NUL termination. A 16-character
>> name fills the entire field.
>> The driver copies this field into a 16-byte buffer and subsequently
>> uses it as a C string. For a non-NUL-terminated name, string operations
>> can read past the end of the buffer into the adjacent groups pointer.
>>
>> Reserve an extra byte for the NUL terminator and explicitly terminate
>> the copied function name.
>>
>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>> ---
>>   drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
>> index aba129ead04c..c778133fadc2 100644
>> --- a/drivers/pinctrl/pinctrl-zynqmp.c
>> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
>> @@ -29,7 +29,11 @@
>>   
>>   #define ZYNQMP_PIN_PREFIX			"MIO"
>>   #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
>> -#define MAX_FUNC_NAME_LEN			16
>> +/*
>> + * Firmware returns the name in a fixed-size field and does not guarantee a
>> + * NUL terminator. Keep one extra byte for the NUL terminator.
>> + */
>> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
>>   #define MAX_GROUP_PIN				50
>>   #define MAX_PIN_GROUPS				50
>>   #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
>> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
>>   	 */
>>   	zynqmp_pm_query_data(qdata, payload);
>>   	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
>> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';
> 
> Too many constants....
> You might want to try embedding 'name' in a structure.
> 
> Then, at least, you can use sizeof().
Ok, i will define the below structure

struct zynqmp_func_name {
        char name[ZYNQMP_FUNC_NAME_LEN];
        char nul;
};

and initialize them as below.

memcpy(fname->name, payload, sizeof(fname->name));
fname->nul = '\0';

Regards
Sai Krishna

> 
> David
> 
> 
>>   }
>>   
>>   static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)
> 


