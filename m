Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+4mqkSi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=XQ+aXtP5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p1seSAse4nQlwwOxVhuAXky7Np5/QOZAhd3VlMKO+TE=; b=d+4mqkSistMEmM
	lt31k6OSsS8J+MP/V2ILFZmSI9JPmqdh9E/xH9sH7DZmrsidRnJfv8kF4CKmXLKGdAQwZdlCF0kG4
	Myvl5AbBBOPrDgPvM7NtSJ7KyyC3lAWXLeepsWNeRIlAQx8FWc9dsk76iFd28N/tm9u8/is43Gg4M
	OUcH09kg9yoQNYKnup6vFFzs4eFTag8adG34RADqf1nVDR3zhzo39EHh2SwNt9hnGks3iRDAlUUH0
	lyPddpHVEyOsJc4t1NuDn6RSPFjy7CrXNQMxH4fd4m7smeahz0sxuavz0A8qQsMkbx77V8Q04UD+U
	IJqz2UFFCiqk08jbTtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLRj-00000006LmB-1SSq;
	Tue, 17 Nov 2026 15:50:11 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLRd-00000006LlB-24Ef;
	Tue, 17 Nov 2026 15:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794930597; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bwHkyVV8jwgAd2PNYVllnWyjdeU5FnDci94emyuBXzYMX+eoIOuiSrMzklRsluNQiyfBK19/ppOkYWLqCqsDMiup4hF8M9TZMjkCT2wWnka8YBPUn2AMUeMQzS5CS9rlAv+QJc9EK0ALg/wdNUj5Tf6mn+u+r8JzXl8z4LzWvlA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794930597; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p1seSAse4nQlwwOxVhuAXky7Np5/QOZAhd3VlMKO+TE=; 
	b=WqthT4w+NKEWzvSIOAKWmqCUQsiy8EE2u3L7pjK6jt1I/aU+QkspbLFjl/ZWwXV61Pxyh9Aw7FuyjJs93+FZPHQk7pXeYeSxfrje1lzmdaSj/AHrgmdbG5pEcUFAjue6CRiziAkK3eGf0Z0pw+OTKsxc38Ogl2ziZznR0p/+Veg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=XQ+aXtP5wqsOthZSZuG+7AweM4r8YVKj/2sIUV7aGDq7DJ4yBTmkcA5HslgYql7lffG+xoQSBe5jdOCN8xaxQvQ3Q5PfvV/DAz11zFMBjPVUmOB+ZedX0H4A6lDBOpkd93X/JBu7A2kCBnjfrcxs0lBNKS4m5RsM7w0yxYXmMNU=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=p1seSAse4nQlwwOxVhuAXky7Np5/QOZAhd3VlMKO+TE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794930596026757.8261289009372;
	Tue, 17 Nov 2026 07:49:56 -0800 (PST)
Message-ID: <1adbb937-9da6-4b40-9fff-48af38327f11@collabora.com>
Date: Tue, 17 Nov 2026 16:49:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: verisilicon: av1: Find the reference buffers
 by timestamp
To: aiyengar1990@gmail.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20261115-b4-vpu981-av1-refs-v1-0-c65769715db9@gmail.com>
 <20261115-b4-vpu981-av1-refs-v1-1-c65769715db9@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20261115-b4-vpu981-av1-refs-v1-1-c65769715db9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_075005_614241_7B7260E0 
X-CRM114-Status: GOOD (  22.20  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Le 15/11/2026 à 09:59, Arun Iyengar via B4 Relay a écrit :
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> frame_refs[] keeps a CAPTURE buffer pointer per reference across jobs.
> VIDIOC_REMOVE_BUFS can free that buffer, and a missing reference falls
> back to slot 0, which can hold a stale pointer.
>
> Look the buffer up by timestamp at each job, as the other Hantro codecs
> do, and use the current CAPTURE buffer and frame size when the reference
> is missing.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

I have tested the series on rock5b with fluster.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Thanks for the patch.
Benjamin

> ---
>   drivers/media/platform/verisilicon/hantro_hw.h     |  1 -
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 37 ++++++++++++----------
>   2 files changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 13e573f1f19d..36df8caa077d 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -287,7 +287,6 @@ struct hantro_av1_frame_ref {
>   	bool used;
>   	u32 order_hint;
>   	u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
> -	struct vb2_v4l2_buffer *vb2_ref;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 2a145433e6d1..59f2adf74850 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -169,7 +169,6 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
>   		av1_dec->frame_refs[i].timestamp = timestamp;
>   		av1_dec->frame_refs[i].frame_type = frame->frame_type;
>   		av1_dec->frame_refs[i].order_hint = frame->order_hint;
> -		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
>   
>   		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
>   			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
> @@ -182,6 +181,18 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
>   	return AV1_INVALID_IDX;
>   }
>   
> +static struct vb2_buffer *rockchip_vpu981_av1_dec_ref_buf(struct hantro_ctx *ctx, int idx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct vb2_queue *q = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
> +	struct vb2_buffer *buf = NULL;
> +
> +	if (idx >= 0 && av1_dec->frame_refs[idx].used)
> +		buf = vb2_find_buffer(q, av1_dec->frame_refs[idx].timestamp);
> +
> +	return buf ?: &hantro_get_dst_buf(ctx)->vb2_buf;
> +}
> +
>   static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
>   {
>   	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> @@ -829,7 +840,7 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
>   		pr_warn("AV1 invalid reference frame index\n");
>   	}
>   
> -	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
> +	dst = vb2_to_hantro_decoded_buf(rockchip_vpu981_av1_dec_ref_buf(ctx, idx));
>   	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
>   	chroma_addr = luma_addr + dst->av1.chroma_offset;
>   	mv_addr = luma_addr + dst->av1.mv_offset;
> @@ -894,7 +905,7 @@ static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
>   			struct hantro_decoded_buffer *seg;
>   			size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
>   
> -			seg = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
> +			seg = vb2_to_hantro_decoded_buf(rockchip_vpu981_av1_dec_ref_buf(ctx, idx));
>   			luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
>   			mv_addr = luma_addr + mv_offset;
>   
> @@ -1983,16 +1994,13 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
>   
>   	for (i = V4L2_AV1_REF_LAST_FRAME; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
>   		u32 ref = i - 1;
> -		int idx = 0;
> -		int width, height;
> +		int idx = AV1_INVALID_IDX;
> +		int width = frame->frame_width_minus_1 + 1;
> +		int height = frame->frame_height_minus_1 + 1;
>   
> -		if (allow_intrabc) {
> -			idx = av1_dec->current_frame_index;
> -			width = frame->frame_width_minus_1 + 1;
> -			height = frame->frame_height_minus_1 + 1;
> -		} else {
> -			if (rockchip_vpu981_get_frame_index(ctx, ref) > 0)
> -				idx = rockchip_vpu981_get_frame_index(ctx, ref);
> +		if (!allow_intrabc)
> +			idx = rockchip_vpu981_get_frame_index(ctx, ref);
> +		if (idx >= 0) {
>   			width = av1_dec->frame_refs[idx].width;
>   			height = av1_dec->frame_refs[idx].height;
>   		}
> @@ -2185,16 +2193,13 @@ rockchip_vpu981_av1_dec_set_input_buffer(struct hantro_ctx *ctx,
>   static void
>   rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
>   {
> -	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
>   	struct hantro_dev *vpu = ctx->dev;
>   	struct hantro_decoded_buffer *dst;
> -	struct vb2_v4l2_buffer *vb2_dst;
>   	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
>   	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
>   	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
>   
> -	vb2_dst = av1_dec->frame_refs[av1_dec->current_frame_index].vb2_ref;
> -	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> +	dst = vb2_to_hantro_decoded_buf(&hantro_get_dst_buf(ctx)->vb2_buf);
>   	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
>   	chroma_addr = luma_addr + cr_offset;
>   	mv_addr = luma_addr + mv_offset;
>

