Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F3606A883
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=deTvu9z/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=N4qcmHqo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w26fEEm5ybG+G7gyNNOpBbzc8hwwqjZd0VP12Wt699s=; b=deTvu9z/QIHI2N
	wtmsvHZoDLnwkHERYl4TJ5GSGWEMamAdG6zdd/lTTJSyxhy3UKHVML6qUEqHjbIDsYrhbZZomFtuK
	+lAwpFLZ2HJxYJCqPnvkP2W2Y3znHUGhXXKFk8ahMdd4UzQDqpKUHZ6kNIgAKsWcWQ2LLvNV0PW1C
	7A03ASLNTSDCGmkeayHHe0T4IkYfpJT/BEBswLQwmNQgtE3Vm+1OxP5Jcx2HS3MSa9aaWCIQWeNP9
	f4K0ennmYDL51XHkL/JbBSEooVDI426vI9pc023ZCEKx7MuEpPc+2c72d2Zpv4zI42GNXmXyRNgyq
	5pVaZO+WJ08YdWINxdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvG0-00000002FIQ-13G1;
	Mon, 16 Nov 2026 11:52:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvFx-00000002FHM-2Rmu;
	Mon, 16 Nov 2026 11:52:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794829917; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=irrbfyXogddlylcQkZlr6cFYcsiEft7lACg+oXK/70XkypgFcOjhmlPA7bq12bE16XzEfAWJYo4r3oWZcjOf3EUX46INf7/iqVbcT/NRcuNT9mFS7dg9/l2KKYIYPTF8fJlCSwLunT45fEXl/zkUcBQNFCd+V4pflORA2ag13Lk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794829917; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w26fEEm5ybG+G7gyNNOpBbzc8hwwqjZd0VP12Wt699s=; 
	b=D6oNnhh/8JLSRSl95JJcti5S9vsohH8/64oARoV8f0hCc7bQfImSA93NBfkpdwFosA9+xFE864riOu+NhuPED6i9DB1j6vHnT2txkXGIvpK+V9VAYv5NUNVf937QzPzylg+y6IoVhuWf4Nbs0gqve8aq48i8uH8WNoom1ikvaPI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=N4qcmHqo84guRQyqnmSu5MjnWgmGqqRgJx9a78v6H+YMDg0X2DOyl/HIZmAgFDsvibkEl5CTzA8eowA/zTt1HiGiSi0ht5rNR3SauwE+SxlW6i2xeongA00WAH966tOIosLWnLvvNIaFko5hsiXgrA4AvfVKhjx3Q9zdpAKkMP0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=w26fEEm5ybG+G7gyNNOpBbzc8hwwqjZd0VP12Wt699s=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794829915540706.1524411200606;
	Mon, 16 Nov 2026 03:51:55 -0800 (PST)
Message-ID: <8c3805ca-0be7-4634-8904-30a9c36d8962@collabora.com>
Date: Mon, 16 Nov 2026 12:51:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
To: Faizel K B <faizel.kb@gmail.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
 <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_035217_881726_D39D97CC 
X-CRM114-Status: GOOD (  25.66  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Faizel,

On 11/12/26 07:20, Faizel K B wrote:
> Hi Michael,
> 
> On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
>>
>> Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
>> "Virtual line width of even frame for ID0 path(must be aligned to double
>> word)." which I would interpret as "it must be a multiple of four
>> bytes". What do you think?
>>
> 
> The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
> "DW - Double WORD (64 bits) access". So 8 bytes.

Ack.

>>> +static void rkcif_stream_set_bytesperline(struct
>>> v4l2_pix_format_mplane *pix,
>>> +                      u32 req_bpl)
>>> +{
>>> +    u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
>>
>> Please add support for the bytesperline field in all the plane_fmt
>> entries here...
>>
>>>      width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>>> +    req_bpl = pix->plane_fmt[0].bytesperline;
>>
>> ... and here.
>>
>>>      ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>>>      if (ret)
>>>          return ret;
>>>
>>> +    if (stream->interface->type == RKCIF_IF_MIPI)
>>> +        rkcif_stream_set_bytesperline(pix, req_bpl);
>>
>> Why is this restricted to the MIPI interfaces?
>>
> 
> The MIPI formats all have a single plane, and the MIPI path already
> programs the line width from bytesperline. The DVP path uses the width,
> and I can't test it. But I agree it should not depend on the interface.
> 
> For v2 I would:
> 
> - take the requested bytesperline of all planes into account, and use
>   the largest for all planes, as the DVP has one line width register
>   for Y and UV
> - compute the sizeimage of each plane from it
> - limit it to the line width field (20 bits MIPI, 15 bits DVP)
> - program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
>   value as the minimum
> 
> Does that sound ok?

That does sound reasonable, yes.

> A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
> stored as 16 bits per pixel, even from an 8-bit source. This matches
> the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
> V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
> the size the hardware writes. Am I missing something?

I don't have any PX30 board, and actually it is the first time I hear
about that. Maybe Mehdi can chime in?

> I can only test the MIPI path, on RK3588 (Radxa ROCK 5B+). Could you
> test the DVP part on PX30 or RK3568?

Currently, I don't have any active DVP setup, but when you send the
updated patches I'll ask around.

Thanks and best regards,
Michael

> 
> Regards,
> Faizel


