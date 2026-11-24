Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B097606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D3M///+9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AwVkoZL0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xi9+n6mqjen7xK0aEroUXyIA3DFP060y5zPoLf1Eehc=; b=D3M///+9++wgaS
	JiqR14i7GAL8ROSW03rNlrnMqIZJjjzF/wDQxEaEsHjll3Txp46TJHXLfLs8p3aTq7fMx9hwTfMj8
	p/lZ10qovhD3k9fckjdeq++B48sggCqH7ZY0Yp70wTWncbD1UQDR8hSJGJIccbIvYlI6kAmNzB1wk
	WSwiabaR3hb79ojCJxue1TcM/3/GuY8y0gMLQn3j8j/5ZVrRAs8WbI0PtnRwSz3O5FeNpOuYMSPuA
	6jv6gbW8P60VQXVWLx7l17B/EWPG5Yk1nCZ9Nh8CMcWb8YXpum28KaEcPVGG9bA/iZpxPB3cvOGct
	Nl7RuQ7x024QIEUwKhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqRf-00000006cf1-3OCg;
	Tue, 24 Nov 2026 13:20:27 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqRP-00000006cbA-0LHY;
	Tue, 24 Nov 2026 13:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795526398; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LOwRIjs1wsFGb8Mjv9bwP1HYHL8EgTZVQvpp8eqhlM0lmJO4Jdhf/7v5VLvwqw9dx2+6oowjoGYmrrJ5CUzAKruAIrlEPg4NPlB+IOg+Y+CJKXMClD2IYefFVb1hmHwlNE+trjxhtzMsrEdil9bwNR0ZAK01pTBbzSYtf2FB7ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795526398; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xi9+n6mqjen7xK0aEroUXyIA3DFP060y5zPoLf1Eehc=; 
	b=EMF6+ukaUhVN3AnviAu9l8x7FxSTpD1QVsY/4+GXBHwDrgBboDynHpJz3qsGHLTyZJOaVwgFGTUrVxcFq7qBpD5PNsJVte5aGyk2nAN6KUCtehk1uf/MxYAwNr7F6rGf1P2Lnj+fbLTUS47wXzxMkQNQ6htT7+YaTswl4+8rOtY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AwVkoZL0pZ/5m6zosyq6PPf0lR13fLOzXsaev1rIOHGJKAgv0UvcrMxAgYBx3a0D35u90tvIadG36jusM1KqWrOny5eXuLiuxHDw4/wAHJaiU8PH+Kp//Gen/DsIjeEvMikB8KWvMaMHl7dl0dYkdqO8PrZp5iU5OgtQxzy21Mc=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Xi9+n6mqjen7xK0aEroUXyIA3DFP060y5zPoLf1Eehc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179552639643419.95007240456698;
	Tue, 24 Nov 2026 05:19:56 -0800 (PST)
Message-ID: <21937a4c-44ad-4511-b408-00a5607c9c24@collabora.com>
Date: Tue, 24 Nov 2026 14:19:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] media: verisilicon: AV1: Check reference frame
 index
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
 <20261120143135.71134-2-benjamin.gaignard@collabora.com>
 <9c7ee6cfa9f4923756ce6355ec20fa8ac916b9ff.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <9c7ee6cfa9f4923756ce6355ec20fa8ac916b9ff.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_052011_432817_C0902A6C 
X-CRM114-Status: GOOD (  16.14  )
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


Le 24/11/2026 à 04:29, Nicolas Dufresne a écrit :
> Le vendredi 20 novembre 2026 à 15:31 +0100, Benjamin Gaignard a écrit :
>> Make sure that reference frame index is valid before using it.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
>> ---
>>   .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> index 2a145433e6d1..5da59104a966 100644
>> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> @@ -121,7 +121,12 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
>>   	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
>>   	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
>>   	u64 timestamp;
>> -	int i, idx = frame->ref_frame_idx[ref];
>> +	int i, idx;
>> +
>> +	if (ref < 0 || ref >= V4L2_AV1_REFS_PER_FRAME)
>> +		return AV1_INVALID_IDX;
>> +
>> +	idx = frame->ref_frame_idx[ref];
>>   
>>   	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
>>   		return AV1_INVALID_IDX;
>> @@ -1262,6 +1267,10 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
>>   		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
>>   						 av1_dec->cdfs);
>>   	} else {
>> +		if (frame->primary_ref_frame < 0 ||
>> +		    frame->primary_ref_frame >= V4L2_AV1_REFS_PER_FRAME)
>> +			return;
> Just returning does not abort dec_run() and will lead to triggering the HW with
> partially initialized data. Either this should lead to some default cdf to be
> picked, or we add a return value and check it in dec_run().
>
> May I propose to validate these once once in prepare_run()?

I will do it when validating AV1 frame parameters in v4l2-ctrl-core.c

Regards,
Benjamin

>
>> +
>>   		rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
> Here, the index passed to get_cdfs() is not validated and will lead to out of
> band indexing inside that function..
>
>
>>   	}
>>   	rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);

