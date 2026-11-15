Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC549606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZGXA4C9J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIr7lunI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6raE7EuXz9WU17PRTjvAl0L5ym8soOrbRFnYzh4Vla0=; b=ZGXA4C9JofN65k
	tH+DonJDxKpYHOXZGsXLj8KoKNnFgol9H5b6eeaO/t+iZfk1W4/rJfUVfASkpXn7Aqh1cA/RaFy/M
	LlvMDqwtTivtbEPbVTyHdwtK7RNachSa6aY6Ufh3FHEyHEY3UpFsrBmVIo0x6rPvPBjL13cJFGok8
	w0r/ff4WWQGfOR3YLo+pcLGlXKa4xy532agXnxixK49KMpIwufPyr91bLI6MEoc1TeXE4BJ4aysZj
	npejj6oKM1dFOv4igUcwmjmhuTuNa2+Xy7kJCbBLheqx2WZdyD4Cc1CQC0sCJeWCQ8DNmUOmYDqhv
	x7Dm+/i/57WoYU1Zavsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbpM-000000006iI-3xcM;
	Sun, 15 Nov 2026 15:07:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbpG-000000006gl-3sjq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB9304010A;
	Sun, 15 Nov 2026 15:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1509E1F000C4;
	Sun, 15 Nov 2026 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755246;
	bh=6raE7EuXz9WU17PRTjvAl0L5ym8soOrbRFnYzh4Vla0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TIr7lunIUvxEuCpZW8GNFmjj/klx/pfRMyEkyycvEAFbDhl1vbJljndXwKiQz6mRV
	 Pp42IOwuA840fJh3rsfjwepb7aaGWr++YaJPYuFvVDlmktlHB9XnD1NKCFUJ7pFqeo
	 ELplCPSgxR312azDwrggLn7PmonMdmhTNthe4eFDMiSTml20u0zBmiAa2hkdOmPwUp
	 inz2x8rLVB5SvtyWPPB6Z2waZ4SU5DL/VWVlys4uUXO09haOV2LFKB1hweGZdIgRKH
	 4narH6KqYr1WHGUhe/4CUrhwINJlAVEIRRYeGeMVYY6I0CYqM/DuxVznDDZ9V03nwo
	 gbZO6n3HmJw1w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261115150536.16212-1-jernej.skrabec@gmail.com>
References: <20261115150536.16212-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: yuzukihd-chameleon: Enable the
 GPU
Message-Id: <179475524484.3273316.16506023091021816874.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 23:07:24 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 15 Nov 2026 16:05:36 +0100, Jernej Skrabec wrote:
> The Mali GPU is supplied by DCDC1, like on other AXP313A based H618
> boards. Enable it.
> 
> 

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: yuzukihd-chameleon: Enable the GPU
      https://git.kernel.org/sunxi/linux/c/c3b0d2bd3ba6

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


