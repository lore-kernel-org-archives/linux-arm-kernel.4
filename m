Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD264606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wNhzELUa;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lyLpzFVY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=; b=wNhzELUaS5Tvtu
	cuvAktwGRQAv/QRGnjS7VCMKG9WughDjGFBZ3ui94g5WE5tWcDG0FP2jTw+2rCfq8XXPFjDqwwv2E
	J6iVhOFuNBuOFwjKyyRcGpCQPfETT+TfxPPxdzE64eowLZAwVRbSjNiDJ90i8Jwr8rOd+GL+1suJV
	Vf9vstAHByRHEmqqMc8H51yrMIoByR55rFTANVT5guwCauCa+9QKZs4BUQEHyK8fyH+mXrRJjf+Lc
	Zip8JHhppr/alquTo7ay8hfJ5/y0WTK7gdX8F9tBm8GeJkmjfMD34KM9KU64GtKaijhrtL/aRxktN
	iif3GphbCtxqNNV0cLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcFm-0000000DtW9-2FPK;
	Thu, 26 Nov 2026 16:23:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcFj-0000000DtVf-2mWe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:23:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so61807745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795710197; x=1796314997; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
        b=lyLpzFVY9x+xMuLIS1ksCokmzOZZ+P6t2DLl0mZGXxTHzZ/UeM1gqReN5gUsvkuXfX
         VgkWI3EIE1hwG2CZEOE22RALZJiqDtXhbXsXy8yI/6xKEwRb4v/4FCEtLFph8vzk9v/k
         42HwrZtedRMz6jUQErkTSo2BTc96KpcsQ35BIBa802EOIIiDBheZ/7x3Jml9cFczuubq
         luU0KKj/a9J5623FFiIgaIulvB5EWGOhhYyIbv8DcWAA3H+Q3G0HyzRpv1ZlwBlUU7ok
         ws9LJfygW7f2i4GTIHpLtN8EDcSkqNWRYBzOw/KuTtB7XUeS+w4ZHM3UgRim+QcGZEyB
         wgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710197; x=1796314997;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
        b=SDSGHwk2rz8p761ymt5U82RoJwwb0gVG3KwJKUYukaRbVDQ7lMeNsvRYfQAp7srfhc
         UdvzcVUvJff1cvrdkk5vdbNaM+Cac5xEEjpgWUEFLGQnYojzKDJwLZThqJOFxaGQx9RD
         q5MaKc2yPaJVrUdAWGYUWcU5j1wqybI7kYeTJbWu0wuPkju0jmQsk1QDm67S2T+Aha1T
         xGo7eDYM4cJO6rClNhXiwvqGnfFFEUcCg6eyy6Xb/9SZDf1i52a1HWjgVCMQJq16vdMY
         9cVfcA9S2mfv+54lV3QeIVHB7FdGW5evoHBV+r12AoTu2yYPjqYWkeRIUrGpETBFIRJg
         3z2A==
X-Forwarded-Encrypted: i=1; AL+hErE/FpSQg2NGayWKbw438iOf21Mkgl0r2VjEVmHSzSJVm9xhGaBFO1ONHbabn5foM03vr++gMGMItmc4FYZ69kju@lists.infradead.org
X-Gm-Message-State: APuU4Z8yzQwlLrtL9+tfVWr0pj+sBvLt3+59db8zgfVIdnS3DQMxwfVB
	9bvhoxGnK4ETnbzVe/9/lmx6T2YVK73gzewkuy/Yqmu6hXlGN3ajLiJywXj6a+jMsPc=
X-Gm-Gg: AZFdTZfS0GWLMQwPdQwA/6xX3xWr3o6+UX1zQZg2xAsrv8vAbcDBWg4o+cT6nJ7MPIM
	hIjTmR5F0PtdfF9kf9pr82bL55PzvkQCQs7ccY2IWG6DxIjT5SLNthutRYw+Cm3L+syFHCGN5fg
	JpXDqP8drieaxUx2wWjl8kpl7/f4G4T90PX1+D/kZd36q7MISqNj+cVTXgz1On+U0Lja/odyOQ/
	V47NCA5GZUB0aznsUZrk7wHRC2Q+7KRWeDPIhvp/B/rmE2L1/mn726/eI1oZT6At2PHbdgCwfJt
	ROx03w9E2oQPzgMyKD83Dj3pPc9obzyCJvHQsF85iz1nUmrm/n6/WacEmmQtP0gY7EaafIpCrFm
	sIlDdMN/SMIunfLdcEqRASQRRB3tGPDDUxDUHL1mExAdO32cMKbNau4aGeKIphLuSWQkptgKeFp
	sY+J7QZBwmDyUAEvgCzvuRmyARfeCk1+rgCKojo2iP+dUAKzwJynevHZ+vozy4HsotXnnnYWfGV
	0WfHA5IkRPpvoldC6fJDO5NXcch5tCR2N6Ys83YHxBMH363bc1BoMb5JdR0a11SEtux0IJEbGpv
	wSqM8uet+Ujmv1wyjQQJmIYZs+imBPS5pGNe9w1revabLaXfpl9T+5VlAXzbBM/sg17XWnkOOwH
	75CKTidwuBkejMbHEC7Q=
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr461737765e9.30.1795710197214;
        Thu, 26 Nov 2026 08:23:17 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm34026626f8f.35.2026.11.26.08.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:23:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 16:23:15 +0000
Message-Id: <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
X-Mailer: aerc 0.20.0
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
 <20261125193122.747908-2-tadilhusrev@gmail.com>
In-Reply-To: <20261125193122.747908-2-tadilhusrev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_082319_716410_BCC349CC 
X-CRM114-Status: GOOD (  16.92  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Adil,

On Wed Nov 25, 2026 at 7:31 PM GMT, Adil H=C3=BCsrev Tepe wrote:
> On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
>> This small series adds support for the ADC block found in the Samsung
>> Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-=
96
>> development board.
>
> I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
> with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
> and the board's three NTC channels.
> Readings match what I get with the vendor-style sequence (re-init around
> every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
> channels, the NTC channels follow the temperature, and 200 back-to-back
> reads per channel show no stale values. So initialising once at probe
> works fine here.
>
> One small thing: channels 8 and 9 always read 0. The downstream driver
> uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
> channels that don't exist.
>
> For patches 1-3:
> Tested-by: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

Thank you for the testing!

Regarding number of channels. The Exynos850 spec says that ADC has 10
channels and, looking at the registers, the ADC_CON2 register (offset 0x4)
lists 10 channels as acceptable ones.
ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0000
to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".

So, I tend to say it is fine to have it set to 10 if it doesn't trigger
any hw issues.

Best regards,
Alexey

