Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDAD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=djGxAK7x;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1SI4NYJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=; b=djGxAK7x6J6oHR3mfjH9E+8CHq
	f33MSMO9Ub+s/WMGw/cQIRJMTES0qpdyRy+ndCknGuk71zic6L7jF+l7maZvMpoIqEY1UjiMb3Fxw
	m5z9pFmaSPMF0D5hhAWbwnHExdBqsBGIFKha/Y25uFZM1t7qKTvhD4or63wD9q0ig+uTIsb3fXOj0
	fP6yVWHBM0jLesZA35/2PA5c1tZ5ZJ/0pCEDaKlfVp4HOZrtJE8g9BX+UAbH06zyutiiGQCBl0GCz
	dRaYGtC3zQLoeBcaoY9zfued5i2dr4eq2ZsK9y/MfBVlNx4xky9i6uo5QkKVI2olxXJo9OHcOf0dt
	Q/N934/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROBB-00000008oJI-3zdE;
	Thu, 12 Nov 2026 06:21:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROAh-00000008oC7-2d8d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:20:48 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8a73075f2f4so161311b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464430; x=1795069230; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
        b=g1SI4NYJgo3j8DkLyq2WC0vZrBTWgke8nGIbqQsfMOLlqGEghJI1ayUb8n2rWilMAy
         PoiQm6SBqPh5IBLOckUnJRdcHG5q7Mpvi53q2PivklMpSYv/AKcUGjxy8Mv9wNOxzriw
         VFwYa/GE8aDYrv9/aBwh3FOnQVqKb1keOSq6HebfvpyVoniNwDjCG+aEGIRjb8l4u6SJ
         9T7makJ+o/OmxQg9pvaaiv6sq3bqwrR7zdRecAI0JHvhGBmQ0Y6vU6ozA6V31DdCAZmu
         WcswKT7L1Na+xFg+Gs4g9BDS17TiKY31mxfIflqDM8jLJyxmWIc/2adZN42/l+n06HDJ
         GjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464430; x=1795069230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
        b=yY2YltwdB8JkTJkB3iVpTkdzrPApb0n6l/M48P2NYjAEkTIAtlvqNqaHJfQt5PJh3k
         U2+zlIgtUwFX2VPW5IOUPL0WQuosDiFleK8GlKPkC5eNBR95Cjwmy8SdujZfgInL6eoQ
         0DUOUIeMn1HAn0jMKIJ7l64KY1Vnr67T8cNDdbbeheMYCIQ+Cog/v+9/yjkooKUnYFgR
         wcbGu0sCwOiAT/rH7Z0Qla+B90v4+VZXqptYIX62El2kQB3ZwXOYUtBah16VlwR1/aNd
         5nIdbCCamIjAX6AU1WRh+ofYRCVvx4KJjLvONQy1VFtC1D92qvYf9YqHxceP/hcaWaR2
         wmqg==
X-Forwarded-Encrypted: i=1; AL+hErGIScNLhV3vSOamxY9+JIb8Uk/geSHzHRPfP5V8MmwmEZPr7tg9S/QmTN2FJjKxGiLBOGMIt4hzgDfFbkMNZ9hx@lists.infradead.org
X-Gm-Message-State: APuU4Z+3lMgwkMS19nAQpcDGrhk+tgoXP07MNEvfk0BCcqtUi5PLBSZT
	luY5NGWL6AVo7PJizjvsdFJMwjxp86r2XWeTzLxDRrpLD7nd0JqUBiOW
X-Gm-Gg: AYBFou0StaGTjM84Be4BtmpA753b8wAFrYU594JTPcIeJsypWR1CW6esm1/gTCilEE5
	C5vcz6+yvfts1uS96FZCgCrnQTj2r5ErlaSEy4f5zleeXRgIFO1ZKwzMh89SGEIRLzvkH0xQS5f
	zlmcaTtALw38qu2zvUBIGncvJpheQNMA/kBfN3OESsswMnnYZCmZd3VcU1K2YmXYRdDWKMQkHVE
	Ho62KKWHdPa9yulszut+HZOeCJ8PPUiNlt8cfjMv3Pf8c52vAx2wtBAhYyzyR15mugroWY2aEU9
	dWRaqmNp7XwoRpI9zKsRCxqJ2LlHJDD2jiOK5g6+41Ky5FNUOLrHRAnsaAXk8FPBrbwc2DkxbuH
	3XgnMS9gF8RmIipd3B05Mr+zMFFTBpDcM/1PVAw8YUbaGKN4REYYVot8Fx0tKALxvWmiUz43TJ9
	+2TvGGe7SPow5+NeE9ewlW4RklOJ++d/wDD248YrBdMnSHn09Bdsu/oB/zEw0BtBYBaYPrPGyfZ
	QaMtcJUBvnLGdjAGmk3mUYrZ5+l/ELwdV1NMiosBaKeDps7Sn1VFNPgn2MD0cVUx2q2gzchoyF+
	pU2JFJuK/IhBbved42Ue89S+NsvvAWPQCObx9AtE1zvvDDcgy8LFEuc5+Tk=
X-Received: by 2002:a17:902:ef4c:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2edd78c45admr80762355ad.4.1794464430262;
        Wed, 11 Nov 2026 22:20:30 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:3fec:b9ca:ef85:7998])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf55sm28202185ad.30.2026.11.11.22.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:20:29 -0800 (PST)
Date: Wed, 11 Nov 2026 23:20:27 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
Message-ID: <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_222032_923228_D1A7D07D 
X-CRM114-Status: GOOD (  21.43  )
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

On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
>
>Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
>"Virtual line width of even frame for ID0 path(must be aligned to double
>word)." which I would interpret as "it must be a multiple of four
>bytes". What do you think?
>

The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
"DW - Double WORD (64 bits) access". So 8 bytes.

>> +static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
>> +					  u32 req_bpl)
>> +{
>> +	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
>
>Please add support for the bytesperline field in all the plane_fmt
>entries here...
>
>>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> +	req_bpl = pix->plane_fmt[0].bytesperline;
>
>... and here.
>
>>  	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>>  	if (ret)
>>  		return ret;
>>
>> +	if (stream->interface->type == RKCIF_IF_MIPI)
>> +		rkcif_stream_set_bytesperline(pix, req_bpl);
>
>Why is this restricted to the MIPI interfaces?
>

The MIPI formats all have a single plane, and the MIPI path already
programs the line width from bytesperline. The DVP path uses the width,
and I can't test it. But I agree it should not depend on the interface.

For v2 I would:

- take the requested bytesperline of all planes into account, and use
   the largest for all planes, as the DVP has one line width register
   for Y and UV
- compute the sizeimage of each plane from it
- limit it to the line width field (20 bits MIPI, 15 bits DVP)
- program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
   value as the minimum

Does that sound ok?

A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
stored as 16 bits per pixel, even from an 8-bit source. This matches
the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
the size the hardware writes. Am I missing something?

I can only test the MIPI path, on RK3588 (Radxa ROCK 5B+). Could you
test the DVP part on PX30 or RK3568?

Regards,
Faizel

