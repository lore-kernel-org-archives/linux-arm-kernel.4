Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EE3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5vgSYjd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BoP/szF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nkt2JQuYxF5BabtIplfQAWBZ1OpVC8q+QXSET0I4YtA=; b=M5vgSYjd764Vgh
	RqmfqxzBlRsxbmwD2JJxp7N35ofefpM2Z3CdPhxTr2oZJiLYKDQUcpvdChxkcjmG4/5KjUUsc41Rt
	YP8u/NLfztd2p6FhDMrgkPqlswfUpmM1uwj75g/2PdeXaB3BQ3zxjGTwU99+ZEk2nq4PLyD7RRWMU
	ZA9eG8K3kkDC4ddiOxmNhXgqXIQWJJZg2zUw77IE/QeBZKzAx1drd+htYLwAEQH22mcv1O+k5tOK5
	wi9nf2+Fa7yObhW7TcCAMstMV+ndVvTu9CR6jlx7Jd1cpxgPEPT0O8IM0H9763SqmPi3IIGpqIuWh
	r3rpAtNnxmcdrpf3fsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIIp-0000000GaNl-3yf1;
	Sat, 14 Nov 2026 18:16:39 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIIm-0000000GaMz-0TWX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 18:16:37 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-91e7af9a67fso13077286d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794680195; cv=none;
        d=google.com; s=arc-20260327;
        b=Q2Yn6hQkgLrFHsO7Z7M+E+501kX1zsqF0oEC0S4+r9vM0bHKt2cpM/viIfh+oQ1or3
         +bzKNhi3Kv8gYTfNjPEisdduY+tLnHHZqMHMMGNuvHjniD+xFH1YDFcx5uaY+ujdZcNC
         2lLaSTAY80gC1n1oZlH9GVMRS0TT6w4PF7CyUqPOcLWeHZU4BrqpTR4BxvMXnL7aQDrc
         hlJ6jYHRJQNsunhIa1KNwWIWTetTvMo9BXXb76v3tYFMaC9ZD/vb6qomjuwDSMhdiMUx
         LDcke1jhcE0efYuV9C7cJ+3w1k5AdRJtNeBT+kOiz+KDWTunrhvF8B90HbgnHmfyp4Db
         YFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkt2JQuYxF5BabtIplfQAWBZ1OpVC8q+QXSET0I4YtA=;
        fh=k5anh2pJru9LzHvCp9P7t2c8C9qvU4CTIbhED/4eXvA=;
        b=YRfoqbD8z2prhaVVNECeaY/MjGMKEn23EFVFQRFt1Jbfk6TjIVJTNaN09SGTI6cyeG
         W32xfMZqCnQUaVA52ebzN8HZ7KljDyX5W70i4orQYfUKCfzXyhRN6vXI+7DoKezhqhJF
         K5Y9eL00MBkjYY73tSr4gydYd64U1oaOG9j001PUglnNZHo88bMG/PGFZCo46nFEMVeK
         MlB5O3F6q4C/Pcxft3T1fIz42Xz9NezR3VrWsf9GxBFeMC8duorTVjoCrVR+oYLJYo32
         kJHalnV2Un3BTljL5gJmsqkI9KUoiPQ+5IDBL/QTyQO0MlA/H+9uLHlUih7h4Kn6gUIu
         Heng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794680195; x=1795284995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkt2JQuYxF5BabtIplfQAWBZ1OpVC8q+QXSET0I4YtA=;
        b=BoP/szF5G8KdkjaEIgeL7k2I0jjH0KFT/RRQdCGrQ+VPIjcnpPlBPtMdRu1DI/l/FF
         3kUYyYEl5I6GiH96ZeMRf2f+GE8fKhOd2EhXLS9sYbWdl5/QXBHo+EA5gcUkkHGuAaJk
         Rh29Rx3N6MqMNkXWv8gv8JnLmIW3SVsrjRiH1weXvx8PfoL3+rCIIGVufs0xP8YhZIKp
         sG0enG+SkfIwDv4OZKuboWkSq4dpaR6TUPllaAiQkciFZZu0WhTj4rnYmUXrQno7p7tt
         NMBz3ILoepm65KbAzBh9Lmmj1NEogWyZ+Fa7gT+sYOAWHGMxh4jDKz9M0bMj3kGlwBEB
         W+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680195; x=1795284995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkt2JQuYxF5BabtIplfQAWBZ1OpVC8q+QXSET0I4YtA=;
        b=cjr1LKgSOgoF5aZP7Mij90oWql/A9WowCO/Vdyzi7LNvYP0b1mH65Md+S1KEo+jd4V
         4KeqX1VCeTAwBK9T7AeTaxySP/Nbxlg0iEjzhD5w4hPk+8bGwNXatWU3oShlkLTYgtoX
         oDtrXF6KZV22xWPy9pS83K8PFKoRxzkyWi5OtbeEJ/8Xygk7VxxrQasii4WyZDMrUuWU
         pVGICdJZz+uL6UzhbfckzlVsFdZxMbEM2W1/VIv7oOS38P6CnShGSkCAXdDYMibP+f6h
         iDVXviS0VRrKsPQ8aQMFkBC8818xN4v9CTG9UR2NABTw2zIqHM8O32qSiiQ4Z092rh8B
         YpOg==
X-Forwarded-Encrypted: i=1; AL+hErF+qaDmmUVH+HHTaEun1aIZPbPGuwUdltYwTIxQmoob5RGQTzqOSNaranCORC4/AnGVMXZR4ULXdBt1hu4GO89b@lists.infradead.org
X-Gm-Message-State: APuU4Z/yJk+/6kTAUHLTYvwDPYiMp7CCYvlB2PJlPGZrAZGoSNp8KGKd
	r1l/Q06fqFInx9FxO6h7CK8RFykAMzHbw2JUXvmbo6aR1LbhND05C3Xqzyu0BnVVC8gwMBHR1/m
	u3Mf4gXNVgGs6vClxwRECfE0xAuZzv6s=
X-Gm-Gg: AYBFou3T/wXk2vu3ot18FZQiy+tk/t9UV9LPEAr/m7FiAMynMXAn/5RSyfechfeBOvg
	zKwOVuh3JkOxBTpTrArwjs2KqHY/NRqPNpafcbU0YQdayGFyi3AAALg1Gy9YqjEAbzxdvV4735G
	Y9Pgs63wzUmsUAZXh4ldiiEpShdbDKXShgQ98NaRp2aK2W9ifnhFz9q/hu2f8gETSGZ0G1gsMXq
	7fyuEHb9yixYXdjliVYmSYmTxEcJ470oBVT1lxSfFOAsZhyQG/P51aqR9of8AgD/hl1QLZe6ox5
	jwfJ4gpRsde8dW0u0OqtRjvivbXDJ5WAJGqtMEYYv+BqKTj5NYJd3saDb7kJ6GyZVfkzELrelAm
	ZmtlvkCff2f58r2fieNgf1utRxhoLUFPV6y25
X-Received: by 2002:a05:6214:1d01:b0:91e:cb87:e4a5 with SMTP id
 6a1803df08f44-91f2423ebc4mr97360156d6.38.1794680194690; Sat, 14 Nov 2026
 10:16:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114051011.275554-1-artem122novak@gmail.com> <132b7ffc-c1b7-4adb-ac66-6f40cc512048@gmx.net>
In-Reply-To: <132b7ffc-c1b7-4adb-ac66-6f40cc512048@gmx.net>
From: Artem Novak <artem122novak@gmail.com>
Date: Sat, 14 Nov 2026 12:16:23 -0600
X-Gm-Features: AclHuK9rIL5Lwdo0B9w7amHU_R88anVbZPxmDS9sLUS9DFnzhL9cg8dXPAbBPHU
Message-ID: <CAPufuhZLT2QM+i97zETYCVs2jRBT0enf+zo+CiiSoiVseOUnmg@mail.gmail.com>
Subject: Re: [PATCH] mmc: bcm2835: restore scatterlist after DMA setup failure
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Hemanth Selam <hemanth.selam@gmail.com>, John Garry <john.garry@linux.dev>, 
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_101636_197131_AD0C061C 
X-CRM114-Status: GOOD (  23.41  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Greetings.

Yes. If DMA setup fails, the request falls back to PIO with a
shortened scatterlist entry.
This can cause the PIO transfer to omit part of the data,
potentially resulting in corrupted or incomplete I/O.

I had a kernel panic while running my Raspberry Pi server,
which made me find this problem.

For trimmed_sg:
I kept trimmed_sg to explicitly track the scatterlist entry whose
length was modified.
original_len alone tells us the previous length, but not which entry to res=
tore.

Best regards,
Artem

On Sat, Nov 14, 2026 at 3:50=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Hi Aartem,
>
> Am 14.11.26 um 06:10 schrieb Artem Novak:
> > The DMA preparation path shortens the final scatterlist entry
> > to reserve space for FIFO drain words.
> >
> > If DMA mapping or descriptor preparation fails, the request
> > falls back to PIO, but the shortened scatterlist entry is left
> > unchanged. Restore its original length and clear drain_words
> > before returning to the fallback path.
> >
> > Fixes: 660fc733bd74 ("mmc: bcm2835: Add new driver for the sdhost contr=
oller.")
> > Signed-off-by: Artem Novak <artem122novak@gmail.com>
> are there real potential negative consequences? I'm asking because there
> is a fixes tag.
> > ---
> >   drivers/mmc/host/bcm2835.c | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> > index efd1903c3ccd..49a975e984df 100644
> > --- a/drivers/mmc/host/bcm2835.c
> > +++ b/drivers/mmc/host/bcm2835.c
> > @@ -449,6 +449,8 @@ static
> >   void bcm2835_prepare_dma(struct bcm2835_host *host, struct mmc_data *=
data)
> >   {
> >       int sg_len, dir_data, dir_slave;
> > +     struct scatterlist *trimmed_sg =3D NULL;
> > +     unsigned int original_len =3D 0;
> >       struct dma_async_tx_descriptor *desc =3D NULL;
> >       struct dma_chan *dma_chan;
> >
> > @@ -480,6 +482,8 @@ void bcm2835_prepare_dma(struct bcm2835_host *host,=
 struct mmc_data *data)
> >               for_each_sg(data->sg, sg, data->sg_len, i) {
> >                       if (sg_is_last(sg)) {
> >                               WARN_ON(sg->length < len);
> > +                             trimmed_sg =3D sg;
> > +                             original_len =3D sg->length;
> >                               sg->length -=3D len;
> >                               host->drain_page =3D sg_page(sg);
> >                               host->drain_offset =3D sg->offset + sg->l=
ength;
> > @@ -495,14 +499,21 @@ void bcm2835_prepare_dma(struct bcm2835_host *hos=
t, struct mmc_data *data)
> >                                    &host->dma_cfg_tx);
> >
> >       sg_len =3D dma_map_sg(host->dma_dev, data->sg, data->sg_len, dir_=
data);
> > -     if (!sg_len)
> > +     if (!sg_len) {
> > +             if (trimmed_sg)
> > +                     trimmed_sg->length =3D original_len;
>
> Maybe I missed something, but why do we need trimmed_sg? Can't we just
> check original_len instead?
>
> Best regards
>
> > +             host->drain_words =3D 0;
> >               return;
> > +     }
> >
> >       desc =3D dmaengine_prep_slave_sg(dma_chan, data->sg, sg_len, dir_=
slave,
> >                                      DMA_PREP_INTERRUPT | DMA_CTRL_ACK)=
;
> >
> >       if (!desc) {
> >               dma_unmap_sg(host->dma_dev, data->sg, data->sg_len, dir_d=
ata);
> > +             if (trimmed_sg)
> > +                     trimmed_sg->length =3D original_len;
> > +             host->drain_words =3D 0;
> >               return;
> >       }
> >

