Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6C606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V78gN8IR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PewIO0Eg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOw+wygM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=; b=V78gN8IRa7P2NJMc40bi2cn+/e
	T0no2Y7pQmeARQ5JX/9oo6G2yO91pyaPPazMkY+Q781YioOXZlnSDmvC9Q5jUathTDhezoPlvWtWa
	q7PHbygkjuQCPr3ptsR/6mLO0WPI47WBVLj7QbBjQ2cjObv2VhGqes0V6y+c+0zFNWCvV5twmlfaL
	mo42xVtm5q//3X9fy2OxL43FJmnBs9ngG/Wqk+U2nqFj3s8uPirLvl8Lenxfz8vPk76zjSFdR/QGm
	MIVW3wVKOqHxbHM4ft4j9pO6vY8Uaw3YHElNz9Sz2dyRNAzJ1dtDDnIzZJvo9AZtJVaTSmRI5fv63
	fMViTR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxmn-0000000ENlc-0meP;
	Fri, 13 Nov 2026 20:22:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxml-0000000ENkp-0xd7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 20:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=; b=PewIO0EggX0biFdBIs7o5Fqgsx
	Ycckl6YnHT//AiMB27iKBfPmjh2TAY96A7vZ5FF2MALM4r4+YmcMgSB8SHPbL2EsKbsGTNakCsjFy
	D1P9TLfgl9y5UIJaGy8oIVPDxGro9ExvcY+/zELDdQvo9frJBLFGAtGnhHiky+GjCtINnRByDDudL
	ZU0RIcigXCzl9r/+F0Busmj94SbxVi1rYMzXgQBGHJbcUIsHHGHLWugj8ldZPEFMpjjotzi8EFoaL
	npporxqTJaolj99FAPJYaBvqbRHx7gtMrrweweCWZRgcJ+IhowJkLMSlIjFTyn9rfTL7mlFdKGNGG
	+Dzyk/IQ==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxmi-0000000BnYA-0kDJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:22:10 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3ae3b5b1027so243001fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:22:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601325; cv=none;
        d=google.com; s=arc-20260327;
        b=gPadcoSSDFVmZUzXN3QzA6j/JKcxlUT9/I1VcX5GlmCLP3D1wpCTjvHPvbASRPr5la
         S2LwtkJs+yHj7WDlCs9HOjcTnXSn54Ff8DYCdJio12z/ecsKP4h52hCuHFQOtJQmODiw
         P/sp2BJXlf6Ylt41Vakk8iEqpgaYIR6HZOOQfzOqwZvva7degwOLPBZAscCeIcXwZ7b0
         PHFLYEL88ufmF6KrXbjUpyELrmhHQmeLgVq7rwkKGvhpwCzgxbuQzKWKXCQif41S97s5
         tVtGnllJoHunf59kyltmu7r4oYyqSsTNGHoQ1XomokW3ulQSvl/lRY1PWFodAFHFEiV3
         HvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        fh=/FgbJgjtyitYFCTeLJlMYdZBjYgHSVPcoGLL+wRpZMA=;
        b=WfoF0B8r1EV/3WSLMj/OEbYYY0a4wzQm0kPXZd2feX7G5g+lPkMRoS4PpL5+W5WDaM
         VultaeScRlnHr7jNPI3pGTXk9U1Pl71onMelWX2+ZzcvU1HD7scrPexG8eFfhyTmaImR
         j+1jI9UUwidwa4v919lgozLqm9B/Ayptx70evhuvLkNO5HwZOzde5++rzj6giwzbSdS8
         7fNdshjNQVw4Ri/TRoqYOsmQOwlGa6+3rkV2Rt5860SIW06rX5sQxrDJ+1ngICm4BNRa
         MSaL9AFvqlv9rF1natqmCjIRGjQb5jkDAqGjxeJoo8bFzb8hNaPOqCkVvSKu8WdDf6QA
         ZFeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601325; x=1795206125; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=fOw+wygMkVmZMWAl7BBWqgRhKjaN3uPtCLuUVxIkFYNVRlF+PcBfW9llYNeWEnkGz+
         VTrfZs6BmUOF7wmqjrctDDVkqjOcwMFD/8LOcecgiP+u0M6Ms8OD30jkoKTivqUv0qaZ
         y4Z3VTOrL0fIS3q9QVUkZ13KHa/s6gg93hApYFWYzjly68M1EUds4Lopm0BWaqyNCz2R
         guFeiRV/MZqWgDGEQTBCuqIwCuAVFxPuxk+rtwaGwbyOK5wXwsittfQSMiOkQ0YhAw/h
         ygQ8p8Af+oDatyw1PP34xRxS9WGlRJyemBwbb4REXi1MnR0062czOYUQgd7bsEyLwlc+
         85JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601325; x=1795206125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=Xgdo3HBnVMBUM1bsLhb5mi3y36g7ViKa2TNP4/UuksjOlgK6WK/Y3iPCEn+3YoDvUR
         55soI1QIGn+3ew640ygL+xfPXt1+pX//5ZVEMM/uXKfEJXZHwj6NndUeilzeAEMLQgqo
         cAsq8/+HpGgUNbvQd+S8wQuZfe7D4cMUWnprHOJqBq9lbd93uBvgaVYiDcySSEtdlsvh
         oua2YvW/smqbEb8AwQdiofJ0di3aDPA2xMCO5B8YureLcXE821Vb2SfjLYjwQ6pj7ncR
         u5K+s6KlklxcKxZmGq3kYWi2JfnEckxNEexxOov62DbpRmAkIfVGh5/2v965Na5D5+4a
         /sIQ==
X-Forwarded-Encrypted: i=1; AL+hErEnmsc6ZeJhlaTQ3DMSqrmgEPmh1Ma/yhLlMakHKMxKh9QuGw9aMwCkiF5EFNqce10GfDcOj9DQVbpI4bGbLPPs@lists.infradead.org
X-Gm-Message-State: APuU4Z95q5GeAo1IdMHFruJwsF6/RfGcNXcItSxFZs1BXhfVEdc9M/rp
	aEHy0mXn/vzQWcFOtjZ76Px4bf3R96G3XKGRHKbik9EPe0oHKitBka0Nwyb0ST2Saa7nnhlDkEz
	yzXJ09dOvCLJ3nqH6PdwCLeI4u6FYMbQ=
X-Gm-Gg: AYBFou2+fcBOqbmKhpFoLaIEqppXgRll9mA74f1oJoJ7wKr0gyMdfnteRDVe1S54a1E
	cIk97XAWWQzEWsZLziPE+VrBzltGqLlCmXM7VqurVD3HKzd0juALp8PRqZzInwZfdQvynDC3bxN
	CGjQW+OJyPyzz0FTAHiRTdUfEEgz7/PpLkf16tDP9LR9s+Vrh3vCh76SdZsZvc/f6US3gLewJb1
	n7kEt2qOcgXPO3gwcCCciATdw+O4JgGQqmPeEb7/PAn1tCyOBI7zeymmZq6VSpYO4Pqt0ew8PoQ
	mN4XPKa6QHthuZaTkcd4eYOPpwzwXxJ6gWoAqummvI1liBcOFyfLvaHCrGcjN3Uj4uLpMZy2Rfr
	Gph+x2dbVB4aznYoXYxp7mKaXdqAJ8r/laFXIJvLimW5SCf4WjYbLCIGQhoymxz1jUgGjrJpL/C
	+iA96bMdDhz+1oBB6s
X-Received: by 2002:a05:6512:1322:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c170746a13mr1720283e87.1.1794601324638; Fri, 13 Nov 2026
 12:22:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com> <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
 <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
In-Reply-To: <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:21:52 -0800
X-Gm-Features: AclHuK_r_rPrVJRj0pkug0EuQb97pNCsN4qnHk9bddNHOrBile8NMgFa-B299mE
Message-ID: <CAEy9hNXNaAdcL4NMmNf7sETknV+jQBp-inqFd-qAPut041GjJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_202208_180013_32171ADE 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
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

> Would that more correctly describe the hardware though?

Yes. The IOMMU is inside the AV1 block and the TRM has no reset for it,
only these four. v3 adds them to the vsi-iommu binding and node.

> So this likely would require exclusive reset controls with
> acquire/release.

v3 does that: both drivers get them as released exclusive controls.
vsi-iommu acquires them to deassert on probe, hantro for its probe
deassert and for the timeout pulse of the encoder cores. Remove still
leaves them deasserted.

v3: https://lore.kernel.org/r/20261113-hantro-robust-v3-0-82383c722ad2@gmail.com

Arun

