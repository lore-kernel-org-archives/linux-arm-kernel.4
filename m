Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B85606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2GAqIwiK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3UgWEen
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w6brxhWc58ejPdDmDsjZBb3VI0jzhlT7oBmaZ1G4V/4=; b=2GAqIwiK+Dd3AUNvlVvIGm00YE
	8tFxi1JG5IZ+y1d2Fj3aoUCzMQIr/3HWM7/xcmcUrNO0mK+T3QxK07CpaHV/UgknKa9cae2Ltj6mb
	0H2HBC024wiFHn50Qdwx9x2zMmrWo7EpU/2yiGVy17WI7yaYqueJE3WENbsHjnR/ov6RCOythvR/v
	5VHBw4F8w3KfHFsbW48oynYZitJPUJFIB3oNse6aVDli3/cYbOICL2GulMU2g2y+q4PW4265mGesX
	jg4L/JeITN0bCSZjuer5YsNaZJjigvEJU6DfCq2oei3agoK7DbXMc+JFWyvxdxjcAge2AJxA1vyDI
	STh5iGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBxB-00000009n75-1JRI;
	Wed, 25 Nov 2026 12:18:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBx9-00000009n6p-1f1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:18:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEBD6402B2;
	Wed, 25 Nov 2026 12:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022BE1F000C0;
	Wed, 25 Nov 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609102;
	bh=w6brxhWc58ejPdDmDsjZBb3VI0jzhlT7oBmaZ1G4V/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f3UgWEenHgZd6XLE/pukysN5IutxEUMLdNKKdEK9zJsRki4m+Z8/DuVppUciskqiH
	 hUv8Bg7TpLKz6HidPpPzpLGvA1Eum3t0lFmi3edx/zNZqzeijeipQWmLpJsdGQ8N6H
	 oWgv2qkvqg6Xmvx2MwfU3uZ1EUCVOVPMQmocEFXMn9QdCrIBJovDIK1jlV8nCqgaDu
	 pYbWX14eqOgkzt2cl5dikb1t9hi6059ZL7uwxKAGSoxCYWP+WylaOdKxfUZeHT0jKZ
	 yfVquEHqcXFUmZUimfKX9S7dWLyb7LpsnfNfIhrWRrwClh7hVxBYdHt62y6Rnen18c
	 gJTnK1p4kh2CA==
Date: Wed, 25 Nov 2026 13:18:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/2] Renesas ARM defconfig updates for v7.5
Message-ID: <20261125-tidy-screeching-nightingale-f8c74a@quoll>
References: <cover.1795540796.git.geert+renesas@glider.be>
 <cover.1795540798.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1795540798.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 06:28:35PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.5-tag1

Thanks, applied

Best regards,
Krzysztof


