Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B154606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kh8XFHP7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA6J47+e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=; b=Kh8XFHP7JfqGWpIGAcWqKusgCO
	mIU8NPEX0/65hXrAYdVU5/VhYcL92HPReXSyV9LbAeUeWp8a242MhR7PsoCHVSZ+Uo1GgQtEd7cSF
	TCoKDjVKX6GwFX1Dbqxkyoa2J47dyF7zIZV/X+8i1iAzMdGnewqXdPYjJEFIESP+eXV6UUTBBzr51
	LxmkIMCkm6AJBz7k/K87z6eiCWLBAU5PSOoRzhrvRQEr752FgOrS+FaEV18UAexiui+Y+p/wXz7gT
	a8OamGVDopmNj8HoYu8D+mX/8PHjOCcZXw0KDfqJtAjJUxsQUf11CAQjQ4AUj2bVhVj17ehnyGp5Z
	WeUNGrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxlW-00000002tGo-3PYH;
	Mon, 16 Nov 2026 14:33:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxlT-00000002tFC-3erq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:33:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5be47aa555cso3882500e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794839576; cv=none;
        d=google.com; s=arc-20260327;
        b=TTWPXQRJlMVrCLGvW/cKNHKvkuKXbhfeSRvcH7KvOd+ACHwz8Gn6hnPpkVjYb+KTaV
         +3eY5yuOZ2IExqspoxZCNMEn1hVAfYd4FR8lpkHodSwkU5/h8el27AbrReJyygBPu8gM
         i2U564jIGgKXFtTS8I2+OWT68aBq/g02Z2wx1ka4z4i5FTszos71/ffl+uoL9S+H/HL8
         QVV8kcWzb/DHv5ljlKQkL2iC/8Bk5qh5Esjz8WAb3fKboccwqymjfeN7oPFofcrooIRZ
         fpMo347g47KSPJwX7Tu1DqoDPt3bjkr3lQBoHGR81++S6mHSzTuSqHPQ3KKpxHUlGiqP
         95Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
        fh=CsYv8ryLeHhlJcSpY3DemaqCcfTTaHfa/xpKF5pGrJ8=;
        b=TQv3yIIhXSx8fAAS2UNdypXKLIhMiz/1iT2M3jtS6U7h48gME3xbwO9Grnggk4JQV2
         +VttrItWlqUQANIl/pK8XWggp7woQsGLQGByhCJxOThzz9C0PUZe3/4eMLjYhR7yIiO6
         2XFYLK14dp7imzaYjlJg1/J4bVHlusOu9setGopu/5hgeQRss3YyqymchsiZmLP9nIgn
         7Han5eutsnMUs1OOPv3pdLdVHeBEUT0s9CcPR+4+dMo7OW7R4KQbtXAM1PU6k3NkIDnK
         Vt7ofevJFe76h7H0P8KmjA/KwqR7RajBbrGeI+e7OVr5zZgMlycCP5a476StBPTlYkK6
         Hl/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839576; x=1795444376; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
        b=DA6J47+eX1+nlcJzRKjyqiSTx4SiCW7beW5juGHrUDQd1ayqOhDhjASXewyAph5UZf
         DQqc8s/2MHwU98H5vjhovqz14b9z+nH8s0wB0CajlKjkrFl1LkzUW/SKj5XAp6Dv4NyK
         hLffYGyFMmiTOgewGtMDYA0WkUIoKKyj/I/l17AHLljMUQ2gPAfCdQebKNHbJ+3Ogtr9
         La/JtrJs5FljfuLriZjsmcbvXVirhFfCYB/jAUq+d2+6s8/v7rkl3f2RLdfP2CTDTC2y
         I3M2wLAkahfCMBFGCzeGw9mrsx/G4wuGPKPgn35RR5u0dVre/qf1Jy/XF6VbtVy6qSW1
         oNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839576; x=1795444376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9B94QbPDjaKKQtAC6TsJzJpuRtomQi1ExQZgwuOqbU=;
        b=xtXN/4J3jLHijtSBCBVR36Lo/oiEjLqfqyj7rnKuxMtBG0RunfXJtNWlth7u33Fq+s
         PItD9QJzFCC/Pe6AHhm89DG4WjfiO2nNa/zmxIYrFkDFv5n4komN4GaBw/rB7DI967Pz
         FVUrHq6sXxk6vIMdiLoNOjLT4r1pzz65CAy2NI3C0M5DDQ05IW3qX+9+JWSo9xxg+yfV
         AaqGKpmtma5bQuye8milxF6gytwJH3JMatqrc2XNZtSaExZgMcLoscburm42A/mFfg0o
         VOr+8Z4gNmOmzTfNimbqHPSAMW08di/R4qYSM+XTRvP5l2p/LzV5jz6OkrchLBOGPP7N
         spDQ==
X-Forwarded-Encrypted: i=1; AL+hErGwDmQllEjcZ5T9Ue6lq5uduFr3D/h9z8gaNzlk7sMpZ4SlanHRmUFotzUd5gy0UGIFcEACiyHF6AfGdhNwtunE@lists.infradead.org
X-Gm-Message-State: APuU4Z/JyDWDdoc1/eSkrmwRnEorBDYIgUVYlwU/+ta3jlZvmEUWWYld
	E5f5ZcnMeav1m38d+3AsNrbUdIeAIqQAPZ2WtEoqeN0EIXZK7dsxAJ39GX0OQbs3cczeUKr0gDb
	1RFrlmECvsxXrQ0zaZi5+322uXl6mvvix5Q==
X-Gm-Gg: AYBFou1ApZtAYkCtDHKIiLuvv4VMPUWKUS/FmK5MfLLfH2dbh51MyJL+hp+F3Ilz2qf
	XTrfVgCd68eoyIf7XbCWXeDRTfKcvWPMferB5DcusvwplBE8WZ9gXE4h42k0jCCzsySoSlOQO15
	Kt4onRGr9BBo3hb0acL16T0Az1JcqY0dO4gho+dasNgYoJObJk6rhtQX4asQdbpMjiUScjC6vD9
	DoVJZoUTQNUXXa85Yl2k2a0uiUudeBXJbXelRDNnOwth9mUiAGFnbrz21X5CzUcDc4kpM/37QBp
	3aJQuazEXFaMAxwpJa00uhF8l6kvKyDQA5EtPZmudF1zhnIH5kTVV46kOabJRyUl7saaw+unE/f
	Q39mc4ub4TiAKTKMpi+zoBteS7qhqsAvZ+gmcgmueU9eWCYseZnCIB+xjcvr87FjZp/CoFeWwpL
	HK4otqXGOpKSz3fr7+04ELiyu0EPyOwuuYY5kuHQfHB6OkQlJyleo1hpB3vTR3t7YVRa5Z2N3+U
	tqOVe5UurmH0K2JKUvR3J4xDZ7ePFaZOriQQuq2zfEl52avmSIfXrgN4yj++dJ3RdWcECRtik2k
	WyaUXpWksRax4gR17fKaXsVRHfRgNjs=
X-Received: by 2002:a05:6512:31d2:b0:5c1:4c0a:49d9 with SMTP id
 2adb3069b0e04-5c1709aed3emr4514975e87.16.1794839576049; Mon, 16 Nov 2026
 06:32:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 16 Nov 2026 15:32:45 +0100
X-Gm-Features: AclHuK_LmPF6GdpEB1OKtm5HFOhuVUEo0FmsAXlPZr3XF_GhyxB157Z16Flkh34
Message-ID: <CALoEA-x+TpMdsE-e7M9+9K0wu0kgbwDdP02QsMZ49nnnahxxnw@mail.gmail.com>
Subject: Re: [PATCH 0/5] tty: serial: remove redundant pm_runtime_dont_use_autosuspend()
 calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063259_926590_1C115EE2 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -1.9 (-)
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

On Sat, 31 Oct 2026 at 18:10, Joshua Crofts <crofts@kernel.org> wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
> Joshua Crofts (5):
>       serial: 8250_omap: remove redunant pm_runtime_dont_use_autosuspend() calls
>       serial: fsl_lpuart: remove redundant pm_runtime_dont_use_autosuspend() calls
>       serial: xilinx_uartps: remove redundant pm_runtime_dont_use_autosuspend() calls
>       serial: port: remove redundant pm_runtime_dont_use_autosuspend() calls
>       serial: uartlite: remove redundant pm_runtime_dont_use_autosuspend() calls
>
>  drivers/tty/serial/8250/8250_omap.c | 2 --
>  drivers/tty/serial/fsl_lpuart.c     | 2 --
>  drivers/tty/serial/serial_port.c    | 1 -
>  drivers/tty/serial/uartlite.c       | 1 -
>  drivers/tty/serial/xilinx_uartps.c  | 2 --
>  5 files changed, 8 deletions(-)

Hi, gentle ping on this series, thanks!

--
Kind regards,
Joshua Crofts

