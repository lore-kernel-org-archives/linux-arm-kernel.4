Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1C606A89C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4xIPcLF3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hfz1DwFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G1LL/x7N77Eu1XLmVkvU8EZYqDRVKlBzvqhN4r+M2Js=; b=4xIPcLF3/sJqZu
	yBIPLWw9PBEedwngz7ManowpOaW+eUZXBxSkw0k5Q821pmF21Hh06jhRsbxlV9OHDOg2hH5CVKqbx
	MDViPrWtwU4zb599jjdodtDDbNyUcXS2pO/DrszxsG02Z7wpYXOg7C3MpSvznsQOry6BZGebe3XI7
	MpfidRcpIPkbBjmx4tlh7I76l9h/y+qHf1WV2iFftXAuQCsdu1OShT1MO0m82FYoJUIuzdiP+bC7/
	XKdepghi+wUnSM5iBrnaNLXFyx7M0FoUoteI/T8UQF9Ak37mewBFP6BCcL18O1d9PS9bMzgpZyEHe
	Cnugp4x8AFmVINrCAUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLSA-00000006LuV-3D6S;
	Tue, 17 Nov 2026 15:50:38 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLS8-00000006LtN-1RKv;
	Tue, 17 Nov 2026 15:50:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794930629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M+ZrGkTyiA8mwALNyDzkzYpqOuc0nk8rmPgHMbEodQl2vZLceLmuJhx0znthV3bbNnTHSd2FH5+eNy1ekBAVnajB/5F6/fyw7NVxVymy2+4CKSaVehsf+ryAUiQpqQ0SGD3MpNK2a8vPiigIhAWyMpm/Ssr5mbHQgutT53IyyL4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794930629; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G1LL/x7N77Eu1XLmVkvU8EZYqDRVKlBzvqhN4r+M2Js=; 
	b=iZK1oKOEBlWQDlGQ6qNLIdCkTCV7v2bHmLs9GWvOgrqVeJaqJ75+EcQZlO5lpJEeyveuGOUD/mYRtdjljISHPweKHwES8MS11buv1sN7I2iZIA9HwycDLm/lirZRJVPrXiA5AL/p2uvOKKGJemENT36JrKYgfEGaEgWgmcNU7IY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hfz1DwFRq3HWKRf2nl7c818zlf3EcVL9zW5dXCaoQaXM+BjqHTCDnFcCOUMBcNxWuKkCs0ROA04nWwMXZYrP5YR6H6aUFyOAWD/9IqiyBFUPEpMVOi61iBD8lzOIxfFySCJC+RBAkqxIgEp15kncqGhzWb0CAS4QvYJIEko786o=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=G1LL/x7N77Eu1XLmVkvU8EZYqDRVKlBzvqhN4r+M2Js=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794930627710904.9822389417972;
	Tue, 17 Nov 2026 07:50:27 -0800 (PST)
Message-ID: <93161ff8-dd0d-4253-aa80-174a33de30dc@collabora.com>
Date: Tue, 17 Nov 2026 16:50:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: verisilicon: av1: Read the segmentation map at
 the reference's offset
To: aiyengar1990@gmail.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20261115-b4-vpu981-av1-refs-v1-0-c65769715db9@gmail.com>
 <20261115-b4-vpu981-av1-refs-v1-2-c65769715db9@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20261115-b4-vpu981-av1-refs-v1-2-c65769715db9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_075036_436345_884B84C6 
X-CRM114-Status: GOOD (  17.66  )
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
> The segmentation map of the primary reference is read at the motion
> vector offset of the current CAPTURE format. After a switch to a larger
> format, that is past the end of a reference held in a smaller buffer.
>
> Use the reference's own offset, and skip the map of a reference of
> another size (the spec then uses segment 0, load_previous_segment_ids()
> in section 6.8.2).
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 59f2adf74850..f23af435f961 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -899,15 +899,17 @@ static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
>   	if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
>   	    frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
>   		int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
> +		int mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
> +		int mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
>   
> -		if (idx >= 0) {
> +		if (idx >= 0 && av1_dec->frame_refs[idx].mi_cols == mi_cols &&
> +		    av1_dec->frame_refs[idx].mi_rows == mi_rows) {
>   			dma_addr_t luma_addr, mv_addr = 0;
>   			struct hantro_decoded_buffer *seg;
> -			size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
>   
>   			seg = vb2_to_hantro_decoded_buf(rockchip_vpu981_av1_dec_ref_buf(ctx, idx));
>   			luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
> -			mv_addr = luma_addr + mv_offset;
> +			mv_addr = luma_addr + seg->av1.mv_offset;
>   
>   			hantro_write_addr(vpu, AV1_SEGMENTATION, mv_addr);
>   			hantro_reg_write(vpu, &av1_use_temporal3_mvs, 1);
>

