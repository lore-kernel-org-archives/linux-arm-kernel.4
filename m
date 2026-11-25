Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC57606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDi19fdx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7oxmC1mC7GZMwPEhucwdkR3sWAciexcVTvPbuPvoXpY=; b=vDi19fdxh9Mb/L
	1SISyrwq+8dAnKFk+uWb0SBp18Tqd5PT5ZrpmT2m6sQp6prTAXbMGbm3OFwGnMpI6WmK+yZdGeYnW
	18CTz0dmWqiVPNCp7T+9jix2l9U3R1luklkmrbNmAfFko8iQAcvFRhl5r8/LGL/fYzsejv/PABb7R
	JQj/kXqj3OUz85TO49YtcNJ+A7fNnD5eu3ZrIqeL8mYLKZQ9nk20suRgBBwYesD3dhnJFOXSIrB3t
	8YQXGAVGt43/w6HTJg+YHSakelDkCeGlAw/3Z3cpyw4aG0K9hOmVwVCrUkq8+P02nWximDlSYZsBt
	bX+USg423lljctB2SOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWELt-0000000AFN6-23cK;
	Wed, 25 Nov 2026 14:52:05 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWELo-0000000AFMa-0uGv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:52:04 +0000
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id A9F74C364F;
	Wed, 25 Nov 2026 15:51:53 +0100 (CET)
Message-ID: <1e8e9867-a6ad-4af6-9e27-d06f7540bf77@gpxsee.org>
Date: Wed, 25 Nov 2026 15:51:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
 <754c498c-7252-3f2b-54e6-3ebfdf0181ff@amd.com>
 <47182dbe-018a-4ca6-b20c-f6e2afa5f474@gpxsee.org>
 <c7f5a712-a2ca-2424-cc63-d262c21d5381@amd.com>
 <dce94458-c9bc-4762-902c-7094d9bdc3c8@gpxsee.org>
 <2e8444da-ad9f-033c-c22d-400b27bf0d76@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <2e8444da-ad9f-033c-c22d-400b27bf0d76@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065200_473757_AD5DF9E8 
X-CRM114-Status: GOOD (  43.66  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 6:57 PM, Lizhi Hou wrote:
> 
> On 11/24/26 02:35, Martin Tůma wrote:
>> On 11/23/26 8:00 PM, Lizhi Hou wrote:
>>>
>>> On 11/20/26 14:21, Martin Tůma wrote:
>>>>
>>>>
>>>> On 11/20/26 22:40, Lizhi Hou wrote:
>>>>>
>>>>> On 11/20/26 09:23, tumic@gpxsee.org wrote:
>>>>>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>>>>
>>>>>> Add the missing PM suspend/resume callbacks that properly reconfigure
>>>>>> the XDMA HW on PCIe suspend/resume.
>>>>>
>>>>> Just wondering if we could destroy xdma platform device in your 
>>>>> PCIe suspend routine and re-create xdna device in PCIe resume?
>>>>>
>>>>
>>>> While this may also be theoretically possible, there are several 
>>>> arguments against this:
>>>>
>>>> - Every driver using the device would have to do it instead of doing 
>>>> nothing and rely on the already established infrastructure for PM in 
>>>> the kernel. 
>>>
>>> I am not sure if all xdma users would expect the same suspend and 
>>> resume happening automatically.
>>>
>>
>> Why wouldn't they? This is the standard Linux PM model that the driver 
>> is responsible for the device to be fully operational after resume 
>> like it was before suspend.
> 
> There is sound card case which uses cyclic dma. In this case, it might 
> need to restart the data transfer after resume.
> 

The patch is a minimal patch that does only what unconditionally must be 
done in the xdma driver during suspend as no one else can do that. It 
expects the parent drivers that have initiated the DMA transfers to stop 
them in their .suspend callbacks which are run before the xdma callback 
is run (this is guaranted by the driver hierarchy and the PM 
suspend/resume order).

> Also I did not see you stop the inflight DMA in the suspend callback? 
> Would that work on other devices?
> 

Again, this is left to the parent driver that knows best how to stop the 
DMA transfers that it has initiated. All drivers are advised to do so in 
ther .suspend callback. Some kind of "hard" stop may be added to xdma if 
it is required by xdma self (or preventing some damage that I'm not 
avere of). My tests with our HW did fine without such explicit stops in 
xdma and the current state of the xdma driver violently cuts power to 
the DMA transfers anyway, so it can not be worse than it is now with the 
patch.

>>
>>> How about adding device_pause() and device_resume() callbacks to xdma 
>>> driver and use dmaengine_pause() and dmaengine_resume() in your pci 
>>> driver?
>>>
>>
>> This seems like a crazy workaround for something for which there 
>> already is a standard kernel mechanism that works fine. No one will 
>> like to implement some obscure special handling for xdma devices to 
>> make a standard case (PM suspend/resume) work. Especially when there 
>> is no real reason to do that as the standard method works fine 
>> (tested) for XDMA as well.
> 
> Just provide options to minimize the risk and unblock your work. Are you 
> confident to have the common suspend/resume to handle all the cases? :)
> 

The only thing that I'm 100% confident is the patch is much better than 
the current state where XDMA-based PCIe cards are left completely broken 
after PM resume and the system must be restarted to make them work again.

There may be additional steps needed for some HW that I do not know 
about, but I would let that up to additional patches when the 
maintainers of that HW come with the issues.

M.

> 
> Lizhi
> 
>>
>> M.
>>
>>>
>>> Thanks
>>>
>>> Lizhi
>>>
>>>> And it is not a simple "one function call" which would be needed
>>>> (and duplicated in every driver), there is some additional re- 
>>>> configuration needed, eg. the user IRQs.
>>>> - The creation/destroying of platform devices does a lot more stuff 
>>>> than just initializing some registers. It fiddles with the IRQ and 
>>>> memory allocation/deallocation which you don't want or even can't do 
>>>> while the system is in a PM suspend or PM resume state.
>>>>
>>>> M.
>>>>
>>>>> Lizhi
>>>>>
>>>>>>
>>>>>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>>>> ---
>>>>>>   drivers/dma/xilinx/xdma.c | 147 +++++++++++++++++++++++++++++++ 
>>>>>> +------
>>>>>>   1 file changed, 124 insertions(+), 23 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>>>>>> index 9d827c9a1267..d6772b38d8f7 100644
>>>>>> --- a/drivers/dma/xilinx/xdma.c
>>>>>> +++ b/drivers/dma/xilinx/xdma.c
>>>>>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>>>>>    * @irq_start: Start IRQ assigned to device
>>>>>>    * @irq_num: Number of IRQ assigned to device
>>>>>>    * @status: Initialization status
>>>>>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>>>>>    */
>>>>>>   struct xdma_device {
>>>>>>       struct platform_device    *pdev;
>>>>>> @@ -135,6 +136,7 @@ struct xdma_device {
>>>>>>       u32            irq_start;
>>>>>>       u32            irq_num;
>>>>>>       u32            status;
>>>>>> +    u32            usr_irq_mask;
>>>>>>   };
>>>>>>   #define xdma_err(xdev, fmt, args...) \
>>>>>> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan 
>>>>>> *xchan)
>>>>>>                   CHAN_CTRL_RUN_STOP);
>>>>>>   }
>>>>>> +/**
>>>>>> + * xdma_reconfig_channels - Reconfigure DMA channels
>>>>>> + * @xdev: DMA device pointer
>>>>>> + * @chans: channels configuration
>>>>>> + * @chan_num: number of channels
>>>>>> + */
>>>>>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>>>>>> +                  u32 chan_num)
>>>>>> +{
>>>>>> +    int i, ret;
>>>>>> +
>>>>>> +    for (i = 0; i < chan_num; i++) {
>>>>>> +        /* init channel hardware */
>>>>>> +        ret = xdma_channel_init(&(chans[i]));
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>   /**
>>>>>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>>>>>    * @xdev: DMA device pointer
>>>>>> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct 
>>>>>> xdma_device *xdev, u32 vec_tbl_start,
>>>>>>       return 0;
>>>>>>   }
>>>>>> +/**
>>>>>> + * xdma_irq_config - Configure IRQs
>>>>>> + * @xdev: DMA device pointer
>>>>>> + */
>>>>>> +static int xdma_irq_config(struct xdma_device *xdev)
>>>>>> +{
>>>>>> +    u32 user_irq_start;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    /* configure hardware IRQ registers */
>>>>>> +    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>>>>> +                  XDMA_CHAN_NUM(xdev));
>>>>>> +    if (ret) {
>>>>>> +        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* configure user IRQ registers if needed */
>>>>>> +    user_irq_start = XDMA_CHAN_NUM(xdev);
>>>>>> +    if (xdev->irq_num > user_irq_start) {
>>>>>> +        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>>>>> +                      user_irq_start,
>>>>>> +                      xdev->irq_num - user_irq_start);
>>>>>> +        if (ret) {
>>>>>> +            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>>>>> +            return ret;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /* enable channels interrupts */
>>>>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>>>>> +    if (ret) {
>>>>>> +        xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* enable user interrupts if needed */
>>>>>> +    if (xdev->irq_num > user_irq_start) {
>>>>>> +        ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>>>>>> +                   xdev->usr_irq_mask);
>>>>>> +        if (ret) {
>>>>>> +            xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>>>>>> +            return ret;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>   /**
>>>>>>    * xdma_irq_init - initialize IRQs
>>>>>>    * @xdev: DMA device pointer
>>>>>> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct 
>>>>>> xdma_device *xdev, u32 vec_tbl_start,
>>>>>>   static int xdma_irq_init(struct xdma_device *xdev)
>>>>>>   {
>>>>>>       u32 irq = xdev->irq_start;
>>>>>> -    u32 user_irq_start;
>>>>>>       int i, j, ret;
>>>>>>       /* return failure if there are not enough IRQs */
>>>>>> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device 
>>>>>> *xdev)
>>>>>>           irq++;
>>>>>>       }
>>>>>> -    /* config hardware IRQ registers */
>>>>>> -    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>>>>> -                  XDMA_CHAN_NUM(xdev));
>>>>>> -    if (ret) {
>>>>>> -        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>>>>> -        goto failed_init_c2h;
>>>>>> -    }
>>>>>> -
>>>>>> -    /* config user IRQ registers if needed */
>>>>>> -    user_irq_start = XDMA_CHAN_NUM(xdev);
>>>>>> -    if (xdev->irq_num > user_irq_start) {
>>>>>> -        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>>>>> -                      user_irq_start,
>>>>>> -                      xdev->irq_num - user_irq_start);
>>>>>> -        if (ret) {
>>>>>> -            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>>>>> -            goto failed_init_c2h;
>>>>>> -        }
>>>>>> -    }
>>>>>> -
>>>>>> -    /* enable interrupt */
>>>>>> -    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>>>>> +    /* configure all HW IRQ registers */
>>>>>> +    ret = xdma_irq_config(xdev);
>>>>>>       if (ret)
>>>>>>           goto failed_init_c2h;
>>>>>> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct 
>>>>>> platform_device *pdev)
>>>>>>       return ret;
>>>>>>   }
>>>>>> +/**
>>>>>> + * xdma_suspend - PM suspend callback
>>>>>> + * @dev: XDMA device pointer
>>>>>> + */
>>>>>> +static int xdma_suspend(struct device *dev)
>>>>>> +{
>>>>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>>>>>> +              &xdev->usr_irq_mask);
>>>>>> +    if (ret) {
>>>>>> +        xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>>>>>> +    if (ret)
>>>>>> +        xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>>>>>> +
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * xdma_resume - PM resume callback
>>>>>> + * @dev: XDMA device pointer
>>>>>> + */
>>>>>> +static int xdma_resume(struct device *dev)
>>>>>> +{
>>>>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = xdma_reconfig_channels(xdev->h2c_chans, xdev- 
>>>>>> >h2c_chan_num);
>>>>>> +    if (ret) {
>>>>>> +        xdma_err(xdev, "H2C channels reconfiguration failed: %d", 
>>>>>> ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = xdma_reconfig_channels(xdev->c2h_chans, xdev- 
>>>>>> >c2h_chan_num);
>>>>>> +    if (ret) {
>>>>>> +        xdma_err(xdev, "C2H channels reconfiguration failed: %d", 
>>>>>> ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    return xdma_irq_config(xdev);
>>>>>> +}
>>>>>> +
>>>>>>   static const struct platform_device_id xdma_id_table[] = {
>>>>>>       { "xdma", 0},
>>>>>>       { },
>>>>>>   };
>>>>>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>>>>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, 
>>>>>> xdma_resume);
>>>>>> +
>>>>>>   static struct platform_driver xdma_driver = {
>>>>>>       .driver        = {
>>>>>>           .name = "xdma",
>>>>>> +        .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>>>>>       },
>>>>>>       .id_table    = xdma_id_table,
>>>>>>       .probe        = xdma_probe,
>>>>>
>>>>
>>>
>>
> 


