Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50425606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4r6qlYzy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fu8tBIfc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WGx4yjZhEde7TvTLPPi9oLKwIm2f2ZhCwsVI7E4TU3s=; b=4r6qlYzyG/OObP
	urvWk18qqLn6wBcgFjmY2YhwfNgwD7HOAUuCjxGUfBtYCs4K1F87M9WtEe8QBuOtsFHUrqRlrdt/y
	cJDc2EXh/aexZAECHOPSmHMo79MOH8Y04vAAiatkfpNhzcqvrp9alimIVS9lyLiZ759thYZdDp+4q
	nJdzAGttxtZAC+1vgoH6BfAdsMGqWbTXJcnsTZ28r/JOF7HzjbzEQr6L+92ciQZNfDYcy1j8w+ox/
	rRFITiu+KR2z8Az/k4DK4fZBmNcP0CNYr/fvaAUpAR3oog3o+o5377mB5nUtJhP5r9yio9/QdbEEk
	C9G4KZAujhpWM/an7olA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStX0-00000001sfr-3o8y;
	Mon, 16 Nov 2026 10:01:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStWz-00000001sfU-2QLd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:01:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55CFF40113;
	Mon, 16 Nov 2026 10:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAD1F000C4;
	Mon, 16 Nov 2026 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823305;
	bh=WGx4yjZhEde7TvTLPPi9oLKwIm2f2ZhCwsVI7E4TU3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fu8tBIfcVgM+sIFEkI+nzsaLohduaXylLOLdJs7oPhIpZCaDgGRyDIwJM7KV3Aoad
	 BmtIT2/JFmw6YO1hF/rcga34joJ5I9WOraeQnrA5cUA4EUn+s7uBOF2TmHaoYsGuBz
	 Y+nhu+yln62MU5CXk7p/hBiGCeKX/JMC4lH6TfAIksvDn3i2iekbooR3cehX+Jw3U5
	 s8IQo0YnfGwghCMROSe2atJSsqTagxds9e/Rgmq+6plXldjiO1JO8v9OVmCe9iXiBZ
	 nEzmb9iSUus4zrJZrkWPB6RDr6faY95ftNVNp/4YW56Bg6rzNz3RoVROlSPb1T/To9
	 AaOv3q662vvBQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
 pokala.reddy@samsung.com
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
References: <20261113110612.3265841-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung:
 Exynos8855 SYSREG compatibles
Message-Id: <179482329921.39377.1080590759697882936.b4-ty@b4>
Date: Mon, 16 Nov 2026 11:01:39 +0100
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


On Fri, 13 Nov 2026 16:35:59 +0530, Raghav Sharma wrote:
> Add exynos8855 sysreg compatibles in bindings

Applied, thanks!

[01/14] dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


