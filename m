Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885F606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYluWbqe;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=f6eHaqsz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=; b=rYluWbqet2YXPJ
	Pm60xE/Wmz1SlcGIJBglikzFp+CtUWXwG9ZF6i57eh0duvOU2JugIFDVRCtZv2gAoA/5+dAmy3ie7
	JlCHK7o9/xAJYNRlp0UCm+wDoz6ljDnQLorgzeUj/ScDf6ogLN6Y1PMdoaCDPDIfzwgw20UOXN7dO
	vOWUJzsTQ59W/Fy9Osaa+Qr7ZDnEsYSVeKEOZ10JgcZrQtUV5R6BIbJWWH0E4EBPN6hMUs3T0bsol
	JpSJB0Se59rta8yvr7yZYjvAH6EyK15AwvDM80wwyKrnsFl8YjfDtPeLUY3k1kiE0ynGtGdQlCq8N
	sehIDcaYlovCdC1LRzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA1C-0000000Geia-45vy;
	Sun, 08 Nov 2026 21:01:39 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA19-0000000Gehe-3wA8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:01:38 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-677d35fd1d2so304315d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794171694; cv=none;
        d=google.com; s=arc-20260327;
        b=lKDCJsmrMUvTJqV5F0iaa5MRwgdVi4sxiLya4/IWgyvIeAmqXf3X0AQINDE6RQFVdW
         jitXGeqW7AOxb0vJYQ8qpIHEzUpyBK7tZFb9Y9DRqAD6i9pjt5MArHLmsbLTFOx/HSCk
         VWyHVm7Rq2XO1zIR6kB2Mc9uXjXA5lnGmPsKp+CqOHcRbAHpmemHDF3GabuvimplwJnI
         ABiOsDJ5c92MijPfwntkucmnn3/dequhOQpVMP61Uhyib8BVaduapCGaae6NDN5gGXVu
         NQbyoddQ3g4Cyfx93PzNfCL6gQ5MnynD0uppkHQJxZAPNQDStblcLiR41U4Uv0rrV+3H
         lY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        fh=uIwcHxmiKkdmwcfZ90qOK5N+p2etKKxE9osZWdOFVgo=;
        b=GC6sagk403mvHryCvuFZqyOUw3QgoNDEOEYSJ6RrzGrwsM7vAFs5QnvSYQfWK2t4JO
         fQzokgBi9zF+OGXnOuLJBtbga1bY16PPBT/eqBH2JTWp89JL1KX24uYpSh4xSC2VgZT9
         zKcjAyR4RkVTsP9qPbzIjKfoGdFMkhb1igImNeOzMHhf5Lx1gEvFlu7mjFhzYvlZSkjT
         nMdu8lOF6hsVxYr0scclesHM2V8wEznqRmo/cOAOny7C9pcFImi6kKMSoteigQvQujoi
         PnWAYTaJh+o4YZNyx+n1dDw9cb1fTxCaRcRjuH/G30e/inna5zQR5NVU4nACMcilwFMn
         oVPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794171694; x=1794776494; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=f6eHaqsz54DsVZmholH2Xld6xtX+eIVjU/9KxUR2ifhO2vIDp30xXM73LT7mK8k9/n
         VxPtZU4IGugSaRvpCGgEn7sjziPh01TvGgekNvHr7Zq3cfYw7+rDwtCuamUfo5BKDM3J
         KefUFRfYzL3laRiWwA2TyWg4JtwmrkAyrXpXOrRHUvU2iH2sXL+Xq0w9t9r4dcxkFzK0
         +SBfAVZuhMlPXXyLpe0qO2r3Za6BvWgNVl+c14/VMPIWh7RWPyFjZ7IJiNTVvKLoV/ZF
         msSwwcBbuuNLts+a5X13aOG0tGlcQJTrA5SioBWQkvku7qdD1la+PfLaR5oxnQbwQoK7
         tU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171694; x=1794776494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=quSNplLiZFz87epPHwf44HRGVj9kW2+Bwi7WbKU6ern4NbBJyf2zMd6gA6id+j+qxw
         pHaFxzTzNXkbJBxbsY+i+W7ncM1PH+5x7/RxttGMIUAuHJy2fvxK903Q2hLH5y/acRPX
         Dt7GU/5MdRdG66Yjfm5QtrGarB5JBNc7m4inaF9rth/HjXlUnj+wKh52Dyjqz+t5CM+o
         LBKlzXxqi9FPGfrM8FFNwrYYfPVxYRhWmszxBalcaBQWelSDreQHhyzrpHw/IHTxP0+n
         OG2CieoH+sFbf7rlEV19oSe8LpPHWsjUVj8oK4SdAIG0eqpfBRpW9s3s76kC55HNUxGt
         Hauw==
X-Forwarded-Encrypted: i=1; AL+hErFDvDDkyyhCU3r5HS8vW4g09udQKPZRbPKOheDvdEt+Q6JrAUUF/Kj2vqnKgWi4Z8d2MvmOyqZXE+E1fQiaO8fv@lists.infradead.org
X-Gm-Message-State: APuU4Z/FkXwS6YZ6Ic0uonFJEH+heUb1hE2cmI6+qLFX4PoURifXW76R
	vm4N2PF04lRG1nJJtnVZn6YylCz8N46aOASJQrztA+5/sKjz3kxRBOxLL0yzhUhAxyrczNBLhqv
	3SYsZYa7vfEOFQXyt1xw1c09I6mxQ3kU=
X-Gm-Gg: AYBFou2WXWSJQTk6WOlHWc7zpq8oun+tWqNC2TFtUsJ4t74hG7eniBfxXTVwdNzljU4
	v863AZs+01xW+WLzVI0deRsTevRfgT09TfxhZhypLN8sWUUaGoZlcjcHYj+dlGqNi5AZ+1g/cXW
	53UW1+Y4TOCx8Bf4ieEDtNLvVKnArNnvMIuLXXcPtI9qC2Gm85DBIVnixhNxIDYBtY5I/ls1K7A
	X6QRtOe3FgspsET9q8xzTRSlQg0LylRaq/odlfzCUik5q6rbwB9DglRHv9Nq1McS4QGm1xMWCgv
	UrnHUdK5aXVUGe18aRurKftjJCJM4vvn0Ml0zjpUHp+66OZrv2UHgB5JtRSxseop+O8y/LANlsZ
	9cowJeZFhQMQhB2lLhJS2/rCg4JTFIAPxAA1/7x1KmilxBXCorLaVRbBA0B+EWuPc75NmlDJGDV
	vSAF3Z59HYWxQdml4=
X-Received: by 2002:a05:690e:4386:b0:67a:3678:e323 with SMTP id
 956f58d0204a3-67c3d9d34aamr703099d50.38.1794171693858; Sun, 08 Nov 2026
 13:01:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
In-Reply-To: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:01:23 +0100
X-Gm-Features: AclHuK-YI1_ZLeM-O06Jf1zbjFaiV_faZLy9KmuFTZNRq2F63vw1avnq47JKnuI
Message-ID: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130136_006191_742BD0E5 
X-CRM114-Status: GOOD (  15.01  )
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

Hi Valerio,

On Wed, Oct 21, 2026 at 11:52=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> @@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *fo=
rmatter)
>         if (!ts)
>                 return;
>
> -       mutex_lock(&ts->lock);
> +       spin_lock_irq(&ts->lock);
>         list_del(&formatter->list);
> -       mutex_unlock(&ts->lock);
> +       spin_unlock_irq(&ts->lock);
>
>         gx_formatter_disable(formatter);
The documentation below states that ->ops->disable is called with the lock =
held.
gx_stream_stop() does call it with the locks held but
gx_formatter_detach here doesn't.

It doesn't seem to be problematic yet because aiu-formatter-i2s.c
doesn't register a ->disable callback.
Can you please still look into whether this is a problem?

Also for a future patch (not this bugfix anymore) it would be great to
have lockdep_assert_held validate that the lock has been taken (inside
->enable, ->disable and ->prepare).

[...]
>  struct gx_formatter_ops {
>         struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
> +       /*
> +        * Following functions are called with gx_stream->lock held and l=
ocal
> +        * IRQs disabled so they must not sleep.
> +        */
>         void (*enable)(struct regmap *map);
>         void (*disable)(struct regmap *map);
>         int (*prepare)(struct regmap *map,


Thank you and best regards,
Martin

