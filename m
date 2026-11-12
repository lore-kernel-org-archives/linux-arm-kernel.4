Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF824606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4LbALXy;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mBqta6sQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BAGiVqo482Y2Wo+PAk1n3JBj92FYpa/0+d+5K1xeOuY=; b=Z4LbALXyUo+RRs
	1Q5O7tQHpm1tsa931EhMDlVzAsmL4phq8GnN0PGgQ5d1VUgq5r0mbYHRo5Tpr17uEGld3nTIIOqhB
	u+4NX2+oN4Mu/gYJYm8Hdhqo5dHf+Z65K/mb/Dt79k+f8VK5yH/woldZckEP9LYholXT42dDWkImT
	xGk4QYPrLbW25zpTcIoHzwsLRaToZdYzOQ4ZOdMugSL59jWenTfZktxojBX1FooNnJ7Jt5wkcF+9K
	eYrtXp78I8JUdqBRzy1jIC+UIMG03J6ol7QeXonTsFgRrAFw65HhnK8BIObDyRNJSKj/rydYfG8YP
	j1oHProSPqxFHmOxELjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS1F-00000009WVP-0Gxi;
	Thu, 12 Nov 2026 10:27:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS11-00000009WSd-1CHy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:26:49 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 252D9802;
	Thu, 12 Nov 2026 11:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794479061;
	bh=Y/lQ3pq9rgGGVd75tXp0uthRUc6fWC7EXCQMcm636I0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mBqta6sQxO4C/KG4iD/5Q5P8iuJmcGhDCpZG2IVW2ZSqaM4FqPsFVLQq+7f4vZMkV
	 Ij3VHJ/qEGJyqcjlv2iPMs4WFb38T2AQQrwYvKjyHpJ7oY50tavRs6j46TzMeYV2yo
	 bgyNISVvAIhHz4i+B/MTh0cJyR/8jsxALO3mHBuY=
Message-ID: <8c71220e-c74f-440d-879e-06434b1f3ecc@ideasonboard.com>
Date: Thu, 12 Nov 2026 12:26:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp_disp: use
 dmaengine_get_copy_align() accessor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank.Li@oss.nxp.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>
References: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>
 <20261111231644.GC449775@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261111231644.GC449775@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_022647_973297_F9934E16 
X-CRM114-Status: GOOD (  13.30  )
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

On 12/11/2026 01:16, Laurent Pinchart wrote:
> On Wed, Nov 11, 2026 at 03:07:37PM -0500, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> Use the dmaengine_get_copy_align() helper instead of directly accessing
>> the copy_align field from the DMA device structure.
>>
>> No functional change and prepare to move struct dma_device to private.
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, I assume you'll push this to drm-misc. Please let me know if
> that's not correct.

Yes, I'll pick this up.

  Tomi

>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index e998f22686748..0753236b9546a 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -1433,7 +1433,7 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>>   		struct zynqmp_disp_layer *layer;
>>   
>>   		layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
>> -		dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
>> +		dpsub->dma_align = 1 << dmaengine_get_copy_align(layer->dmas[0].chan);
>>   	}
>>   
>>   	dpsub->disp = disp;
> 


