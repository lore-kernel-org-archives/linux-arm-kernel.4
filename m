Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWAlzqXy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9KB8bNW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mmhdqFI00N1WBlVnl/3cbJ793dbxFER3bru1NLYoAdQ=; b=pWAlzqXytaove6Ps2A0yvpJvnH
	Zydk7z5ZQ7w8mfeeFDF+ILH52cB9uVLUsl3WMcGVExIWQ7w3tDW+SRaiYfzsZPuAde2dFJgwTeMqZ
	G/PykTmelhJtvgXsHNB/NLNkw/n9pAU7+EVG4qSTzBPOjW0QIZg5WA7LXI6MPBJcmCLmGsdmEwTHN
	fzH8Dbk5M7drVu7yvqNRRubI7mM5m7/Gmrdw0GN6NthhHs1ZAx0/G6bE+pGc2K7+hKT3O0Ob3ZTu9
	pt6BXUAlFEPHUz5ZphUixTdGULTbdhjd65Ikqbvsig/svXrMSQAx7dzLW4RJd5x7t3vG9t9l+y4FG
	WpQLc/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaBi-0000000DTlQ-3kCa;
	Thu, 26 Nov 2026 14:11:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaBe-0000000DTk0-0jR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:11:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C282D43450;
	Thu, 26 Nov 2026 14:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B813A1F000EE;
	Thu, 26 Nov 2026 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702257;
	bh=mmhdqFI00N1WBlVnl/3cbJ793dbxFER3bru1NLYoAdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U9KB8bNWd9736dk/QI6XKLJjRYslrkd8KUeSXKqHqSbtayZiQGSalZq70LYAEGGwD
	 xSrpz3rzgTpnCGUcVA3+yiVkaourMgSk/mSYNUaaO/BVf+HypFVwooM02RvQm59eQQ
	 q7hg+bTb9YxPzMGZWFlINbuYMwFNG3edahazUhwKTY6Mnx3II9kfjbnh0zAwCr0LOf
	 oebPmei6y/82sNcAt/XiWg/KVWZeAaGfUtad1YqAff8ZK6GnbPWStx/1P9ZX8zfPro
	 0GGXzEsx05hK/p6f5Ht7NomI0PEZvM1jFrXmSYlOsQfccWN+BmFaNgW6ezvDEE5x6v
	 BU1l5fmAtNDHA==
Date: Thu, 26 Nov 2026 15:10:53 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: aspeed: Fix potential coprocessor bank map leak
Message-ID: <st3vyhktf65rk3jzhxdefjnhsl6xxqhsu6dvi7pbudppfgt3jg@qon74p7q44vw>
References: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 09:58:32PM +0800, Guangshuo Li wrote:
> The coprocessor bank map is allocated lazily but is never freed when
> the GPIO controller is removed. Its only owner is the device-managed
> GPIO private data.
> 
> Allocate the map with the controller's managed resources before
> registering the GPIO chip, so chip removal finishes before the map
> is freed. Round up the bank count to cover a partial last bank.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: a7ca13826e47 ("gpio: aspeed: Add interfaces for co-processor to grab GPIOs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Changes in v2:
>   - Use a managed array allocation instead of a cleanup action.
>   - Allocate before GPIO-chip registration so teardown callbacks finish
>     before the bank map is freed.
>   - Round up the array size to cover a partial last bank.

Please also include a lore link to the previous versions in the
changelog.

Bart

