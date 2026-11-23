Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA460A2607
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZi4pzIN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmRWDqC5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R020g54OZZm83YeqwM84l5L4106wrL7JprwR9fNpr1w=; b=qZi4pzINrcxAYEfJ8OG4sfwkbu
	Bbqbjb5t++gPx31lT5hHHG034sDRVbgNkLxLZkfHBAMAMdT7xmEHOMgJj887OAw7HkCPLontQF682
	UhnG8byL9q2ZO/RL7FqNBWaE4t0YNeAhJr7JsasiMaSNqyP0jHRkBPISIjOisepU54msklGmXofhQ
	ezhc8jcdbVBV6QGgDquGuJgu8gqQ7GhMBPILKhjXcsbmSryURi5LwNTmrLYhGSv/OMDEmGeD835GB
	0OuTp0gf6R9e03PLxFLYRCNSmBVErm+lV5OwQxQvrth9IKMQoyiX7Qm5CD1+Fh5fYh2OTeTEZUoqA
	DnMEwP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVzq-00000003zZF-04Tp;
	Mon, 23 Nov 2026 15:30:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVz4-00000003zKK-0vIX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:29:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 54F1D622F4;
	Mon, 23 Nov 2026 15:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F262F1F00A00;
	Mon, 23 Nov 2026 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447772;
	bh=R020g54OZZm83YeqwM84l5L4106wrL7JprwR9fNpr1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kmRWDqC5dXQeZvZlh8qlBEYVX2C4qge3Vx5LcqUOzLbGhOXUzSCBBvmBQ3/FYP4QI
	 9fH4LRaObVabwwJsjL54XiIoxXVtOhguSEki4tToCARmQaLQfLLD1vcvo7v2ptTcAx
	 W2fwJqLRWgQjOJ+cNomsUK4IZRtamaNcqp63tOvpSgDJKtAUCPqoSUO2A7vCf/TboV
	 sgGAQC9YQxJ/2pyJ1bBY6CNN9um1SVzoe/jnXHqY5mn37KuwBIU/Dm66uI7NvwCL7a
	 /DMLgdTEw70bOxRpEWMuDt4RufIOFgiaIuGI+A2LOr+jAbMRMcwhR6LRRaZUKDRl+C
	 BsbVpXEi+F00Q==
Date: Mon, 23 Nov 2026 16:29:28 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v12 1/4] crypto: qce - convert to auxiliary bus
Message-ID: <sfsgrwaj6ichkuafqvrpmql67664x6vyxgz7lwjxhywbf5zc3l@edz4qooziklt>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-1-b5a2a44bc5ae@oss.qualcomm.com>
 <c26b8002-c246-45cb-bca0-8f596a2a425b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c26b8002-c246-45cb-bca0-8f596a2a425b@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2026 20:34, Bartosz Golaszewski wrote:
> > This driver is disabled in arm64 defconfig but one of its
> 
> That's true for next, but your patch #3 seems to disagree. That's
> confusing. Maybe you meant disabled for arm64 platforms or marked as
> broken? Because anyway defconfig does not matter here - even if drivers
> are not enabled in defconfig (so stay disabled), they should not be
> affected with unbisectable changes.
>

Keeping this fully bisectable (it is build-time bisectable actually)
would mean squashing all 4 patches together. If nobody objects, I can do
this of course.

Bart

