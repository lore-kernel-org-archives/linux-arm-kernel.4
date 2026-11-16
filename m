Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fFuYJoWr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXmWvjsc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DHaice+Ti0PzU+k5QwVlqcyysO8IwelYCih66aFmNyQ=; b=fFuYJoWrVqu3Nm0G7U44FzNATr
	7XdA47I1mxU8/FsC0ahciEsM+BRjR20CaJwEKS/z5BhwmOnihxgFMaDoiEIKuhiOU1Hg7RMaJz7oU
	pSxtTK8CAYAmhB1GFzSs5iIuu4JGqSmqe2NJE/T5KT3i8q6Io5sWnzOY48dfOADo1o+Uq0MwdxYHO
	u6tZfj5mL2VpF9Z3UEWj2G/Gij4DcGFVXnRZFq083swqL39R7uO7eos6VYBYUdEKssR/8qeGd9qgj
	pDu1b0Oa3DTcTzRddG8O+1MIk2FecK2I4RmPno+JZHwzhwDhWSQlEBn3+sotICEHxGVgXfRl2pefk
	/gGD0cdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpgf-00000001Bd3-0s6P;
	Mon, 16 Nov 2026 05:55:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpgd-00000001Bcg-3EwD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 05:55:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C432360F2F;
	Mon, 16 Nov 2026 05:55:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794808526;
	b=qcKHtJn/1EX9mHC16gV2qxiTnH/MXxYdZA4JiekQYMXhpjmAf0JbmP4nUd20rlOrP5o6
	 qrOpeKPr17AFa2QOLN5fQOa9yXkuzlwB6qld7NGOm+Yz9YoYSTb0bbrBu0sMFeAcuJxLz
	 qJaE6fsSMJuuTcNCUVpByqJ1nc5hxfml2ucCYnATHzb/6l5D3rrorlNl/5FZSXDIMMQxE
	 kF2KzfKAQvW7TlrUn2wSXomGikwQRCQR9Z4MpNWUvl+vVBsxIoAKWhX3doZySKwk9OUG9
	 uXUdrbQK3SBlufMzyaUPGhKEfL4lkXcVCxwD07RwCwY3ws8hDVO8OXHn9W0YQB+UT3Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794808526;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DHaice+Ti0PzU+k5QwVlqcyysO8IwelYCih66aFmNyQ=;
	b=m3BSxy5gxNk1ax5I5HiRJ3efae11czCLU7FHGVHLMP5077aSmQUjM6U9YB3r2tS8OTVJ
	 /wBaMmi/kethX9URAUjzbdYE1PUUUiUr4hrVR+1QMVgP6e8toESpEldjl4KleVeygP/kl
	 OjU/vRP1+w8NSL0cVtz8HicjlnOZhSsE7Sj89cZzUBqjTkUE7VeHIANgb5X6uGBRGkX3H
	 Xn0LpTEyrgoc8ypswCaONtAGoTLR5GI9XGu0eRdlmQcbeLGaU5zbiW5Wdfnwefk/khHQm
	 6QfXFeqb9dH3kdA77yApJ12Iz/ibTXrB/ojsoawrW2Ld02qFBfNwfy7h1fDNqyRtn3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDA7C1F000C5;
	Mon, 16 Nov 2026 05:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794808526;
	bh=DHaice+Ti0PzU+k5QwVlqcyysO8IwelYCih66aFmNyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MXmWvjsch/N61Bche8WqkZvQqF8C4SXdCcEb0kpbQrYlp8HO4ZL7wOrcWLUmPQIbx
	 WL/G0bJzUp5sW56VUObbZxdHIakkSaOXVy53vBvmYfoPw5QIgYGg7H37Zu8NXgDQzB
	 Yn4lDn26vAIABjxTfipukXFmlUxIGtSBbJBp6yrMrlqgdJjcjJJxdq1YMURSeIktn7
	 EcVnIsQDXS6ZDZjed9++AaeBCKM51Mpx09N1mDr3/OVpE8yw+W+zcpIqG1UoC7FnLT
	 llsU1nuHQnA952fr76mZrKc0OM2FrtP8BLowye0ASqrIIvNNhMNlVh/lTKSJXLfj+s
	 T3NI5lYT4qmww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 69AE24A318;
	Mon, 16 Nov 2026 05:55:25 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 05:55:25 +0000
Subject: [PATCH v2 1/2] spi: dt-bindings: sun6i: Allow Dual SPI and Quad
 SPI for the H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-spi-sun6i-h616-dual-read-v2-1-e0c66eb71e20@gmail.com>
References: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
In-Reply-To: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794808525; l=1092;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=J5fWkwwhvbIRdi/tKkf4w+0nyQr1DVDQbXeDAzQuqPQ=;
 b=svyeGoIzmzcktMV1ZQt0EBtPZ6VDtsuLr/LDWTdESX9RzfCqsv0ugB5a52NxpTCv0RN59pdrH
 kdVg5xaYFd5DVGcPPYnBEvgqoHqeay4U895LmnUpQLlsnD5UdBf0pjG
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The H616 SPI controllers support dual and quad transfers (H616 user
manual, SPI_BCC DRM and Quad_EN bits; only SPI0 has the WP/HOLD pins
for quad). Allow them, as commit 743956bb9990 ("spi: dt-bindings:
sun6i: Allow Dual SPI and Quad SPI for newer SoCs") did for the R329
and A523. The H616 keeps the H3 fallback.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 14c2f318dd04..116c5868415a 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -106,6 +106,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - allwinner,sun50i-h616-spi
                 - allwinner,sun50i-r329-spi
                 - allwinner,sun55i-a523-spi
     then:

-- 
2.55.0



