Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A1606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjxNtjRx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IO68mBpY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8k2d2PhMnYjRXQ5QRw2mJbIvbUQXrtHQaaDuFIHG4zs=; b=EjxNtjRxpRT39Q
	rGC9EQlwLxm6MSa0sTh1eboEljtE7Sj2KTJ2wb/A4HNGLXM36r20ay05xk+fPnaP3Q8Imkmyn2csc
	x4thUjYFVKzx0sDLtyb/k2HxzH9k4Km+lx7og5SS9VoAwU9QQGmXp6ZGGtrTIsFsX5KIenO0qNsoL
	IculcSACMCo2IaJDEIkLj+CUdRLZaFx0PjX0eUexNOnP2/DaFBlGV1qSpZTmBn4EUoePjn0j5eMvP
	hHnNZjYN5XuKYzy24qhSeJ2lgmNKNmMUhdG1KlVjhijnNtselD2p5DYyTwSlYxDVULk82vnPj0Z8k
	v7QakJPy3tmGf2bPSmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUyL-00000001XU0-0kP1;
	Mon, 09 Nov 2026 19:24:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUyK-00000001XTm-0owX;
	Mon, 09 Nov 2026 19:24:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B874741286;
	Mon,  9 Nov 2026 19:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4131F0089F;
	Mon,  9 Nov 2026 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794252243;
	bh=8k2d2PhMnYjRXQ5QRw2mJbIvbUQXrtHQaaDuFIHG4zs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IO68mBpYnUHXGVCtcQ4aUiCR5OpZF6j7sJv5sFZ6Oy0Kg2rleMKEZyUN3oM4jSLyJ
	 G/akshB3q4eaLSzY393f0AfGLUmQmJ2ZPiEM9DfsranqkvgV2CtJWaKH10l5yP+HkB
	 6VHEiHz87BMyFX70UoUjNBkifodCfkqM+cEsTwj7FgtmPu7v8YJ0l+dLG2P50tFUmh
	 BZgEF1W5rvtsKHutCHO7Y48ytx/a73YxysbmnR2bfwag84kxXrsasMSXpPYYqzXYwa
	 fchLvg/uN4sD21ySsLnTjFNqWCyBrCaEAceQXWX2z2jql5jjQIQy+raeXnc+UNcObN
	 9S/t9G//QdLMQ==
Date: Mon, 9 Nov 2026 11:24:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Cc: 1579567540@qq.com, Marc Kleine-Budde <mkl@pengutronix.de>,
 kernel@pengutronix.de, Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Oliver Hartkopp <socketcan@hartkopp.net>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v8 00/10] can: fix Rockchip TX stalls and bus-off
 restart/close races
Message-ID: <20261109112402.283c16a3@kernel.org>
In-Reply-To: <20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae@qq.com>
References: <20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 08 Nov 2026 19:33:27 +0800 Cunhao Lu via B4 Relay wrote:
> Subject: [PATCH net v8 00/10] can: fix Rockchip TX stalls and bus-off restart/close races

please use get_maintainer.pl, do not CC netdev on CAN patches directly.

