Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BhOZpNgM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqqoWWGw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1rqNf8DXGNQhqw2bih7fwgNOK1pcQshJVyfz+w/p2OQ=; b=BhOZpNgMQDLacQ
	flB9BOqPrJrlyR7uTFdWGYlsIVg3Rpush6JeUANDHQ1pA//0vcicCYE2dC1aHiNFYvj1jOXNlqbal
	fiy8aXofXUK6Pp+yuDekm+SWjNwuZRUnOl+9huMmfJNGnvlj4CKmmBlA7I/bJg5lT5TZV6vFHCVFV
	C5YsRKQvUUX/v4/VFXWp0BHCFWfz8U8iUCpC5NPrqypM0wsrbTd+WWyt/17dLiYBAKYQX/83K2WMk
	D2Y/keek6FV56cU4BSXviTBggPZanj7at/4NcnNnqTzqx0k69o5TEGO1hObVOebXT1diDn+tVR1oi
	DfT97gP4saLpSksigxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoQi-00000006IbZ-3ODQ;
	Tue, 24 Nov 2026 11:11:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoQh-00000006IbT-2l0W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AC1F400B8;
	Tue, 24 Nov 2026 11:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAB21F000CF;
	Tue, 24 Nov 2026 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518679;
	bh=1rqNf8DXGNQhqw2bih7fwgNOK1pcQshJVyfz+w/p2OQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=RqqoWWGw67GYLOmMSjE1QWBRPSUWfGQ8kWt9YhLbw5DS1OisElprZEGF8xg+XEd12
	 s0YHXYp1l8YS5l/5cV6jk9TtUQMdDG4xqzVC4vOPFYdVQiyBjjJHqJ5XMvLhvOZ7MO
	 L5rhf2p8SXaYV01/HNVOVitc5z8hcVxnpC5czGdP/EDKHSP4dzJCkf62nNWrceUA23
	 ndYkr8wNrB0/EaxEPSMgjUl38blK2q08JlSA46vFsWMMJcZ2KlcNoBFOz2knAS3Jmt
	 ehUkdH2i6DOn/9iBh7fwcByyR9syanl+58sj/o5SFlvBsKypHcI3SRZQnhIBTbFP0a
	 N5eLpsd1K136A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 94725198003A;
	Tue, 24 Nov 2026 06:11:16 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 06:11:16 -0500
X-ME-Sender: <xms:0nAFa9VWpW9uJ8l3_D_wUyXrLfEw6nZFJrWYwSxf7tyIYxR8t3pO8g>
    <xme:0nAFa4YqVLPzf9glM33mF1LlFbs5RmaN917HnaLE5NJE1Vq8U5ZQ4mH1-qg5P_P73
    CoQDqPMBx7YE5PMX2oezf6FIyp5FgoijhkY1aCCcRL99yhmyOU-zxKw>
X-ME-Proxy-Cause: dmFkZTG2GcUkH5HHLMhct1sPKBX/cvn14gnx/Zs5RxgF/vwxnqVC7OvwHkd6wuE4GcD9ky
    kRzDtGLVdMQcN8kYRoZqDWL0uAGk/o7e9bb5OAG7qknYM7UNRdnsENPTEEVJKgDyXJno6l
    bgx84+1O0w4cYTPvoC0eCRYyR6ogh2YWGpNYnS0kmry0nTczFzbr+sYV0LjU9JLrqzqyMN
    4KlY2L8+oGGS1qeVJ0SXOV75QItRRh4YX6xxkPVQre43Ykn4QJ59Q035JFqF5G6d27ORco
    WaQnsxCel3SAI5SivSgCPbwecghpNiJjS6nEtRGIRXwBxe97uBg5mWi+XTwG+bQ/mjXflv
    MMyLGr+y83jLAVuy8fr4rn0oNCeDOkztoNGxND0NHSTPg6lNbBWs0hqmyGv+UlAk4UZCBp
    tOaCDuzdyCEEfJB/8xZ7tLEQtNeyifI97q/Q1qeTi1nAl7i9r3pizuX6BjJyaJdwWhRc23
    WRgAZ96E4BPI1sz4Eqguxz7wn0ln/dqwXOFdXFYaCsSz3LJKgWLl32TNlGR9bQkZzGDFX/
    0KxqqmoAGi1vxy/+IC+N2M7h5rtL2XFQ4pUShztbrmwqzPF2o6PMc6s9YTWxkll8Uq1EOd
    MJgoKd2inbIY/5OgskcHbOG2UCbVor7hQIhuM9AXkcPu1hXUyesz/kYZeAsg
X-ME-Proxy: <xmx:1HAFa9uls_ezzIOPSG0VqpxzrQnE4h37fDp7j0p-208zhq9yxJIwGQ>
    <xmx:1HAFa3LOEz2ezP-8pqmMUwR4R1KRmAHMTsYypqQrY4TBPtJEVRsbwQ>
    <xmx:1HAFa-8mtkEL-DzR98a6Nmr8ZFujkjOxtTZrKjb5URQaChJvip58nQ>
    <xmx:1HAFa4ytKhqb1psvaagNiCMpBDDJPpvSgs7IESZIsErfNIjF4whDCg>
    <xmx:1HAFaz4IAlX6UO_erPKikg5noWxOS-bLp4i5XjChbTR0u9RBP1gjdeId>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DCC92F80093; Tue, 24 Nov 2026 06:11:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:10:53 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org,
 "Emanuele Rocca" <emanuele.rocca@arm.com>
Message-Id: <f87eccd7-f9a8-4e94-8fad-603703eb8bc8@app.fastmail.com>
In-Reply-To: <20261114211019.80609-1-ebiggers@kernel.org>
References: <20261114211019.80609-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64/sm3: Use assembler for sm3 instructions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Sat, 14 Nov 2026, at 22:10, Eric Biggers wrote:
> All supported assemblers (binutils 2.30 and later, and clang 17.0.1 and
> later) support the sm3 instructions now.
>
> Therefore, drop the use of '.inst' in sm3-ce-core.S and just have the
> assembler generate the instructions.
>
> This requires adding '.arch armv8.2-a+sm4'.  (Yes, the assemblers want
> sm4, not sm3.)  I also tried just '.arch_extension sm4', but that
> doesn't work with binutils 2.40 and earlier because they consider sm3 to
> depend on armv8.2-a or later (and this file isn't built with
> -march=armv8.2-a or later).  This was fixed in binutils 2.41 commit
> 205e4380c800, but the kernel currently supports binutils 2.30 and later.
>
> No change in the resulting .text section with either binutils or clang.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is intended to be taken through libcrypto-next
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

