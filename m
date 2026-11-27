Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785A6606A6A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lTyIjz4/;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eJu0/bqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=; b=lTyIjz4//+jB+A
	C6l/5mAjFU2mIvWyuACwVVLcgt2WAoUdHtgwy4WLXvACxPgQq9rYew9L9TlLQcdQxRvEgvFLL2sZw
	SY+A+NzNM/WQ9vwZ7tH+zjsqO7hGPvUalQh1bl/z/h2T/KIfpF4ny3x82ROIQO5QXyJ61PXZnu7v+
	/ZT71CIlKzYPro45jaIJ8AePijuj2aqjF9112G3vPwnvrJaXiEMJ0L787KpXnIAF7kb16kYd0zrGL
	BIFmcACkzgeDMbko13E1c5vL3cY88UnQdwqgrJ+7HilUAKAp6YuxJiWDkwVGV/BMJDzhG8M8V9tx2
	1MZibjmAwznhyhHuflSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx13-0000000GYpz-1tC5;
	Fri, 27 Nov 2026 14:33:33 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx0w-0000000GYnl-0JHY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:33:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso11721044a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795790004; x=1796394804; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=eJu0/bqAzNoGO1HNlTGb7JWCsyF3v8PfV6Hdk2XcGxXixwY9+Y6o4VTcxtv2CpW/7J
         sKaYecmHNI86wiMR7El5AeL102tvKRBRsXTJekoHtCotIsuGcwxHUciIBoMRCMV/jB0U
         WSryq6Yn8ZrfXHi58lexogqRma4SZZXO6jrnFz840n7O6ivAzP2GFjEFbjBSnK+7UcUa
         mdv2peiEMoKGmcu2bdcRjtziZstBsLVg6YXQer+TK1aA8ME1trP6X/mLGdhScFdnt/nn
         omrCplvxtwH9SlGNH5RyN01ZjuJul4d4grJ5PwypWdtpJyYr2jeRxRCtYKzY0oJT4Dd/
         0EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790004; x=1796394804;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=P4X1Nysflw1E6wfshdg4W+OWGSCZyiHMErkTfY62NJ7uTpUoaOL7TgqG3tJ7AwIXuh
         /Qq5edOxiWEkEwzPPxPtjPxQLtMh5fzW4PlalJM708JXOoG82pJBBVAk5561qRs4JCG4
         Xt+SL1CLgL6WUfAhp/cVKis2hkgwBSQRjmQnA5w46WEvTpKoquh4qwJURGUfocgbyykQ
         0b/5HYiuoH+0bKlMtwuSCenJF3NJWQ9lK2jg+AiDiSyLe+RMFZHm55Wn+PndIZ2MBAss
         OYVPdnYU97mWe8lOlNMqmdGGaafSEn4EnwP0El222Bqc4gkXd5iiFbUs7KgkB9qOroTr
         mQYA==
X-Forwarded-Encrypted: i=1; AL+hErERRGEASRLmiX/UdDdhZ6Pdv9/pKD1cqNB+ci8ZXh1KOj808AQ6WgUlXVbYSg0vt48xPcGn+pPPqW8eG8cT3L+3@lists.infradead.org
X-Gm-Message-State: APuU4Z/8Z4TdPfBVh2bd/uTr+uO1mFQwY+biOZb0NQekdmL8bLZ5FGlv
	HjqaRVPkAVspoFBc0za2zzfgxDZTKoazXh3Roy3e3Jysvg5Lk62A3dogDYip4siC62mvPufTTUs
	Kkb+K
X-Gm-Gg: AZFdTZedK2pR1BTyzIGcB25ci/hGk5ckzCtryvKfoLWsFk5Wlt1l5T5S9oCdh+34rma
	9OzJYOaAsyVtLKVfv9lj16h/FrnXHWCz3pEddoQHeeWDOcP6qIJ2G33ag+HDfCsVtltaoyyp9QV
	HTPi1owtwdTWdK3Kf9rli7MQSGb/8N9oBgToIcQs5YACsJ/mX6gReNMqlioRtlHLqzY2X+F9F5H
	oj+l1rL7oL5Zr2ODNwAcJ7gfATil4033pJI+O5bHrQdzEv7S75KWE0y65+HEcT9LJMgZQ0M113C
	ZTMmHEQ/kIzMV1rFRe+dIE6GlMmt2HUdMBTDobRkyVR6eil/GK0z9Yg+SSDpQcoJQAN8BrK88Yx
	T0U3khSwjn8HnCYk7dM4zl8QlCXtUmXDEOCyLjyIdvL6lwil94lJ4XfTy/WarxvKyKsJcYw1ysI
	zdAzKjHo9abUYT4pDKbBx9DvShQQ96s9c9L8UGk8jKb9+YPu+7J0pO2a0SxjUv+E1BKtTttQbwk
	4KE/iG1IJMwKj3IlBhb86dY/aMn7aLoFjc3AuexQoHGl8sAe1TyG2742JCJdi1f6vnYtG0+ZjYq
	8WL7/fUFtt1KWII2r9stlIOTbC8eAJEdZq+tc21LhPG/Z8h0
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr13284812a12.6.1795790004077;
        Fri, 27 Nov 2026 06:33:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb9f8160ecsm72961a12.15.2026.11.27.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
Subject: Re: [PATCH v13 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Message-Id: <179578999837.3130490.1321256774164046797.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:33:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/kkh+STkW16bo61fnrALXUXLopXwJUn8icTeFUDyuzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcUzaJnLvllxStGv1dWD2t2zaPaXOLj2dHvMC8gu0yX
 moGSbc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBGnfkaG06uzPxgxWazev9T8
 nBznBSb/J5mvX23n5H1avOdw6kn1AEaG219YnyTk+92QXLDoc8rr7wv2Lb6115HvlPH6mBXGqbP
 SmQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_063326_249436_58D3F8CD 
X-CRM114-Status: UNSURE (   5.74  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-nuvoton), thanks!

[01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT legacy
        https://git.kernel.org/clk/linux/c/5cb3fcb3a35e
[02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
        https://git.kernel.org/clk/linux/c/4df94650b44a
[03/10] clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
        https://git.kernel.org/clk/linux/c/88997515be60
[04/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible
        https://git.kernel.org/clk/linux/c/4154c8b3d3bc
[05/10] clk: nuvoton: ma35d1: Reparent the gates correctly
        https://git.kernel.org/clk/linux/c/1c2214475dce
[06/10] clk: nuvoton: ma35d1: Use device managed helpers for fixed rate clocks
        https://git.kernel.org/clk/linux/c/c31aa10b3ca6
[07/10] clk: Create devm_clk_hw_register_fixed_rate_parent_hw()
        https://git.kernel.org/clk/linux/c/5093f6f2543f
[08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
        https://git.kernel.org/clk/linux/c/107caca779a5
[09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
        https://git.kernel.org/clk/linux/c/6f6ef44a950a
[10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock controller maintainer
        https://git.kernel.org/clk/linux/c/350f54ff5b92

Best regards,
--
Jerome


