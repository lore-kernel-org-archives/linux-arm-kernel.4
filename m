Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A07606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4EvvnZhs;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XysbLgkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=; b=4EvvnZhs/iKKi8
	KsaI46Q2F7FqIlnQ/KszpZ9/soh4hHSRMx13o0pQPpcUBRoKKRSCaWI2uhdwwygeU2sJYUYyGpptd
	d16kLYCiif5pXNitvI2tA+RUS1Rj0aX3p/AF1TDcSWPoi0Kn1OtDOAu9mZy6ZLoMwHZ6geCLYOA1j
	j241L0dX/zg1QVDeUly3+aQ1K7PflJWRsjYfahDOS14o3/V7/m8kOtwtmeiipN9Bbe0xo4GHhZmVw
	++5ZVj3py0E5hAjYMcgwKqysakttRkz/f/fBngQBRVsGD84kd2KNUBzscFApNREpcnATNLu1KQjMc
	ISEtBFgqJyINMZI1/cZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShP5-00000000TYw-1ZIw;
	Sun, 15 Nov 2026 21:04:47 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShP2-00000000TXx-3XIh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:04:46 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67db5e13b0cso304949d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 13:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776683; cv=none;
        d=google.com; s=arc-20260327;
        b=iB0xCnnYtG3jwPlZb9KU6doxar1Esf99EUowzVdPk6QpBdMAtVotaJG+iBjPnnDU98
         eJuD1CrYLXvFNkABCxd/VOFuybWB8m9F2IrS6kRU/sy6QK8OI92IosdKDooFQjUK1UOE
         l/xZi+4Sh4jhX7SjxMg2dpZCoZxDhUNUj6M/cEEQNDRqnOuQE6K1uycw0lKHZeTtp2au
         1/HWCwR1koG+OHMd6KwddxJLIIQ2JaT4roFLxIEjMFHUHZVWZZcC35XlHvopKhpkvb+L
         NAeVwn/qsCy8eCrLlPCBqKHPkaC8kBtn38yuN/IDkWPsbGi/0Bd45GCu7STA/rOVHmzE
         e3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        fh=N/Vmf8Ug1pZT6fi2fuL0J/xCT6yfdl/wqmfp7guEKnI=;
        b=GEgRJeVliuJdslcYmyCfmFRjyR50P0hugS6aafEN6ZO7ERCwlx5omYgIylxM8Q5vjA
         RiLnC55TWEern/QrP1vnAAkF5/ccsGmwVLQVFVdFxa4tK8BZhQWK6xugwu007L1zVlld
         TBMioo3qirobVxKVuMsPK+SgPMM+jX1x2G2XYY+c77j+bFMlVBS64+gKq7bCPX5Y/7MT
         HlhRJhWKs1RBOwhWGfzFfIef/rAG0Zd8rv6WgXXJu2sKEiQMCzfE9bFm25OYCbpvj1o7
         olw3ll8M6lVZ45kW+mw7bwxyosJosstyuQVk+VgfGGcdfLiVtWrGvYyyhSLXz6uXBsEp
         cNvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776683; x=1795381483; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=XysbLgkpzdRqhsIkUk72Ux092aL/o5gjo+QmD28f+eBdPiBuzzK7dnmfxnoVcZGdEV
         n+E3r0zcmbpQDQgfsDzG//xg9zFtaR0QpAy7GNKI0IX8t+WmkXBuHwRiVcnBGeh0BrIb
         5WiN+klAQsFZd/leFSbONrHtTe2AUehAx95hJ14qBvQbBG0bYobPg7DhroTzRujM+lpA
         cBdqN2YrF/m6ZpI/B4mOQ9wutjo9ucOIFNysuAyOy/564vpFMOQZg7WQE0gQU/JU0bUo
         r0ONElvp+lbV+CDgDLhN9gFIkwHzcwdeRsO00mx9hh7S8U5LFTmpwlPwZyQciWPuDiPG
         H/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776683; x=1795381483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=SuyNHRf9sf56+sswU8DplUy5T1o4dlvbbWFQT4aGlCSkyOEQ/vgVDZqRHsdWOKqEBB
         zxy+JJn0mWjpB4HsFohmKHxCQuusBre1+AC/9ncpSlPolycifR5Id1FFsoDikAKXXLaz
         0GTy6V8t8r/y4dqkXQ+wPHLCD7k5wf9vs8y52hVMb1ifcW+ew68YX20zarpeb69xqJ30
         z801dKgl6pB5A4DA+C9wXZuTI12V0V3X0qyCekeEU02DhhbuGUwLu2tIbUlg3knnd0Gi
         oPasWw9EmwPsLKDcaI5mm6ZB53hMROdVjkt2YYfjZND5N+7zqR7hf+eZso7iWy3f7XAb
         KFVg==
X-Forwarded-Encrypted: i=1; AL+hErFfEKtVkS/LkjMHsvhY1I/ZjlVESoGbdqc2gGmUn9FhIXtnCBWb63MK6LtNoa1MQDS5gZ5twRUMrnSRiGZF21Up@lists.infradead.org
X-Gm-Message-State: APuU4Z9xyHrFZTAucCgxkYDGp33QjOq2hDPxTy2qhF+b+Q771UZPf2dK
	kRhqpqg13e7ANfK2VHU1doKfOUaP9uYZ0ay4MWWxFFm0z5cGEjIFOcV0xBbqq1OUy81r6wEQuEO
	tNnZchCcK+mPqVRgOqnDzm27BqSkTy08=
X-Gm-Gg: AYBFou2y/h6a2ASLA3AZ6DiIuppDuG7lJEVqaGSkIeMaDcp5N3NgLYTz8swKL8KzYNt
	86g+zzyRrWuX24m5v2p/Aga8xWFh0px543BRhfyBmt4UAed57kxdjgnexYdEzPJoN2VJObKgVvN
	TBBb7CNRIModdlKB4l0vBEfYdWZHiozbQhWiffXhiYGuVnvTx6Bt5bOLaB2Njt5/JdSm54d9AkA
	VZyMMJ1EH9pPpht6KvNNSNI0ifdOiushOGQZc6TCtZ5GYr51h12WtwsE1M5OdiGla+y/9O31md4
	xvz6rTCNWpiw3TKGuoGUT6qjac3fun2o24EqqvymzWTa8tfEsk4Eqnpo5I07mFMKVJyiG0rsTnm
	SI/ClOOsC36U6cf8ngB6jqYOlzy9DITX5bfCedhtwCvwIz5FzGHocsuMLVOwLtfle2vJYKA==
X-Received: by 2002:a05:690e:479f:20b0:67c:2b34:31a5 with SMTP id
 956f58d0204a3-67d896aa73dmr2886678d50.56.1794776683083; Sun, 15 Nov 2026
 13:04:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:04:32 +0100
X-Gm-Features: AclHuK9HsBcphbKQs0k8LqAA9uRq4kzQTQJzZ3MTf8At638gba0WRnCC9ExoQzo
Message-ID: <CAFBinCDtqNQM=89mQ9uw7hr1CJVGo5fHNPJd=jAyDZ3+L3wCvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate module
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
X-CRM114-CacheID: sfid-20261115_130444_888333_1FF8195D 
X-CRM114-Status: GOOD (  10.53  )
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
> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

