Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470D2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3yBxh5/;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=j02+UmPS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+7MuY/6UP2Bsh775A7XrC/mnlab/U/JJYl8O0EaI6UA=; b=P3yBxh5/SzspIrQB2FosXOW9TD
	fdBPpN/AaxsY8CvaNmxexlTYWfO+OV8NCMLnmcX/zWHUq4v6gR2x7LDeRXF28USRDpkopMruo07C8
	9qXLQD8SU1kwWpWzWnXmFRTvgSfsjH3K3+xjiFLfEAZPQPChBMR1rqORONO2hv7OqJfeDS0AbENOJ
	KIMdvFL0ti3Gbd8vlf5eMD17zF/bkoo1jXMH/bO9bu65crmYTrmz4dvrln3GaErYkY13aim3C5OeX
	bMrxoavkOeIR8cy3SBDbsgP2FA0cDEDBllplp74XBYXQySX/jTlyBuB6rVE3LpBM3cLHOwle/l0by
	rLL+LWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBa-0000000BLHF-2XEj;
	Wed, 25 Nov 2026 21:05:50 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBR-0000000BLGL-1r1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:05:49 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 4203E4C89A;
	Thu, 26 Nov 2026 08:05:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+7MuY/6UP2Bsh775A7XrC/mnlab/U/JJYl8O0EaI6UA=;
	b=j02+UmPSaqgpY9N9yYLyP5D4k9ACgdBnURpGXfJ2NTjIMMmsDjOSOhn0nvp7N3scF20geo
	d6biDUYWKWaSA3oOOpJSOlXppJYfguRIR7qwORiOKcWeR2n6b7T+eRd3zaIyYAxKnRVYry
	xNR/6z4/a3p9QSRPJG0Edt1KdF9wE4T6llSiBl9bMxPqApBFpHUxFk1jzar5HwoQM5GwQz
	uPBUeNP2epTo/YTunxSNwey2bgA3flRNN9bl8chnLuBsvOq5AgtEHS0AX16FuMaj9K6xuo
	YNTHQHtHo8NjR1Xc/q6YXV4/tfMYI+saS7f0SHKefS+iE6gT+WYZLz1kEevYQA==
X-GPT-Reason: legitimate; this is a technical software patch submission
	(Linux kernel style) matching the sender's personal domain
	(alastair@d-silva.org) and the recipient's personal domain
	(alastair@d-silva.org); the content is highly specific to hardware
	driver development (Allwinner A733 TRNG support) rather than marketing
	or a scam; there are no URLs, sense of urgency, or requests for sensitive
	information; and the message-ID is consistent with the sender's
	domain.
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/4] hwrng: sun55i-ce: Add Allwinner A733 CE v5 TRNG support
Date: Thu, 26 Nov 2026 08:05:28 +1100
Message-ID: <20261125210532.695823-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130541_629818_E7A3E76D 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds True Random Number Generator (TRNG) support for the
Allwinner Crypto Engine v5 on A523 and A733 SoCs, and enables it on the
Xunlong OrangePi 4 Pro.

Dependencies:
Patches 3 and 4 depend on the OrangePi 4 Pro bringup series:
  [PATCH 0/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
  Message-ID: <20261125124407.4098345-1-alastair@d-silva.org>

Tested on Xunlong OrangePi 4 Pro (/dev/hwrng).

Alastair D'Silva (4):
  dt-bindings: crypto: Add Allwinner A523/A733 Crypto Engine
  hwrng: sun55i-ce - Add Allwinner CE v5 TRNG driver
  arm64: dts: allwinner: sun60i-a733: Add Crypto Engine node
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable Crypto
    Engine

 .../crypto/allwinner,sun55i-a523-crypto.yaml  |  68 ++++
 MAINTAINERS                                   |   7 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  |   4 +
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  12 +
 drivers/char/hw_random/Kconfig                |  13 +
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/sun55i-ce-trng.c       | 377 ++++++++++++++++++
 7 files changed, 482 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun55i-a523-crypto.yaml
 create mode 100644 drivers/char/hw_random/sun55i-ce-trng.c

-- 
2.53.0


