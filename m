Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ZZGrlcX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9m7WiU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=; b=3ZZGrlcXIuC3rF
	1FNzyCOffOXbsxJliagoquGGA/1nwjWlUIurlhR+DGVQseRq/qu4dlgH4q8qCK5CoTWvKrkovGrE7
	4j7RUuWFHhGlJxAE/T3f++0/o5RD6POZZR1UZtDfqXQ/iF9m+tv0KnlApedX4jZjUvOzSVATas48A
	zLKC4SxwWvdj4zJ7dn4jTwSexy21wmLBvnkbUlaLUWivS9I1DOyD/OHk2gP3yH5Nm4Twk3rBRSyj3
	sl5TbuAnj52NmJcwEjS3rWOa3SW88QeyUEKn1jSZ3qITy38EbHEIJAF2uqxsqjbLzmt5vyVcatLGz
	titDyIse3b8zWOwpXCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIiL-0000000B9HM-2vzj;
	Wed, 25 Nov 2026 19:31:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIiI-0000000B9GS-2yys
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:31:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so7183144a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635088; x=1796239888; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
        b=s9m7WiU9efneFLIi8EPa7fm4p4dXqQM3S3Coxh2DiWCMWdHUFnmQEEabSRKShHhOcD
         j5CLRywSeD/9JoQFoAkMzbtBrSMXLefMsjwwFKjCQRswPkSeYIRdEYUo90tbP63MOSXb
         pjF8ZooBIlk7sip7q9GdCskUdQgZQA3bV+oVrjWppj9Kll2hwtUe8fJpwEbtd/tBlOsS
         XVvIbX4Xorph3XfOOQyR9YWYxm2DsZDD3/7XQSt3rEY9S0dGHLI5isI7tXjIqFZqFhXL
         GVsB/uCczVnHZtK3NmhFyd/iFh7Wd6FxO/wMhADnJ1p3y0EpOP0sPHCSykP2wphOSjLe
         PHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635088; x=1796239888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
        b=wQYQnZSXFHNUiBk3Oga740VU35uf44HbrLDRTjzDVnrPoyn70i+qnvjYO8Fx8Yp2ue
         BhGNRmy9iTfzQww8/tog7fRRbvoNyVHgH2ntfwqUkaOlZcsvOUrQ9otDhyzRRwyaeHE5
         Rd85vQNiAABVNPwS6Rx1OuBHXeF+m90oe8bT7zHNPQGLgnivAu+ZQ3BYIE7rA1Si97mM
         G9bbWUhWxI7XF/S2D1DzkNOCiEofvVEj/MR0nLBoZJ4C5eQ2TRo/zycAdhdqgHt8IQx9
         7yESC0sDFoRqt/ZodXTctS6R1Mx8Ok+GoJ0IQk4/0AuXNHJ1UnKxjJzsgDoI+6XoXk7k
         QYBw==
X-Forwarded-Encrypted: i=1; AL+hErF4w09oT6ZehNohE7nx3F5Ftc18oWYGTStSS5RwAzOQ5G4MDEXHuGZGXci5dj5jolvUahIcY2gy7OWxLcHsh1IK@lists.infradead.org
X-Gm-Message-State: APuU4Z/v7FMTy0FeNlETMuubrNMPbV8zEWU2XJ+w/FeBCpepR0uTVuU8
	DwvGJJ+vgkfAWxasL5AxKwGitagAMwL7JhBnD3SjEtP5Z59SW+qX0MNx
X-Gm-Gg: AZFdTZcHs/nNC4ShqYn6xP51GP6Utoej4W0zVfaUaTeJ+rZ9LfnWDHVvrupSZlKgbs9
	VNMEecpTGc66iocJ/0dnBRCzoof8wO9HzhFX0lwRXdfR5cTprN77j65rQu4Ww99fTDc2iy2tIth
	cEAfd/B9NYqqUsPtqV3ULBzzRp5AVBHKFmJIL3dgUMOJRRvFbLOFFk/CL/ic+jgkt04VxNkXOgU
	cWuxHwMu+ZlsrsULB6lFmRv/AssSXhLVSJLShKj0rHHm/vmbD178oznKxZjIwihe6u3WAFZ7YAu
	o9tcyw+3JqlSyAKzn4AlqdnkVzXdpR6J2L+JA6XuH+NFN/xTJmA0sQHL2Kfy26XYqhZKjJoaiGY
	sWccWdBAnFRFIYD0ULiGMrhvtwIq2gISQ2MdjaS4llWtkuMBIh0xyPwd4nckT5ZkXtXm04SWHVz
	VlCHcx7cF54JcEAWFYos/NrIvoD5fnKwpfCXMmO+xBMPyXuc+3FQpuJtZH6+w6w1HcFC2VJorFf
	nfqviDJtwi0ctqT8HUEttkB49CupJ7FgmJZO88M8s2toE573HNKB/8EUs5XI6J8vcNjux3/qNBP
	/rkRAWvuHWI9dvo11xmfCaexwCi4rHWjyEzvpBO6XTwbsp8=
X-Received: by 2002:a05:6402:1f4b:b0:6bb:1203:487e with SMTP id 4fb4d7f45d1cf-6bb12034b21mr4236672a12.6.1795635087911;
        Wed, 25 Nov 2026 11:31:27 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm8924419a12.28.2026.11.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:31:26 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Wed, 25 Nov 2026 22:31:23 +0300
Message-ID: <20261125193122.747908-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_113130_763218_1130650F 
X-CRM114-Status: GOOD (  13.54  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
> This small series adds support for the ADC block found in the Samsung
> Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
> development board.

I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
and the board's three NTC channels.
Readings match what I get with the vendor-style sequence (re-init around
every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
channels, the NTC channels follow the temperature, and 200 back-to-back
reads per channel show no stale values. So initialising once at probe
works fine here.

One small thing: channels 8 and 9 always read 0. The downstream driver
uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
channels that don't exist.

For patches 1-3:
Tested-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Adil

