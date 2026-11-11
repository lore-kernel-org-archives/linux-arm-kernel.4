Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0247606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YT69Zc7r;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JXBRqsR8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dDFMBYQOa4uJE7PzeKyrrGP8ivAyLwocI64qk9V7SoQ=; b=YT69Zc7ryq2vmH
	7+HWUeQUMKVk4dJvs03qEqnaKKJ2xPlK4KKjilaHatGkWsOelb7CC1eUI+fSUaDRgSNtfw/oMFkHA
	SxGhW+zJLN3u1H8hnlYudU7YJCsvK0KuIbqSFGLyq1UZObbcczy8gdMqB0OSqrr7gXFeh/5c6TH6F
	wPgcSfmAwh4Lz5DTaqZ3CPwmKbIiboJVftj1aff5l0UC8OxdjgBu1Ik9r3JIPpChwXVzkQt/rc7zV
	BG//4Khb6STOQmsz4YhSrbQxI0X/oe2ptPhIdEtMeKMU9V6Kq7H+lInwrnzD0+1bZ8qw0OvmxISzc
	gHh5b21MDc9OxHr0H+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4v0-00000006Enx-1xrL;
	Wed, 11 Nov 2026 09:47:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4uy-00000006Emq-0hvd;
	Wed, 11 Nov 2026 09:47:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794390409; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zova7S+4VoUlY0Zd9ItVIFVeGKZs4+fz6hdRSIiIM+PM8qgLpQll0rFvUH45cx24OIhaJkkJZ9Esoxm/3I9xIcLW+oxtjnM7AbV/3jDtcJyZo2HJxpGKJoGEuvl80DYktsZ+dhrBK7dhmawDFx2dPrsByrO2fuEbrjsinKd12io=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794390409; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dDFMBYQOa4uJE7PzeKyrrGP8ivAyLwocI64qk9V7SoQ=; 
	b=e4/2iRZ6OnHxulopSPGTWhuj64Le5Ki3NdOgMAB8ipfQQfOPZdAJsBLrUlZRe1UWkZuZEfJp2z7NoKbR4ibFD9SLbxneTBiZvMM7XW5FByX9NKdh/MfSLtWVkB5hr3kiiSb3EO03gd6XgosjjYG/anTBzemIqAwM6ntOkrmWrHE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JXBRqsR8ousycN+AeIqhe6tHpIhFzn0QMfond1bqheK7uEsFspseCpTB34+RHZMrY1LwF8HXocIlmaBxGy8GdtSvscUYaRCMUrQbuG9xCiBn9DYwnFOu2borWiFcyWKhByEyfLepxBDOPvVIZRkMPOisTjgQOYmbFPkD+BFI494=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=dDFMBYQOa4uJE7PzeKyrrGP8ivAyLwocI64qk9V7SoQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17943904075303.476694908820832;
	Wed, 11 Nov 2026 01:46:47 -0800 (PST)
Message-ID: <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
Date: Wed, 11 Nov 2026 10:46:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261105232310.385463-3-faizel.kb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014700_272783_E4DDEB75 
X-CRM114-Status: GOOD (  23.09  )
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

Hi there,

Thanks for the patch!

On 11/6/26 00:23, Faizel K B wrote:
> The MIPI DMA uses bytesperline as the line stride, which must be a
> multiple of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it.

Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
"Virtual line width of even frame for ID0 path(must be aligned to double
word)." which I would interpret as "it must be a multiple of four
bytes". What do you think?

> Any larger bytesperline requested by userspace is also replaced with
> the minimum.
> 
> Align bytesperline to 8 bytes and honour a larger requested value, up
> to the limit of the line width register. This allows DMA-BUF importers
> that need a larger stride alignment to use the buffers directly.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  .../platform/rockchip/rkcif/rkcif-stream.c    | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index f2a24832a8cf..e50f20e40f7a 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -23,6 +23,7 @@
>  #define CIF_MIN_HEIGHT	 64
>  #define CIF_MAX_WIDTH	 8192
>  #define CIF_MAX_HEIGHT	 8192
> +#define CIF_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits, 8-byte aligned */
>  
>  static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
>  {
> @@ -334,20 +335,39 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
>  	.stop_streaming = rkcif_stream_stop_streaming,
>  };
>  
> +static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
> +					  u32 req_bpl)
> +{
> +	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);

Please add support for the bytesperline field in all the plane_fmt
entries here...

> +	u32 max_bpl = min_t(u32, CIF_MAX_BYTESPERLINE,
> +			    ALIGN_DOWN(U32_MAX / pix->height, 8));
> +	u32 bpl = min_bpl;
> +
> +	if (req_bpl > min_bpl && req_bpl <= max_bpl)
> +		bpl = ALIGN(req_bpl, 8);
> +
> +	pix->plane_fmt[0].bytesperline = bpl;
> +	pix->plane_fmt[0].sizeimage = bpl * pix->height;
> +}
> +
>  static int rkcif_stream_fill_format(struct rkcif_stream *stream,
>  				    struct v4l2_pix_format_mplane *pix)
>  {
>  	const struct rkcif_output_fmt *fmt;
> -	u32 height, width;
> +	u32 height, width, req_bpl;
>  	int ret;
>  
>  	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>  	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> +	req_bpl = pix->plane_fmt[0].bytesperline;

... and here.

>  	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>  	if (ret)
>  		return ret;
>  
> +	if (stream->interface->type == RKCIF_IF_MIPI)
> +		rkcif_stream_set_bytesperline(pix, req_bpl);

Why is this restricted to the MIPI interfaces?

Best regards,
Michael

> +
>  	pix->field = V4L2_FIELD_NONE;
>  
>  	return 0;


