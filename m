Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88936606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4E38XhO1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpB8sVrd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=; b=4E38XhO10SJrsEtwO0zklUtE8H
	LYuz+B0SjvN4p7S5mUCt5UAy+AOrHIL9zlcvX+677PDfRaFwzxHBSGsnADvH7S42WbYH0HoDNuLqa
	AxY6sXuGNLtRk0BJgi6pU9mCgbOKXt68QBgOlrlfh3tsJ/W7bE4vXxkRAL8HgA/o4AT5nchBgrSq8
	0nUzG124NZYsLbvZ0It0PKx+QbuHJKv/B+Bd0ea9DRs3KYSB7JB7nKidt+1taJ2eFgoFBZY1zxj9e
	Nr4KgM7J7eiu2gLSsbcMe9hBoMcy5n6XyBMe0LJjLZbEY/4p0Dae94Pko/blP0TBo1dAHplRDiJBw
	LrGrcVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReGx-0000000BFWa-29Vo;
	Thu, 12 Nov 2026 23:32:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReGt-0000000BFWA-0inf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:32:01 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso184698a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794526318; x=1795131118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
        b=LpB8sVrdWUYq7Ahw9L7fUPJBYX3Bl6Gh6zIx6S3QNJO/2t9L+SWdVwKR1sKjtaikJS
         +sviBYnAqdigqtZLzW2DroFtx7A4vOoFJ7l2gJDC3ENQuZ3P/CGyHh9A0WvgNMKPH09w
         Al5Xq1ppiVKBtnYurO3pmfxlh/UJKRqJeZFrh2VrymljV8BiH5idqh04HzCnJrNa0bHa
         d0G9UG0fSq9iXCd+72d4k7u7MQ16pqKGSmhAbOmRIEYgLT0uFI8RrgPuQNP+ZYdFT/qw
         IfMRUjqdmDrgXKY9KAdm9IwLpI3fUfSV7o4v6Un9lD0tZbNCNA+fh3eNyGNUrr54E5e6
         1Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526318; x=1795131118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
        b=Wy2IpDyBQ4QRy9gskLsjNnxanOz9/hnJbnDWYGDYsZMIF1X7f8n4+m88ZO0CV8ZIMP
         dXF4XB5REhAS3Z7+LLAnJh2oKGm3BQot/2jCTljJD99k2KmxGva2j6LJPXqSXifb/+XV
         otGuyhK0brwEptpPKTq7mJ8IfGKZpjYiediSB3rCF2Vxfy2bqm2cnSb4YK2+q2WqC44v
         LCGVy32+zWqOr8xM7DIgldYmmAiJsW86iKq4LKHinlvMajKlxp7q8cfEjgyHvcJQAmHX
         ZQtm1V24b/kAqmX7zcUjtPc6WZBiAMhjXrnD/5SV/7RowmRMDPc/r66/nuRB46+EV6ag
         boaA==
X-Forwarded-Encrypted: i=1; AL+hErExkwAA5bc6RUQXh2gJkkWXlzQtMxgd5P+58vjd9hWcRIdUiSiTHGNzcxBkLPEQcfOZhAgPcUNMTlRQUllEpBBe@lists.infradead.org
X-Gm-Message-State: APuU4Z9T+f63Dn0FIBbdqVcLOOVGrvTdQqF6a6xP50CUi5VdWDwNswwF
	8r9fmqKOzI+O7cP8ckHonv16abpiIDAA1X04EZ6mWjnKyscSody5kgAP
X-Gm-Gg: AYBFou17pyi+7j02TaggglVevPmZptnhI5cbFClyuf2tAiX9wPb/LP/OsDNs9vwCKKu
	tFDsVdnKJJTSRv1CYkOUlJT/WQARcOFwAqhLqWYk4HIkTBWRBJ0sYsNzoXoqSayabABW8fMX2P+
	FIlZLDI4y1zJyV5MyexHktDEHXl3EQYsdGIkcQFSI96Kl0TSUxyqxiljnwEE0XrbONNucm71/gU
	QNqGXo4cZoh1K1x9fRb0vVnibqrsMhMiVMBNg752jmMLcu8nSwNhg4xnyaT4oHKiw2O8bl5YDGW
	o3juu8Y8FfLI/DvcUK8ni8cjXirxp+EZnzJBFJ1oLMVg5OLUAlYTN0PQnKGb1RArfrGu6J+Epgt
	0AHPBEfULqyz2bw96iONnUwWM2d0BI3rn7bc4trrrg8uBdIH7NG1sMkAmsU8jJ3jQWQdgYVd9Gc
	F8DfubD67W3+h1J4mh0vjlR8jXJa3+DUyN5QFxaVBEOsvRXGBMc3wnVksURY9+JOnYciIB4VtCo
	0T6tQHwDF4nUcpMKAvkfERR3Tn1jc3L9d+sONBgWXVPqxOuHKyZmVm6i+7Zf2HE9SL5429B4lxG
	qyuML1gfnrbtf+3hHgf6N8RuRXx/dtfD1M+TzJR2VnHGY2G6GDk1Dhc4R9aQIu9tuwX20FcagYv
	712TSYYXXpbT7xIR1aQPj3o79GGMH
X-Received: by 2002:a05:6a21:6f09:b0:3e8:b7fd:6265 with SMTP id adf61e73a8af0-3f7a72ba1d5mr589620637.23.1794526318165;
        Thu, 12 Nov 2026 15:31:58 -0800 (PST)
Received: from prox-debian13-dev.listerlab.win (203-96-142-148.dsl-dynamic.connections.net.nz. [203.96.142.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18adce4sm317815a12.23.2026.11.12.15.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:31:57 -0800 (PST)
Date: Fri, 13 Nov 2026 12:31:37 +1300
From: Patrick Lister <patrick.lister.dev@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Nick Clifton <nickc@redhat.com>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Message-ID: <avZMWY2UBFdBLrqW@prox-debian13-dev.listerlab.win>
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
 <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_153159_209236_F6413DC3 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Nov 12, 2026 at 08:58:53AM +0100, Arnd Bergmann wrote:
> The patch looks fine, and it's clearly harmless to merge as there
> are no users, so please add it to the patch tracker according to
> the instructions at https://www.arm.linux.org.uk/developer/patches/info.php

I have submitted patch 9527/1 as requested, thanks!

