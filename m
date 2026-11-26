Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE668606A6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTrTHHLN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HF1qky5t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=; b=yTrTHHLNh/yV7YBh3D1Iswf56O
	5buxgWk2E6oHKL5KaGJP0UZN5md2/PoDVrL2vM1P9Q5eN0XlgbgRZFLtzMFKov0zOzEtJWPNdH03D
	HAqJ5Lmd7AYyrTzFR839lkYk7Scq977mTX9W9sVyjjoGTt5gnttSOYUI8KWupVWpvmO2BpyG81dpL
	EYghG3H95sRvrsvW8H+obr1aSdi74d6U7fct5xq3hMz6hYZuKqJognP0ZcJ9W6WxJX2OJY3jFgUd4
	1mHmbPJzseSBCyxJrAbLb/rJo+YTV5Z0Yh3S9wA3dKtyzjrxX3xDXpAzfpyfimBameQ6ylaaGXQpa
	FKlGJgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWg9y-0000000ET8V-2Z18;
	Thu, 26 Nov 2026 20:33:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWg9v-0000000ET73-05u8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:33:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8b5e147f101so725485b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725214; x=1796330014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
        b=HF1qky5tRMGpiM28BoiTjG5mYF4h4x+MPhtJ5KjQudW7iO4UxbatNjaLUIHGQIPK5X
         WdWKOI0BN/aY9PHfZKJvhfq6/MNffyACtnLq1H8B4MqBJdJOi+/ss58KU9+DLfU/pQh0
         pC0U7ZNNUUR6jOCSZW0llfjhoqX64ZOFv2PiP+t9r6u5dBvzkGqzeZ2aHTNtDicVMgxF
         wkfSbAol6CaQBx0y12R6vFu3Eo6ChFusnVvzgLDvb3wny4mdXgBetJ5p+N61ammHC/zt
         bTp+sZb7JRubBXzrOsOeXxLb3UgxwRqDjKk/o4VXnCNzryDWBnbw9Tfm5xpG0klbDWgy
         28aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725214; x=1796330014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
        b=hDNR59G3S/LN1os784OSXYJIPY3ctZqlo8tFZFgDus3oDvAt8yAHJELMu/+JqF5JBn
         WsLoMTBmc3cAHWDPjHxU5MzYx7/YDuBRVDgYFDY6Ct+eYIjEW3CIc8jO+zDoHhHkLYqE
         I5Lkw7rZ8E9thVduNJCnV45iZqAFZ1oPTh3WCrSwdox6WnJQyCshoTcoH00dwnW6l9TX
         EhkVCF1LKnO6s1vWwlvB1p2AYkgS3zCmC/+cmxo1A/qDETIVErcL/69NtxV61ahmgzp7
         ndwGS0ofW4dfKJ+XnAgH0nHciuqs6guPoOa8pifNM6mVnDDzyv5iuC/KNuPtFUUXoryW
         /ApA==
X-Forwarded-Encrypted: i=1; AL+hErFsUGuSC9niVrQ0bNSlto6KjQ+WtzADQ86RLTWv/j5uZs0fxglEwQqGs4G5944A5G0gYB26JBHWq6oGMV+d461i@lists.infradead.org
X-Gm-Message-State: APuU4Z9WCNr98xn1usS1gkaYVFpGDJKO8KGrQi3BlW/N21LhAN6UHa+O
	IRo7LLjUHvsVXDbCnINvdbYOE9yEFUnJjz57xatiVj3RWU7C3QNTtz8f8CJNZJAQ
X-Gm-Gg: AZFdTZfTitLVJuWbAJXGYsW3ZqqjLDccUS3WbVWFYHJZ2UIaPTCMPQfHfhXpoN9sB/S
	RdVTuggxBwsXXziVnPsTpBYx4fsbfeYiQLUcUe9LWZe3IPytz9f0zhsjXO4TWDXzMnlJJpdTrs1
	2Tmagr0urwten3Y/+l8j/onhUvyu95l2+AtBjPwh04NVsGLfLnXEVrejKVN2ljFN2nkWucyMRWs
	WC1zhxYNLx3eE0JvFgOt0MoOSZPfe+rO/pRfA4xp3u8aYWQmKty64hbZ6ro0J+RbnBWYCcGVZ9c
	N8GCfXtmXU/qmMaiwkAgdKg76R4ouw8Dp4htLg9lLlLZRfgSybSJDh3v5kFNp4Aifb51aKkdJ3a
	vQSqHTGRk/blndUROWltAS1eZx2Dm4FHulYTWt8SehdJ+IMhojXUx2rWgP/C5OZKwWx709stfaY
	vqxgKj4NrghauyIGQy28G785S8aEV8Pl1gcmRr7350KOxGLLaY2K1C1LEQ6DkYN070s9NI8+f7X
	jqiZ+RJ5cmBkRj62ip+WVpvMf7zGA+ksx4ZOEfCxJoQ2GQ/ufs+t/1KCMjmVKqG60CYSFviMDwM
	9hl7Pao100a7GFnC3QqTudYGQdBz3WDJxn5j7ESZwFLZTHVQMbYwUDIHXAY=
X-Received: by 2002:a05:6a00:6f6a:b0:8c2:da80:978c with SMTP id d2e1a72fcca58-8c8796aab2dmr30978453b3a.1.1795725213712;
        Thu, 26 Nov 2026 12:33:33 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:85d0:b069:3959:1d31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87392d408sm11154247b3a.44.2026.11.26.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:32 -0800 (PST)
Date: Thu, 26 Nov 2026 13:33:31 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v2 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline
Message-ID: <xf3wywxva4ogx7zn4urfkdgoldaamo673v2l5qm74trf6tjofx@g3gksm7mv2yr>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
 <20261118203134.315591-3-faizel.kb@gmail.com>
 <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123335_057046_7F74756D 
X-CRM114-Status: GOOD (  26.31  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

Thanks for the inputs.

On Tue, Nov 24, 2026 at 12:13:20PM +0100, Michael Riesch wrote:
>> +static u32 rkcif_stream_plane_lines(const struct v4l2_format_info *info,
>> +				    unsigned int plane, u32 height)
>> +{
>> +	return plane ? DIV_ROUND_UP(height, info->vdiv) : height;
>> +}
>
>Is this the same as v4l2_format_plane_height? And if yes, would it make
>sense to reuse this one (of course it must be made public for that)?
>

Yes, apart from the block height alignment, which is 1 for all rkcif
formats. I will export and reuse it.

>> +
>> +static void rkcif_stream_set_bytesperline(struct rkcif_stream *stream,
>> +					  struct v4l2_pix_format_mplane *pix,
>> +					  u32 req_bpl)
>> +{
>> +	const struct v4l2_format_info *info = v4l2_format_info(pix->pixelformat);
>> +	u32 bpl = pix->plane_fmt[0].bytesperline;
>> +	u32 total_lines = 0, max_bpl;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < info->comp_planes; i++)
>> +		total_lines += rkcif_stream_plane_lines(info, i, pix->height);
>
>Just to be on the same page: What exactly are you doing here?
>

When bytesperline is increased, sizeimage must grow with it, or the
buffer is too small for the DMA. For formats with a single memory plane
(e.g. NV16) the Y and UV planes are in the same buffer, so sizeimage is
bytesperline * (Y lines + UV lines). total_lines is that sum, and it's
also used to limit bytesperline so that sizeimage doesn't overflow.

>> +
>> +	max_bpl = min(stream->max_bytesperline,
>> +		      ALIGN_DOWN(U32_MAX / total_lines, CIF_BYTESPERLINE_ALIGN));
>> +	if (req_bpl > bpl && req_bpl <= max_bpl)
>> +		bpl = ALIGN(req_bpl, CIF_BYTESPERLINE_ALIGN);
>> +
>> +	/* The Y and UV planes share the same line width. */
>> +	if (info->mem_planes == 1) {
>> +		pix->plane_fmt[0].bytesperline = bpl;
>> +		pix->plane_fmt[0].sizeimage = bpl * total_lines;
>> +	} else {
>> +		for (i = 0; i < info->mem_planes; i++) {
>> +			pix->plane_fmt[i].bytesperline = bpl;
>> +			pix->plane_fmt[i].sizeimage =
>> +				bpl * rkcif_stream_plane_lines(info, i,
>> +							       pix->height);
>
>v4l2_format_plane_size?

It computes the stride from the width and an alignment, so it can't
take the requested bytesperline.

>
>> +		}
>> +	}
>> +}
>> +
>>  static int rkcif_stream_fill_format(struct rkcif_stream *stream,
>>  				    struct v4l2_pix_format_mplane *pix)
>>  {
>>  	const struct rkcif_output_fmt *fmt;
>> -	u32 height, width;
>> +	u32 height, width, req_bpl = 0;
>> +	unsigned int i;
>>  	int ret;
>>
>>  	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>>  	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> -	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>> +	for (i = 0; i < pix->num_planes; i++)
>> +		req_bpl = max(req_bpl, pix->plane_fmt[i].bytesperline);
>> +	ret = v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width, height,
>> +					  CIF_BYTESPERLINE_ALIGN);
>>  	if (ret)
>>  		return ret;
>>
>> +	rkcif_stream_set_bytesperline(stream, pix, req_bpl);
>
>Wouldn't calling v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width,
>height, req_bpl) do the trick?

I looked at that, but stride_alignment is a u8 and has to be a power of
2, which the requested bytesperline usually isn't. For example, with the
IMX415 in SGBRG10 the minimum is 7728 bytes, and libcamera requests 7936
for the 256-byte alignment of Panfrost.

>
>In summary: I think this is a common problem, so there should be a
>common solution. Reuse helpers, or extend them if required.
>

Agreed. I noticed that some other drivers, e.g. rkisp1, also handle the
requested bytesperline in the driver itself. For v3 I'll add a helper to
v4l2-common that fills the format like v4l2_fill_pixfmt_mp_aligned(),
but keeps a larger bytesperline requested by userspace, up to a maximum.
It computes sizeimage with v4l2_format_plane_height(), so rkcif doesn't
need total_lines and only calls this helper. Does that sound good?

Regards,
Faizel

