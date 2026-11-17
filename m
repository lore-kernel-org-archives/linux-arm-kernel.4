Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A16606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TDLVPaZX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNai+9v8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sUnKsuDGKFImQsuMY/DHbO5AZYpcq2an3IW8zzTpUo8=; b=TDLVPaZXmyAeYCWtq4p5frQ59r
	clM9xlAFvfSS02r1FhUBU4XRJBUzE4rg4gIQ2Zv3vqiYWQo7aOkevPFv4Roq+hxUSScZIbpk8aJGE
	kMOI/unnK4sqCk39IPeohCD7WYrABujjS98ybJyU1PrIcTd6m/x/X3pOcRKRY1OlPaLH7ZRK1A6c+
	Ui/7t9yyKGO+J2ltR1p3uJxpfIYRFL0bRZ7JOvYMOX/RncNixBsqG8MrX7kPEkYgH1SpWYgKlbM3f
	J9QzHa7gfkIjv0hRtcfVj9FgrpPDHCjd9GB4sD0mYKUgIRyzt4QCw0+KdtRszoBmiTrd0mznhdlYv
	fTZa3+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEcN-00000004twx-0ECJ;
	Tue, 17 Nov 2026 08:32:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEcL-00000004twn-3zEl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:32:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id EE70762E6C;
	Tue, 17 Nov 2026 08:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 006551F000C4;
	Tue, 17 Nov 2026 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904360;
	bh=sUnKsuDGKFImQsuMY/DHbO5AZYpcq2an3IW8zzTpUo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eNai+9v8+RaoNiuRSFvmegAXjAMPmru/wvqVSCDMJbYCKrktLLRcl0rI8BU4X/LHR
	 GhRqi2Rk3U/JVMaUPv+w+DsF5nuIajLtggeUFQK0eXyQ19ikXbAW5OOMoSDYpEilu8
	 f48TdLGe1c+SYYciXV/KwKweBQW0FglSXswuV5UfaY99CBJFT64TF5KnxOUL/cT1MJ
	 2spAL5weAcQ/z63d/fcamlFPtFYTecsTHNjeGw1LoP+wLgqrm9+RYrjtJlZny6B9ts
	 ZClRUPQybqkE+YTT1k7SWJmiBRZjLR3dlxTaM/er66wvit52x/5kDoM+hhorKZhGry
	 pfOut5SZb+2qA==
Date: Tue, 17 Nov 2026 09:32:37 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij <linusw@kernel.org>, linux-fsi@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <bdsajtpcyfh6slwpwvi34uabych3gzlvibw7yvpieg2345xcxs@2qr6ect74cfc>
References: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
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

On Tue, Nov 03, 2026 at 02:20:42PM +0100, Bartosz Golaszewski wrote:
> There are no users that share fsi-routing-gpios in any of the upstream
> DT sources. Even if there were, the right thing to do would be enable
> HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
> of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
> flag is now deprecated and will be removed.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi!

Gentle ping for this.

Thanks,
Bartosz

