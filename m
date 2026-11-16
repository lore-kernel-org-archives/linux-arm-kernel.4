Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC30606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tCD8AlEx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Az8RloN0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KWrIH6Ghtq3+JL+RWvfyphsNLu+Dv8di3CE3m4jvDoE=; b=tCD8AlEx+orVpN
	ZPEMgnCIJUd2y+pYkBTXiyKVJzxdOZymyCS3sYKODTzuUXh9CcoXCsQCWtyZnd9ZUkQ3mR+1IkpE8
	o3ztBEcX8hySWhToUS4IRwSmFPZ5MNbteUmnuOWESnonzdB+a4gwFq5KuKE4HkP3r2Ke0XdvNfILu
	9O3ElSMvbF/TlobhJIHK/f35rGVx26LgrS3ZkKte0cNoi1KRRfXyECKzUpERBUPQJV8jRtA+D9RBf
	53cEMsyX3j9Hs/WJTKK+RSbUh2iFV/OkydFpRE5gIlv16z/8BoaRZVNZLoGrw3rAd3ZHOsjjhtw0x
	nxxFbDlaNK6jVzVkHmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStX8-00000001siA-03Lt;
	Mon, 16 Nov 2026 10:01:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStX7-00000001shk-07BY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:01:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ABE46285A;
	Mon, 16 Nov 2026 10:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABA61F000C4;
	Mon, 16 Nov 2026 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823311;
	bh=KWrIH6Ghtq3+JL+RWvfyphsNLu+Dv8di3CE3m4jvDoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Az8RloN0EyVusDn0tcUCCxPCZ5CQgMycNlLs+pMFYC6nGf0jt5NKUr9prLtC1tOY8
	 QmJV8yy/IvfRO20rx0UJCJlzCSQLB4orbSV43nbdKAg84a0Bl75kDMV7yuAGoNtQjE
	 4xiJKQAdnDFzoCIdfYLJKw5iLiIqy9J4cLYdmNbbjHZUSoYRGPupIRm1/Anjr/tyTT
	 FZ9i/QC6ApekL1wL3FYGhboDMrns1+STdmQ52o/beejpqs93k+gV5ga99XMF5aO1Np
	 LRTcsKntz6MmRCxI1vyqKTKSArJBtL+iifCFgoi55Ci9f1f8Czk9ScvJBzYn+lNnn7
	 pyr8ZF4LCw/7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
 pokala.reddy@samsung.com
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
References: <20261113110612.3265841-1-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v3 00/14 RESEND] Add clock support for
 Exynos8855 SoC
Message-Id: <179482330541.39377.15409353994638408556.b4-ty@b4>
Date: Mon, 16 Nov 2026 11:01:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 13 Nov 2026 16:35:58 +0530, Raghav Sharma wrote:
> This patch series adds clock support for below blocks
> found in Exynos8855 SoC
> TOP & PERIC
> PERIS
> HSI
> USB
> There are many other blocks, for which the support will be
> added in a forthcoming patch series.
> 
> [...]

Applied, thanks!

[11/14] arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
        https://git.kernel.org/krzk/linux/c/14a87bfb0614d87b04134156e090d7b00590d2b2
[12/14] arm64: dts: exynos8855: add cmu_peris clock DT nodes
        https://git.kernel.org/krzk/linux/c/99eb8abc95341047451f5c53d70d044fa4481af0
[13/14] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
        https://git.kernel.org/krzk/linux/c/1d0231f292d437328ab97c24e052ab6a30d82bf1
[14/14] arm64: dts: exynos8855: add cmu_usb clock DT nodes
        https://git.kernel.org/krzk/linux/c/65ffdae53a6d522519fbd66d3cabbb4622e3e5bc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


