Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDE6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CcNi4H1s;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n+mbt3hJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=; b=CcNi4H1sJtbnVH
	c3ZyeoYfNNgS1MeGGpMveM1NblIHN21YO0IoxTHiwzTtxg/M+TMHznGaf1wv4zxgXf5boaBQ1YY90
	cArd0qa/XvzwKfGHg1sQIbEuk75yOpMpN9cWeb4iOg9EdNob06ndCz8PGm2lkOMmnaQmqln9l/L3m
	qufZtZVnUgCVsjaWjufKXV8+n3nBVzlq+1v/rD0hRiy0SPnblNUDe9luvkLMpLmm7D7C7GSUdo8w8
	L50PP/RxU8pIutYrnwJ9IrPwWviUcML8turNWNWNp9sqXsQXnA2PEJJh7UhAUwU1QD1vz9q1skc8r
	wgP/BWze7SyAf+Dcg94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWomN-0000000Ez1I-1Atn;
	Fri, 27 Nov 2026 05:45:51 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWomL-0000000Ez0e-06wY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 05:45:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3705714b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 21:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795758348; x=1796363148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=n+mbt3hJTJZzuqdnad0ojPj4Et3xJVfIy8OuD29Jj8wghWVXiXa8PRDqKDTo/WtK9a
         JsxqedYlcWZE2Py7ZGkvn6+zwdp2yDECaj1HrPPdZhlvl1/aenY7NVF7gfw0EGgmipJL
         JkuZiLmMHZ2mybvIWz5yGy+WCDHocBUqG1ofQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758348; x=1796363148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=JQcLHC8tWlugmXzYkMbUb1pZnnoKD/GKC6yBzq6NoAdwO+bQzObUXGxLVtygQCsDo7
         AK3u5GLAQx1w67s6PO3qNO10Q6AUbs0gc2tyExwfrxkQpjVPBEJrU3ssntZpnluG5mam
         GVGRLbs6/vY0t8h9heNvSgjH8Okxylu5TtH55JsQAzBozGIuQIQUGRvmI2zQq1Ijq+nf
         Lt8hyB3crDF2I1ODptb41kCny1x7Ljr8mU2P2aoG1fuysQCSSTwkVjWgHXa/0tS63PsZ
         eAtE6IBYUb/vFKcAPRjaNe6HabnhZLw2uwxFI9usvQ6LHitigyB3ETSAphLMB85cQrU/
         MD0g==
X-Forwarded-Encrypted: i=1; AL+hErFEDRW8P3jKiqhNbD1TdyRcDLiJQzdzR+IZ/DCQWEjOcykwAx9hRLayUOSA6U2bS/G1UGtEqLUob7ri9SpsXjEA@lists.infradead.org
X-Gm-Message-State: APuU4Z+oveK8I1z6MPXwiqjSMZ1BWDUL3FynG+lPBYA1i4cmVAO0wMCQ
	UrC/JdllEfnPjogzroYpljgVwbKPUAj5fyP/+YyA60It6/I/BLs/eT36ObAJfBDwEPtTq1qEpr1
	dZDwtCg==
X-Gm-Gg: AZFdTZeEEqqo35JcwoVc3Nvqcw8vIBKcmq9vcgjJcuVuZp63svF+BxVkSoLtURZes01
	z+Bqqj657e6iJI6pKmRdehy6JjRaDmCPj5ICyphRIc25fbAhQCzMx/eh7fo0txW1P8e3OPZnmVc
	FfEB+oEtTLYSBdqF4QFmmL+I/M3fRnG1rRDRSgRLi4T5md05o9fy8pJXj3pQz+EVwwjY0d9br7D
	jdSqSeC2B13VLoFBRqsXndvgBpvstsrJXZ2i2FxjThJs6M/5uTD8WF/41cjOon4KS+jWByGwwfv
	U+A77On2dVkMxQfDlvllPSJz78Bg64Jjw1XLBJeGTSHEzvvQahHoYgDWrjJu1umM7TVp99l9SlZ
	QeiXQj1SZeLmXHNmNwOGEtd8VSiEefFJWDi27pDeDVVshJqHaOkbbG6jNNQLrlv2PIF3rNlJ+AY
	RVK4xFzleKxpoxTtqm4qgbP4eZ8FX8z71mRb1nfoadiodPhx7ZsyuCsVyFJ1uUBr2W7LaIHhCMK
	syVjdupQLiB4jGTah/9ZXHygdMU/4yD3n0F5GQcbERJe9oBpNbXC/sxQt2SUZz7S1fKWsVI72OV
	k30PSSEVvRG2Zj3TnCWZ8bY0JKdGgnP9QXXuO0D0R8g1Ur1mnLlzKWYtyczv9asTcnjbbjGzR18
	uDAKJxbrQ2E0+yw==
X-Received: by 2002:a17:90a:e7c6:b0:3b5:a3:4423 with SMTP id 98e67ed59e1d1-3b500a34682mr6503275a91.28.1795758347834;
        Thu, 26 Nov 2026 21:45:47 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm39171868a91.15.2026.11.26.21.45.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:45:47 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso16428492eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 21:45:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFWGrWPSPfbuKAg93OYzOXPtVzSfZt4Sc8U9Juj0BjcW/XGY+q5d6DidMRge8l8JHrYNZRzpZVAL7Hm/Le2LxPw@lists.infradead.org
X-Received: by 2002:a05:693c:87d2:10b0:386:b5a8:1c5b with SMTP id
 5a478bee46e88-386b5a82496mr13605222eec.18.1795758345905; Thu, 26 Nov 2026
 21:45:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023075642.3671805-1-fshao@chromium.org> <20261023075642.3671805-2-fshao@chromium.org>
 <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
In-Reply-To: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:45:07 +0800
X-Gmail-Original-Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
X-Gm-Features: Aa3M54qNDjQhU6gA65neybgLv3Xn13aUHMcLYLRb3RcSnItlV06t95c1GfEEZAc
Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214549_117892_FDFCEAF7 
X-CRM114-Status: GOOD (  25.26  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 3:17=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Fei,
>
> sorry for the delay, so many patches...

No problem at all. Appreciate your time and review!

>
> Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit :
> > mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> > If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> > mapping, the worker finishes the m2m job with the buffer still at the
> > head of the ready list. v4l2_m2m_job_finish() then schedules the same
> > job again, which fails the same way, so the decoder never makes
> > progress.
> >
> > Remove the buffer from the ready list so that the job is not scheduled
> > again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> > back. Print the error before that, as the buffer must not be touched
> > once it is returned.
> >
> > Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video=
 Decoder Driver")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c
> > index aa9bdee7a96c..a4cbb7c76998 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *wo=
rk)
> >       buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,=
 0);
> >       buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
> >       if (!buf.va) {
> > -             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> >               mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!",=
 ctx->id,
> >                                 src_buf->vb2_buf.index);
> > +             v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +             v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> > +             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>
> I did some research as all this felt very late and defensive. My conclusi=
on is
> that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_de=
c.c).
> This will let you remove this defensive check. Buffers that failed to map=
 (or
> unmappable/protected memory?) will simply not endup in the queue. It will=
 also
> give an immediate feedback to userspace.

Agreed. Early rejection, fewer manual checks and less code overall is
much better.
I sent v3 as a single patch:
https://lore.kernel.org/all/20261127-vcodec-null-va-v3-1-e24521086062@chrom=
ium.org/

Thanks,
Fei


>
> Nicolas
>
> >               return;
> >       }
> >       mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=
=3D%zx vb=3D%p",

