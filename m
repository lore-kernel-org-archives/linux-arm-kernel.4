Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ADF606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZYbDAkkN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=; b=ZYbDAkkNIRI8+UhtHJ9rRVvwmA
	C+QRAoUYNu0dqgTYguRSgFLaZ6AbAgqNE7GCfN94Q/s8Z00ytGBE4mXNFHiHGKbTupt3cIIx7Wf3r
	shwooVr0QubUjffDozyRC5VOUnDoQ5EcFWfpEbBxKBzWdIdyrHK5g3ArRhS9VsQd7xkT4lwGB3DsC
	HJXFGhoZEFNMnvxOrX6iiEgyb99+azt6tD4FyGPhgv2kkwTzdRe+yZBdDxnEZffoBjRSED98H/wyQ
	CSfhQ3L/w2Y06beVP84Ovy++bqc0cH1CQCVNz6dO5Y1HRulUXoNY1eFQpATvaIrAJrv/Hlv2LNobb
	+Bg1mKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgjv-000000032CC-3t04;
	Tue, 10 Nov 2026 07:57:59 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgjs-000000032Bo-1YDY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:57:57 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso423105241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297474; x=1794902274;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
        b=m9XiADZZXcT1WFjrhz+LHyfXW/oVD6Ch9q0f90vUejI+fwURtRpbXRu36eG2ItZVk/
         5BOfbN01nGvCjnabRO36fLw0IXd6pCp2ODR+C5tN/rIMXunCLxpcMiIa0Cdtmtwq9Gx6
         kkmbPfOQm1Daxo9jrHPP0XRZ4jTUE1Q0C2PSIET7Y4f3gbM6+R3lgj4hFU68nrbDveBD
         dXEjis5oMF3fNBJxk9YUnuHUSA3q5rYZ26tLw8wa0t9IbPyxiSsMaVyRgiUWrk7SEUkt
         1hWjYlZhMoBINvesAPsV8KG+YSeWpOCx2K3rgQdhnkxOGfmnj3+WWJ9JgkmNTVS5fWWL
         j2UA==
X-Forwarded-Encrypted: i=1; AL+hErG35VtQA/pBScAzjaPEqyDW0npwbcXym2WGYpG6Stmoc1whzBH/nkLzdvQqppB5VP5x1xEexcozRNeFn8Q8a/wo@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZAsU5vgEV3+pZZhVTJ0AgUJo2zpKFaldUzypzpx74xZ36GRSz
	5hM2qYP+xXyk55YXoVGVNjSwdNYdmdgiOtd8kwT2QqefHkkEwPkv307VqpVwmTjzz2Q=
X-Gm-Gg: AYBFou2xkEfo9yDVhGXnYpq/xcjECOmXC6oEy70CByIzUXcl2jAgrqHIXLO4UWCW/aw
	U9WqXIsZbaL9MDq5UL/vjjxOjUip9xJMGM0k3zy6j0ECxzISs3uV07zj3cXoQeY+dHnvPlYMDKS
	QEnTKdAGTDXr1Erd8cqrEoygFF29O1Che+OhjCB9wRWvuZk1cd2a1Ya7HhXr/OdG1ciQ9b4C8pF
	U+X8KARnrH/Ta5NMkxD+f+az8YeaxH48bS9dCC6sxHefP9phvhuu6YFGAxVm/8BtL85ImBGofcP
	p+WpdE3r2jnvIgUalZO5DXdSTgoJG9uTIiWWotdr4SzrlzTsCYdRd4VbyG49H6ZLRB+baOaMKYs
	UHSqMOr3mhQal2HlWLXzz14L50SqY3PxGWs5nBZYMd7pEeU34wLjcC2/aLsNGy2HHyuR7ghOX1z
	EKsebqP02v+5b33wes/X5BneveqdUWqMDptcime+6o7Ou229NfH/XZCRlHFfEGSraWDVaUX8FRi
	/lP+ex/vowhOq86rQEJ54ao78XO0P3sADMY5OKy7teZbndk88ohzAJuLClSWbjvAizUVaag+QV4
	b2/fglCwTD7yw2tbqeIjMixQowSY0j4HD1lp6s/E/0cxgTrRhLNMONjpwT9FvHtRn0I=
X-Received: by 2002:a05:6102:3f8f:b0:7d0:56e8:d146 with SMTP id ada2fe7eead31-7d301b9d300mr453525137.12.1794297474244;
        Mon, 09 Nov 2026 23:57:54 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm1194917137.9.2026.11.09.23.57.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:57:52 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so430775241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFselmIqpUnZC5jYBFVljEe0DRCoR/CnNPaIaj4bxRhr0wBLbi4Lu1y5qM5bD6MggLYobT+baKR39cnKaCfsdA3@lists.infradead.org
X-Received: by 2002:a05:6102:4190:b0:7c3:2b19:6266 with SMTP id
 ada2fe7eead31-7d301bfd9b1mr443049137.22.1794297471476; Mon, 09 Nov 2026
 23:57:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
 <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 08:57:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
X-Gm-Features: AclHuK9JsEgh5r73zJDHAyGi1UgY8FApv7iweIjEvmBZD0LvfpJpCmquM1eWYd8
Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: remove redundant pm_runtime_dont_use_autosuspend()
 calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_235756_411111_EC168BC1 
X-CRM114-Status: GOOD (  17.09  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 9 Nov 2026 at 21:51, Joshua Crofts <crofts@kernel.org> wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

