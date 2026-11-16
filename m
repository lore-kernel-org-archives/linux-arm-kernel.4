Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4BD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AVLAXfxh;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r8R3W7bD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=; b=AVLAXfxhESrGA4He0tg20XFf4o
	J7l2uqV3VlE6KWBkpKIgeP4fXQ63++CXe10GiursQ6or9nX7daXXip5kmdvmxLFd99svoVIfCrw1H
	NfE4xbCkt+1utFEf5m0YdFxxA7VtxKmOaxIKLKiGiFen8RIFjp0cZISoDsN0WdeVxViqYKsYOPnZs
	clfMdmcT9sESfBgRDZEgtt5KLtnkNPzp8FvzasiNTWURxtindSKMw5o1CHVZDy2HjUUllnkH7GYE4
	vJW/BZZLojI5RHxIlBqdeuQwkgJZfJtiRQXSMsXcNqjws5gSk7SG/ESFKs8m5oqiVD9TjFG0pI8yc
	EY8Q76YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT16I-00000003V1y-17DB;
	Mon, 16 Nov 2026 18:06:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT16E-00000003V1P-0K5c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:06:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so4819914a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852396; cv=none;
        d=google.com; s=arc-20260327;
        b=SwIhfz6TsslVBNfY++UBbTY6m7RRolONmLy/5nk6GPIS8JPsTOCfJNCZLKvoGybW1t
         neTKfoMqiFYh70uf7NclC30FMMFmkm7zmhwCFgaMTt6WpWvFUgcIGO2xfcH0p7kqvRZv
         D4GwTn6UpqZ6YqHNhfHVTkcF86RiwcbDITIezMipUYCdjAtgpBCHbHTsAqn8WyBp2/qV
         6/+Ml5/mwC1PEpGUFVkjdpkbiFRikGUodTgctE+sNxSQYbUcYmnLy5lnHyFCoZiu7eAA
         Di2Sc2r8FMgYrN6UnpTAxg4o8bHybq74+XJ/Si0pRzgruHRMtonjMJnWjrdUnQLcoMlm
         3x6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        fh=kIWNdGr0QqZzkY3VgxQPYJgoioAz+YRiQhaiSOhxrdg=;
        b=Rm4GDXa+owZth+tk3snQuLJlpb88sObmffVKjMJ6KQEEB7PdQhMJVhsp7N/0FKFnJn
         b0lwz63x673pduiVVrFum7B2Hq+CbD3v1CwuFWmZ/Q0Bq9nThMUxf33oAEI+EJgmrfxA
         3WSH0zdo3bbSLVYcT0mC+kLFQC7EeaY8rXaT3OLTrY0KOU/fRGMH/1zhqt8zsCwG9Gq9
         E7/QIWSuKbrm+wZ98NpOdam84CYs9G32MvgSV1zSk/WmNG1aghGJm3n1BvUVbC2tBFQQ
         XzsbEb8uErN9on5o51U90EcPaDNDY8db3U57waDlxob38p7W+R22Q4oPtLqkW7woMJ+3
         ITqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794852396; x=1795457196; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=r8R3W7bDY+dqFRtPzZCp27WmiPtFA190IFXmpyRY7ATiMMrHX7G/T4vJ37+ZddwLap
         c7ppgjqyUkPgVMG5M0F5Wrm30OxEwYrVd5vY+9XUzateeZIDzAysYbPrVzG7CNyC2KaM
         8rOn2Ldqr9IPvKj2JsABufoqX0v4mNUeh+jdzeMYYibSOLV/7p9rLcvvVzbzUj9IFJ9D
         jwnjNYxSZ2uwCyFspWaFU5eHtX8LNkujY5nbk9JKfhQPgOSexytQLgNAoXQpqSIVzKKK
         3vcCu/hXoRbs1oSCTx0U3FzWudroPIl9wXXDmHcwC0/AVtT4wVldpeaAY/VIH1LqYWij
         9agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852396; x=1795457196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=voglsT/kdl22kIjf1rJJCUrQ7mXJzUIO0uY2uZkOmuwW+4WgN+ThmqKj1dlOJ90UcG
         7FCfQttSebPNbdXu0/If2xsDfr9SioYpnKaeZ6YBrWMgJ6+etyAMGh10jAAs/MDrasLh
         3eWRCiMDeQFK7BOzT2tRQFouRbZkfmhPObz12v8pDc0VxF1WC5AXKLyX2Ghkvgn4IY9w
         /YPnyLKoXZqK/inIOXohG2ve0T27VAy/TZwPmWvPfiOHvRKdeutcUiJ1vr0dJs++SOKk
         GP+Wyh7yjWehvmySrFWa6FfW4sRk5PPQ14/Amm3S+/JRxAdWbvlNF0DvhNoKnh+SSKLV
         WfgA==
X-Forwarded-Encrypted: i=1; AL+hErFCt/MlsUfhVe25a7HXyJF90zCQBMJh7IiRVBB+ERYF7ryH1yVPTDWBlUAofadX/g0HcPeAeBrpx4Mp8YefcVvr@lists.infradead.org
X-Gm-Message-State: APuU4Z/6gO2+nOGxlHniO2MIrmhvfqF4V/onGJVagO58WBb+55ik5Qi7
	PAc0wuoyHTGb/HIzoaq4t96yB3f29I/C0O5vnjKZNPVvKCmU8II9fLlcSNA9psEpxieKmFNPVU1
	uoWe/pmAU6hYZ6KX0vTSphiJaKF1PPBpNXpxd4dJmUA==
X-Gm-Gg: AYBFou3692XYN7GsovsIDTdAb5UJneKpTyN4e0bo7gRHlB1dQy27bdIV/anyI2Hohb9
	Y1ouDmP7/bKPhOeQy2kj3z2IC4/ES0ORO8ID1H0xjaDC1BdlvDDcRtclaeOPbz+0XtppNxLaJmH
	DI/fHSPyZuNTHMYOX70xGLUmuxgT7HIQznQiPc2512NLxoPNVuvkg9njoEA/8teO9g0F6QtIL8o
	UDmCe+HnxN0ig+pRXau0OCrEMdXRZsi9j4r+mJmrg2X7sebz6bPzIEBemTaEf169DnSeL/3AUnS
	NNxlzViogT7gWZbd7Jk7V+Zov/8VXpjreIGpuvwasqLsIR4VG6QGR04lqr6qSGRbkVCk1OBav5e
	xkSGtOQmiS8TDmgbrWh3fcydbrEH6C7ONp1XcPAq35LhZTzNIPzAp6dGSd8oc7zGIw76GN8oQ
X-Received: by 2002:a05:6402:1389:b0:6b7:d672:7834 with SMTP id
 4fb4d7f45d1cf-6b7d6727942mr5514347a12.36.1794852396101; Mon, 16 Nov 2026
 10:06:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
In-Reply-To: <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Nov 2026 18:06:24 +0000
X-Gm-Features: AclHuK-FFknY5syd2Sq_iB3mSD9v2WzoQZ6qZmiqFZ7TfMDgzML0F8GxXx83h_c
Message-ID: <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raghav Sharma <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_100639_196488_E137FBF5 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Krzysztof,

On Mon, 16 Nov 2026 at 10:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/11/2026 12:05, Raghav Sharma wrote:
> > This patch series adds clock support for below blocks
> > found in Exynos8855 SoC
> > TOP & PERIC
> > PERIS
> > HSI
> > USB
> > There are many other blocks, for which the support will be
> > added in a forthcoming patch series.
> > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > ---
>
>
> Thanks, entire set applied (even if b4 thank-you letters show partial).
> for-next will be updated later today after builds.
>

Just FYI, there were a couple of outstanding review points on this series.
https://lore.kernel.org/lkml/CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com/

I guess the main thing that would be intrusive to fix in a follow up
patch was introducing a slightly different naming scheme (compared to
most existing Exynos SoCs). The clock names being
"gout_<IP-clock_name>-<block-name>" as opposed to
"gout_<block-name>_<IP-clock-name>" that we have for many SoCs. That
also applies to the dt-bindings header "CLK_GOUT_WDT0_PERIS" not
"CLK_GOUT_PERIS_WDT0" etc.

Thanks,

Peter

