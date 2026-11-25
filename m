Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1/QzAntc;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FriL/RZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=; b=1/QzAntc/dDDL0
	7/4JOjuaNCUiTnNgxTgflAC5qpm/PyFbrU6l4g8XI0ZD65L7Uqbfstt+oUybAXolbpZ5LHEtOBRz9
	QJN2veFFv2P4qZBfnsxzppua1rqnRhFLTkM+MYxmTcgceqywpdGJsjz5gKhbhVQSlZKXHzuNBiZjv
	rcKhmdFmhXf0YwWwKbBRmbkiTbsv3hi1VF7Ag7Pn7rtQWc6SOPY/kg2bWHBV/Z1/ysZpBBCfVH4I9
	QNTbGCos9QeRaUQi0EbxbW4WUBQOe6hpqW8d7awa6Psz2ORw5lV91DqDBLQvaJFRM+zykzWAuap7c
	fBRVukExRV9/blWDh8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0wv-000000089Wc-0Mns;
	Wed, 25 Nov 2026 00:33:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0ws-000000089WD-23pC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:33:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1188507466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795566800; x=1796171600; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
        b=FriL/RZLr2O09MJm7kntYOMKkTyJOWgOnWyYgj3kS/FB4ydW2xvaLnfP2MZWP3FmC+
         NR3VzMIzpF/OmKA37C4LjybrOyg5nxDgpzG9wGJ2ru7FbKZwTKFgSmlV08ysGrsQ6Zup
         IhURNeyCb++d7KBGU2U4w4giIyIGVSXdK21nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566800; x=1796171600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXutiY4wAsWVrAmyrBgblgr1VSZYUu14hZX1/vO7UHE=;
        b=d/yTsAwbXrVsQFR8Px4z9fJLpthtQlH91bUNS5z2Lb9/8lWFKo6NcZt8tFM2Aw9jES
         EuT6L5GtTS6fEBXlSSgXdJmyycrYOoU5SgV98dAHi+QoWr6G5GMp+h+BNXP1vrCM8bf4
         UU7OAfAuuwYF2IIxXgVqNbdqx4FYEUEHVU+Lto2TwOGXKfj9i2hBrCD5b1AKEX72Iu+l
         nmUHlyl4DHbdH/jMmZ3ZJqx5Ylr5GqLqI/xUplwbqhnyLn+lhHMCwQp8eSTjLARL0TkE
         JUx8mfCgLBRDrK6orOeHe/HDggo9DAhc3c5Q8yiGzPg2c6+0eBXV1TAiDMaO99Sca5Uo
         pzPw==
X-Forwarded-Encrypted: i=1; AL+hErFRoI5QO8N7MnwsUUVI4+jDixIC7iMmfG+ybuQDaYiwjvAT9X2Q1Hwln8tmwuz9CVIhhgEmU6dB+k4HVSyy4fbq@lists.infradead.org
X-Gm-Message-State: APuU4Z941CsQjjehkyOVigkDmTpn2W2nDJrFiphZaZqIYJT5vfM0hhnx
	0qOdXOVnndrZ05pBFMpPp0svdioz4BFNqVOgOl2TwTiYAk95biG1VppXuCNAWKR2yLav6M3ZTe1
	zYOtE8kCu
X-Gm-Gg: AZFdTZdKq2T83xfiAu0enchlXmjAfNtNDrvDbiOsSkHXUjmYn/kDIb+0o8fsuw86Riw
	mN1TvORUEDMEg+j0V+k8zn7bJScems6naIT63BTXOfu72XAm/gtF8cJRFISuh2mjjUf+0j+IC08
	rru23UPmDSK/oaxVNNRKm9aeXazIFtqXwZUGil0CkJalroS4Qdo923hUIj9o0zweKz519FcT3B2
	puB8hc1oqfI80aGfQNHAUtcr9nl21ab8pyQRT6ZENIiSgHVIXilNzS3rjwvZjar8+mmkRSb+nJH
	9VIIdRR7/kRBrRPIH9DcvQOq3jiD9fjmHsSW5Wx0BdImp1prua4i5B/Q0FLSX/kyQM0KmAjOCFP
	lqV2BWbKmswicf2OfGNf3fzGHM7ytezcxbJW1of5KDH8Veaj8p4PU6iEhZOgv/omgmpOhCkooWp
	DlMVjJ9WnQ6efm6myqPdf/QYGkOBupjLh42sEmy1rkftlfCcnT2w0f6aJSwIXr7+JLi6SDCGRG3
	baY/0k+5HhfOBeWnBIjbPIpBnqf1e3USWis0b6RTNczwB5lEDLgD2j3ifZkK1+8rNioLXHnKJtI
	c4kXiUCTaZVvtR+IpnOTnL1ALxULVqqnQZz20ZkA0Poy5fCVjx+7LQ0Xbz8MuuF65l55
X-Received: by 2002:a17:907:2d13:b0:c42:4f89:13 with SMTP id a640c23a62f3a-c513186f187mr1402348166b.15.1795566800051;
        Tue, 24 Nov 2026 16:33:20 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm582374466b.69.2026.11.24.16.33.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:33:18 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so32926605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE5gXj4rrPjf9b7yosxgyp/2BQmzhbi1fKtz/d/ZYyKueV6e8oJQC17lQOf5y0l9nXGc9Wzumdn5/e/rQ1CsI36@lists.infradead.org
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id
 5b1f17b1804b1-4bb861576bemr256892195e9.11.1795566796722; Tue, 24 Nov 2026
 16:33:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Nov 2026 16:33:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WG=29qgrTHARxHRpwNNedqQAg9qGRV1upDObekVLazbg@mail.gmail.com>
X-Gm-Features: Aa3M54r4HJHXbXXsTl81DElUvLOJMM_DwqBh6af4oogcdFGi5xYSj3tXIA83QFQ
Message-ID: <CAD=FV=WG=29qgrTHARxHRpwNNedqQAg9qGRV1upDObekVLazbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_163322_581816_E2D760E2 
X-CRM114-Status: GOOD (  19.17  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> From: Vamshi Gajjela <vamshigajjela@google.com>
>
> Document the device tree bindings for the SmartDV Technologies MIPI SPMI
> master controller integrated in Google Tensor SoCs starting with the G5
> generation (codename: laguna, canonically written as "lga").
>
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spm=
i.yaml
>
> diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml =
b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> new file mode 100644
> index 000000000000..60d1e1769cf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/google,lga-spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor G5 (Laguna) SmartDV SPMI Controller
> +
> +maintainers:
> +  - Vamshi Gajjela <vamshigajjela@google.com>
> +
> +description:
> +  SmartDV Technologies MIPI System Power Management Interface (SPMI) mas=
ter
> +  controller integrated in Google Tensor SoCs starting with the G5 gener=
ation
> +  (laguna / lga), supporting MIPI SPMI Specification versions 1.0 and 2.=
0.
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets

Could you remove the "-resets" from required? It looks like for at
least one of the IP blocks on LGA the reset isn't exposed to the main
Application Processor. I wouldn't expect this to be controversial, and
probalby Krzysztof wouldn't even mind you carrying his "Reviewed-by"
tag with that change (though he could reply and clarify if he doesn't
agree). ;-)

-Doug

