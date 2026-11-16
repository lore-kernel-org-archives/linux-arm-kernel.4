Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=my+oKD5T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X5L0n67G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=; b=my+oKD5THioQq0
	YWr/dlXRP02aTi3meI9LTGguoDue7TcWuA/Of0ieDg5WfKF+2mtgvW54LtdtsPX7NGqWQBvAaCTYk
	SoB3/EOHW7tP4aKb+4zEva3bD3JJB9RsK5A6WDXpkX2ZUujE3ZPlgqzwbNB+qjFidjr71yrEP7QCA
	XFCjiao9Ob9lWvPqbTTeeptndUuAs7q6UdOLdBwRQpYomcaW4y9YCM7/moDpFobRkY/0MdRV0K+cv
	KkC/l24hyA0fZeDSjZIMbBx7jwAqLDSaluVT/aRx6sZWsGyV8H+JbNkSYJfK5nlhLCwj7vEaWhr+g
	9uDnHMLGkVhuXc39M84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpkA-00000001C8N-3gIR;
	Mon, 16 Nov 2026 05:59:06 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpjv-00000001C40-1xuL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 05:58:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso231747e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 21:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794808729; cv=none;
        d=google.com; s=arc-20260327;
        b=rqJlgQK1BndtQoHYH8q//1RbfBsbejJ6eMLcwWrSt887hxndSUzw6z1+i4BG+xdmx3
         sUdbK0vbiWu3OD1j6xMHfcyfQ1P67J69Qb2EgSHvfqAc8Lw1cVhdlIVVVEUdo3eCxPJt
         zp2HEMsRV1z5mjuqCZEZCR+EaSET4L28dflLKEO/6xoeIjO5TTM2PNmrf7fIBuRJOeDS
         yrI47JHuRgsvLe00xDVkEw8Df8tcwDBf9UUm9LCmxYjo51+Ytk8agKsMmU3QRQmjEzWw
         P1dqoXhEC/k/AKHWSgZAagfu9MJUzo5Fcksfiv3sHn+b82YjTdqXed0Hrk9Bs3+IsjsJ
         rJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        fh=z6SM/7LonVhH7XgTl7LdCVOiklg4GAkH4lQmaw3jRNY=;
        b=iiVpY9z+FtF4mv3ytEsYdLt+9Qu/a1/QRIenD42A85fvzUzuhVkz5CxGi2wEzmHfwl
         /HT3eMnjsNFnPryRH9RmMzhIoMGKY+c4TNOjtG/Obm8/Zc5Gx8WJ74mHfoQzyBskrDQN
         LQmJGTCESPGCVEFyfRW4ccqh5JiTkVrPd+X3rukVEatyAtar4Tfwuv7TO+lvdNA2nRYS
         OiRHfKhEFtU+uu3zkNtCpHuszm++QFqpfJSzrQjgkMXgbp7pYkrLvRwveKOtL435gS/6
         aSD32rpJUCPwftZRPznQ6gSBAfk1eDwA6EJhURDM9XYyu8y2UNBDzjw982ZC4VVtuvfd
         8TZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808729; x=1795413529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        b=X5L0n67GGbX8vvP34pEo353ravZfPqwiYjGMVEStF1natdH/f9lPF/G0gagFs/dxSq
         yXTK3VCYOy55P3TYSL+m5i1yo089w39xQezFQbzzPMEpPPxSdNqG32qJx8F0FI38HeDl
         3sTkfRQLh0GZQliC/lHwIApqtUr5v2n869FCms/xNYm4z7D1T3N2Hd2wLUkMm2V4GcGv
         x/+FM2AB8g2PXkQQoX+arW48xrXa+UFHc+gl6iRrL0ZIrGTS/ta0cIBf3FKvUZswbX5+
         +lGoxFFOpzDc6JpM8mC9QZmX9xU5jzc3C3lr90CbwzYCgSe3awgTNA6qodxBCrE3X17n
         OV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808729; x=1795413529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        b=heZVd0q/UgYrNYxQit7ZmoFV0KKeFtlm50I6nCTEfpmLicwq4fCLR3onO1YTZSXUTS
         cQer3Rb2MOoJ5ixHbP4jzTBwnre4UJ7U/gPgy48P7STcFqQsVMMXzVDOodcvx0HMYBf8
         ROKpyT6+PR0r3MGotoeq7zI8a9JZzP+lkXsKgUrLMdQKKkaWMYpHZKtiHPbF+3FL2M13
         AIVdkdKdHj28gKlNxz1kw3JHEo2YWaB8EygPF3osk78NiSaqCp2V4xhIZhSYLxyv9vR5
         ei2U0fOLUmJdCkD2DgqsfbagNnFOUz84e7825fMe6boAmNBhjR3Q1UWqAQnVhHQ/7Cbs
         ktMw==
X-Forwarded-Encrypted: i=1; AL+hErEdu7a0vUhhq+R6b9WUdXo6fHl4sYvigIsi9Perll3Na6ZTQs9tfp1T1P98671NcelBp8rCgbfHgyYsD3owh7LV@lists.infradead.org
X-Gm-Message-State: APuU4Z+CljaNLnJ7TYLH38Ctc1dEWBaDBKqBxUUrFADiQXxUdfYx6vY3
	rEPZXK9u9bxh7LexSjiwly0xZ7QPrtUFIhAcJjnpxkOpatRb+NUacTlFumasjKglpM5zYD0zH8H
	2A9p8mxhfQTEj1uoGFoka+Wr4XnZvEEw=
X-Gm-Gg: AYBFou3P/yttyBxrOdv5hqAJBY0/CMeTJabpwBxgBr5td/3aPreIeVAKHdKDRLRDRpP
	Nca1Gd7X7JcrrWSrZzH+fuqrtL8XShQvVJ4l33EkL7yJ1KlyHwCC+GT5O7WXbLaxMqAKoZjR/ck
	gjXTNaCEY7bygGELPnEtYGaOBsktKNr7WCVlEDuifAyZU1qT91YBp87rDHdQAQcZIoLarhl2ZHa
	GdH33r7Y4XP+WwchnKAt/Haapt086Ri6cHSyTfDZelQJ9X9fxYxgBns/Ocjl/Cmzq7pWlwfISbx
	LxPvREigViKABqH0HOLT1K5UIfkaTn9KUzwBIkO1huALANWT8GUgbo6acdHJkuDeXR939tcsc7R
	O6EGarYoZR8LYOEhxJoD22c9pPgyoq5S27QkRQkDwMbbd6hBKACvVDnLJj7hD4N434vj991I=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr3973537e87.0.1794808728737; Sun, 15 Nov 2026
 21:58:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com>
 <179461167656.590303.12402709871115244251.b4-review@b4> <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
In-Reply-To: <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 15 Nov 2026 21:58:37 -0800
X-Gm-Features: Aa3M54oyNaHJcBkKzqdmGmOePaHsPjod2sYjt6MjOSlPfYgCgkl8Fvj4W_J60DU
Message-ID: <CAEy9hNXFw1Fr81p=27vHR4HbNOA2ni4srU1RyP3W8wxoas6Ztw@mail.gmail.com>
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_215851_533651_611F0726 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This new compatible needs a corresponding DT binding update.

You were right and my earlier reply was wrong: the binding limits the
H616 to single-line bus widths, so a dual-read flash node fails the DT
check. v2 adds the binding change as patch 1.

Arun

On Fri, Nov 13, 2026 at 5:13=E2=80=AFPM Arun Iyengar <aiyengar1990@gmail.co=
m> wrote:
>
> > This new compatible needs a corresponding DT binding update.
>
> The binding already has it: allwinner,sun6i-a31-spi.yaml lists
> "allwinner,sun50i-h616-spi" with the "allwinner,sun8i-h3-spi" fallback,
> and sun50i-h616.dtsi uses that pair. The patch only makes the driver
> match the specific compatible before the fallback.
>
> I'll say so in the commit message if a v2 is needed.
>
> Arun

