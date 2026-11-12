Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7C8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VlWJv9Sn;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0XGdx+t+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=; b=VlWJv9Sn+42qMz
	K19k020biN8zUq2GFe7oK36w+jFlISfY7oeKouTYumvELM5VTTXB81zoGWZTVN0broNTyYwEMBh6q
	7NBlDCkPrGTZ4uHpnp1kZs7teNfaTmIZeJbvUHjadVsdQgbTJZ0UTqcWqKytz/1dRfxvTUS0vOePT
	pfYhAHsUqkpgrk2GcF9yXLB1Rz3e/UcHVlolwxzkvKr+lQC43Ck98SNAlhsCqEYKmFznSIbhPiNiE
	w8zwlGkjpVc3L8+RbjWhjp56qzXU9s3D166qdnELmND2MKLzMmJ1+PKqLGAChL1e1q/pFWUDEIYjB
	CLdWH48P+DiH8baLfLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdrU-0000000BE97-2OVS;
	Thu, 12 Nov 2026 23:05:44 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdrR-0000000BE8O-2zNf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:05:43 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-677af43eed4so324906d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524740; cv=none;
        d=google.com; s=arc-20260327;
        b=e56hvtV3KdUtQXz3F1OVuokGk4QXoIRqz8j8sC+QfRUs91fA2PhK3g2w8bktUl8/rl
         utFEq5USJ+0kdpI7ucnX0qUPncyoakLbSNDG3G8B8ft9bZD8DFE9yDo+NreJiWOhanc7
         j1p/clMm+YmAJrqOHiPsFEq648jfkv80AA8GXQsuk4wXFDeShj36Bg8jAGaa7xkIC5c+
         8Lx6nyft8Jik7mTlTmKiMyqbpVv8AHiLLBdzBbrf9X6twLGK30f3XUjxClwMN4J0bHO9
         sqH/a2z0tgkgVW3cMt3Ddjipx54pdQ2APeFBbYA2yOUSy9MMMj5tpAIuo5Qo3TS3tHAk
         6McA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        fh=MwGRXEx8C4cudIl7B/Z+HdaBWQ1VzgcZW6ucGqYLQyA=;
        b=H897xap2sU7jk7r8M2tUdJImfx3cqK7zLsWHOHSC9uzzG3TasljkaxWtJPGHCGGM4q
         fHkpvVDxxqF38B9QFYRY0KtgLp+Nx4bn10KrZeACgHjQgAwCo80Erfr2G+ODdQbJjK7Q
         +4nh3CSnfdb+URrGpVaVa2zalwUcV2OABGvTlNDdLL5cq3rVMOx3iqVm0X/2Tkk7T8tn
         /HMyWwJMTzUvvpSfa7mWLA4OR4FB+FIl4/wPpGsXYxqXl1bAD8YKoMD84ToKT4Nq4ldq
         Sd7kr6hjoGwCA6oaF/24BZ6ZujHEUoskcDj6LuHQc4gQ4J9+U+224uPMNQxXLjjh7ZFj
         O3qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524740; x=1795129540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=0XGdx+t+5PrWiml9QXk7mP04rDUHuOhn9QZvLJgcj9XvC20Pxx/OZ/s4AQksOjYBJf
         UQdpiQJzS7degLCvKE4dS3DsGwec3C69ZXl1SoA1iVxTMrJ8lkzYL8HvQ+ouqCcUzZv9
         DaqgGybBM0eOiRGk8NBFohSVoHxn/YMfu7m5md0yFncMq5segiwtH5R/vZBJawhEJhy5
         zL8rngHZ/P8DW2W9aMBL6jWyWOnkRB/r1ZFFUCMxTtQhdL4tnml5rWAZAPBWHNGDxSZ4
         rhK5nbSaumIPXNmXNw4YZQ3Y9BfIGhvRY4IAyZj384qEElBBbB93jRLLh+hXYfp7z4o7
         kKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524740; x=1795129540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=fGcthmSnqAS6eLy2+tld0rAlpB5/SD92l6+NqrPw5ilcjBN0tQcPMkwGJ8zqu/N6Tb
         ugfQgjERzpB9a+RwGYc2yQL+yIryOFn0WaSA8os1jX3QiUPigbQi+ZxTxSArVl800WOd
         r+J4oMx5Vlt/vRXH00C2jxWTfH3W9FXk0zOUvuhnpq4fPh0ejDHphdniTIJ8EvZ8VXiT
         WpOi+FRweAFD37ChLypsTRS31erfFQbV+8WK4HrpwdE3F+mrjtQgB5NI+RAS5Hi5aprH
         wnJTzprMxqhgxfnArVPgQDsbxeg/wPQBHJm76RyRm9lgowXW9YGegIaJPFB59/6wUbr0
         qkYw==
X-Forwarded-Encrypted: i=1; AL+hErHAV+BwaHjTZ/+oi484gDiwKUD0gkL/s0q7znGxurwcWnvEPcQv79T6Okbvr7gw6T0UIDnkyJnPzzWR0OiiFt1K@lists.infradead.org
X-Gm-Message-State: APuU4Z9F0V3k9Ql+p0JW5M7KkGmfoRsq8yu/HInsHO1ZpAvjGhEp67eQ
	KdYVOdz7QlUkrhJZknQyjJJjtUrfYIHjmF6MopUaKQhwFQV3D7FnU32ovv8On6Fo4flSXys2DFD
	YV06e7nIvIk6SInNUnHn+n/L83fCiEm4ocBXi
X-Gm-Gg: AYBFou0vNH2LQ5idSYX4pEVXMMMwHdpI/60ItZT+SEjeFSwtuaJTuBPDKsHFzeLXjJ4
	v/OnT6YtTmUAWRNtChOOedcVvmWz5xQKUk18Obupi5GXuQWeC1Oup6mVzTEsbCUj+JCyev85DRQ
	lI8LL0mSBP402QoVS+BbCWawnbQO7knefiMIJkQEPUtJ5ZmBClXx6LkSmuFJO/V4ORI43wQxTeJ
	0MCzTH+9cXHgbeCsqbimCzZsg6vXu/WQ32jdnAH3IpnLIhdw7bEzMWmEKjx3rXXUWwAOTAMVWqT
	MxfQLyN4Nwa1pMSx+kWeYmwhUBLDnNE8kbCRIS68Ayh+o+dH6A8kEvhHQp2kRCPlFI+JElOJuP7
	rYGYGKpTviQcW9CoOWDaQv1uafxc1L0lghW0XsJp/uU+U7kSKDdqXv2+VNrJ5pVCWfR5/FA==
X-Received: by 2002:a05:690e:4506:10b0:67c:1aa:2030 with SMTP id
 956f58d0204a3-67d897be561mr407000d50.67.1794524740366; Thu, 12 Nov 2026
 15:05:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
In-Reply-To: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:05:29 +0100
X-Gm-Features: AclHuK_8bTUR51TRXYpLvWTsaJ7E1LH3kcGSVltDcpyem9ID-KxpWLn-7OZxH4w
Message-ID: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_150541_763844_413DAC52 
X-CRM114-Status: GOOD (  11.27  )
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

On Wed, Nov 11, 2026 at 11:09=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_comp=
onent *component,
>         struct aiu_fifo *fifo =3D snd_soc_dai_dma_data_get_playback(dai);
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         unsigned int addr;
> +       int ret;
>
> -       addr =3D snd_soc_component_read(component, fifo->mem_offset + AIU=
_MEM_RD);
> +       ret =3D regmap_read(component->regmap, fifo->mem_offset + AIU_MEM=
_RD, &addr);
> +       if (ret < 0)
> +               return snd_soc_ret(component->dev, ret, "Failed to read F=
IFO pointer");
As far as I understand:
- snd_pcm_uframes_t is "unsigned long"
- snd_soc_ret() returns a (signed) int

Doesn't that lead to a signed to unsigned conversion error (highest
bit set -> large value)?

axg-fifo simply discards regmap_read's return value.
That seems odd at first, but knowing that its regmap is MMIO backed
(same as for AIU) means there can't ever be any error.


Best regards,
Martin

