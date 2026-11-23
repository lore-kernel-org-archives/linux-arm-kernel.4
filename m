Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B5F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zssck7QW;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=egC+cpAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HEf2vhQIJNMhExKsSoXNC/Ooon9tyG3ksduKnDMvRaw=; b=Zssck7QWRGe6dG
	u8Jrtza3BjFebj/cDt5nJY7TF1EqwreQ0Ozp5qrHpaKoeIGRxmEFFQy0fdbNzBvUgzm5ZNkdv8a7Y
	n0JNRtt5tlSziNdM/WneJmgguT6eZqJY1B8gzYFcDty0uQ+cLf880UsgYrvw2aJ4GWyc0ck3dHlEc
	RC/C0AScdUYVRFwuIOylJ5CRAicuCgp7OnBzKlOpbZJOiz9q1bhYUDOYkMP/oJJTKqd4nfz1J/PR4
	fkxjW+g0XR9Jn0qmOI7ZDTlw1yd3+n6x39g2sYWa39kI85NAMmBFbcdLrtb3dkzAMmg78indXPGkT
	T+uYWo4npqJyvBQEQQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZH7-00000004b55-0KGW;
	Mon, 23 Nov 2026 19:00:27 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZH4-00000004b4h-0CxV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYCjGnS14hL/orkz6i3n797QRFHOWmGUhL52Nts7n9PmE8zm1adZMMHpfUDf5xgewSbQKthtZXgB6DGe48sbzK97fHT3Vz9RG/JmY44xdWywU7sWOBJBIID0BzxJNl4LW0wxkG41WTrWdKEXzFgVGbCZykm+/w9GZiAW/lmm1l/3ZqYAJ1AV/Ef5M0tRmIQqFRv0gCg4vd0De814O6J4tL3+X2LaDIO4ivZ5pR0zxiDUlwFv6zcEt0ylniS7bEWgRhJxP/NOWEGyN9D0v1A7zD2KSI5JyhbHm089yUwjibqKnnfYK0yM7l5Nh8CpzHUKRfKI8Pompy0U3UFYrRp6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEf2vhQIJNMhExKsSoXNC/Ooon9tyG3ksduKnDMvRaw=;
 b=Cjo/Tdzm5mpGI02GGLwnQbJLGpQw1jzu9/8rwAAJOXBQgV04yX5835LJuYpxN1yam5EXARB2/wXUf3h+cblOKqF1XDR/rDGAEDmCajj2d/9/7U+zlm8ppk1vfNverLXIA+6Pv4tSQL4ZP/ugWXKfdNo7fdm36UFWPPcD5Pzf6g7tiHCwomO804I6G8DjuaBXIjFhFcCqCDM0eo8x+qORU1l80Z4l5NNPpxmEWsKvFI2DNcb+7nCbBt9tIFpk9n/cWkLkrgyRuIjkQpNemWUWB/tnZDkHzvtT5/7dS7Bs22x6T51aqeAdR004vC+AUWGAs+libPhnHQZNk/X/bUeEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEf2vhQIJNMhExKsSoXNC/Ooon9tyG3ksduKnDMvRaw=;
 b=egC+cpAsMXbGChmrCDoz8u37aSs4lzFWkDJpRi6cZS81jyLHhp3jtc4uKMykarWkCYekKBRps0L9Zf5FEjWRlbfZTuW2XFrCBV7A+Cm9tl58Pz+7JHaHHsi9DVW3hp5HIBjGmfFXZJ3Ucc5aNZi/bEuxuWFH8Ie4Z3uWq11xRro=
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by SN7PR12MB7177.namprd12.prod.outlook.com (2603:10b6:806:2a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 19:00:07 +0000
Received: from CH01EPF000BE941.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::1b) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 19:00:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE941.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 19:00:06 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 13:00:05 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 13:00:05 -0600
Message-ID: <c7f5a712-a2ca-2424-cc63-d262c21d5381@amd.com>
Date: Mon, 23 Nov 2026 11:00:04 -0800
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
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <47182dbe-018a-4ca6-b20c-f6e2afa5f474@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE941:EE_|SN7PR12MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f59e0a1-6922-4953-5515-08df4993fd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003|261026140227099003|261102124227099003|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261022075727099003|261026121527099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: vqsRfyTYm3OVcxk+YP1CV+IKFs+rjLHMbJUz/9VY8aueVrw+Q3JBAhVlrCQwe07CdmpJyUDrgI0lpTL9GfoHiWdV7LgCb+Z3BWVdC8prOwQMVHNzXgXLkFJz31+iT9LcECoxqzLppdvcLhkSP5W8q/bEMwdb2zpCeJmOTEGdNqJi2+QrgLSu//sbKYthDNesFEt7Pyy91vuMjX2klpbl3sTLVObuBT8gRxguX6XWqb1TpZON4QpjpXn4zEOM7ekoGHzb7ANck0hdLgC/jz1MeOwtts0pPCE6zVmQVpBRGlB2WiSRErlKN88QFfaMvnYeHAVyJF2Kfn5MatGtI+agsnNVjinnNFlBNCHazvHV1+CCy0Jfwi+MWpjZjr47IQcet1Y72HfQnwQLQ0V7dT7eeRi7cdPUGuIJoJMWgxYzO82SwX2E0YJdLJdqLojv0YIk50w4OdW8yt5HWwwYmBBMtZKDG0DWve19H48IR1o5SUouiw88eIZyBjyditiaze0X52P/kFqein9SbtbKjPaOfxfeMmucOqLqywgCn1vODtuVRlWorzD0osLeg5P1+mOZWfU9RQ4lqTo+xIOB5QFqnaObx2tTKGXPCHpB/zJ3PJwm19ml0kzI/Cpp6zxlmJOcezauJFMlEtpp3Q/Uk+VeX7x32FjX+ctbLSo65iA4B4HHDSW1Z8A/Q2E4lUW74W2qBW6vuCJOIXTC+8+0y6YEqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003)(261026140227099003)(261102124227099003)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IZZJhdWO05FP/80t6phv4WPazd02/GLT2KazjmETCaB+U8Sy97zefIf7lc55tVmOx6Q2728V0hVWo/OAPg7vDy2petGmscaeXPiumCBKHCcjUu3+TfO886I09rfCOSE7GC7yeAcQfDtVWo++G19EdibGr5dsSuK0/rDI9F7pnSxLyh5wvI95fWtptod9yNfIQE8TtcAFypcqnWoJ0+zD0rwIt4WZtauFcid44QYNFxYKcCJb4Rknir1m+tqVizIBpSAWwX86uVMY89yP+jWcRWFwadGChBR3vPPjsCSS2K2dt/hHfsv3Cj+aUUdcLgTJoTr8OMh4Txkayur67jdfSdW/MHjKDLdXJt2qEVTgLis0METHNxfR3324axKLWP57h00vd5LMgv2GMDe+OMta3kA20EvzgoIwpWwIT/IXgcUajH6FqQGzZl8EO2yklMF/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:00:06.5222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f59e0a1-6922-4953-5515-08df4993fd22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH01EPF000BE941.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_110022_303342_83B358B9 
X-CRM114-Status: GOOD (  31.27  )
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


On 11/20/26 14:21, Martin Tůma wrote:
>
>
> On 11/20/26 22:40, Lizhi Hou wrote:
>>
>> On 11/20/26 09:23, tumic@gpxsee.org wrote:
>>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>
>>> Add the missing PM suspend/resume callbacks that properly reconfigure
>>> the XDMA HW on PCIe suspend/resume.
>>
>> Just wondering if we could destroy xdma platform device in your PCIe 
>> suspend routine and re-create xdna device in PCIe resume?
>>
>
> While this may also be theoretically possible, there are several 
> arguments against this:
>
> - Every driver using the device would have to do it instead of doing 
> nothing and rely on the already established infrastructure for PM in 
> the kernel. 

I am not sure if all xdma users would expect the same suspend and resume 
happening automatically.

How about adding device_pause() and device_resume() callbacks to xdma 
driver and use dmaengine_pause() and dmaengine_resume() in your pci driver?


Thanks

Lizhi

> And it is not a simple "one function call" which would be needed
> (and duplicated in every driver), there is some additional 
> re-configuration needed, eg. the user IRQs.
> - The creation/destroying of platform devices does a lot more stuff 
> than just initializing some registers. It fiddles with the IRQ and 
> memory allocation/deallocation which you don't want or even can't do 
> while the system is in a PM suspend or PM resume state.
>
> M.
>
>> Lizhi
>>
>>>
>>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>> ---
>>>   drivers/dma/xilinx/xdma.c | 147 
>>> ++++++++++++++++++++++++++++++++------
>>>   1 file changed, 124 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>>> index 9d827c9a1267..d6772b38d8f7 100644
>>> --- a/drivers/dma/xilinx/xdma.c
>>> +++ b/drivers/dma/xilinx/xdma.c
>>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>>    * @irq_start: Start IRQ assigned to device
>>>    * @irq_num: Number of IRQ assigned to device
>>>    * @status: Initialization status
>>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>>    */
>>>   struct xdma_device {
>>>       struct platform_device    *pdev;
>>> @@ -135,6 +136,7 @@ struct xdma_device {
>>>       u32            irq_start;
>>>       u32            irq_num;
>>>       u32            status;
>>> +    u32            usr_irq_mask;
>>>   };
>>>   #define xdma_err(xdev, fmt, args...)                    \
>>> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>>>                   CHAN_CTRL_RUN_STOP);
>>>   }
>>> +/**
>>> + * xdma_reconfig_channels - Reconfigure DMA channels
>>> + * @xdev: DMA device pointer
>>> + * @chans: channels configuration
>>> + * @chan_num: number of channels
>>> + */
>>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>>> +                  u32 chan_num)
>>> +{
>>> +    int i, ret;
>>> +
>>> +    for (i = 0; i < chan_num; i++) {
>>> +        /* init channel hardware */
>>> +        ret = xdma_channel_init(&(chans[i]));
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>>    * @xdev: DMA device pointer
>>> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct 
>>> xdma_device *xdev, u32 vec_tbl_start,
>>>       return 0;
>>>   }
>>> +/**
>>> + * xdma_irq_config - Configure IRQs
>>> + * @xdev: DMA device pointer
>>> + */
>>> +static int xdma_irq_config(struct xdma_device *xdev)
>>> +{
>>> +    u32 user_irq_start;
>>> +    int ret;
>>> +
>>> +    /* configure hardware IRQ registers */
>>> +    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>> +                  XDMA_CHAN_NUM(xdev));
>>> +    if (ret) {
>>> +        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* configure user IRQ registers if needed */
>>> +    user_irq_start = XDMA_CHAN_NUM(xdev);
>>> +    if (xdev->irq_num > user_irq_start) {
>>> +        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>> +                      user_irq_start,
>>> +                      xdev->irq_num - user_irq_start);
>>> +        if (ret) {
>>> +            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    /* enable channels interrupts */
>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>> +    if (ret) {
>>> +        xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* enable user interrupts if needed */
>>> +    if (xdev->irq_num > user_irq_start) {
>>> +        ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>>> +                   xdev->usr_irq_mask);
>>> +        if (ret) {
>>> +            xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * xdma_irq_init - initialize IRQs
>>>    * @xdev: DMA device pointer
>>> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct 
>>> xdma_device *xdev, u32 vec_tbl_start,
>>>   static int xdma_irq_init(struct xdma_device *xdev)
>>>   {
>>>       u32 irq = xdev->irq_start;
>>> -    u32 user_irq_start;
>>>       int i, j, ret;
>>>       /* return failure if there are not enough IRQs */
>>> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device 
>>> *xdev)
>>>           irq++;
>>>       }
>>> -    /* config hardware IRQ registers */
>>> -    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>> -                  XDMA_CHAN_NUM(xdev));
>>> -    if (ret) {
>>> -        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>> -        goto failed_init_c2h;
>>> -    }
>>> -
>>> -    /* config user IRQ registers if needed */
>>> -    user_irq_start = XDMA_CHAN_NUM(xdev);
>>> -    if (xdev->irq_num > user_irq_start) {
>>> -        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>> -                      user_irq_start,
>>> -                      xdev->irq_num - user_irq_start);
>>> -        if (ret) {
>>> -            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>> -            goto failed_init_c2h;
>>> -        }
>>> -    }
>>> -
>>> -    /* enable interrupt */
>>> -    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>> +    /* configure all HW IRQ registers */
>>> +    ret = xdma_irq_config(xdev);
>>>       if (ret)
>>>           goto failed_init_c2h;
>>> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device 
>>> *pdev)
>>>       return ret;
>>>   }
>>> +/**
>>> + * xdma_suspend - PM suspend callback
>>> + * @dev: XDMA device pointer
>>> + */
>>> +static int xdma_suspend(struct device *dev)
>>> +{
>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>>> +              &xdev->usr_irq_mask);
>>> +    if (ret) {
>>> +        xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>>> +    if (ret)
>>> +        xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * xdma_resume - PM resume callback
>>> + * @dev: XDMA device pointer
>>> + */
>>> +static int xdma_resume(struct device *dev)
>>> +{
>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
>>> +    if (ret) {
>>> +        xdma_err(xdev, "H2C channels reconfiguration failed: %d", 
>>> ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
>>> +    if (ret) {
>>> +        xdma_err(xdev, "C2H channels reconfiguration failed: %d", 
>>> ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return xdma_irq_config(xdev);
>>> +}
>>> +
>>>   static const struct platform_device_id xdma_id_table[] = {
>>>       { "xdma", 0},
>>>       { },
>>>   };
>>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, 
>>> xdma_resume);
>>> +
>>>   static struct platform_driver xdma_driver = {
>>>       .driver        = {
>>>           .name = "xdma",
>>> +        .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>>       },
>>>       .id_table    = xdma_id_table,
>>>       .probe        = xdma_probe,
>>
>

