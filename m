Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF38606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2bhLIiHT;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IWzDA7MN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OF22Ucnl3ZCxcE/Nb9MUN1QcdW8Ovj6ulxi9x4GFWD4=; b=2bhLIiHTpByZ9h
	JgUx7ySAzurSaxgOhkn0ISBNQ1MMWlA09PQkjZDYqUQ3JcQ+aIblX6B07g3S92Nlz/OtRws4Jwkxp
	V3Ntu9oWp8+6sxAKtEldjF4iA0gFeFu6ep3L+tKaaRG2x4w0pFMcCvL8PDlo47ji2KUPYJvP5XuR1
	oubyk9TOp9QzIxcWw4iCKwXSUBQcSgDdfeNAV+EQmceJO+oyZfjbIrRFyrlami373scUnPmAIeFhF
	XcEQ/sAX5HBaQ9seJMPlmh9OnEhT50m/btZPLqJCSHpRHI8GkXSHHyyl+vS2r61dET3ry2OpfBcW6
	2dMcD6/WZI9k0PJi+hHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIxT-0000000BBoB-3rW0;
	Wed, 25 Nov 2026 19:47:12 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIxP-0000000BBn5-3iRd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:47:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbLrrYFQgE2FcrCdDwlyR9EMOE5dPPmPwilnjIeN7werfEDFvravlvnI6G25rJo1U92AWmVEJGpl6olIShXJc9KeshqiE27Kr4+gkTQ4DIR6MyRSRX1BYcNGABANooSvaUb9Mux+OopBmw1ly0ntsvCrKsrGC/cH+kd68G74heWpdOClQ98S7YoEbArh4E2kxGuylfSNbApfrwY6Jq+KnoU/pz8quBJ69quRASkfQafWTvlB6+x1DAlNY6oO+cWBya93r703Xa3FLYzcfLEOCISQcXckZ3UBGPgfOn6eYPgpVfgX+pp7hcnwuXEC5qoCk/WMuoIpZ5cqmNhfIF37eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF22Ucnl3ZCxcE/Nb9MUN1QcdW8Ovj6ulxi9x4GFWD4=;
 b=QKeFMXdcO32OH7V+xbuoDIX/8uvEYo+C8w08Wq/XXHSmkft9xQY7vsloqKUTVky4Y82OkdDNebDNfdEcWCAQ60Z2sgoL09vGVIgLK/NsXSNO5NsPEQqqXuNxOHmWQs2Qq7RmBCK+yOrJL+q0T+Ce5mw6H6z4Orq1HA+F0nT+YIiW/+DanB7BvPoCBnX5ePmHh0HN3cEcrnmsRJOn5byU+z6M8jn0VHBuuO4ezIv7sGBmLNEhyolz3kQpK79x4FEjuTKsSlwLByrCpvxQIaVN0HzpKEluwmATXNiBcAkB0B7z+4f/kf9dQe6k8c2X6+AOBGuW+q2fQVnkDbpXBnRFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF22Ucnl3ZCxcE/Nb9MUN1QcdW8Ovj6ulxi9x4GFWD4=;
 b=IWzDA7MNfeyomfzi5b69K9EmHzeR/w7pCBUi+nGncmvh27E5PP/VBy8GHyJTVVkJtU+hDZhdglFbZOwUT5E9+K1UzQ5W4+lKcqnE0DiTxypIboB1nVqcHoVvieIahkqykdhuQuji1fY1rrsv+Z0dVnEMS/JM6Fi4zAHJNuWE30E=
Received: from CH2PR14CA0048.namprd14.prod.outlook.com (2603:10b6:610:56::28)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 19:46:59 +0000
Received: from DM3PEPF000265B7.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::47) by CH2PR14CA0048.outlook.office365.com
 (2603:10b6:610:56::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Wed, 25
 Nov 2026 19:46:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265B7.mail.protection.outlook.com (10.167.23.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 19:46:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:46:58 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:46:57 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 13:46:56 -0600
Message-ID: <24408f35-6f46-26e5-1bc9-5c6424681adf@amd.com>
Date: Wed, 25 Nov 2026 11:46:51 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Content-Language: en-US
To: =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>, Brian Xu
	<brian.xu@amd.com>, Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, "Vinod
 Koul" <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Michal Simek
	<michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	=?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
 <754c498c-7252-3f2b-54e6-3ebfdf0181ff@amd.com>
 <47182dbe-018a-4ca6-b20c-f6e2afa5f474@gpxsee.org>
 <c7f5a712-a2ca-2424-cc63-d262c21d5381@amd.com>
 <dce94458-c9bc-4762-902c-7094d9bdc3c8@gpxsee.org>
 <2e8444da-ad9f-033c-c22d-400b27bf0d76@amd.com>
 <1e8e9867-a6ad-4af6-9e27-d06f7540bf77@gpxsee.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1e8e9867-a6ad-4af6-9e27-d06f7540bf77@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B7:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6bd984-048a-4c3c-a9eb-08df4b2cde03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|22082099003|18002099003|56012099006|4143699003|261026140227099003|5023799004|11063799006|261026121527099003|261022075727099003|261021123027099003|261102124227099003|261022115727099003|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: +gorfTDwvOWT8fK9N+9fq9P1zfVERIhtpxq1MI1FcC49vIjujRM3yHI/EuLIiac6R1gnxJ59ds3jpqebgS4a9pc/KMp3k1W5cr82JKzg3SJlbAregfbBiy3yHfUeKKyP0LHEc9DY+IEeKKZLJ97j7jcim5htvPJSkQy9LZvJzpL/oIjCj6FDcOLY2XooOXDjIUxcLw4xESwC6UZyDmcsmjL0E0K0K8v1U5HDfjMlhDak22UChxqeU9tpxUKQw+fBLLSTK824yprslE3+dkMkEZFN534M9c0HO1ljsAwBqvmwxEHUcyNERtiZMeiqyy/4grls9OGRQiV45pOo5YsX8xSbqawRLJDBmRmLLI+/VVP7DjLA2stDTOdSNrm6C17AQoZiIGYqCzInaLtpefSexVEwMnWpPHwa8l3Ud4fLQwJ0Y2xDZlJ0oLgEmSZ/FJQgib1wSQ1Q6HLTYZsSNY5JKUr1zZiaOEvY+p+VswFpu70LYINRfaT8ZnyG3Fm7mtwAN3iT4jFTjmSKAlITjySdeQNOQWVph0K/M3WvqnyvPHDMQ9GdPtDoD8cWjuH/YZCl6mdUgn8Xq9TzjKU+CU9AEnWKzGZ3XQxbK/AJqSqGuMHPvKoGzMhHBqrLXH/3UkZP7Ap7NdJzEM8OZ8iT3YeQjwdvcZvXM2O83MXB5Gv2jwL3+cISAIvnXfcuBqEmo224srlHpXRjUz46iyHsOTzPgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(261026140227099003)(5023799004)(11063799006)(261026121527099003)(261022075727099003)(261021123027099003)(261102124227099003)(261022115727099003)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Xuo38vPa3io8VQ0yD58ruRymtIl9KMe4HqqCO0dgDxfxkF6r/BhTxJzjVO1zid81ca/mQVLrcIWYLJh5uAnCflj0JovI0i1jN3UMLEgQyyjIhysgBcy0pZ+MiOvyb8+Tz1wB6/NTNw5l+le6u5t1jKotH4quUaLpI5eAVWtVEx/cwS8hzdN8uB/nrSlmIBexg5fH1CJqCecRBjazqplTBCVkjtXtR+dOQxIk1ociwJh8z/ZFmjziQb2g4hqeguRkedsxvjJWtRMJJO53V/lsit6mWRBK6FQl69Cy6HBVsqqQ66CwpLJB1Jya2kav7vSzxZ3fUh+Kimj2xADqCgPLHqi3WLM5JVQuUrskn4C//jA1uHESV6u0azAO7p2E87yd/a3j3p2axIiP6Gqv83/2L9sHokW1851535RouZxMiVJx7KQtv1VmemN1Pf7CzWf8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:46:58.4571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6bd984-048a-4c3c-a9eb-08df4b2cde03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265B7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_114707_933323_9500E7C1 
X-CRM114-Status: GOOD (  48.51  )
X-Spam-Score: -3.8 (---)
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/25/26 06:51, Martin Tůma wrote:
> On 11/24/26 6:57 PM, Lizhi Hou wrote:
>>
>> On 11/24/26 02:35, Martin Tůma wrote:
>>> On 11/23/26 8:00 PM, Lizhi Hou wrote:
>>>>
>>>> On 11/20/26 14:21, Martin Tůma wrote:
>>>>>
>>>>>
>>>>> On 11/20/26 22:40, Lizhi Hou wrote:
>>>>>>
>>>>>> On 11/20/26 09:23, tumic@gpxsee.org wrote:
>>>>>>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>>>>>
>>>>>>> Add the missing PM suspend/resume callbacks that properly 
>>>>>>> reconfigure
>>>>>>> the XDMA HW on PCIe suspend/resume.
>>>>>>
>>>>>> Just wondering if we could destroy xdma platform device in your 
>>>>>> PCIe suspend routine and re-create xdna device in PCIe resume?
>>>>>>
>>>>>
>>>>> While this may also be theoretically possible, there are several 
>>>>> arguments against this:
>>>>>
>>>>> - Every driver using the device would have to do it instead of 
>>>>> doing nothing and rely on the already established infrastructure 
>>>>> for PM in the kernel. 
>>>>
>>>> I am not sure if all xdma users would expect the same suspend and 
>>>> resume happening automatically.
>>>>
>>>
>>> Why wouldn't they? This is the standard Linux PM model that the 
>>> driver is responsible for the device to be fully operational after 
>>> resume like it was before suspend.
>>
>> There is sound card case which uses cyclic dma. In this case, it 
>> might need to restart the data transfer after resume.
>>
>
> The patch is a minimal patch that does only what unconditionally must 
> be done in the xdma driver during suspend as no one else can do that. 
> It expects the parent drivers that have initiated the DMA transfers to 
> stop them in their .suspend callbacks which are run before the xdma 
> callback is run (this is guaranted by the driver hierarchy and the PM 
> suspend/resume order).
>
>> Also I did not see you stop the inflight DMA in the suspend callback? 
>> Would that work on other devices?
>>
>
> Again, this is left to the parent driver that knows best how to stop 
> the DMA transfers that it has initiated. All drivers are advised to do 
> so in ther .suspend callback. Some kind of "hard" stop may be added to 
> xdma if it is required by xdma self (or preventing some damage that 
> I'm not avere of). My tests with our HW did fine without such explicit 
> stops in xdma and the current state of the xdma driver violently cuts 
> power to the DMA transfers anyway, so it can not be worse than it is 
> now with the patch.
>
>>>
>>>> How about adding device_pause() and device_resume() callbacks to 
>>>> xdma driver and use dmaengine_pause() and dmaengine_resume() in 
>>>> your pci driver?
>>>>
>>>
>>> This seems like a crazy workaround for something for which there 
>>> already is a standard kernel mechanism that works fine. No one will 
>>> like to implement some obscure special handling for xdma devices to 
>>> make a standard case (PM suspend/resume) work. Especially when there 
>>> is no real reason to do that as the standard method works fine 
>>> (tested) for XDMA as well.
>>
>> Just provide options to minimize the risk and unblock your work. Are 
>> you confident to have the common suspend/resume to handle all the 
>> cases? :)
>>
>
> The only thing that I'm 100% confident is the patch is much better 
> than the current state where XDMA-based PCIe cards are left completely 
> broken after PM resume and the system must be restarted to make them 
> work again.
>
> There may be additional steps needed for some HW that I do not know 
> about, but I would let that up to additional patches when the 
> maintainers of that HW come with the issues.

Thanks for all your input. Sounds good to me. mgb4 is the only in-tree 
user today.


Lizhi

>
> M.
>
>>
>> Lizhi
>>
>>>
>>> M.
>>>
>>>>
>>>> Thanks
>>>>
>>>> Lizhi
>>>>
>>>>> And it is not a simple "one function call" which would be needed
>>>>> (and duplicated in every driver), there is some additional re- 
>>>>> configuration needed, eg. the user IRQs.
>>>>> - The creation/destroying of platform devices does a lot more 
>>>>> stuff than just initializing some registers. It fiddles with the 
>>>>> IRQ and memory allocation/deallocation which you don't want or 
>>>>> even can't do while the system is in a PM suspend or PM resume state.
>>>>>
>>>>> M.
>>>>>
>>>>>> Lizhi
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>>>>> ---
>>>>>>>   drivers/dma/xilinx/xdma.c | 147 
>>>>>>> +++++++++++++++++++++++++++++++ +------
>>>>>>>   1 file changed, 124 insertions(+), 23 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>>>>>>> index 9d827c9a1267..d6772b38d8f7 100644
>>>>>>> --- a/drivers/dma/xilinx/xdma.c
>>>>>>> +++ b/drivers/dma/xilinx/xdma.c
>>>>>>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>>>>>>    * @irq_start: Start IRQ assigned to device
>>>>>>>    * @irq_num: Number of IRQ assigned to device
>>>>>>>    * @status: Initialization status
>>>>>>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>>>>>>    */
>>>>>>>   struct xdma_device {
>>>>>>>       struct platform_device    *pdev;
>>>>>>> @@ -135,6 +136,7 @@ struct xdma_device {
>>>>>>>       u32            irq_start;
>>>>>>>       u32            irq_num;
>>>>>>>       u32            status;
>>>>>>> +    u32            usr_irq_mask;
>>>>>>>   };
>>>>>>>   #define xdma_err(xdev, fmt, args...) \
>>>>>>> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan 
>>>>>>> *xchan)
>>>>>>>                   CHAN_CTRL_RUN_STOP);
>>>>>>>   }
>>>>>>> +/**
>>>>>>> + * xdma_reconfig_channels - Reconfigure DMA channels
>>>>>>> + * @xdev: DMA device pointer
>>>>>>> + * @chans: channels configuration
>>>>>>> + * @chan_num: number of channels
>>>>>>> + */
>>>>>>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>>>>>>> +                  u32 chan_num)
>>>>>>> +{
>>>>>>> +    int i, ret;
>>>>>>> +
>>>>>>> +    for (i = 0; i < chan_num; i++) {
>>>>>>> +        /* init channel hardware */
>>>>>>> +        ret = xdma_channel_init(&(chans[i]));
>>>>>>> +        if (ret)
>>>>>>> +            return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>   /**
>>>>>>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>>>>>>    * @xdev: DMA device pointer
>>>>>>> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct 
>>>>>>> xdma_device *xdev, u32 vec_tbl_start,
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>> +/**
>>>>>>> + * xdma_irq_config - Configure IRQs
>>>>>>> + * @xdev: DMA device pointer
>>>>>>> + */
>>>>>>> +static int xdma_irq_config(struct xdma_device *xdev)
>>>>>>> +{
>>>>>>> +    u32 user_irq_start;
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    /* configure hardware IRQ registers */
>>>>>>> +    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>>>>>> +                  XDMA_CHAN_NUM(xdev));
>>>>>>> +    if (ret) {
>>>>>>> +        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* configure user IRQ registers if needed */
>>>>>>> +    user_irq_start = XDMA_CHAN_NUM(xdev);
>>>>>>> +    if (xdev->irq_num > user_irq_start) {
>>>>>>> +        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>>>>>> +                      user_irq_start,
>>>>>>> +                      xdev->irq_num - user_irq_start);
>>>>>>> +        if (ret) {
>>>>>>> +            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>>>>>> +            return ret;
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* enable channels interrupts */
>>>>>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>>>>>> +    if (ret) {
>>>>>>> +        xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* enable user interrupts if needed */
>>>>>>> +    if (xdev->irq_num > user_irq_start) {
>>>>>>> +        ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>>>>>>> +                   xdev->usr_irq_mask);
>>>>>>> +        if (ret) {
>>>>>>> +            xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>>>>>>> +            return ret;
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>   /**
>>>>>>>    * xdma_irq_init - initialize IRQs
>>>>>>>    * @xdev: DMA device pointer
>>>>>>> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct 
>>>>>>> xdma_device *xdev, u32 vec_tbl_start,
>>>>>>>   static int xdma_irq_init(struct xdma_device *xdev)
>>>>>>>   {
>>>>>>>       u32 irq = xdev->irq_start;
>>>>>>> -    u32 user_irq_start;
>>>>>>>       int i, j, ret;
>>>>>>>       /* return failure if there are not enough IRQs */
>>>>>>> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct 
>>>>>>> xdma_device *xdev)
>>>>>>>           irq++;
>>>>>>>       }
>>>>>>> -    /* config hardware IRQ registers */
>>>>>>> -    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>>>>>> -                  XDMA_CHAN_NUM(xdev));
>>>>>>> -    if (ret) {
>>>>>>> -        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>>>>>> -        goto failed_init_c2h;
>>>>>>> -    }
>>>>>>> -
>>>>>>> -    /* config user IRQ registers if needed */
>>>>>>> -    user_irq_start = XDMA_CHAN_NUM(xdev);
>>>>>>> -    if (xdev->irq_num > user_irq_start) {
>>>>>>> -        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>>>>>> -                      user_irq_start,
>>>>>>> -                      xdev->irq_num - user_irq_start);
>>>>>>> -        if (ret) {
>>>>>>> -            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>>>>>> -            goto failed_init_c2h;
>>>>>>> -        }
>>>>>>> -    }
>>>>>>> -
>>>>>>> -    /* enable interrupt */
>>>>>>> -    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>>>>>> +    /* configure all HW IRQ registers */
>>>>>>> +    ret = xdma_irq_config(xdev);
>>>>>>>       if (ret)
>>>>>>>           goto failed_init_c2h;
>>>>>>> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct 
>>>>>>> platform_device *pdev)
>>>>>>>       return ret;
>>>>>>>   }
>>>>>>> +/**
>>>>>>> + * xdma_suspend - PM suspend callback
>>>>>>> + * @dev: XDMA device pointer
>>>>>>> + */
>>>>>>> +static int xdma_suspend(struct device *dev)
>>>>>>> +{
>>>>>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>>>>>>> +              &xdev->usr_irq_mask);
>>>>>>> +    if (ret) {
>>>>>>> +        xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>>>>>>> +    if (ret)
>>>>>>> +        xdma_err(xdev, "DMA channels IRQ disable failed: %d", 
>>>>>>> ret);
>>>>>>> +
>>>>>>> +    return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * xdma_resume - PM resume callback
>>>>>>> + * @dev: XDMA device pointer
>>>>>>> + */
>>>>>>> +static int xdma_resume(struct device *dev)
>>>>>>> +{
>>>>>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    ret = xdma_reconfig_channels(xdev->h2c_chans, xdev- 
>>>>>>> >h2c_chan_num);
>>>>>>> +    if (ret) {
>>>>>>> +        xdma_err(xdev, "H2C channels reconfiguration failed: 
>>>>>>> %d", ret);
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    ret = xdma_reconfig_channels(xdev->c2h_chans, xdev- 
>>>>>>> >c2h_chan_num);
>>>>>>> +    if (ret) {
>>>>>>> +        xdma_err(xdev, "C2H channels reconfiguration failed: 
>>>>>>> %d", ret);
>>>>>>> +        return ret;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return xdma_irq_config(xdev);
>>>>>>> +}
>>>>>>> +
>>>>>>>   static const struct platform_device_id xdma_id_table[] = {
>>>>>>>       { "xdma", 0},
>>>>>>>       { },
>>>>>>>   };
>>>>>>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>>>>>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, 
>>>>>>> xdma_resume);
>>>>>>> +
>>>>>>>   static struct platform_driver xdma_driver = {
>>>>>>>       .driver        = {
>>>>>>>           .name = "xdma",
>>>>>>> +        .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>>>>>>       },
>>>>>>>       .id_table    = xdma_id_table,
>>>>>>>       .probe        = xdma_probe,
>>>>>>
>>>>>
>>>>
>>>
>>
>

