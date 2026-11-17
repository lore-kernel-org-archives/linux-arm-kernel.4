Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD4606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yf67mOBz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ay4D0LzD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=; b=yf67mOBzB3BIbi
	CcveO3bY8ieq5hEx9pY0YsYONCvumF81BRfy4rIkl86iCE4rB0SAKB7hpy+X9TdNurPJQeLfnrB4C
	27ymY/HbzBQMhEx0NLmRF0VNSvfqoA52dVBfkAZgMeiG8YEVZApzr07KdjzYVn6x/Gy4Acto5sdq8
	pe5yR0zgvMuXHSruFnO6o+vdke45prf4szj7AP1fBCENo/97bf2crkwD9yysVAUGOoEsLiUr9OkR5
	NI5hNuDmw7s8HLSLGpcCTV+k57hO7bJ1VK7Eb//uK1AVFX1GkdUDmMcTj2SSETlc/xCqIwhXWn8Se
	49Wl7Bd6VXiSUQB3UDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCTA-00000004eni-04BU;
	Tue, 17 Nov 2026 06:15:04 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCT7-00000004en0-2VvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:15:02 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-170135e43c7so6858328c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896100; cv=none;
        d=google.com; s=arc-20260327;
        b=hOKL1EL6qsD1sZqX9B4zgusZay0DjxXyzzC9Zh47+9NFPzoHtEpdSPyexHlTkVtLfq
         3JEPWFcUUsONzPfp2U9kRdkBXpQKwUEh00vvL8Zb84XlJ8iT8Or+JbxU7k3a/pdLuMsk
         GlzjzInDAqY/x504u1Q4wvU9qFofnC6gRnyPQ4Qgs+xttdfssKTFfYksEECfonG0DAVR
         FR0hGO6FeK9g/aEvSDCTbQvCbQVsZD2lFHbrVINiW1SVVv7m5owTFTiqsNCsbs26Gsrd
         JxpFEk0wyxiQbloYrWtxkaXs6xjibW7yqRomlZRYHc8jMILwq1ni+dhlsJYurTWnOgFV
         ES4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        fh=nhGwTsCcOUiVXLJIO8llByUkMS0/fb2iWH2glBIHOUM=;
        b=F8nIK7Kd4mXW0cwrUpog1pYO3LTfGydve8jIthd91SCYgC+5M8dXfXutnt6Rwssaxo
         ckW8MTlYViBrge6fG4r4bxYhDd4D2gTxlJGhjurGDtQCKbVUX+qGEFW4wsjUUPZ0urYB
         Mr1PIodXe1xtfGhPhKzvuojHRjCs25X2M+W1nhEZSeaLUv/RfdSkuM5MsWIsum765A9c
         ZrMFL+nXm5SjwqIgAaJwsXS3fFfXb0bx5miAMoHTmJuHwsb7ezH6XzV5IHCVl1CwPy3K
         1inenxY3mB+lB1Mz/bUAb6vwMVrdg0ZU89HBUxABRw0+qRslWMCjbTWmRk6Ch3p66tBN
         fX3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896100; x=1795500900; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=ay4D0LzDHkf+eDyEbhGagMw8PQE7MKoGzJbUoA4XGOiXtAPGO92tAmYFyzE458mApL
         hbd1tgAF13hNfxCKcWa7olAfMxXwDrQmTIvzAMeePFDQPl4itzuuyy3kHp/TcxS8FnS2
         KZnjRjkujSRzr3MYHTxSiR75p+iches5xbDPacp/nQvV0hT2rZOQpJjTj5vP22KDfKxg
         R4tzULuD0RTekOvd1dcBiVYEGRwdbFGJV9E+AFIv/POdzz/sXBLxrUxbwepaETpkDb8v
         2DaODBNrZWWjT/wKrOhKfD4Z3C0F6bMqVfKkD47thXv/NTpkOzdTCJhZjXrBxKwr2WOb
         9vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896100; x=1795500900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=nQN1nvh4BUO9EpVRmGx02o21pr4YlEWhp0O7451Zo4fQU7RMDtReB9nEqNuwi/PkdY
         aNLGnkXhtw9QbrSVqUMj183jNNmZWTcQoOOGZ9T82mPtOHhf8H5F5Xlk5majcN5Y4uyw
         bLZ6u4xYZ8GDVYxQc0VppwBbAFCe1uK0iPLaqEJ62amXzq7Dz8x+rJ1tIyX5BA9qQG4n
         Rijq9LZVavZpH7Zg/9HkJQMx1gOuXlcodSyKYzJThikec84/E7JoBIRUIEPLbrf6dJ/0
         RwJMFVwBl0gt3sI/73WWab56zadMIY0xY1yP95vUDiZ1+DvMsYQPErD2BfzQGDnqaKbt
         Dl1A==
X-Forwarded-Encrypted: i=1; AL+hErGUS/8iLlUlTokoKjjUgIOOl9adLrDUMFpsS6qgMdILq41LVsqtEgiDaO7Nhogolfk1Buz6dsoe8mQYU1OpQGiR@lists.infradead.org
X-Gm-Message-State: APuU4Z8vU0uS00eZ2ImRJCCQ4JPtKOEFawbvKTrc9fnqIzMIDR6i9jKQ
	1eMuPhQEM2FLGlvvKqeSmPFynKtpASlENjtLs7pqpbzIXTvmqfm25Vbr6FfWYvO1dXLpt7lIims
	dusu2fqFtEdGNKoflT9Mc7fhfG2AQEXY=
X-Gm-Gg: AYBFou2jejuOju1Pk8gFYjyBVagS/Jy8jX350g6xgyPevJn5jWYV7pP9gGxxDYbtSLr
	GIymeaxc2d4vy8yOFjcbCtFqeuFyyazcqcXAlSLlsFrt/EwEwy5QFEYdpDlpn2aYNGF/UaV1pgo
	GGDF0MHNatzSUXVYXaErdHMv5LNbND8jhGVeXcaZcKJqS4MkRuBaRmkDTeDiG+gAwAH9s9QWxjs
	YC2x+iSALhl2NDz00TNUJyFZK3z8ifCzEqJ6qCh+e15PlCGMvrWjn4FknfC6zzRp/kV4IoXGtne
	vbD1xyK8fSrBEf0Zp01OIwq1c3CpBWAcRTcQb4R1nWX0LCdE+0TEtAdmwM3sbQXcp6glqTjjjh2
	yFMmGEmaGQB71vxxlviKI5hLXgUEKVXUW++Av1Xs=
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id
 a92af1059eb24-1b532d780bbmr3902889c88.30.1794896100415; Mon, 16 Nov 2026
 22:15:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:14:49 +0700
X-Gm-Features: AclHuK-92z3C_GXFHu7R-8mmf-2cWRgFAIJrCVXLvNtI2-ZT_Yern3kmnNXQGro
Message-ID: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Val Packett <val@packett.cool>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_221501_649095_72A2AA96 
X-CRM114-Status: GOOD (  31.55  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
> >
> > PSCI provides no call to read back the current suspend mode, so the OS
> > cannot tell which mode the firmware is operating in or why the switch
> > is rejected.
> >
> > Add an optional flag that tells the OS not to issue
> > PSCI_SET_SUSPEND_MODE on such firmware.
>
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?

That is correct.

>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?

Just as Val stated, it's not possible sadly.

>
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, rewrote the property description,
> >  renamed the property]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Document=
ation/devicetree/bindings/arm/psci.yaml
> > index 0d04389c81..2eee38d155 100644
> > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > @@ -98,6 +98,19 @@ properties:
> >        [1] Kernel documentation - ARM idle states bindings
> >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> >
> > +  skip-suspend-mode-switch:
>
> Maybe a more descriptive name can be found?
>
> osi-mode-only or broken-suspend-mode-osi-only?

I initially settled with a similar name before (with 'osi-only'
phrasing). I ultimately went with 'skip-suspend-mode-switch' because
the root cause was only due to the mode switch not functioning
properly. This property doesn't do anything regarding the mode the
firmware is stuck at as it's only fixing the failed call. Normally,
the driver sets the PSCI to the preferred mode at driver probe (OSI if
supported, PC otherwise). This property simply skips that part and
assumes the FW is already in the preferred mode. It could
theoretically work for firmware stuck at either OSI or PC mode, as long
as the platform shows the same symptom, It is mode-agnostic essentially.
That being said, I'm not completely against the 'osi-only' phrasing.

What do you think of the above rationale? I'm open to suggestions.

I admit that the word "skip" here isn't really helpful since it counts
as an implementation detail. "broken" should better describe that it's
a quirk.

Best regards,
Reza

