Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01796606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RMknMqbz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMSMishb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lbGYiPDuIZCD0wowch3/zCTgY7l065ITvzcpq4lCQS8=; b=RMknMqbzqt10kF
	5v5B9z5rAnIcVR/xEbqWkTRa9Oq5pvBekUMGXll/8rGCoD691HGufgAXcugz88xPHM0HAn1t2N5U1
	Hl8DvqtfghajY6ahL4HSuvbNWTpOziClaAWdm5pY5muwmhINWVcLM2pgkyEsKcvSse316i8IKXYnw
	CHGNXIN/+DD2EPdb9oijZMQDCvqzW46ULCV5+tGRKsXo39gOWbQ+19nLbGyUv+GpKVzXXb8jjr8bb
	Fp0/3m8wa1HkaZq3PhHT6euRE5MWO2nDwVNRMzEOMZ2PVro93Rl4oyOlf5hjqw0s+VjvxOpfTIYLz
	JIercNeKPQtRBKtBY9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rD-0000000HRTG-3G67;
	Fri, 27 Nov 2026 18:39:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rC-0000000HRS9-0EOl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26ACD61B43;
	Fri, 27 Nov 2026 18:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBD91F000C1;
	Fri, 27 Nov 2026 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804776;
	bh=lbGYiPDuIZCD0wowch3/zCTgY7l065ITvzcpq4lCQS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aMSMishbltparIC+hpsli24VvITjp1M33HJP+WuWlal3p7XEew/5qkThNmFNd90IE
	 ZzGdDtcgNMr3vPqcGMBu5Y5tN4Sz/NhfdrAICTvD8Ws9bQ/Q+sihCq2LFgUjixMCvz
	 tHdcAW7I7mCizl3zCTDm5pjNoHL1OAHPMuMcCegNXjhBJxUjBrmt6WF+N5ZGg0kfA1
	 7iCLgKLvGgLC39k7vRirqqmXZzISgvS6u41+IQpCndXq2vavKrJIW4vKMAImTvcINy
	 OJ5YxEaayf3JmDVevVhfJuSZQwTSo9UHo+b7LZbKQv40xDxmvXsUmesnhiOnLWRyBI
	 fU1y+2OsCUzWw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Use property length in get_bootargs_cmdline()
Date: Fri, 27 Nov 2026 18:39:11 +0000
Message-ID: <179580045521.1450371.14748209917362714057.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015192810.395975-2-blum@kernel.org>
References: <20261015192810.395975-2-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 15 Oct 2026 21:28:08 +0200, Thorsten Blum wrote:
> fdt_getprop() already provides the length of the bootargs property. Use
> it to reject a zero-length property before dereferencing it, and test
> the first byte directly instead of calling strlen().
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: idreg-override: Use property length in get_bootargs_cmdline()
      https://git.kernel.org/arm64/c/cfebe741eb91

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

