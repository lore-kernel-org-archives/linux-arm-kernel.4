Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD398606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nW/ok5Wl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WTsNMoDgz+6rYNzhf1TDqkTqDZUxXtxKcRwXyf4YzDs=; b=nW/ok5WlCzfspD
	lQH8CNTPaxg0k1OcK+5LYaV+7O5l5FY9hUEUg+ST2SfpQ7XDcPaImURKTOtHJ0Fdith7KosqaTdcd
	JB3qh9LkxMQCR/VyBmz7cddb2dXvyauHJXkPGjWwEB+/23F3VgVmYphwVJPq0HfM1MrNPhw8BYpT7
	jOcXv/TzfHpNzP0nwT8bx5MV8kaCzW3kfRjk0fFMrhtybY/TTTWdlckR0oU+kF56/4o34q7mdrAxE
	IHZFchJ3d3uyvKfSQRcGLFU+HkQK9EJ2K8Wo08aMLjB0zeypaUSMStds/6a67iyUhi+8w+kcmbylP
	F+z6QNAt6DmSexxa0HAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWyv-00000004CzZ-2AIq;
	Mon, 23 Nov 2026 16:33:29 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWyZ-00000004CnI-2edx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:33:11 +0000
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 22DE1C126E;
	Mon, 23 Nov 2026 17:33:03 +0100 (CET)
Message-ID: <7285f4da-c5c7-4077-b6cd-bc7921ab04a1@gpxsee.org>
Date: Mon, 23 Nov 2026 17:33:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20261123122236.5460-1-tumic@gpxsee.org>
 <20261123122236.5460-2-tumic@gpxsee.org> <awRlXmBFmE8R82qv@SMW015318>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <awRlXmBFmE8R82qv@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_083307_843363_FDE18DC4 
X-CRM114-Status: GOOD (  24.90  )
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

On 11/23/26 5:10 PM, Frank Li wrote:
> On Mon, Nov 23, 2026 at 01:22:36PM +0100, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Add the missing PM suspend/resume callbacks that properly reconfigure
>> the XDMA HW on PCIe suspend/resume.
> 
> 
> Can you talk about more about why need reconfigure the XDMA HW? Does it
> power lost?
> 

Yes, XDMA is a DMA controller used on PCIe cards. When the OS goes to 
suspend, it powers off the complete PCIe bus and as a result the XDMA HW 
completely looses all the configuration set up in probe(). On resume, 
the HW must be reconfigured, otherwise you end up with a broken, 
iresponsible PCIe card when the system wakes up.

M.

> Frank
> 
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
>>   drivers/dma/xilinx/xdma.c | 146 ++++++++++++++++++++++++++++++++------
>>   1 file changed, 123 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>> index 9d827c9a1267..fade49eaf1a8 100644
>> --- a/drivers/dma/xilinx/xdma.c
>> +++ b/drivers/dma/xilinx/xdma.c
>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>    * @irq_start: Start IRQ assigned to device
>>    * @irq_num: Number of IRQ assigned to device
>>    * @status: Initialization status
>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>    */
>>   struct xdma_device {
>>   	struct platform_device	*pdev;
>> @@ -135,6 +136,7 @@ struct xdma_device {
>>   	u32			irq_start;
>>   	u32			irq_num;
>>   	u32			status;
>> +	u32			usr_irq_mask;
>>   };
>>
>>   #define xdma_err(xdev, fmt, args...)					\
>> @@ -398,6 +400,26 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>>   			    CHAN_CTRL_RUN_STOP);
>>   }
>>
>> +/**
>> + * xdma_reconfig_channels - Reconfigure DMA channels
>> + * @chans: channels configuration
>> + * @chan_num: number of channels
>> + */
>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>> +				  u32 chan_num)
>> +{
>> +	int i, ret;
>> +
>> +	for (i = 0; i < chan_num; i++) {
>> +		/* init channel hardware */
>> +		ret = xdma_channel_init(&chans[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>    * @xdev: DMA device pointer
>> @@ -1018,6 +1040,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>>   	return 0;
>>   }
>>
>> +/**
>> + * xdma_irq_config - Configure IRQs
>> + * @xdev: DMA device pointer
>> + */
>> +static int xdma_irq_config(struct xdma_device *xdev)
>> +{
>> +	u32 user_irq_start;
>> +	int ret;
>> +
>> +	/* configure hardware IRQ registers */
>> +	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> +				  XDMA_CHAN_NUM(xdev));
>> +	if (ret) {
>> +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* configure user IRQ registers if needed */
>> +	user_irq_start = XDMA_CHAN_NUM(xdev);
>> +	if (xdev->irq_num > user_irq_start) {
>> +		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> +					  user_irq_start,
>> +					  xdev->irq_num - user_irq_start);
>> +		if (ret) {
>> +			xdma_err(xdev, "failed to set user vectors: %d", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* enable channels interrupts */
>> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +	if (ret) {
>> +		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* enable user interrupts if needed */
>> +	if (xdev->irq_num > user_irq_start) {
>> +		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>> +				   xdev->usr_irq_mask);
>> +		if (ret) {
>> +			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xdma_irq_init - initialize IRQs
>>    * @xdev: DMA device pointer
>> @@ -1025,7 +1096,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>>   static int xdma_irq_init(struct xdma_device *xdev)
>>   {
>>   	u32 irq = xdev->irq_start;
>> -	u32 user_irq_start;
>>   	int i, j, ret;
>>
>>   	/* return failure if there are not enough IRQs */
>> @@ -1060,28 +1130,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
>>   		irq++;
>>   	}
>>
>> -	/* config hardware IRQ registers */
>> -	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> -				  XDMA_CHAN_NUM(xdev));
>> -	if (ret) {
>> -		xdma_err(xdev, "failed to set channel vectors: %d", ret);
>> -		goto failed_init_c2h;
>> -	}
>> -
>> -	/* config user IRQ registers if needed */
>> -	user_irq_start = XDMA_CHAN_NUM(xdev);
>> -	if (xdev->irq_num > user_irq_start) {
>> -		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> -					  user_irq_start,
>> -					  xdev->irq_num - user_irq_start);
>> -		if (ret) {
>> -			xdma_err(xdev, "failed to set user vectors: %d", ret);
>> -			goto failed_init_c2h;
>> -		}
>> -	}
>> -
>> -	/* enable interrupt */
>> -	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +	/* configure all HW IRQ registers */
>> +	ret = xdma_irq_config(xdev);
>>   	if (ret)
>>   		goto failed_init_c2h;
>>
>> @@ -1297,15 +1347,65 @@ static int xdma_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>
>> +/**
>> + * xdma_suspend - PM suspend callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_suspend(struct device *dev)
>> +{
>> +	struct xdma_device *xdev = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>> +			  &xdev->usr_irq_mask);
>> +	if (ret) {
>> +		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>> +	if (ret)
>> +		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xdma_resume - PM resume callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_resume(struct device *dev)
>> +{
>> +	struct xdma_device *xdev = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
>> +	if (ret) {
>> +		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
>> +	if (ret) {
>> +		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	return xdma_irq_config(xdev);
>> +}
>> +
>>   static const struct platform_device_id xdma_id_table[] = {
>>   	{ "xdma", 0},
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>
>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
>> +
>>   static struct platform_driver xdma_driver = {
>>   	.driver		= {
>>   		.name = "xdma",
>> +		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>   	},
>>   	.id_table	= xdma_id_table,
>>   	.probe		= xdma_probe,
>> --
>> 2.56.1
>>


