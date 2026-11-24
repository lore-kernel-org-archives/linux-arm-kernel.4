Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94875606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kUKU2Ynl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IyJGpSNW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4A9LDC1Pxq66xRXpAnFLlD4joyJvsEB7ommipyTBSAU=; b=kUKU2YnlU+DaBQ
	kBV2mBTOIPfAL3QjPLTxOYQsjVqVvEVoY7Ri69iY1OiT+d15/AVuWo9UwXcsA/tG9ETs8QfiCNTBS
	mP179fUvFls8wTSpCzxmEI7JntUqsTZaggs8eJQIFzRY4MgmYh7aKtiDxGjq2urVaK7GY31bi1LQW
	oqksUV5x6oFkF/F9hbVOHTiGlf43B7FrcfSK4hjjXZXTe7WR1dyQUW11AsrMzk0Hd9mncZBGMg/ud
	WlvhqdmoGJFBSorLcCLa93hlaIhlZW6G9W+6w7TeHD5E8cNioFNc75EZvQZc3PnQTn+EUEiAZSqqw
	ITNF0bFiaL/Ur+2E7AvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnk4-00000006Dgd-2wZj;
	Tue, 24 Nov 2026 10:27:16 +0000
Received: from sender5-pp-f112.zoho.com ([165.173.182.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnk2-00000006DfU-0BTt;
	Tue, 24 Nov 2026 10:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795516019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LfGiEdx8OjnCNigbjAA6/zn9RrTArJj2FDRUGgWVO5SPcAiahJmVxLsT627D3JaA8Igbqlk1yUjNWE7FultU3Bvjuzb7lmQFjH8Bltsder65QyePUvW12kIwQ2gD1J7Pm48uyCA6+GZGsGYkMcPrpWoVFDd0ThBLB7EqbRVig3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795516019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4A9LDC1Pxq66xRXpAnFLlD4joyJvsEB7ommipyTBSAU=; 
	b=hPUujiE2ZP/ar4Z+UH5dqbDAOlu/PhBGp4xXAHQrjoOBPy0SqOKalskGYGBEDYLsnNLScobmFoTbeo1JD79xvbDAopeATWwr6kp+lgmkpB1lpo0xT+4lVe0wGqPJpDgkcgxjvN7idRhNZj7JKbfRXEYW6FhUTRxndJMcaQgIrzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IyJGpSNWB3Iy/ksv11xA0oHwGVyuEQzfVI+XPmi/aAJVMDKWAB3iuYQoMCoSwuI+OLtzXFjzqdUyIVoOUcKK8Ty899HJoO+qLXSiJ3Vusk85kW5XO6Xrtp9piULRsfRNBmr0mlJSrkVMRm7FRDOK/PvBotijXBWkz1DcEKOVRPo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=4A9LDC1Pxq66xRXpAnFLlD4joyJvsEB7ommipyTBSAU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795515987257765.0607790829777;
	Tue, 24 Nov 2026 02:26:27 -0800 (PST)
Message-ID: <35884259-b669-46ed-a9e9-59cbfab926e1@collabora.com>
Date: Tue, 24 Nov 2026 11:26:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: rockchip: rkcif: Filter enumerated formats
 by media bus code
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
 <20261118203134.315591-2-faizel.kb@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261118203134.315591-2-faizel.kb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_022714_183750_E4C26B9A 
X-CRM114-Status: GOOD (  19.89  )
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

Hi Faizel,

Thanks for your patch.

On 11/18/26 21:31, Faizel K B wrote:
> VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
> although the video devices set V4L2_CAP_IO_MC. Return only the formats
> that match the requested media bus code. The DVP output formats have no
> media bus code, so they are still all returned.
> 
> Otherwise userspace can pick a pixel format that doesn't match the
> media bus format, and then interprets the captured data in the wrong
> format.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  .../platform/rockchip/rkcif/rkcif-stream.c     | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..b117ba57bc75 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -395,13 +395,23 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
>  	struct rkcif_stream *stream = video_drvdata(file);
> +	const struct rkcif_output_fmt *fmt;
> +	unsigned int i, n = 0;
>  
> -	if (f->index >= stream->out_fmts_num)
> -		return -EINVAL;
> +	for (i = 0; i < stream->out_fmts_num; i++) {
> +		fmt = &stream->out_fmts[i];
>  
> -	f->pixelformat = stream->out_fmts[f->index].fourcc;
> +		if (f->mbus_code && fmt->mbus_code &&
> +		    fmt->mbus_code != f->mbus_code)
> +			continue;
>  
> -	return 0;
> +		if (n++ == f->index) {
> +			f->pixelformat = fmt->fourcc;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static int rkcif_stream_enum_framesizes(struct file *file, void *fh,


