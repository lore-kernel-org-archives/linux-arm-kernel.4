Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1x92jnkA;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hpBea2fL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KvLTLQ/5YuKvI8qabgrqVyVosbsFCoQiWnaF0krpYb0=; b=1x92jnkAS2RVrg
	Cjaf3bQ+Rqe2ugQh84AWEhvwjgSpr4TndyjAC8KEFy9JVU4BazVrlH66wY27BPghOyLuwasW7NidO
	EDggts12zFyBlFvymuSzfLZIWy1wdTxw0WWvMyshtAMvw7kTA9tGI2XeCBa3pgWVUm9OM4iJj8roD
	sS6xuSlS93vvhXbNEUj0jjvql5qftAHnLXyfuwCU0NwHToLWKqbfyinqtCuKF3npiw9Pm1buzw4XV
	7HozP7vVQi1CKOASuHeVQ/W8fy4EK4ByfSeWi81pGDYJSJwkkyJ4neLpPgojgJw5e4G8UTDPMIO/7
	4e/dtp0eiPQb0/QyVgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyPL-00000007v0Y-0VBT;
	Tue, 24 Nov 2026 21:50:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyPG-00000007uzW-26sn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:50:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-492f0a1b685so3474605f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557028; cv=none;
        d=google.com; s=arc-20260327;
        b=sIKJWhKvJOyjOq5R+3FCD/3DQh8MoQ3qreHL0rWlcVWxB/Pmynq6TizSEBbfHeU/5i
         SJ3iFgpKAC8+gx7xsU/cVOtaa/vN/47m/0MDQwiRjlhZmUeO9YpPCGra+Wb7d49TmCLC
         Deg3hoxrHmcVVNqztS+YMcoalnabT7CH4J3CbtDbk3LEuePQno+GTsM6rLZEBJJdCtpK
         zg6Hnb2aYnT5a5uwhrq217KmASrX0cgFEoLJydroEqGkl35NxUMzTfhGLlsfu1fQrPLa
         gKzjqZokBq98sLgODRaoDp+7HJDPbo+aMXVq9hWMvAeK/IX9DbBs3YECdyWGSRLW0c+f
         xniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KvLTLQ/5YuKvI8qabgrqVyVosbsFCoQiWnaF0krpYb0=;
        fh=98fgLeYrjo5xwdl9RmJBa4d1O3Kqvv0SEtOSclHKFLs=;
        b=E+NVZX/rB8fuUMR0AzpigjDLkjuB+eBgTLtQkehnXa2Ox4DEbPiY6nqtYWnHrld+5H
         RttdjAqZSSfuk7+nVxRYPMCij94DR3cRv0wODGHlMWagklIVOCw3UZdgH6Qgb7SfBUk9
         NZCOF/0HIBp4sBV2Gdg2L8lFF9GyUy3gH2hE5lUXJI7ckquJPkRwLO+2YskXfx3yZLnJ
         34w6LsEfDaH3v9L6Tk7OTdtVMUPaY+2ks4GwwLYkJKEP+P42ECzduYmtPvJlS/vPjHkc
         ayDR+AMTypwzMweQwLHCK2cLWZtmhy721g8EzZjJlU1mGWacSEua3RxVX8ky9cL2TJS2
         EfFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795557028; x=1796161828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KvLTLQ/5YuKvI8qabgrqVyVosbsFCoQiWnaF0krpYb0=;
        b=hpBea2fLPCMaYlczz66WeE5XxjUyb12xGDVSq+xIB6ahLYKR5JFJ2NMRLqAxdWj+6V
         7Jteb1scbnqGrtNBt4DdfpltBwt61KWYmPpNHYQIs/pdPMeEjgwAW555NrtlCqleQyzS
         /tNpRPNCLD+rhAp6cYLbFjDqxaX1LfWYgY8ghwEdXoItBgDX9/7FCSlO7EC2gcEDL/Xv
         pbsCrbCGT0qvYA8sZle02PW45NokZ3I3xAGiymGYBGeFHJ/p+fZMtgAy8fq6G+SvBVhw
         OjdiqhsfEl8j3HEOWFDO4fYCFD4eGtzREc7Sdv17oNS/GC5I5cCUbQyrcoYiJaKV7VQs
         qx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557028; x=1796161828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvLTLQ/5YuKvI8qabgrqVyVosbsFCoQiWnaF0krpYb0=;
        b=OL5NIWpBb1QnLCI2GtiJrKdWmycWnSHvyCcGmJC3RgOjdya9b00bDaPz1dN4dCQmyI
         aidT0pGXvEceX/QpmTEcQm4t078XfD6Xxm1Lqgd7bMceCDP3/5GCEfAI9mcMXCn0rD9+
         yQ2EMyfn4eqYfOuOq8H0u9YozAzKaPxx8IGexoNraqSaX3Z7F9UvaWX+j4T+T1jJJSIx
         LWc47KS9dCxdveWqONmNN5lT4bXIXu+nmVxWu61UM+wZ3qIKTh4qIIh4lp+yK6pbTkxv
         uGLPggEuILDdGoRV8w0f/NLHs0oy5CmJIY1FPq+0wBZ+I98HNXqz9a/mSoPuwnDIzSA6
         ZSzg==
X-Gm-Message-State: APuU4Z+zbQqKBxPNtH7ympt2CjeWBRZqi3vUet1xOcTq2U8+cabFAvm2
	z4gVYYP9DdCEOYnHYhn7uNdN6O8xAlErwv8KRfWKHs9+ftjCQayn1aG7WCM7jNEuuK+j7Dh7BHY
	kmOiCsnADR+kruFutb/W8nZJl3mRrnOVejYi6ilMQgBkDu6kOQNPSsAQn
X-Gm-Gg: AZFdTZeggBfz2bsLFKoLsI7MAvSk+WjcHm5fJ7lRgAo7uVT2wsb4679kK9iow/X8OAs
	ywkCYOgdO3EyafHu+HO9AZZVMLV07lvYfuDmMNvebopE7tBM2W9o5JAHId1vB73T0W7ESIyHmNi
	nI4Piiakx448C8eGb0P/095W2azv8qyvGewaWSbswlzCr4ZbOj1d2EwWaMfFekjorGvYi+alMPv
	IveWVx72/gj+5jyiR/fCl2H6K7eRxO68XMmQ+1wvNBoKA4bAyGUyseip/dwg1alkeNXn4KO+a3D
	S/kbOXWih2tRhboCJ9H3bvP/hvNc0d5L3xW3CWPGohKwB6acaIkFlzCQteNmzWHhkWTJWB7ttdX
	jytV6PWRmL53wW86hAvOzNPOB5RSO2wX/opmrjwjOtpKD8rFzHMtEtf8ripV+2VySZzv/7Wkb0U
	8c7lhY4GKENUviRWVwXDZbXtWwNCquhdAfGUtzIobB6LQfDp9HxLqw7uCUONFmenp0+BvXdtZA2
	flAebDu+XILh7OVDJIr9aw5o6NK0kCbhLyRxw==
X-Received: by 2002:a5d:584f:0:b0:4b9:8ac3:f5fa with SMTP id
 ffacd0b85a97d-4b98ac3f6d5mr388008f8f.48.1795557028121; Tue, 24 Nov 2026
 13:50:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com> <CAKwvOdmMsCgBuTnMtuDeTzxUqN5fX6pQz5CJ5m=U==DAboMW9A@mail.gmail.com>
In-Reply-To: <CAKwvOdmMsCgBuTnMtuDeTzxUqN5fX6pQz5CJ5m=U==DAboMW9A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 13:50:17 -0800
X-Gm-Features: Aa3M54rDiyOcQshYQz7BP42J39XO5ycS4MDyht_sg7ic078sfs74NXkCcNBHdMQ
Message-ID: <CAKwvOdnKAiDOdrUQq2FKsegnwmrtskMdxggCbN5xz5ML=iL3WQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: Combine module .init.text with .text
To: Ard Biesheuvel <ardb+git@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135030_555537_2E0C86EC 
X-CRM114-Status: GOOD (  17.18  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 11:38=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > This is a follow-up to "arm64: Implement support for BTI veneers" [0]
>
> Forgive me for taking forever to respond here...
>
> Does this series supersede [0] (i.e. I shouldn't spend cycles/time
> reviewing [0]), or compliments/"goes on top?"
>
> > which adds support to the module loader for indirect calls to functions
> > that were emitted by the compiler without a BTI landing pad.
> >
> > This series takes the ppc approach, and simply combines .init.text with
> > .text when loading modules, so that cross-section calls in the same
> > module (which may originate in the same compilation unit) can never go
> > out of direct branching range.
> >
> > This makes the BTI veneer solution unnecessary, and permits some other
>
> Sounds like it supersede's then?

Answering my own question now that I've reviewed each patch closer;
yes. (Sorry for the noise)

--=20
Thanks,
~Nick Desaulniers

