Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9357606EE8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cjRtuYjb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm7J10wM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SVWYYLhxeEIhjDuhTBIlUZL/L6SyEXLXw2BhtSeMLfk=; b=cjRtuYjbeu8l5l
	hb/Ww+YczA9XL6E/BjhUi9RA7RCOIk4kqOnxR17N3q8fGA9Zug7dQDfx9sJ+JaZ1cRAdiwTZ+fdWq
	wsqsydLfJJ3J2+7qbg3MU0rNRzalk4heP7RMw+HAeTPAdpflVwgBM4TkBtshJ2p1ZrfWJWVFN8JLU
	365YjWm6+Zw4thLInBsD0fe5X8tlHp6kB6syOxR02qFVAsGtRmnQ9R/Y0791wfqMVuf5bsUn17ZZ0
	PZqf+R9DLX/GewiMmNTbkwscR/qR5zBuYPPdJeXt2E5ZrIaOa07vLsNsWtTk1vZWaZEzPXDkx+dCR
	LYzK/p7/cxhUw1666+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQO5-00000000whY-3csI;
	Mon, 09 Nov 2026 14:30:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQO4-00000000wh5-11II
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 059AC4352E;
	Mon,  9 Nov 2026 14:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DEE1F008A5;
	Mon,  9 Nov 2026 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234619;
	bh=SVWYYLhxeEIhjDuhTBIlUZL/L6SyEXLXw2BhtSeMLfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xm7J10wMj12w44NK9f7GVywB07zNdzQmqnyvrSOaL3WiwURoulSVND+vccHcMiRvz
	 0TUtso/FoX3DrzMQiuQ1KQDANXLiQak4DTfzi9hOYavJ8KPP3QgkK/FDt2OLJG4ntw
	 TX6snFA1fb0kmiK9pL8aDslQFlw5PhfREauamO4BrGXt22GnXXfRXW0M3urVLZqZQu
	 W6aviJa6KEtprUcsfgNIGyx+lHSJEnLLKEeKYYMWitiocXpT6WzY7YeijWvTL/ei/g
	 veKsVjNHOSb3x6M8mO8fFDzRY/PEcv89UOpSTBGeIRp9lpv18SDRWwWbk1yzQ1PPOJ
	 z7dE78pY+6AeA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
References: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: convert to
 subsys_platform_driver_probe()
Message-Id: <179423461620.181759.13684411783134376117.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:30:16 +0100
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 20:29:27 -0500, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().

Applied, thanks!

[1/1] clk: samsung: exynos3250: convert to subsys_platform_driver_probe()
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


