Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=epDxrVCY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+dAeDDv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=; b=epDxrVCYUMclhY
	uBJXi7y97gxGKcWXUYXq/ac9XBdSw4I2nA6LlvJ7ayP4Xq3vJleGXMtllf42flQaNZ/KcvagpJZBZ
	41vceEtgwAl6fLvt4ofeL4Xv7j5//rTUQ8fAr6BdiqjWpTPebxQLzMCyxX3Mi5kiCDk77gkZhPPyf
	f9vrNdYm7PjDI1DSu6TmPwnAL1SUSzBUlkQ1dzYzDyDPLm4nLPjvkEnRvFSDhi7rZtfnWGX0bNYHD
	epNSL1DPmeWqVmazymeElvFlRAPMaFcQJHnZMahOnUmHNyb90onRfGaqYx/62SLnbTm6UQ54rNdR4
	SBTwUfqDVMvmGPrcc7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFMz-0000000H9Xo-3v1Q;
	Mon, 09 Nov 2026 02:44:29 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFMx-0000000H9XK-3Qxa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:44:29 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso668815c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192267; cv=none;
        d=google.com; s=arc-20260327;
        b=qExOFiRx8gqaj9XCZPfCBsm0PfBSUg154twJI/2dd203lvCdS3yDe518dfMP9m/8MX
         98JL+hl3dc+rkd1PpqxSVbMtMcK51S8tMB1Y7iWkIwZGfGF6iq2t4PEFREQifXOmFMyv
         w0RV1Zb6idN2ByQKVaI7Ej97ucn2ugsnon3kxXljKc0X7KyubgADU7wX4WyQtmE9JT01
         f/sH0pPxh+8jOODm/K9UY30qSZUzhI0BHQ93FYrxwWFQUWeSSYJF7oEPkmFUvrE2sjeq
         YPDhSWfVeoVat0OT2f6I62gdNBydcx+h9UvxsA7dYpalBFNHNfQqfFG5+CS4KNlBSqoY
         T6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        fh=ZNII+xYlaY9Br/u5MFa7bU8Mo6IrzvOtZMFbHY6I3cg=;
        b=ncvPAe72XlHVD843y9OjBcY9qwzLWCt9bKLEp4xfdpt+EST7k3SP8pFa76834Deflh
         IyOb85MFjf4c+ZPAJm+1p53FTtr4lq8GiUj6ugdvsfJCwvTD6NQEIWQrerhyXzuMWOvx
         UJyHAiELNCfbu+2cQhYLIRy9vtoXE5S1YmFemU3YkS54Urpq885XSLPQmynP1cgV3S0A
         u/5bojekPuOBHKnGrRWemKL2NmCAr7sq7tjDpda2su1F+yOSXlvesmkshAA5zF2PMjyQ
         KY97ABU31YKNBV+KTTGyce527bDDmeaFFGyDxwBJG+I5WbUH0+w5zm1zPZCrhkHPU+bp
         Y1TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192267; x=1794797067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=B+dAeDDvu3F6/ObfwyvNt584v8YNUHrowzjIbYXv2DaY6POoyK8RzEC4dzBZp79sWU
         HlKgPD6e0GYPHU6NOxNRHig+UV/nVKQRfrvEAcZTJvzt408llfdeSEl8hyuxkHICjIgV
         JAqr7U4Il7YTwh4e9A9TT4yQhaC4CN5tWKQSOl20azA8Zl60gL5bYcqWyayuRKqGRe0O
         Qdt7Wpg7F6HAuN+tk3JBljf4+XYn/RuLCo+IJ1aWzMoqJJBKi0n9epZwd5m5mtoyJd/W
         xX8zSNpvjHWs1ud1RQKBhdHp0B+97pvMiXFQQKflk53Ba9Rxxn8I9sHwwpixzqiJ3ePe
         en5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192267; x=1794797067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=y3Nkg1ogtumJBZJxMZO15fkZHq9O9lY5J0PXwtSneR6uw01LuoTwKXLwlCzcYMmMa7
         11fp8XLEkf2OaZ0HQ/11j9wF3eP6VAd4HZJxb8wwjA0OmmEByzzBd+uHflhuffedfG6U
         4aGsbMJ7sa9U51ZpsSSyzASjRd85+oJ5NXEV5evTRz2IN7gtL/8vbW+Ui5tnfNTeIuhM
         loQ5qwfurLp/ho8mTmkuunhrJK7hFwKCVJ3f1Tp1Xyj4ffmKzXpGXlJq8hi5s0gzmnbY
         JY4N34llOEc81PkuaMBlerG9TOiOyujH8AlxSQ9pF/F/o217tDJAhGt4o9HkYwcuRF5E
         FC1Q==
X-Forwarded-Encrypted: i=1; AL+hErEjOQIt3bARS3yyhVjqWV2RKjkr3+K0rjub+bhEvOW1b5xX3IFJSCpsjbnqhR37H5W5EmrlZHECAAGxeAfH+Mrm@lists.infradead.org
X-Gm-Message-State: APuU4Z/UOwtBBs/lt1yCM1xoPwurhH5RObhc0kimW026KyGZ+GqFgZyM
	UVT4Bg3nBIi5V81FgnRtTnKvNFK7moCwZor/8w1fva1Nr/Yw8MzemDJZ6TS1owerBQrC5k5oVnM
	N/YraIMwNGiaUtMuDC3zNMEcIY52me9Y=
X-Gm-Gg: AYBFou3z0qgHDQPSyn/RdEf/UeaytSHBAaXQ0DPN7aSA3uLxPwxhs7mfaSBwnBt0EQz
	D8s7iYZds/dc6kneIuwVfILHll4NQQvwR3KEN86/PXztDl80zB20NJ8IvvgNss/3D9DtZdr+fmT
	vSPh+VokEZHxpp1GSGeI17rwyBmxxAuNqKcygXRXVfWYPLuxypU23mWCN/R15ICR9WnNOODxW50
	SP0aJWjdO71rZfQKTmHl2V9fVbtXNqmKhQ8FV6GVtt6VQiSqVandapy5xLoSg1qMys3Ei7Grq0W
	pQ7t56VPO1EMIkV2bB0VknrNrmHloO7+f/EiEIvXg0/KSKe8lTYDYvdGs1piqcYHsu6ea0NoKzn
	6o5yzkx60HTX/o0mzNIpbGjtGwIBPsFayOOZsAsg=
X-Received: by 2002:a05:701b:2616:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b39fe291d2mr3839870c88.5.1794192266580; Sun, 08 Nov 2026
 18:44:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <20261106212939.GA1814035-robh@kernel.org>
In-Reply-To: <20261106212939.GA1814035-robh@kernel.org>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Mon, 9 Nov 2026 09:44:14 +0700
X-Gm-Features: AclHuK-MtGA26JxVmDU8vwHD7H1Dr6pcTzIJGZiqmr_2gGFPDRoc8BRW2dGJq-o
Message-ID: <CAAq9HC7Fk-duB0LKaDDKeEmLYvZuvWTBab-YpjS9x9QHm0z+7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261108_184427_881086_373C921E 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Rob,

The failure isn't fatal on MSM8917/MSM8937, so a runtime fallback
would work there. My concern is other platforms. Today, a rejected
PSCI_SET_SUSPEND_MODE makes the driver stop, which is the safe
outcome when firmware misbehaves in a way we can't diagnose (PSCI
has no call to read back the current mode, so we can't tell what
state it's in).

A generic "try, and avoid on failure" would turn that into
"continue", for every platform, including ones we haven't verified,
unexpected things could happen after that. The property lets a
platform that is known to be safe opt in explicitly.

Best regards,
Reza

On Sat, Nov 7, 2026 at 4:29=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 09:41:10AM +0000, Reza Kurniawan wrote:
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
>
> Is that call fatal? Why can't you just try the call and if it fails,
> avoid it. Then you don't require a DTB change to fix the issue.
>
> Rob

