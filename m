Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3EB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fz47/f7r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5D1fhaR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:MIME-Version:References:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bETUltzFp8ju63w5h2+StYgoq2SuMVMwAED32c/bEV4=; b=fz47/f7r9bmHYY30LZM94jvCXj
	M0MYIwzwOItSu/aRryxmD1kXrz5UCqfIVJuHtQ7RECP26UokvbCgpq5rxOGwPqHQjHZIl8IKe3VUp
	THXsmnZCruLxldNgjaJnsDJ+M3VSWrPmGWvJd4v1VG+ZNLvwZf5u/gbuUGx8/inaC/V+bdIaoHITB
	XnWSH5qHTaDhZQU3XbexVgg+tKaYtOj1TKBJpIkTprwxz/ZdkMcWgkTv+U0ZW+zzx7ngKY9n3Isli
	/sLiyo7cU2gdCO24ShIAlkfXQ3AEqodV1+2yjIp2cx6drYSmBYUEZ4KfUpORRnwDCUe33lcI3tldV
	LquODSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0yV-0000000BnsL-24RW;
	Thu, 19 Nov 2026 12:10:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0yS-0000000Bnnk-2lDP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:10:46 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5c14f7768acso1710439e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 04:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795090242; cv=none;
        d=google.com; s=arc-20260327;
        b=mDQHmieCmYWKmQAcbIdFFoycSQiZzXudX2MpdHYX4XABdLvDqqx5e8m4q1rOR9pXxy
         8jwI15sjpWkFGnx8UzjjgYA46H43jbMm7540w450k8laLbC1oy/uoLAOxzZYj5TvuVzy
         ztx20B9Vcve65h94G3l5bbAsXjndqdSR5aZ3Ak4s3EdwFlIewQxi5uy+mm4oxivkci0U
         iioiNhEczeexB4Z86XLDeQ583aDRtdVG11XB9oM8CtQd5ZDVjtuV+bixMfBWwGamU4YG
         /3zfszDIKD7zFpo5CqBD0z4i31pIAjlmOfkabQKuJ8bZlHedg0D3SohyurNvrLnxjknG
         vHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=bETUltzFp8ju63w5h2+StYgoq2SuMVMwAED32c/bEV4=;
        fh=NZd/3ZT16c12vcfMf5VPc9myedhs6fky6hljoou36x0=;
        b=mZbaoIu+6lcAIUhiHHTaqpHJA4jD6+V0zkH8KJSsBAfahYRsetLgodQNcjcF5eopLB
         7Cx7RYugAtkxlnrW21oed+RGFWjKkF2rBqyXwxJTlt3wu1+WlpcP4Cz00VpYxL+4ZAdt
         eIc8qKmSGqykUYBM03/ZhCxghFLs6MFBbdyAdI5kuMdDX1M/rJyfZqCj6AgBWLR6kSDy
         98tInBa3eJwL6zmsMlEItjY4ZFqIeK3ohnVzyAWaxSZ1it5HQN8dcrQc23V+U9Spf0k0
         d40OIFZsKlDy1g8mjmocFV7PqQqnopcJYKErBbmr0VFXIpaQdtCPIgEADqVvC1oPABcp
         RImQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795090242; x=1795695042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bETUltzFp8ju63w5h2+StYgoq2SuMVMwAED32c/bEV4=;
        b=i5D1fhaReYLnAPutw7rQ0MthHQEDwzsp/2yRa17XO/lu8uO4EPD6BY9IWhTOOplOO1
         zZzZb0je6+MkK0aVCznGSddRWqM7po7t477+wkFe12qEEHTU2vZGL0MBcxTdPdwwAD3m
         7b5w758nDoS0UfMic/CqZ3ScCS38PW8bn1KCjtvXIKbaCRH+fzDa4g6hgN3Lf2KMwevP
         G2RnXjATQgrjazyE06FobrsR0plFjmmNODz9sNO7zgLNYHF1T89QVR/xO/tA1fuwzzFY
         QbAEz9uHrHzpTXM8yZcJHAnvMxnaLsGFj8XvtS4jbkiobZKvXNZyVJy7ukQvCjEDh0Oo
         iocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090242; x=1795695042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bETUltzFp8ju63w5h2+StYgoq2SuMVMwAED32c/bEV4=;
        b=YBCaOmS6kdWcg8sPUE+FqfACmNQjC3PPaGHhP2Ajegu3fcENAuvfATc4yC9yQnX81o
         LlWUEsKL19Y2R23YQWHFnrsjg49pBg62VukViEvUbIXj/wKFjdkxlZsidR7R5ESivcNh
         DnWA0ZWIndlWUhMZmM42n/ljfPPuISqgZdv4MK7Pme+QXMdTPvKbX+xJgBvx5xjn1/Ak
         UWiHssN2eJak4+OOwCPqknjwS5a3hzgAsvSs2Oq6YohVFofW2tlzOTdKHmDy3b54T+DE
         mPQsIfg9huXkZrQ38t/wXR51xaf43zBQkm9e7SNiNIK4tRfDfenkSGheACVrb32rY9Hl
         A1fw==
X-Gm-Message-State: APuU4Z8uN6Csh49XOW2vgzojNgUefviVCbAIoSDizB/xVLbKIeC3Htcn
	WKNpHTxZnEqb3/kQ1/I/PNaeYtDwoYaZy2+KxF/WgwZry4Gv5U9R/uXd3myf7o24fK/dYLnVIJE
	HnlesY25ca4Y/8a5CUaxlgyME5Tw+E7U=
X-Gm-Gg: AYBFou1lXBifFRWEf/46Ppc2R93tyYymU5d1Ei5k2KWLLDtt+hp0XtFUhDUV6ZOwuYS
	NT8MF5UoEjtSLpUGtN7J558htgtrP3LgrjnSB3KN078JF12aSup+LZkaeN0K0rwGq3YN3JBxvTT
	oPNTL/inahsA1xPpSNUoiu++HjDSqciVsSw/NRV0Td/raO8EUrS6ef7b5abWy3sY9IsShn0OK3B
	88PlgBIN7Lr9sgSPyhvcGPJ+yG7hjB1sHxWcGux00eyRcmphPmDoxWd/R7qfaebk6WC3lLPSEoY
	vX7UPXW9JnYxyTMvmdvX3fH8zwh3GetpaXjavLr3bPzTYdK1mmqFp9foqc+fsR7k1GT8GYjStBx
	kcpYar6OQvtLd7F/Bd/mYOAjks1v5fpppdC6/DzBskbNERD212vcYZN4=
X-Received: by 2002:a05:6512:3c9a:b0:5c0:ca1:9dcc with SMTP id
 2adb3069b0e04-5c1aa02c2bbmr2030231e87.57.1795090241380; Thu, 19 Nov 2026
 04:10:41 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 04:10:40 -0800
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
In-Reply-To: <4ae5596c-281b-476c-b656-1e03ae7409b3@kernel.org>
References: <20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com>
 <20261117-at550-rfc-v1-v1-6-5879573cb825@gmail.com> <4ae5596c-281b-476c-b656-1e03ae7409b3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 04:10:40 -0800
X-Gm-Features: AclHuK9FN_lcxmvKpiBOURMVJw7FuBsEr81qRUdUW-5-lcWp0rWdYKip_S5TZBE
Message-ID: <CAJGK9zbbEJ_E5t4tXAHmi2QH8vjAmFzLDUbykUfQv_cDwvkG6w@mail.gmail.com>
Subject: Re: [PATCH RFC 6/6] ARM: add the SiRF AT550 platform and YPL514si board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Ulf Hansson <ulfh@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041044_769356_E3CD8EB7 
X-CRM114-Status: GOOD (  13.24  )
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

You're right. I submitted the patch without properly reviewing and
understanding the LLM-generated code. I'm sorry.

I'll review it carefully before submitting another revision.

2026=E5=B9=B411=E6=9C=8818=E6=97=A5(=E6=B0=B4) 17:14 Krzysztof Kozlowski <k=
rzk@kernel.org>:

> On 17/11/2026 14:06, yy-Local-LLM via B4 Relay wrote:
> > From: yy-Local-LLM <yogo.0917.sabu@gmail.com>
> >
> > Add a minimal DT machine using standard IRQ, timer and simplefb paths.
> > Describe the SoC and the firmware-configured YPL514si display. Leave
> > usable memory and the divided counter rate for the bootloader to
> > populate. Keep optional peripheral nodes disabled until firmware hands
> > them over. Disable unvalidated board suspend; limit this board to SD PI=
O
> > at 25 MHz. Document the RAM-boot contract and the missing
> > cold-boot/clock-tree support.
> >
> > Signed-off-by: yy-Local-LLM <yogo.0917.sabu@gmail.com>
>
> Awesome, you did not want to even read what LLM told you?
>
> Best regards,
> Krzysztof
>

