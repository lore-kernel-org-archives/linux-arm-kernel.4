Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A89606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YhbBsuB0;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=csfJhc/R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=beeIhfgcQV7TlBjZN1ejJeypNbQ1lSiL1HUsOsG1ZJo=; b=YhbBsuB0RbnXzb
	NJu8ztCQsLKiEDHV8HJl9FlZz3xrwZeLHMgW30OGmZU1ytiywZJowEN60piyLBMAVjOVXQZN/SCLj
	L/gi6EP6VcbvfqqtxdmMyzK/vDeXrXh0xeMBfV6kTZcqaJlL0BOzZ/Zs7OjsXQ8o8snXghU15Qvwp
	teOA0fwVgH9SehA1iyttl5H9K5Pwi8gBl/pKFzTgjZ+QEj6JyDRmuP6nG382OCmK0qivUQC8uxqUD
	HzBSXn67Iy9jMsqEJTaF7Z5Hxin1yW49HDp6Xj1HkEUJOZbdqKSbyOwG3qHeqCIYqOa3q1ZLoBvoI
	+ycy5tMUULI5grTWHy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKEr-000000000hD-31Uz;
	Mon, 09 Nov 2026 07:56:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKEo-000000000gl-20Om
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794210977;
	bh=beeIhfgcQV7TlBjZN1ejJeypNbQ1lSiL1HUsOsG1ZJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=csfJhc/RRIoGZu7NmjEN/JlExsYIdCdDjKFGP0WrTXnd3adCSzQbtobaJH3CpJA9I
	 u+RvCSBmdHeUB9sXQNuzyFxnHpapWHIJ2XIttm1J8nas+c6Gl2u0R3rx2oQAC7jNhs
	 lUysmms+0Yj/NDFsZq5EisAgR3CMlnMfNeTl6eGUZ1AVxBo8GN1Fq24d56sX5kqcuI
	 KNn+acHpfiLjsn1e/Gs8OQuW+nIc+2OO/B19NI15C0rImroGXiMuixw0dXw3hKedAx
	 Foj9ZL6zIMdy6aUk+aGAReLEbqVl99A5bIPR6Hwt8GgHC7tHHMkZDAd5T3vD30pT9A
	 M+DmoNhnFGbMg==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B62156495E;
	Mon,  9 Nov 2026 15:56:15 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Renze Nicolai <renze@rnplus.nl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: x570d4u: devicetree fixes and
 cleanups
Message-Id: <179421097567.853200.13340616110295498836.b4-ty@b4>
Date: Mon, 09 Nov 2026 18:26:15 +1030
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_235623_200714_68CD94F1 
X-CRM114-Status: GOOD (  11.54  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 21:33:01 +0100, Renze Nicolai wrote:
> A handful of independent fixes and cleanups for the ASRock X570D4U
> BMC devicetree, found while working on OpenBMC support for the board:
> 
>  - Remove the w83773g temperature sensor node, which is only present
>    on 10GbE variants of the board and should not be instantiated
>    unconditionally.
>  - Fix the tachometer channel assignments for FAN4-FAN6, which did
>    not match the board's actual PWM wiring and produced incorrect
>    fan speed readings.
>  - Give the eth0/eth1 MAC address nvmem cells unique node names, since
>    they previously both resolved to the same NVMEM cell name once the
>    unit address is stripped.
>  - Add gpio-line-names entries for a few GPIO lines (NMI, BIOS
>    chip-select, LPC reset, hard power-off) that were previously
>    unnamed.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


