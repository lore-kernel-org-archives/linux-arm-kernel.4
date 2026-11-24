Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o34wqKqv;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AhqVxwLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=; b=o34wqKqvjHkgZI
	HP76JBl19CeWq455O09akygzIrrCvtGGWKHlNBaSLUAmSGh/6gM2VWguLIoyMk24kU9rI+lPVjv2l
	yDBBgxSTcfSwCIy///smRAHus4fxHCaCpK+PjB1E26xvUMa7S5d3fUIx90cpyLsJ9xyn9IW7LQ/T0
	1XDRT6FlK0NZ31NH1KTC2XAydolr+U0Bn7qtnsA03LTZwSivAuQwP26uNzfB/sobQ74xKYzfaOI/q
	NTbFysrgqGgNQPkusryvvVBqsfXg9A2JETQqVdduO4xmdWi/82DIZvfKKvA4LPTvFAdm8/gbd5oJT
	HdQ2JcdlmGgRmhaxlOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyeU-00000007xb6-1EcD;
	Tue, 24 Nov 2026 22:06:14 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyeQ-00000007xZT-1YuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:06:12 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b335eeb340so44136337b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557968; cv=none;
        d=google.com; s=arc-20260327;
        b=C1BOHYsKHdT3SHu8Tq8OoUnNNjOA8Si4rJMy7L5JAR52VQLeyHGrIv5BMFWi1tPvsF
         cOmJniIs+tVIL1un+JwfLcpIusylIozWYkiACnBn0sCJ4YoGXwtmKk/jXkLa3kiTBowr
         nWKWNaJipYXBBgE+fjBoDtxVxoVcw0cePZEGrfLAaJ9I1/aTwnzno8O1chbrJhnZtY3J
         HgFab0fKJoyK+g+ttr/TFCdkUJFJn9L8WXHC6p/F4Q3HFIoWhzrZBtBAQ+z+RTwOEifv
         eX0W8hCOYmOt3JWXf2CwcbEeIxRzLeKgICfGydT7kQF65muml6Ft/VEZ6EULbd4tNwiK
         /3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        fh=EnZhXFp5+M6pnwsUxXZwtzdS0b8qmNIyTVlcPjnK9dI=;
        b=QUrvTzELgY9TfqGFKwLFztZsooUZRAGoqfhzbDl9Pvj2GwTNnAly2VOsxaA6P1XeRt
         Jou+wM2QlJ3Eo2knAdmUFqgeCo1lCWebyHSEO5XiRaO2LxMB8OUDsOWyWEHo+Cdp8a8g
         gyWkZCLwru/8aiJu9xwEbBITIqmq3hKwjjGsEqKH22Bp/5UDISzrvUVRAXJb2PCVwiYe
         t2RTEaeDhSj73AM1iRPVVLaj0UBPoSsGUyBTN6TZrEVJLBIvZuRWz8zt7VTuzhifaeaO
         eWcRWb2yVewOoed0CITaz+60HDCAad5dFV/ly8Mpjd8pY+fyU6ym/be8bObmorUK0CRd
         iQaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557968; x=1796162768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=AhqVxwLSgjgAG7V0kNF3adCyY7mxk2N2UgoBcI+3x3RvrGNz8DOk/mE14XQaclSnOc
         mk7xX0paYGCpEbmwN2T8GvsEgoMWBvXd43E6e/cqhlTra2J+wMVNoXD2YPPSbmwM4uOq
         uYqe/C+4Wx78HaYWVfGtJyD+GHxeSzdP5HYV8pjdFCg5XT3lSo20p5bc/pbfN032woXh
         H336EtNIUGVWBjelXxoibQ35Y8ie+5zqUtLXy94FjwlV125ZjY9/YKjqBMRCUtFCNBN/
         fGYtofewXuSAbGYABaACHVVKhLJXZidN+KVGHdi4SwWFkdKF4Tj2PI+hSopV7OOdCTtc
         fL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557968; x=1796162768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=JN9ynAveRMNGFhlNXr+iwtpC4MtCRaL2EL/GJyKafHh+gDM+81xSTsOtsQZN6knONX
         Z+2BVSXNUea//cPh2kn76XucQDIdlXMIThSRFgytDgQOsqNYlMIiNgUM2LmUjYk3bvGC
         FeTOEjnSrSmfSqQk/9lIukkI3paO/VOEXQnHGah+cQ29j/AhQkznxfb/Q7cf7a6TnNnG
         Mf7HWjy21IHuhAE1Pwf2Mm2dK0j2LCtN4S+vBe1lVUmhf7ckOUBHDbCjnhGEdARk3EN6
         gMT+iTnNIAy8IBfyGrIkgEx49Gj4VxGjrXl+xiRydLV++wh9aXKy0IFW3H727vCsxgbV
         PaVg==
X-Forwarded-Encrypted: i=1; AL+hErG+jP36TWnUCkiMB6baeZSiSB+1KWMu8RWM7wGGXw4PfcuYQTxMcYGIrMch7lGF1NlwfSPP9Cte8g+gpH3Yyxls@lists.infradead.org
X-Gm-Message-State: APuU4Z9eydgSdXZwh3bSDVV0U44/u01rM4jcIjT9jZdAWujumvg0xZrS
	Ej7Hye40xccmZFkZeeIpvgYe3xmqy8dvYMiTv0hcuOf4acjb9NrDPN0M8vAxM9gKAFtaAtOTUFa
	jN8vgk1yCqU3K+UTIZUclukJd5ErlNDE=
X-Gm-Gg: AZFdTZcIkBtjQOcJeknqSOjhILP9Hezvya0IGIp2L7yLpev8pK1J7MgsZrddNTlv673
	XxekLJoVeyvRqaJcaU7NRKL2hnHWkgWZSr4WzMhCyQv+8h2uYjsgJcJ+atl9+wb7wIaSg5OD7c3
	q02OPYzZS1TycdKiEmcKwZ4bUnCDQT8WLnLEy5R9l1+i4NC82Gap3aMNXdFXGIreLqZ0egSygKU
	YCwV5qepTwYfBO6odhqs3KOC+EhpdkzpB53XtrVzSWZ50kLb7Tw6zEs2h8oqEjiPzqJ4WEGOmab
	As9zRAQkQoXbJgAosdUAIwG4hbjFGCTQB9OjdM2oN87YOYj9C+LjTJxLNWfJBJz3Ae9/HQomJB1
	qNJrCBxR0wkFJG/dr99CZsR22Yl6U4HgkdlOmLV3X3cNUkeh1/7lWFdjD12DN5it2PLOh3Q==
X-Received: by 2002:a05:690c:4806:b0:8b3:33cf:1ff8 with SMTP id
 00721157ae682-8b52047e1abmr62214977b3.51.1795557968035; Tue, 24 Nov 2026
 14:06:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 23:05:57 +0100
X-Gm-Features: Aa3M54obAOudEtwcvYkDuGnJHvL3A4XdBNW-oHonc9K3rZo32rUzvFY7EEi7VPQ
Message-ID: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_140610_423323_5562CC75 
X-CRM114-Status: GOOD (  14.69  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ronald, Hi Neil,

first of all: thanks Ronald for picking this up!
I like the overall approach. Before I dive deep into this series I
will finish the code-review of Valerio's AUDIN series.

Two quick notes below.

On Mon, Nov 23, 2026 at 8:38=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
[...]
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>   add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>   "hdmi-phy" child node under the HHI syscon.
It's been a long time, but I think we've been asked by the devicetree
maintainers to have reg properties for the nodes within &hhi
But I can't find the message at the moment.

> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>   PHY configuration ops, along with the temporary legacy creation
>   helper.
At quick glance your PHY approach would also fit phy-meson8-hdmi-tx.c
There seem to be minor differences:
- two additional enable bits in HHI_HDMI_PHY_CNTL1 on GXBB and newer:
HDMI_FIFO_ENABLE=3DBIT(2) and  HDMI_FIFO_WR_ENALBE=3DBIT(3)
- newer SoCs seem to have HHI_HDMI_PHY_CNTL3..5

Meson8/8b/8m2 HDMI support is not upstream yet. That's why those SoC's
won't need the backwards compatibility code. So if you need to tweak
the driver: feel free, there's not much you can break!


Best regards,
Martin

