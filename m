Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC69606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cXMrGnIC;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nqsIHqY1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=; b=cXMrGnICwerH37
	zM4oWDEx+9Z49GgUr6ZI1XyXdgD0inRwEZNsfXCLWp48SAqbFNhNS24F4CU8oEan9O4i6tPuMRUSX
	+DLCzCflDkphcmoD6nNBth12F0pFrAXQ5oL05giw3+j7E0NAGVz61ewq6rPhZA4e+gm/s4xaMg66g
	tPJoxK4A6UY3Rw2ZlWC07ghW+jAK0g8sG14h4hfMVvC3rTpxGgavxaeJQYjkqx+jpk0mOxE8f2BRr
	ht+NUaYFKxxIudqCPZNlBecbwPTSiIFh/lR0+IUrR36b4Q8v91qq6QYh/MTAQSxFa2Rp0bqBy269S
	wuLX43lhrqhBACTo3YJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShlW-00000000VaR-3wTW;
	Sun, 15 Nov 2026 21:27:58 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShlS-00000000VYI-1lqc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:27:57 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67db8985419so264369d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 13:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778073; cv=none;
        d=google.com; s=arc-20260327;
        b=TpMSXm26B13/rXmTl8zPPLNbtuMgSDu1ZB0/UHJwkHfeiG9vkpDWKS8889BpAkGMRa
         XURUX65Y29RuDlrrQtpOYRgNRtCvReXuHOLBV9OjT5AZ/v39JNfjLXc/4EZYjn7/pgR+
         e3y9zd0RcAmWz+x2aMV2QTmHPYGOjEI9MwnShDaiNr8NhgbEJ6aMelXyE32BaDCDeSyu
         i6kK+VVGs1kUK/+I9K5LLyQp+MEAwp+LfOoi9LsAo5wXRXnh7rjv7IN+uGkwVTX1v8EA
         TN4wG4x9jqQsuWnnTT3H1VqbQk9P3osczI1okga0TkBZd61+7KXmm8/XBRZVkH8g9eza
         gBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        fh=y5aTUXOdZGCcSr4sb40YFH3wyOIOKxR0Y62C0s2EQ3s=;
        b=Q735WgrYrZ9RBMoUDkcxvfL6zHiq7c3z5nn+SZeLYrcR0OjBqGhCSq9FgDd0aeD1NU
         WibHEVjb8ybtL9PahbRodoSoeJD41OJ92g4yGox1Q9tCXH2jCzgRae1GQini9lNlf0Cd
         ASsTinn37iF9XPoArHR0WQssEbL8tNEY1qpk6fXXm6o2cl1heJguoR///NBUVmFgIVw1
         z2CmwkOfPWR/f6mDbmGfNlQVdJwBobkhoU8bgx4CKY/cDdUN0L0Yz3QnaUiIuBYYYe10
         EhXrEwpTL8XPj3MJvX/BgjBgKOMjZTVyf9xwtfYOpJbs1KA5vm2rJjOJaGtsAdKOheGj
         J9Pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778073; x=1795382873; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=nqsIHqY1KbBZfQIiB2k0xBZXNuQ5AHneZOuJ6yokaSKQYgotLschKuezG4likZm4AO
         7imH86T7GA6eo1gWP9uy4ugdAA44fdPAP84cT6e0AVpIHBKcC6xHgdUiEf5ixpytFHM/
         BPI/vrWXx385MeUI1gLykbyT5hjeptseoSIKmzYZB9h8eczol5ITlZYuVKxxHmVc8oc3
         vGE3rhyhpMowEmq8GGQV+gIqJg/rQioimQGGJo+34hDMX6cGQH7XiITpXLNxGKWyNSBJ
         IqWDDu/5WLOZtA/Vm0IBeOlBQ2Cieo9ZJPDiwhhZndtap4TUcm56jthUsuSJPgCX3F/v
         mP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778073; x=1795382873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=dCNhZkd+g23n7UZET1Wsz+iyIYLicgyFdw6PgU1lfDSHdNOpsX9lj4BRVy9p0p2I0B
         ALXUwMEz8NaTjRe/rdgePqrr0eb/glykA2t638AWdaE27ZwoEhiSP2Xc+wOLJyTx8MUw
         LlTg71rZk0efrMyrDpDY5l6ySIF5PIrDtpb/CeUlRWn6CEV63di//7E0IWRjRFOtP3w8
         aAI30sVAkqdUEOzBrAxr6ik2qSJ5ahuUyZpfdv7M2WNTfQ188r9+LKUVZHcas0Lff1vr
         s2H/asf1MyMS0gZ0rzJ393JmGIPklbRQOj4wZFXXUkH/nPhMa2RMBs8dmeUqRgupNjTw
         qujw==
X-Forwarded-Encrypted: i=1; AL+hErHYXZeay2mzYb7Una9UBFST1jLu+9QZ+nUtiOsu/v9cAhcT7xkgAlp3UzemEjIdEc35DnyPulHWKrk0J4UtCMtY@lists.infradead.org
X-Gm-Message-State: APuU4Z962g6ROKubZsSB2dYmKAiO1yc1MSB1ABc9Mof5RvWqCiIl+uP3
	HRt+wfpulwG7eytLKawD7H2OgaixuxD4J/KRPkVn9wE7n2G/LOHmvOR53LdnOpHJBfhZe08CKXX
	qXQxoQykCz63BMHko9iA79GPQhEVb6zE=
X-Gm-Gg: AZFdTZdA/IrSEtBA3Ci+5va9gjSujEKFNAEIqyUDDU6NvM7qse0i1FozVTKJ195gvpR
	FVyks90JSJuAbuajgc47rMCmxW/+JW8rzdrTbLAiCv5C85IJFwwpAvZpqVQciqVLzuhPvvbgO9J
	aTC5Zir6Gig4/ylkmwUogetiRZ+QYkiJkyFFZjCEKrtx8LvV+jIlJP0gzZu+EnziS5CcwC8KH1L
	c4vP8cfK/xpMYlS/3QK+wRu6aN95iSZT15P/ZoIxa4+j2Pf0tXMYQG73lB17lQxZQFALngYXAKo
	x/VvtS793mDmvXYxRd5wf+xD98alkZW/cX1hm5dw/3c7nteRlygc/MP4p98aUIpRf+aaYtc/Eju
	XFNObiDRQCUtC6lgwPZhbo4i16eoJBSiGX1N0dHTRfFFHTeggRDR6YwPVfK2MRCGY/hthzA==
X-Received: by 2002:a05:690e:130e:b0:67d:bcde:a150 with SMTP id
 956f58d0204a3-67dbcdea64amr71968d50.65.1794778073162; Sun, 15 Nov 2026
 13:27:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:27:41 +0100
X-Gm-Features: AclHuK-tHWEVaVNE_O7wlDFFBv_6XVrqFZ8dhMwLJs0OnAdbKC_ynIhtYeGD0qw
Message-ID: <CAFBinCC-R=apWQ7729NueJYSi9d_pn_z9ukyFL5qPMXe=VQqAw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
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
X-CRM114-CacheID: sfid-20261115_132754_485918_235F8BFE 
X-CRM114-Status: GOOD (  13.96  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimi=
ze
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

