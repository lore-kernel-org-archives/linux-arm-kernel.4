Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D6B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aO8+/aV5;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TvYMImfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=; b=aO8+/aV5v/g21D
	gKuf0h4xUzztCq0dpNBRAr8Cc2f09h/8gy2HEl7eu/rQ+R4ekUKIwMKPk2ssITDQhbxOPlkm/gJyR
	ODaaih6yut3Ijz6gug2JG5dVZFUxNAYTsLjBYyktzAk75vbanUgSHgTte40lKGit5Z0bLaOoUgmE7
	FZxNpi9lnkdf9OhNqmAkHGdRWasPFB5uek2LNm+/uu25ptgIhweHFaY1c7RLPwh2AMUGykVLEtjQP
	v4JEZOdpaG4pFls9+bbm27HgBZA+t3Yrbm9PkYBXYEJqSrgykq6dwp0fIFGTOiaZj2aVIJvonsoka
	H+xEOaGu3Y7o29JMyhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShTx-00000000Tp1-0983;
	Sun, 15 Nov 2026 21:09:49 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShTt-00000000To5-2Uel
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:09:47 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67db89857abso239461d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 13:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776984; cv=none;
        d=google.com; s=arc-20260327;
        b=j+CctY0L3CRm+zuKHD2qShLFt1KtZrenHSNtDqvghUBF7xPn5eNNsVEpKzJf/H//Qx
         pxC8x9wc0KFRoajN8Ew1c7xmlE/TsDIdJBRUWRc7G/aEf8wc3yTksh2ZuaB8tZpMmEcD
         wpeeFKRVJQOQ9u5ILFU3FUcHUYvfdIsvW12iA1F9kIR299JfJbWJW0cm06iJN0yF4t8u
         U6JfrRh67AF5S7i8ma2u/LMvTTarp2EWl01i5ihSC498yJWPCSHp2gUb2EwshzIJ/ajz
         8/PgSfpXLHO2qvDg/hXDbNkyuSLLScusL+rkD5VfJX/aaXTS75GGY4uDuSkehnTLrdcf
         qgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        fh=2WaHDWTBa+c9mksw47CmGo+coNzRIyIjrU2kPaWgMBg=;
        b=APiWqd8OfMpx6+6QbMY4KfPkh7g6cLIlL7VvaCpbI7f5ewNi26mPXxRxyKSGNQ4cQM
         zo0VEgNn80Pg1Dk5KDSqdQYBfRcWOQbo+2I3rJcIaaDyOnOA+1RvFgheUqcLm14ZYsGX
         fRTVagggxlW8eK0SOqvmnam07z3xmSESLuL2UovX20di9QIxyrX9TGhrTeN7J+m63GGJ
         t2bYOXS8rJwvpfUMavUM6mfzhbqbJH04frB71S7fBQf3gqpe0WUCc2p1tEbt1wN6jr/d
         0vyoaqtu++00iXhEnJ+Zqy+mG591XWiXIUmJghdfAIa6Y+uJPfX/hkNKBS9hFCz4uhN2
         PB8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776984; x=1795381784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=TvYMImfu8QIzopaLY/MQ6iopWvDZ9IdYLKz2FSRfL/ZC21G68O8hrVsKRCw1ZJVyA+
         xSYIJlQnpyYl2Yh5OYxFtuST2EEXm9avttyJ/xVUY6mVJxrfWnXygMs9cVGbD2+D5gKL
         GNeGOe4cam4NQl6g5rDNHV17jUtzbicDsBRjoN6NBhpxXVn+05sMeA6fzJxORuHyczRk
         yJsPDzx73mN/RAlaPA2q1t1T+AGsn7QZsE6t4J4PE4jl4bjTR13c/h0lroVxIeSpQ8yD
         jkG247RJkI7W2J1fG2gQ/WZS0QHnk+c5rQR+qZHb1o2ZFzmECQiWqS/OrovXYhEuwqrO
         ow1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776984; x=1795381784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=tk0VWhgU7kSYFIYUy3PNA846AwgzxtINIW9JsS0S6IV13ywL1+IQwOTGg3+T+keMo7
         uJEwpevdvwDawrTI9KqaSPQVfMrjKYku/x9r7Aela10KKew0vhd4l9DeE/naUEU8oNrr
         mVJnNr3zMj0sFvSuENEAj08ER5xMH/P86BOeHQcACUSjxtrLXjBcGDVZqumepz1AoaWl
         zm4mH3ObHH5u+nsXwKScqP8BNfP2TnTetKgXB1Sd0vDo8kg1WubXK4GUmD4tL6WzcdMB
         OPc3nLadxgRCFeVO1Cik2PP21lvbpjO4+AI2KQQt2UQ2XSzLgw06WaFmuKSwRFuCROa7
         7B1A==
X-Forwarded-Encrypted: i=1; AL+hErGBR2GTxr+fdZPUWcmMGxRXTxJioO7IZmkxVucLgZuy24L24d8cs1ojV7f8Nat4qolDzEPg5eY1Fp8xy0pxjzXJ@lists.infradead.org
X-Gm-Message-State: APuU4Z8Pjb7Y0Ruqquoq6BfzPbP0zQAuPIqub2/U3B78mQ40j/RBftWH
	PP3cOcb4OGQoeRxpvO401wZztyBHwp19igHzeLA6FS8nscnqs25lP/CySuzYnk9J1GlggBXSqXy
	7dYzyoplJxAp7uYK4resgf3UYzPkJOK4=
X-Gm-Gg: AYBFou1egmDcIbSVABDs5Ptc6qaU6gvhyUyxRc18QpF1cLS8KIq2pN0DmuaT5FgE+As
	UE1+5kOwzE5IYwYGUO3Q3O9svYU1kRwyENjSrzFCHZS5d3hScEMFCyKxWqbEN5RQ2NBJ2IS9MYi
	stia3LilzufGoKAhYy/y8ZLD1X6ibLm552+EX030wGL3St3a1dK3yEuWSUlwyUPlWEjfWa9J1V2
	9Gra7ONSMJ90OfJwDwuoJLz0NyYyqpFdsvSpwvY4WMMH0bLwR43qZ1VdE6L4fkwu6IEQvxDiZjM
	DJXNK6AnB7zo6vjhwhGfoJHyjdSXwp0JQsL9xKadmM0o46YJ7xhnHFPJE0mw4sB8YDAA+RIotfB
	k7yyWiTaUBk11NcK/0mNEmzHh41ETI4UCEmxtnPU0rm/MynbVcqDR25mt5PFKXOqYK0n2tw==
X-Received: by 2002:a53:ac9a:0:b0:67c:cd5:f5aa with SMTP id
 956f58d0204a3-67d89731e46mr4496105d50.122.1794776984233; Sun, 15 Nov 2026
 13:09:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:09:33 +0100
X-Gm-Features: AclHuK_ZuEq6J89mo54PdzP1OnTq4mPljqW6aT-mLz76EZXNOrQC8XCfvE0QC_0
Message-ID: <CAFBinCDB93uLnY9V-tLt4n77Oh5keji=rwA-VNbHm6V8rkYkJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
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
X-CRM114-CacheID: sfid-20261115_130945_664489_0EE4340F 
X-CRM114-Status: GOOD (  16.49  )
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
> A recent Sashiko review [1] on this code revealed the following problem:
>
>   If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
>   and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
>   snd_soc_dai_active(dai) remains 2. This skips disabling the clock
>   divider.
>   When the streams are subsequently closed, the ALSA core skips invoking
>   hw_free again because the state was already changed to
>   SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
>   enabled, potentially draining battery or blocking system suspend.
>
> This commit resolves this problem by using the 'clk_enabled' field of
> 'struct gx_stream'. In particular when 'hw_free()' is called on a stream
> the code check what is the status of the other stream and then only if
> both are off the clock divider is disabled.
>
> [1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.=
org/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

