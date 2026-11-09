Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC71606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jljipFdW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbqJePTV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=; b=jljipFdW3MSkzcitFXDGYkevKx
	TS9v41oUzOtavXGr7OLvc8Hf+LmTUJUb2FuvZusydMTRN4z3ld3ws0Nd6iLexABFA9GS2GyfI1ZwV
	kWKkv5hCUttHH6spdisUBgvWIhV93VoiuuhX/RnxrrYOb/Xy+KpY8Sn+s/V9sRlm1Wv3+2c55K3wL
	aoNFWSqoY+1/pL5lJLRk+5SKZCbed7P9IWGK2DmZ93Xjb63Flqo1VDHWh9dyaUEUfFnT2rxvN5Qiz
	dAzt7sEwrf4pkwLqcTYu/Q+MG/iyQHbKZEp0/LpKTm7TFRWaRSkooZgjhUrg87wiMTkf0GfUib9Fq
	8manQpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVRP-00000001aZ7-42pp;
	Mon, 09 Nov 2026 19:54:07 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVRN-00000001aYG-0md9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:54:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b0b8b5d28cso75533a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254044; x=1794858844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
        b=wbqJePTV96bxrZnnkS7kPNgD81BwQj9lVa+sdjtbbrbrYoKjzhox8Q6kFmhyP/drwj
         Ni2mtD/pBiE5O4bO08P6Xp3DDJXN7EziSvxY7uoC1zq2VcU2JH5K6ZXWIvDqx38bNYMq
         muE7GIdVtVaUMtIKlP0udIC1zKEv8PBM/7D4RsOgDzAXdmwJFGymBxslxdVzSD3yfbX+
         D4+C0wFjgGvXZrHDccfs9/i1dgGbFbsW9KeXB7YdRS0p3LzYFyRuTwsn/oZmjDsoxIwB
         LXa0fM148GBN/h3+jCR45lWW33aO8CsGYLmOHG97gqFjvcr+kYkofjh7YvRGD0RLngPl
         eoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254044; x=1794858844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
        b=OIdYhJcR52WvoncXkgnrt9HcNNRoSUPl1Q/51oOHbLFsr/yO86leuxapOVbQgjnbRk
         8twGNZ24BURWiOGBa8ysmh8qtoNfIa86jlsc5tx13IYR/VtejmNtZkq/3mYtradWPEal
         1bOFiamb78iufaJN9zjw3lejAMrABNguHfAUtdZ+6GM1lWqZert+RWGEzywbHQfpfGRP
         A2Zb9rYoa759H7WgWHdUtQVldOQl9gsP6UjXp81M3pXr97aQ30D339vYEme+zjW2qQyk
         gb5B2gJWgW4W/Dezn/O3CuUL42O+SN7Q1i3QDD2nqPEPhn1uPg8QRhV92ueoRxgyQj+o
         jYkw==
X-Forwarded-Encrypted: i=1; AL+hErGMO1PP/Q4cRmxLbA6rZKXLcrR2ZFxrIAImr/h9TFVWfyIZ+sM2ngLbSUQVwO5gY6tjKoPjQvryNIdmlexlzOSR@lists.infradead.org
X-Gm-Message-State: APuU4Z+WVOqabYN6KNFrFDRiNUHL0TWecAYmkJhG3Uj9NY5w8wYzHsby
	RkrsYLBrgt8wiDOz8gm45zlL3x5poUCZljyjJyp8Uh+b8Les4RsP1e4C
X-Gm-Gg: AYBFou1kOcWZm0nu1GNHBzlF3sBadBYNfr4nUP+Aj3Xcyvqed7ea+ve+qxTpIcXPchq
	JN6VHN7khAZzuhtrDHCkLYCxDpK9+U12Q+dTfeVsIjgrk2QCz9jP8Fao7xDF1FLRScQNFlm82VT
	3qWfOgJG+Ne6AqG6eJZ9h4OQRfZIFxMSpjzcK86K/3p/aWhBpVPqoG/D2+fJMeCVV9AjsQElGRc
	e4RDkGlovrRSryZzi+kMBo7OklXHukNDxDu/ElBRkY5tzUgF8kJnQyASlRDKDGkkZKBLnZJpZ0V
	xV+P/IOFQ/RWXlYzo4+mJ71ysLYn9ujXIa8hhFll4juneQgGGUI0mgf+IhEfC1nY8si4X4+WoKM
	hd7YfSWmMSbZpVvE14XTXmQLPMOnBRWromA2jAko75HTB4JzritS/wO+2j9dmAkEQz/rsrThrM3
	QxYOY3fsQJNdxBeD9nQ+BqrR2jQ3rkg3VgajiOHRmtrzT5xa7GcGA/AV/mWJQxDjTZu/M7bvoWg
	5RArgRf50/fAroiMc+7F9PE4HWvEpvzKPRqrzlAAChbh5uyMXtdp1my7i2uAPatTARjFxP5Zkc2
	MxfpX4c/emTo2MVZoJx/2diTB+ZDJbOD8cgx9+zCm0pfEAeyqONrKgr93w==
X-Received: by 2002:a17:90b:3c09:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b166add45fmr1297126a91.0.1794254043528;
        Mon, 09 Nov 2026 11:54:03 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:4b92:5a54:3d6f:1e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1690f4733sm134974a91.3.2026.11.09.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:54:02 -0800 (PST)
Date: Mon, 9 Nov 2026 12:54:00 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
Message-ID: <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com>
 <avG782VCMTWTNax0@mdjait-mobl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <avG782VCMTWTNax0@mdjait-mobl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_115405_233405_BBF9DB39 
X-CRM114-Status: GOOD (  16.58  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mehdi,

On Mon, Nov 09, 2026 at 01:27:34PM +0100, Mehdi Djait wrote:

>> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>>  				     struct v4l2_fmtdesc *f)
>>  {
>>  	struct rkcif_stream *stream = video_drvdata(file);
>> +	unsigned int i, n = 0;
>>
>> -	if (f->index >= stream->out_fmts_num)
>> -		return -EINVAL;
>> +	for (i = 0; i < stream->out_fmts_num; i++) {
>> +		if (f->mbus_code &&
>> +		    stream->out_fmts[i].mbus_code != f->mbus_code)
>
>what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
>set.
>

Thanks for the review. Yes, the DVP case is missing. How about only   
filtering the formats that have a media bus code, so DVP behaves as
before (see the change).

        const struct rkcif_output_fmt *fmt = &stream->out_fmts[i];

        if (f->mbus_code && fmt->mbus_code &&
            fmt->mbus_code != f->mbus_code)
                continue;

I don't have DVP hardware to test with. I can submit a v2 if that's ok.

Regards,
Faizel



