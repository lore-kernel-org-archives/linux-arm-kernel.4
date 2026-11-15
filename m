Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB393606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qWQrWfex;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vG9O9wNl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=; b=qWQrWfex53ezhC
	oUG+BqUaekKJ2qtsCOKE07vzv+XavoncXj09InIUooLTo9GbMQDpGwVMuXhC1qWU5QWY3ZWpX1NuH
	BynUI1iHxfe5KztAoJ7GmKuRv1xrQprg/UFNgXP+TGHImj9AgwjqiGzsv5eYw2kJgdj0o7z1ZBZJk
	vjgZxwegQW6cMp2TQ+0h3wNE9EzCKDlFzI6Rtjy4jOTTAUTOkzL7GzpnSCny+QCcw4sNJoM4TAo7G
	EgHwcENfOm/BcjhjbsdBYKxhhbcBtRPmum6b8lMuN1AhTMStUcaRzCkJqizRRRJtDYYngIDTUXhhJ
	z5Q44iWl8HL2K745UKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShkm-00000000VLa-2GPE;
	Sun, 15 Nov 2026 21:27:12 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShkj-00000000VJa-1uCS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:27:11 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b0d126f631so24352157b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 13:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778028; cv=none;
        d=google.com; s=arc-20260327;
        b=TctrYjIYiwT2uob1KI17g28lnZZzCEJv4zDutzdZFeRHxS14kONDc9cbjru2EHr3VS
         3ln8DivdpswWw+ZL2nT1+Wx+bRIPjUWbLZJGFuM5D4cK4XCmMTf9tv9O/1RdN2iizfR9
         2C1pOopYpI++ztabCCM3/8qLzdoej5WSesFsLaDMs5J/4PYFNzom05nYzGHeHgwcxGZa
         hlDNuNA0rvhZCmJ5F8/jqtpRo8e7Fg8UcK7uv98QhkxYHyhZCN1qiQ/gvF5Ak2uo3GyK
         kr/ZwDdlA+81yp7FDg53ClyXllYGZeqiT1r6MsZV+uC6NkVhw5r1nz3Inu21pT/3hHZc
         wrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        fh=3vUVVBsmiartKHWqBTOaUx38bqoyjfcp9PafWpugOCU=;
        b=QCHqG3wZFZ8bR5UzbQbwC0Pzy1NCwomNjHBzI1v0kl+PDQdnaSzpyCfLWjL+zo2Ji5
         zLi0MdfaRC+RtbIVUMvjpQjccHBnwuwTDHh/HStTYClfBH3uP0A1tboXRUKcRQExRjKf
         JbE3JEsrJCUqJtV91aauXq48txx2OLmfhkdQvAMVlldqykeGCriFh7N2EniOLU06c3WV
         +uSuc2m7lfHn1tdgi7/t+G5l+Z8nzX5ZDGRUGXcx93+5e+KTO8HSF+q5PdKAEdsweYYK
         cpd6mFzJyoMUMT9L02EbUVmdGevrv8WfT9T+4uoFvAzUbsPLEaE1p60BDPRuiGhqD9ch
         nOvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778028; x=1795382828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=vG9O9wNlBKGQxUuLdAnelF856Wd++h3GweoOOxNzlwbvIHt2xTA9nf7hJPAWnOD0dE
         sUIOEZ7SsXgpZsgSfvOKl1KAN7ghde97RTshorCWM3qlC64TtZlS89nId1GqXUfGCtIZ
         z6fItn2jVkmQl1YMpFAJN+h+RW5+RT3gb0APye5/AZZXh4W1UkIPkTUJE2pbExKstE/t
         4soUODxeDJo/vh8o34qzBKBn+6j2/7VolsWiwGa+WqdvgyWjlGmCa5II1k51+8OD3mC1
         iBlYdTFuS0gDpQBzYmPZDBzQm59m4f4bpWqv3B8Y7Lk7d8zrgARpPcOw7rTysIxTPeC4
         e5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778028; x=1795382828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=BrVQKLYKnHo3xJChpQ4DPYkjLnw+FwpvLq0crcPWpCSlJ4uj/M8ZjDFi8LpUrLLbeN
         KqZEWhrV7d5kS7HBztAhQyguP4MwqsVKB9mNFv95KyCwItGw1/OD/35cckpDezmmmi/s
         VBJrtIifD3fC9hUMc1HAPNF77k9x3MjMaG3sV5AxL7iYpZVBwquFw/YX1lgM/IuT2Pbm
         gvwNG8uZQD5Pnq5rbZUqJ6gpA2aPG/McsufMZvk9qlbhKom9WzMFI0hswGroWcyOU9OM
         4OcdYLpW8TGrDeYAuU+x9eAlxZcyMOGSSf2QGojJTbYqISyx6n4qzxWunmdNJ+CXdLdK
         W0qA==
X-Forwarded-Encrypted: i=1; AL+hErHIxhkRkZDiph6eNZtMZFqwi4m/R8AnK2ZPPg6RGhnh7MUUAELEKIVvqT5RVu0Okd8H0OAKqHi7c5Om79Y9DzD+@lists.infradead.org
X-Gm-Message-State: APuU4Z/RcK6XonDqu1mMxMOZJzRF2R3HvnYUD34DIF6Ii2yUxX0cRYRv
	lP4gch8ofLND8XmRjK4cFy9P7jzadubAJ9Wt4Le5Z3RbO4XlyPcGeCV7+sgA9N75p2UOSMhiCbt
	MtrZ9YFMIsfnT1Nr97N0GbgN3DcJA8s8=
X-Gm-Gg: AZFdTZdnME56Dn3zWxWuiJNBwk6TUHrkgK+rCIxNm+v/gVSbwZJ/u3gwlMjqp3UMau4
	NJy7i9sc0tGJkWvV7KfuuExRDoW7aby3mIUdny5RAEk0W/mab4hUuYxeTg2n42Cx5eYTrWMVZ+p
	JIuJJGed0bGKHUBRomArgF2n5SY0er5qIC+qFNzMfrpdbngqNS2E8oJe8DLEFuT6+gtD1nAYXPN
	n2wJfMGCOKBRhNqspAdRO0/o6ewdg/hHfPSd+fo7RSF5MSfWbsr7b6iaZukJg0G+XEtm8TxYNrr
	lHlgVZpSVLatLEBsJhZcKVs8Fr+3Dgf72BP4vK4eAbOJFjSmm1DQRN/rQ76VSjOVpE4HvU6E2C6
	aJTx2Xp4zWINvJvL/M/3NUmNuklyjRggf+w1TSR/VQ0aZoxLSUlg9G16qux55WFdOigflaw==
X-Received: by 2002:a05:690c:6e85:b0:8b4:c2c4:bda1 with SMTP id
 00721157ae682-8b4c2c4c026mr25492897b3.67.1794778028118; Sun, 15 Nov 2026
 13:27:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:26:57 +0100
X-Gm-Features: AclHuK-_NZa3qMznm_nhucaqssqDCKZOwFULWjo8j1EdkFI26I-pZrQxJB4Pk5w
Message-ID: <CAFBinCC6C7QD2-eYhOR6FjQ+1a1sH6E0ioUMapFkTWe6626hfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_132709_501495_FCBAD0C7 
X-CRM114-Status: GOOD (  13.04  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> +static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
> +                                 struct snd_soc_dai *dai)
> +{
> +       struct audin_fifo_dai_data *data =3D snd_soc_dai_dma_data_get_cap=
ture(dai);
> +       struct snd_soc_component *component =3D dai->component;
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
> +       dma_addr_t dma_end =3D runtime->dma_addr + runtime->dma_bytes - A=
UDIN_FIFO_LANE_SIZE;
> +       unsigned int val;
> +
> +       data->last_pos =3D 0;
> +
> +       /*
> +        * Setup memory boundaries.
> +        * Note: DMA has a 32-bit mask, so it's OK to take lower 32 bits.
> +        */
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_START,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_PTR,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_END,
> +                               lower_32_bits(dma_end));
> +
> +       /* Load new addresses (both LOAD and UG are self-clearing). */
> +       val =3D AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL, val, val);
> +
> +       /* Reset (RST is self-clearing). */
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL,
> +                                     AUDIN_FIFO_CTRL_RST,
> +                                     AUDIN_FIFO_CTRL_RST);
not a problem but a hint in case you experienced some weirdness during test=
ing:
older vendor kernels have a different register write order and also do
a retry-reset dance when _PTR and _START don't match: [0]


[0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/sound/soc/aml/m8/aml_audio_hw.c#L348-L357

