Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D324606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUdAj04X;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+oYj628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AKE9hZpQGszWx/7HA8tIwIZOKLxBkMhWpBT53qbuBGk=; b=LUdAj04X2MIlUE
	T2FkLxE2armA+9UBS0KBkS9oPVvqwz5JsrNsOle2QZxIErM8EPLEGxFFgzGMGdvSiMxBUxKZQRVpV
	Q8OCHv1bATbvUS07r+EGZLj+OpY94AEw6rltT00mRDjAuCjhp0vCNFnj7RABjnbkcMO6xfXhLBmUR
	9BaVEb6awrl4TLm72OZ5Igm8nVVpuB9G/6Ci4NH9PGQSVD3boQmLlacBO++xXSc4j1PQVczR5zDfQ
	db3OSBBtLEdPqH4BCox8ReLkG9d/b/+fFnBkLh/1wl2JQQIMEeKYNihzdm0G9+Pg6oWKCNiASbnA7
	XxiSRRs/zonM5SBpRYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh1H-0000000EYWu-1FD0;
	Thu, 26 Nov 2026 21:28:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh10-0000000EYRu-2GVV;
	Thu, 26 Nov 2026 21:28:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50C0061B37;
	Thu, 26 Nov 2026 21:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF331F000C1;
	Thu, 26 Nov 2026 21:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728504;
	bh=AKE9hZpQGszWx/7HA8tIwIZOKLxBkMhWpBT53qbuBGk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=m+oYj6287zb9RCTfENOWwvGl/347fysghidRTIGsZIAgQmoNOAUZI1xSYgX7dJiQ/
	 NRJK+RAtzUQDtCpRovni3fW5ILQGGCgP0SGIG885i+Acm/L/M+DV1mF53fqEJ6jZ03
	 tF/R6JnEsWVP8szh5sBl3ygKbsZKDyT6STwJcNfY86gqYS0KJUKDWwAUAhaYFmO61I
	 UHR6VaPZOa6ah08pJlSTdShRR3ouj7KvAtT7qvXMOkYaJPyB+dg1PYszQeu/tTHGhZ
	 h6WBnHbokPHlhxTZjDWI+4nlxkW6e9Jic/7ytegVXwSn6Ry8NlwhPnxQhWkpqOj8F7
	 uPT4Ps0lZtg7g==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] dt-bindings: spi: rockchip-sfc: add RK3506 support
From: Mark Brown <broonie@kernel.org>
To: ZhuXiangyu <1194781887@qq.com>
Cc: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_E24973E955D1A26CF5A4F983929F8F8B0006@qq.com>
References: <tencent_B239E24A7651B43AC21C4769D1E75FA0A505@qq.com>
 <tencent_E24973E955D1A26CF5A4F983929F8F8B0006@qq.com>
Date: Thu, 26 Nov 2026 21:28:16 +0000
Message-Id: <179572849658.838304.8494302770279500225.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=558; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NYkHdhnKP6nblxfLbI6IxY44AGsOc8rvLXvhgNlcXKI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5lhTuFngeoThR2myD5bwJRrGbd9UE3D8kFiw5/Qu7X
 5LrstaojlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExESJrhJ6PKjGP1XEGOKRvd
 rHMWPBLKktfxD73+oPljAXNAL//fH4wMD+wTmRSauf/EVDjrfdFW3h5zKmPvfy/h/L6J7Fnc71T
 5AQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Document the RK3506 FSPI compatible with the generic SFC fallback, and
> the rockchip,grf and rockchip,max-dll properties used for the
> power-good handshake and DLL training.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

-- 
Mark Brown <broonie@kernel.org>

