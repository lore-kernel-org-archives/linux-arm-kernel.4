Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D8B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u1u67PtO;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HuRfvXqq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UE9wGF0pwW3NKk3EGGqr6iAQHPthH40KgegCDrxwBqU=; b=u1u67PtO+59pay
	D2bs7o+iM4h2YdfonKSmYzZBTTpohc+KuGcpiWi57AftQnPBXVTqWqL/a4446rULW+lbjT8tx1BN8
	yUh5cHvb7K6J2xMO6Lkadcn8Et65XwvW+5ckOkHFG/AvbjbBRkAwrwq0WjUJF92RmIGA7MTlRLvaz
	GpTXr//9iaN9tCeMaeboL1v6wjjaE+NAl64Hy8Ts2S0dRY2O75cXF2uXOsFalzoEnhboYNL8Yq812
	psXDPDdBZBRuM5daQqtfSwPS+Hu3dBRqsVpYEMGuFuCHVAQ1JDXNUN1MQHqfYncFGG/Yh8CBOlQo1
	AzaMjVXuv2jKSDQRSsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRuz-00000009V8T-09A8;
	Thu, 12 Nov 2026 10:20:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRuv-00000009V74-33Nx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:20:31 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFDD3802;
	Thu, 12 Nov 2026 11:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794478680;
	bh=Ea69BVEmwDtsKQtrsOr6RFnZuInEt4kFkMtLtVsqXYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HuRfvXqqmeDyqX+UL+f4rvr/mA255L8hwgpxVhlMpgE6dVqAn5m9MsNi04LZWxlCy
	 qR2MpQukaQTBZHVK/iesG2lLWcNaLau7nkwulnksLRcvpbaR8Xfqx2fUE0epqsxu3/
	 SkOOKmXvHdyI2Bgf6QZ9pqlnxKR3EmSwB2/ktXd8=
Message-ID: <de113745-4cad-458a-9834-ec5c04f2b83f@ideasonboard.com>
Date: Thu, 12 Nov 2026 12:20:20 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: xilinx: Use dmaengine_get_copy_align()
 accessor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 "open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
 <20261111231551.GB449775@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261111231551.GB449775@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_022030_257683_DB40986A 
X-CRM114-Status: GOOD (  17.06  )
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

Hi,

On 12/11/2026 01:15, Laurent Pinchart wrote:
> On Wed, Nov 11, 2026 at 12:13:24PM -0500, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> Replace direct access to dma->dma->device->copy_align with the
>> dmaengine_get_copy_align() accessor function.
>>
>> Prepare move struct dma_device to private.
> 
> I didn't see a rationale in the commit that introduced
> dmaengine_get_copy_align(), and I then saw it here. Without knowing much
> about the greater plan of making dma_device private, this patch looks
> OK.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, will you handle this with any other ongoing work on
> media/platform/xilinx/, or should it get merged separately ?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

This can be merged separately, I don't have any series that I would be 
sending in the near term future.

  Tomi


>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
>> index ece2116639fc0..e01bb40bc39c7 100644
>> --- a/drivers/media/platform/xilinx/xilinx-dma.c
>> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
>> @@ -710,7 +710,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>>   		goto error;
>>   	}
>>   
>> -	dma->align = 1 << dma->dma->device->copy_align;
>> +	dma->align = 1 << dmaengine_get_copy_align(dma->dma);
>>   
>>   	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
>>   	if (ret < 0) {
> 


