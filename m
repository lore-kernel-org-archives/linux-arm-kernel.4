Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3518606A882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r78ixica;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Zl3yjhzC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=; b=r78ixicaDxbjUeeFEubdgR4yF7
	dCJgxKnGayOe78bWAIJ4PnqG5MRa6FSJBruXZgFHszxvCdMLKmzROHb6Y66Yt8GE2miK4h7HNUjmV
	DcSVpjs5Qy4/ysh7jG2wwX6AG34P9yshLB94aXT9zm0oisPx2hZSXtwDR1AaxNSIXdCsVJs7Bvwv/
	AU/3zLPCMZ9R01kKwF0g6Lu4OqAoQjxgEMr9Po6lIpiq1shAEj3M84GZ1JRLb6R5nvkkw8UQDLOZI
	efF7aYzq7fCvz2o1vxfKdh800BkD/1FhfvnTcFw4c6AEeewJZdwB2w8G/rUM5h6eEO8u77PJISdB9
	puH4joSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy2M-0000000ERzA-2llD;
	Fri, 13 Nov 2026 20:38:18 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy2I-0000000ERv0-1WcB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:38:17 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1989049e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794602292; x=1795207092; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=Zl3yjhzCkh9RM/aKYyjM8fICdFukE2e2CwDjH3B4E26czaG+jq22fd1uSmj/Tq8e4P
         HlWctwJVWfIozw9eg4wG3JQQruAHpWpt2lRrXLM0CK7QGcr67/6PYrgpZ3Dy2Yb4Jr5E
         RfsqwmdQAvtZ2qe0Jl6SCRF3yG2eUFxvNI1IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602292; x=1795207092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=iVY4XbKbxta0VG6RxxSaGGLjgEpKQDY2H3Zj+mvQ9cjpC51ALX3vLjWC2aYqCajFa6
         4TwHbrIwUxtTe5sPz9GLEBbHBaKH8GGMsjSZI/Pt44IM9GoKzFgDkDpPU5YGFZIj/bs8
         zNo3VcuIGXOWf12+IkK+FZ4VUS2X0Bt5e8matYRXLdr/rrAbgYQ5dTbxKWkjgyYJzy38
         iQj/kPe9jrHBytG7JdE1muBSAUtTXWVhVBRx6xg6N8ERc8wKTRLW9JUGByDBI9VaBrC0
         gUx8qWc9rjFv9FJfG33vd2ThMdtDNUWuafNDu5CrrMj+XS0qd+eM2TjNX6EcY/XKC3s4
         QJ1A==
X-Forwarded-Encrypted: i=1; AL+hErHUanJosLACK0CL8ausdfk09jXFwfsbiZwnNbbJgCswgyFosvn4tsX/I3d48duX2OaWcltSipALriXWDgUQVo9I@lists.infradead.org
X-Gm-Message-State: APuU4Z9Fb7x1EofhNVHg0rW3+hocM44GU2kWx3Zlb9K1Wgu97i+WgLCt
	FTV3StRDn9b+fR8uBUaNnG2tZN7d6FhwbswencCM6Zj5o7L6sLnLh9CBPbCv2zCbJpRvQs7LfmT
	90vQ8RfKp
X-Gm-Gg: AYBFou27QFhKEnZ5JTT9QpLd/UuYNqFoCLaNRpCdNgXUBnO/XVYgjPuIrFolUDgmVDR
	MqcAaRX7hNMGb/HKvRCBAyllSPk6RwCqc2p51d1/ENkP76/hDk/ltDAPgY4OOPjJUdi1Hx44kwR
	ARqllwphA+98lkOxXM5XOpPQiZVittLjYrSCppeDz0WF2C0TfUpxEF3vEaOOEQ7za0cFpnk1qci
	Z//SC9e4zW/YcQabSGY0/TUWUST00h2GgtUhbOC7yL2nR6EvP/mqy+9hxMDgzwtOuYje0e9U1cK
	9Zlo2z7Gqppd4jdzwUnGHVEwr7z9BZATH5KFbBNVEnHZ87WM16W1rvvBuFziK5bDZUxlzvXwqG8
	KOpq2CJ1JWfqf706jTOZl7sfCqpvx8V4H8uMTrihGnq2oK7o5JtRhkPwQ6rI7BU7df4tJE1DDRq
	LrMUHSjl3KE38y2Qyan4L12q78UmCiBr/0ew6hqq3QPsMh1X3u5gPh/i4U6QRYoJuFvBpqWV6sm
	yjpCO5GGBWwZ8Di2Bc53TyVYG2VzP/+UOOOsCQDcR19dtdoSNStQUd2dyR0EBKqCQUCDosA49lD
	9WwvCBKrE5iC+kkznViv65nSY+48pIJyLsaqM+6+L/MXtVnv2Oi3nF2sYucrzEbljabhvcDQA2E
	COvZHWZ9/4rIQNA==
X-Received: by 2002:a05:6512:2241:b0:5c0:a7f:3ee8 with SMTP id 2adb3069b0e04-5c1705fabd3mr1538891e87.8.1794602291622;
        Fri, 13 Nov 2026 12:38:11 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c179893072sm492671e87.64.2026.11.13.12.38.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:38:11 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1989030e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:38:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGf/N/GPYKhmnAESRIGo3/ZuL24xyMiAR7ae3wTxfPLwv/h1UdDnGOmkzxk/ocK+YLhsByrhVXWgsE1VyAkOeN@lists.infradead.org
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr76502555e9.24.1794601957270; Fri, 13 Nov 2026
 12:32:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
 <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com> <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
In-Reply-To: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:32:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
X-Gm-Features: AclHuK8SHFgoyjCXNJrs3RjG85XKuoNtkqoClolncw8zp41l0jasiLh2oN-rCLw
Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123814_419789_2E3FAF04 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Following up on one piece of my earlier reply:

> The idea is that fdtfactor and the overlay fixes will all land in the
> upstream dtc project. Then as part of this series we will bring both
> in, so we should be all good.

Thinking about this more, we won't actually be able to sync and run
`fdtfactor` itself from `scripts/dtc/`. `fdtfactor` is a Python script
that relies on `pylibfdt` (similar to `scripts/make_fit.py`), and the
upstream kernel maintainers have pushed back against building `pylibfdt`
from the kernel tree's copy of `dtc`. Since `fdtfactor` needs a matching
`pylibfdt` installed on the host anyway, `fdtfactor` will simply remain
an optional external host dependency when `FIT_FACTOR_DTBS=1` is used.

By contrast, `fdtoverlay` is a C host tool already built in
`scripts/dtc/`, so we _will_ still sync the `libfdt` overlay
`/__local_fixups__` updates into `scripts/dtc/libfdt/` once they land
upstream, meaning composite DTBs built by kbuild are still covered.

In v2 I've documented the optional `fdtfactor` external dependency in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst` (as well as in the commit message).

-Doug

