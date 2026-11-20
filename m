Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F17606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNJmIN2Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6rtY/v0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LW+kKiNqfY8HPCAqY9IfbH53r5HYTznvk+MUAJydRFs=; b=BNJmIN2YOK3XfZ
	lP1XAgC7mvmufbm7K1cx1RfgQfL+MjS/m3SKPf2YehoVb7Jhr05SHR/pEbKdsM3Q0MyebVC3xTLIS
	LIeMkAppXhIphT4U0L7U3ZX45dc6FGY1y1BkwvmWEkD0rQF+N51PIbr0gGySCiQtswAvvk1KJaMcd
	SKm72p7W2KTtBUMOaU86OqROTmcpCWCZAhsxTAii0Z5Qt2xPLRx1SFuMqNzE3jL7/CnxEmC8n4KiL
	v8t6Zo8nYo6GOY+IHK5d4N7p+eWyY8jOZ1jmpfnA7Ujere2k1pYCHMqgJC4fxOLXQkVU4nyDgN+oI
	HzR43iRb59cc8cO3KjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP9b-0000000FCYW-2AoN;
	Fri, 20 Nov 2026 13:59:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP9Z-0000000FCYN-3QTG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:59:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4556462C81;
	Fri, 20 Nov 2026 13:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A281F000C6;
	Fri, 20 Nov 2026 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795183188;
	bh=LW+kKiNqfY8HPCAqY9IfbH53r5HYTznvk+MUAJydRFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S6rtY/v0m9v/0YbuaYd2Wkpcnx5stAni5jfPK1GXXGyNK0gFMVJW5ZcFY/0PWZAF1
	 ya2xfo9tzy2lvUDWcyMfsALvLeKr4ZBYaWwt8ovzyY3cmNeQ32yEmD668RLw3ilG6c
	 udzZkT8UedJGtwPYe58oJi57YYGcJ+Xg9777F+NuJWlL1XFBUdKQbtnrJcEw77P0jt
	 Q500ocXoLiNDaOUhf/uiwF6UyGHitWmh15H1nxZ/O5HVq9lkMJERbX/+HP+sHNItH3
	 Nm1pUn/tGmgIYBNNQtMMjg5u9yuGx+gvgqJU7xzmw0vNa3vHBNiwbecrQV5ukFlhbY
	 nu5v+zDjgApGA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Fri, 20 Nov 2026 14:59:30 +0100
Message-ID: <179518315457.16443.4845385299406425868.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
References: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=krzk@kernel.org; h=from:subject:message-id; bh=KM3O/+wumfVF1ZT0/KxaUkzczLZvHyFeeNmoCihvXx8=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAFJDxRsdx+/H8YhdwVZ2iRkhHLb1F5vkoaEsQ GKstWtEWlOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBSQwAKCRDBN2bmhouD 14KAD/0WJxB6ha5hvZxcn7n60zSvNFl+37Tzii/fjxjGf2Dll0WBL2izQupB9JiSJwFICOpJGzW 2sWN/o0N+t+r9DvEFBEFPnM3n8YwY3ihOpxz5jqygIBh7k5eDrZyKAQxjaQPbNWcn/7hzXoI1QZ NneAlvnILwHgXatkav4R3AGDzNCidEWqehjtZ6Yy9J4gxYQhHWBJCQnLn0l3aCP4N2L80ty0VCe AKDn/re6/HzyrrkE3/KA2UZE8vljzJl0AmZien7YKRKTzTPbYm4iBoj7Ta8rKNs7Pq1tLtftLkQ 4a5bT0umZmSCeXlXtGiNC/FHzQDEAN83S2vf1H8FsGfY5iwPEOUNf6e/+H42Px/Ha+rLpQjrBtw UAe0YYxK/F4jxbGFD6gfPj0p0bwIDiuYD545zTD+gDwjp+yftuSEq/jKsaz2SW4LFLwrzfUBKDz SbUhgh/nFm+2+3kbGHNzQQLdTfFDJSzTL4B+kUR0VfMzy4RMedYotcXDcH1LM8iA1d6oTGK6Qfd Nr7MdYuY2ev7zPV+yQDsDiVOh2E1YhJBsR96C9i+NG7pA4QB6FWZlVMxq3kmi5G5cd9lAxReSRB vypOYlGJzde6qIhMdPGDg2lMobTiRC36vAjoQMqzrzF1cFXhOMNGHDubQmE9eLsq4m8s+KKJybK SPrdizxgh/pGMq
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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


On Thu, 19 Nov 2026 14:54:56 +0100, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/krzk/linux/c/306301ca9340a6c7ceb14d735abb9cc380933a7a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

