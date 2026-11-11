Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC7B606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ZWgxTC9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=NPO9Siu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LJaA6HtGKmrxTdDdOmAvwarGqI59rOjtDYGgfbVCI0c=; b=3ZWgxTC9G/Z/1V
	lLDMeWwGNMkaS2J4nv8YFymLwlkf5nv5Y3Z1gjrZeGxYZ2kzqyUdOPnMv/kDtsb2KSw8mK3mJaSvu
	iZqlph1TwPVDElTHH67CzjzN42zH1N8uIXYscODIn0LY6bPVCMuvBk7xMnL6Y2D9qCD/BgmvIVwXJ
	XoAjxz5m98blBonxSM1t2Lw9Fy/QVVOYYn9qVdpcw66KFWP95Zoip+/IPxZPRU/LybQS9HCMMGlpb
	Rr5fL77YXvR7LaPwOc1sHmwf14t0G80uxBJW0Pqv43pZEOsYiQUfE91rt1soq7VbYXjGomu2ceZDE
	lirg74Iu7AX8rtuncL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR53w-00000006GVH-2hAX;
	Wed, 11 Nov 2026 09:56:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR53o-00000006GTv-06DO;
	Wed, 11 Nov 2026 09:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794390959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=af/0lRDissNzwJALOr/P1m/GFsSM74WEEz4Cm4KkV7VVzRmKU5VNWaGjvZfLocobjdKpGwRe4hBP66jYNTaZzyWNZOnpfCsMGuEqhu48dSBM+tL+UeyBNMeKtj+7gKLaWgI7BiPg6lnZCc51vi5zb2yP9JfCWMdcPCuRQ6qhZps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794390959; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LJaA6HtGKmrxTdDdOmAvwarGqI59rOjtDYGgfbVCI0c=; 
	b=SIrxzL+TMeUZeg9ZuVUj9Itep1BPqVpRmdyJ9IAtZmh/sW6IOqg/mfpuvf2278wrN4Tt748BrshkVn0U8WS14l3489aoOVQ2c6UVgM1A6wZ55o32r+VJbiCG1Xs1HZmCEtKqFRySGjTGPBbKUe7VLT8MBt2v/D7gMmrc0Qklf+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=NPO9Siu5VR34VfGZ6i7tUOjD1JcuFY6w1SejwYzSb81YgEAvz2dPhKUmWrpPmGb/BAv6lPJ6IXG+G36YhxgTvoJyyTn1yKMo5n49WQNZfMP2rHcXnOQeD8LlS6IbnGx0eHampwEZUbJz4qtbtdhLSjJeav5SEQAA6eBFGrWS2lQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=LJaA6HtGKmrxTdDdOmAvwarGqI59rOjtDYGgfbVCI0c=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179439095914522.51825314890425;
	Wed, 11 Nov 2026 01:55:59 -0800 (PST)
Message-ID: <e76c2d98-b543-4a3e-bfa2-c0e6e27bfe4f@collabora.com>
Date: Wed, 11 Nov 2026 10:55:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com> <avG782VCMTWTNax0@mdjait-mobl>
 <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_015608_867940_0DF5DD05 
X-CRM114-Status: GOOD (  16.46  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi there,

On 11/9/26 20:54, Faizel K B wrote:
> Hi Mehdi,
> 
> On Mon, Nov 09, 2026 at 01:27:34PM +0100, Mehdi Djait wrote:
> 
>>> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>>> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct
>>> file *file, void *priv,
>>>                       struct v4l2_fmtdesc *f)
>>>  {
>>>      struct rkcif_stream *stream = video_drvdata(file);
>>> +    unsigned int i, n = 0;
>>>
>>> -    if (f->index >= stream->out_fmts_num)
>>> -        return -EINVAL;
>>> +    for (i = 0; i < stream->out_fmts_num; i++) {
>>> +        if (f->mbus_code &&
>>> +            stream->out_fmts[i].mbus_code != f->mbus_code)
>>
>> what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
>> set.
>>
> 
> Thanks for the review. Yes, the DVP case is missing. How about only  
> filtering the formats that have a media bus code, so DVP behaves as
> before (see the change).

This sounds reasonable.

> 
>        const struct rkcif_output_fmt *fmt = &stream->out_fmts[i];
> 
>        if (f->mbus_code && fmt->mbus_code &&
>            fmt->mbus_code != f->mbus_code)
>                continue;
> 
> I don't have DVP hardware to test with. I can submit a v2 if that's ok.

Looking forward to the v2.

Best regards,
Michael

> 
> Regards,
> Faizel
> 
> 


